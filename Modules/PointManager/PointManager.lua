local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS

local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager

local LEDGER_DKP = CLM.MODELS.LEDGER.DKP
local Profile = CLM.MODELS.Profile
local Roster = CLM.MODELS.Roster

local typeof = CLM.UTILS.typeof
local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local function mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if roster == nil then
        LOG:Warning("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
        return
    end

    local value = entry:value()
    local standings = roster:Standings()
    local targets = entry:targets()
    for _,target in ipairs(targets) do
        local GUID = getGuidFromInteger(target)
        if roster:IsProfileInRoster(GUID) then
            standings[GUID] = mutate(standings[GUID], value)
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
        (function(entry) LOG:Trace("mutator(DKPModify)"); mutator(entry, mutate_pdm) end),
        ACL_LEVEL.MANAGER)

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Set,
        (function(entry) LOG:Trace("mutator(DKPSet)"); mutator(entry, mutate_pds) end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Decay,
        (function(entry) LOG:Trace("mutator(DKPDecay)"); mutator(entry, mutate_pdd) end),
        ACL_LEVEL.OFFICER)

        LedgerManager:RegisterOnRestart(function()
            RosterManager:WipeStandings()
        end)

    local start = GetServerTime()
    LedgerManager:RegisterOnUpdate(function(lag, uncommited)
        if lag ~= 0 or uncommited ~= 0 then return end
        -- DEBUG Stuff
        local stop = GetServerTime(); print("DONE IN " .. tostring(stop - start));
        local rosters = RosterManager:GetRosters()
        for rosterName, roster in pairs(rosters) do
            print(UTILS.ColorCodeText(rosterName, "ff5522"))
            local standings = roster:Standings()
            for GUID, value in pairs(standings) do
                local profile = ProfileManager:GetProfileByGuid(GUID)
                if profile ~= nil then
                    print(UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex) .. ": " .. tostring(value))
                end
            end
        end
        start = GetServerTime()
    end)

    MODULES.ConfigManager:RegisterUniversalExecutor("pom", "PointManager", self)
end

function PointManager:UpdatePoints(roster, targets, value, action)
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

    local uid
    if typeof(roster, Roster) then
        uid = roster:UID()
    elseif type(roster) == "number" then
        roster = RosterManager:GetRosterByUid(roster)
        if roster == nil then return end
        uid = roster:UID()
    elseif type(roster) == "string" then
        roster = RosterManager:GetRosterByName(roster)
        if roster == nil then return end
        uid = roster:UID()
    end

    if typeof(targets, Profile) or type(targets) == "number" or type(targets) == "string" then
        targets = { targets }
    end

    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LEDGER_DKP.Modify:new(uid, targets, value)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
        entry = LEDGER_DKP.Set:new(uid, targets, value)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
        entry = LEDGER_DKP.Decay:new(uid, targets, value)
    end

    LedgerManager:Submit(entry)
end

function PointManager:Debug(N)
    N = N or 10
    local rosters = RosterManager:GetRosters()
    local numRosters = 0
    local rosterLookup = {}
    local numProfiles = {}
    local profileLookup = {}
    for name, roster in pairs(rosters) do
        print(tostring(name))
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

    print("Detected " .. tonumber(numRosters) .. " rosters with profiles")
    for name, value in pairs(numProfiles) do
        print("  " .. name .. ": " .. tostring(value) .. " profiles")
    end

    if numRosters == 0 then
        return
    end

    print("Generating total of  " .. N .. " entries")

    for iteration=1,N do
        local selectedRoster = rosterLookup[math.random(1, numRosters)]
        local roster = rosters[selectedRoster]
        if roster == nil then
            print("=== Wrong roster selection ===")
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
                    return ProfileManager:GetProfileByGuid(GUID)
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
            print(
                "Generated entry: " .. tostring(iteration) ..
                " of type " .. tostring(entryType) ..
                " for " .. tostring(selectedNumberOfProfiles) .. " profiles" ..
                " in roster " .. selectedRoster .. " " ..
                " with value " .. tostring(value)
            )
            PointManager:UpdatePoints(roster, playerList, value, entryType)
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

MODULES.PointManager = PointManager