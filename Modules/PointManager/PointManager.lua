local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS = CLM.MODELS

local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager

local LEDGER_DKP = MODELS.LEDGER.DKP
local Profile = MODELS.Profile
local Roster = MODELS.Roster
local PointHistory = MODELS.PointHistory

local typeof = UTILS.typeof
local getGuidFromInteger = UTILS.getGuidFromInteger

local function mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if roster == nil then
        LOG:Warning("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
        return
    end
    local value = entry:value()
    local standings = roster:Standings()
    local targets = entry:targets()
    local pointHistoryEntry = PointHistory:New(entry)
    roster:AddRosterPointHistory(pointHistoryEntry)
    for _,target in ipairs(targets) do
        -- TODO: Main alt linking support: We need to account for the link not blindly pass profile
        local GUID = getGuidFromInteger(target)
        if roster:IsProfileInRoster(GUID) then
            standings[GUID] = mutate(standings[GUID], value)
            roster:AddProfilePointHistory(pointHistoryEntry, ProfileManager:GetProfileByGUID(GUID))
        else
            -- TODO: Add  Profile to roster? Store in anonymous profile?
            LOG:Warning("PointManager mutator(): Unknown profile guid [%s] in roster [%s]", GUID, entry:rosterUid())
            return
        end
    end
end

local function mutate_pdm(current, value)
    return current + value
end

local function mutate_pds(current, value)
    return value
end

local function mutate_pdd(current, value)
    return (current * (100 - value)) / 100
end

local PointManager = {}
function PointManager:Initialize()
    LOG:Trace("PointManager:Initialize()")

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Modify,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModify)")
            mutator(entry, mutate_pdm) end),
        ACL_LEVEL.MANAGER)

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Set,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPSet)")
            mutator(entry, mutate_pds)
        end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Decay,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPDecay)")
            mutator(entry, mutate_pdd)
        end),
        ACL_LEVEL.OFFICER)

    -- local start = GetServerTime()
    LedgerManager:RegisterOnUpdate(function(lag, uncommited)
        if lag ~= 0 or uncommited ~= 0 then return end
        -- DEBUG Stuff
        -- local stop = GetServerTime(); LOG:Debug("PointManager() DONE in %s sec", tostring(stop - start));
        -- local rosters = RosterManager:GetRosters()
        -- for rosterName, roster in pairs(rosters) do
        --     LOG:Debug(UTILS.ColorCodeText(rosterName, "ff5522"))
        --     local standings = roster:Standings()
        --     for GUID, value in pairs(standings) do
        --         local profile = ProfileManager:GetProfileByGUID(GUID)
        --         if profile ~= nil then
        --             LOG:Debug("%s: %s", UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex), tostring(value))
        --         end
        --     end
        -- end
        -- start = GetServerTime()
    end)

    MODULES.ConfigManager:RegisterUniversalExecutor("pom", "PointManager", self)
end

function PointManager:UpdatePoints(roster, targets, value, reason, action, forceInstant)
    LOG:Trace("PointManager:UpdatePoints()")
    if not CONSTANTS.POINT_MANAGER_ACTIONS[action] then
        LOG:Error("PointManager:UpdatePoints(): Unknown action")
        return
    end
    if targets == nil then
        LOG:Error("PointManager:UpdatePoints(): Missing targets")
        return
    end
    if type(value) ~= "number" then
        LOG:Error("PointManager:UpdatePoints(): Value is not a number")
        return
    end
    if not typeof(roster, Roster) then
        LOG:Error("PointManager:UpdatePoints(): Missing valid roster")
        return
    end

    local uid = roster:UID()

    -- Always a list, even for single entry
    if typeof(targets, Profile) or type(targets) == "number" or type(targets) == "string" then
        targets = { targets }
    end

    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LEDGER_DKP.Modify:new(uid, targets, value, reason)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
        entry = LEDGER_DKP.Set:new(uid, targets, value, reason)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
        entry = LEDGER_DKP.Decay:new(uid, targets, value, reason)
    end

    local t = entry:targets()
    if not t or (#t == 0) then
        LOG:Warning("PointManager:UpdatePoints(): Empty targets list")
        return
    end

    LedgerManager:Submit(entry, forceInstant)
end

function PointManager:RemovePointChange(pointHistory, forceInstant)
    LOG:Trace("PointManager:RemovePointChange()")
    if not typeof(pointHistory, PointHistory) then
        LOG:Error("PointManager:RemovePointChange(): Missing valid point history")
        return
    end
    -- TODO: Add entry to track who removed?
    LedgerManager:Remove(pointHistory:Entry(), forceInstant)
end

function PointManager:Debug(N)
    N = N or 10
    local rosters = RosterManager:GetRosters()
    local numRosters = 0
    local rosterLookup = {}
    local numProfiles = {}
    local profileLookup = {}
    for name, roster in pairs(rosters) do
        local standings = roster:Standings()
        numProfiles[name] = 0
        profileLookup[name] = {}
        for GUID,_ in pairs(standings) do
            numProfiles[name] = numProfiles[name] + 1
            table.insert(profileLookup[name], GUID)
        end
        if numProfiles[name] > 0 then
            numRosters = numRosters + 1
            table.insert(rosterLookup, name)
        end
    end

    -- print("Detected " .. tonumber(numRosters) .. " rosters with profiles")
    -- for name, value in pairs(numProfiles) do
    --     print("  " .. name .. ": " .. tostring(value) .. " profiles")
    -- end

    if numRosters == 0 then
        return
    end

    print("Generating total of  " .. N .. " entries")

    for _=1,N do
        local selectedRoster = rosterLookup[math.random(1, numRosters)]
        local roster = rosters[selectedRoster]
        if roster == nil then
            -- print("=== Wrong roster selection ===")
        else
            local raidPointHistory = roster:GetRaidPointHistory()
            local removeEntry = false
            if #raidPointHistory > 0 then
                if math.random(1, 10) == 1 then
                    removeEntry = true
                end
            end
            if removeEntry then
                local removeEntryId = math.random(1, #raidPointHistory)
                -- print(
                --     "Iteration: " .. tostring(iteration) ..
                --     " removing entry  " .. tostring(removeEntryId) .. " " ..
                --     " in roster " .. selectedRoster
                -- )
                self:RemovePointChange(raidPointHistory[removeEntryId], true)
            else
                local entryType = math.random(0, 2)
                local selectedNumberOfProfiles = math.random(1, numProfiles[selectedRoster])
                local value = math.random(-100, 100)
                local playerList = {}
                local transformProfile = (function(GUID)
                    local type = math.random(1, 3)
                    if type == 1 then
                        return GUID
                    end
                    if type == 2 then
                        return CLM.UTILS.getIntegerGuid(GUID)
                    end
                    if type == 3 then
                        return ProfileManager:GetProfileByGUID(GUID)
                    end

                    return GUID
                end)

                if selectedNumberOfProfiles == 1 then
                    playerList = transformProfile(profileLookup[selectedRoster][math.random(1, numProfiles[selectedRoster])])
                else
                    for _ = 1,selectedNumberOfProfiles do
                        local profile = transformProfile(profileLookup[selectedRoster][math.random(1, numProfiles[selectedRoster])])
                        table.insert(playerList, profile)
                    end
                end
                -- print(
                --     "Generated entry: " .. tostring(iteration) ..
                --     " of type " .. tostring(entryType) ..
                --     " for " .. tostring(selectedNumberOfProfiles) .. " profiles" ..
                --     " in roster " .. selectedRoster .. " " ..
                --     " with value " .. tostring(value)
                -- )
                PointManager:UpdatePoints(roster, playerList, value, math.random(1,9), entryType, true)
            end
        end
    end
end

function PointManager:Debug2()
    local rosters = RosterManager:GetRosters()
    for _,roster in pairs(rosters) do
        local raidhistory = roster:GetRaidPointHistory()
        for _,history in ipairs(raidhistory) do
            history:Profiles()
        end
    end
end

CONSTANTS.POINT_MANAGER_ACTION =
{
    MODIFY = 0,
    SET = 1,
    DECAY = 2
}

CONSTANTS.POINT_MANAGER_ACTIONS = UTILS.Set({ 0, 1, 2 })

-- DO NOT CHANGE THE ID VALUE MAPPING
CONSTANTS.POINT_CHANGE_REASONS = {
    GENERAL = {  -- Exposed through GUI dropdown, can  be localized
        [1] = "On Time Bonus",
        [2] = "Boss Kill Bonus",
        [3] = "Raid Completion Bonus",
        [4] = "Progression Bonus",
        [5] = "Standby Bonus",
        [6] = "Unexcused absence",
        [7] = "Correcting error",
        [8] = "Manual adjustment"
    },
    INTERNAL = { -- Not exposed directly to GUI
        [100] = "Decay",
        [101] = "Interval Bonus"
    }
}

CONSTANTS.POINT_CHANGE_REASON = {
    ON_TIME_BONUS = 1,
    BOSS_KILL_BONUS = 2,
    RAID_COMPLETION_BONUS = 3,
    PROGRESSION_BONUS = 4,
    STANDBY_BONUS = 5,
    UNEXCUSED_ABSENCE = 6,
    CORRECTING_ERROR = 7,
    MANUAL_ADJUSTMENT = 8,
    DECAY = 100,
    INTERVAL_BONUS = 101
}

MODULES.PointManager = PointManager