local define = LibDependencyInjection.createContext(...)

local function mutate_update_standings(roster, GUID, value, timestamp)
    roster:UpdateStandings(GUID, value, timestamp)
end

define.module("PointManager", {
    "Log", "Constants", "Utils", "PointManager/LedgerEntries", "Meta:ADDON_TABLE", "ProfileManager", "L", "LedgerManager", "PointManager/update_profile_standings", "RosterManager", "Models"
}, function(resolve, LOG, CONSTANTS, UTILS, LedgerEntries, CLM, ProfileManager, L, LedgerManager, update_profile_standings, RosterManager, Models)

local strsub, type, ipairs = strsub, type, ipairs

local typeof = UTILS.typeof
local getGuidFromInteger = UTILS.getGuidFromInteger

local function strsub32(s)
    return strsub(tostring(s or ""), 1, 32)
end



local function apply_mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if not roster then
        LOG:Debug("PointManager apply_mutator(): Unknown roster uid %s", entry:rosterUid())
        return
    end

    local pointHistoryEntry = Models.PointHistory:New(entry)
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate, roster, entry:targets(), entry:value(), entry:reason(), entry:time(), pointHistoryEntry)
end

local function apply_roster_mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if not roster then
        LOG:Debug("PointManager apply_roster_mutator(): Unknown roster uid %s", entry:rosterUid())
        return
    end

    local profiles = roster:Profiles()
    if entry:ignoreNegatives() then
        local positiveProfiles = {}
        for _, GUID in ipairs(profiles) do
            local standings = roster:Standings(GUID)
            if standings and standings >= 0 then
                positiveProfiles[#positiveProfiles+1] = GUID
            end
        end
        profiles = positiveProfiles
    end

    local pointHistoryEntry = Models.PointHistory:New(entry, profiles)
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate, roster, profiles, entry:value(), entry:reason(), entry:time(), pointHistoryEntry, true)
end





local function mutate_set_standings(roster, GUID, value, timestamp)
    roster:SetStandings(GUID, value)
end

local function mutate_decay_standings(roster, GUID, value, timestamp)
    roster:DecayStandings(GUID, value)
end

local PointManager = {}
function PointManager:Initialize()
    LOG:Trace("PointManager:Initialize()")

    LedgerManager:RegisterEntryType(
        LedgerEntries.Modify,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModify)")
            apply_mutator(entry, mutate_update_standings)
        end))

    LedgerManager:RegisterEntryType(
        LedgerEntries.Set,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPSet)")
            apply_mutator(entry, mutate_set_standings)
        end))

    LedgerManager:RegisterEntryType(
        LedgerEntries.Decay,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPDecay)")
            apply_mutator(entry, mutate_decay_standings)
        end))

    LedgerManager:RegisterEntryType(
        LedgerEntries.ModifyRoster,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModifyRoster)")
            apply_roster_mutator(entry, mutate_update_standings)
        end))

    LedgerManager:RegisterEntryType(
        LedgerEntries.DecayRoster,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPDecayRoster)")
            apply_roster_mutator(entry, mutate_decay_standings)
        end))



end

function PointManager:UpdatePoints(roster, targets, value, reason, action, note, forceInstant)
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
    if not typeof(roster, Models.Roster) then
        LOG:Error("PointManager:UpdatePoints(): Missing valid roster")
        return
    end

    local uid = roster:UID()

    -- Always a list, even for single entry
    if typeof(targets, Models.Profile) or type(targets) == "number" or type(targets) == "string" then
        targets = { targets }
    elseif type(targets) ~= "table" then
        LOG:Error("PointManager:UpdatePoints(): Invalid targets list")
        return
    end

    note = strsub32(note)
    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LedgerEntries.Modify:new(uid, targets, value, reason, note)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
        entry = LedgerEntries.Set:new(uid, targets, value, reason, note)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
        entry = LedgerEntries.Decay:new(uid, targets, value, reason, note)
    end

    local t = entry:targets()
    if not t or (#t == 0) then
        LOG:Error("PointManager:UpdatePoints(): Empty targets list")
        return
    end

    LedgerManager:Submit(entry, forceInstant)
end

function PointManager:UpdateRosterPoints(roster, value, reason, action, ignoreNegatives, note, forceInstant)
    LOG:Trace("PointManager:UpdateRosterPoints()")
    if not CONSTANTS.POINT_MANAGER_ACTIONS[action] then
        LOG:Error("PointManager:UpdateRosterPoints(): Unknown action")
        return
    end
    if type(value) ~= "number" then
        LOG:Error("PointManager:UpdateRosterPoints(): Value is not a number")
        return
    end
    if not typeof(roster, Models.Roster) then
        LOG:Error("PointManager:UpdateRosterPoints(): Missing valid roster")
        return
    end

    local uid = roster:UID()

    note = strsub32(note)
    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LedgerEntries.ModifyRoster:new(uid, value, reason, note)
    -- elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
    --     entry = LEDGER.DKP.Set:new(uid, targets, value, reason)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
        entry = LedgerEntries.DecayRoster:new(uid, value, reason, ignoreNegatives, note)
    end

    LedgerManager:Submit(entry, forceInstant)
end

function PointManager:UpdateRaidPoints(raid, value, reason, action, note, forceInstant)
    LOG:Trace("PointManager:UpdateRaidPoints()")
    if not CONSTANTS.POINT_MANAGER_ACTIONS[action] then
        LOG:Error("PointManager:UpdateRaidPoints(): Unknown action")
        return
    end
    if type(value) ~= "number" then
        LOG:Error("PointManager:UpdateRaidPoints(): Value is not a number")
        return
    end
    if not typeof(raid, Models.Raid) then
        LOG:Error("PointManager:UpdateRaidPoints(): Missing valid raid")
        return
    end

    note = strsub32(note)
    local uid = raid:UID()
    local includeBench = raid:Configuration():Get("autoAwardIncludeBench") and true or false
    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LedgerEntries.ModifyRaid:new(uid, value, reason, note, includeBench)
    end

    LedgerManager:Submit(entry, forceInstant)
end

function PointManager:RemovePointChange(pointHistory, forceInstant)
    LOG:Trace("PointManager:RemovePointChange()")
    if not typeof(pointHistory, Models.PointHistory) then
        LOG:Error("PointManager:RemovePointChange(): Missing valid point history")
        return
    end

    LedgerManager:Remove(pointHistory:Entry(), forceInstant)
end

function PointManager:UpdatePointsDirectly(roster, targets, value, reason, timestamp, creator)
    LOG:Trace("PointManager:UpdatePointsDirectly()")
    if not roster then
        LOG:Debug("PointManager:UpdatePointsDirectly(): Missing roster")
        return
    end

    local pointHistoryEntry = Models.FakePointHistory:New(targets, timestamp, value, reason, creator)
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate_update_standings, roster, targets, value, reason, timestamp, pointHistoryEntry, true)
end

-- function PointManager:UpdatePointsDirectlyWithoutHistory(roster, targets, value, reason, timestamp, creator)
--     LOG:Trace("PointManager:UpdatePointsDirectly()")
--     if not roster then
--         LOG:Debug("PointManager:UpdatePointsDirectly(): Missing roster")
--         return
--     end

--     update_profile_standings(mutate_update_standings, roster, targets, value, reason, timestamp, nil, true)
-- end

function PointManager:AddPointHistory(roster, targets, pointHistoryEntry)
    LOG:Trace("PointManager:AddPointHistory()")
    if not roster then
        LOG:Debug("PointManager:AddPointHistory(): Missing roster")
        return
    end

    roster:AddRosterPointHistory(pointHistoryEntry)
    for _,target in ipairs(targets) do
        if roster:IsProfileInRoster(target) then
            local targetProfile = ProfileManager:GetProfileByGUID(target)
            if targetProfile then
                roster:AddProfilePointHistory(pointHistoryEntry, targetProfile)
            end
        end
    end
end

function PointManager:AddFakePointHistory(roster, targets, value, reason, timestamp, creator, note)
    LOG:Trace("PointManager:AddFakePointHistory()")
    if not roster then
        LOG:Debug("PointManager:AddFakePointHistory(): Missing roster")
        return
    end

    local pointHistoryEntry = Models.FakePointHistory:New(targets, timestamp, value, reason, creator, note)
    roster:AddRosterPointHistory(pointHistoryEntry)
    for _,target in ipairs(targets) do
        if roster:IsProfileInRoster(target) then
            local targetProfile = ProfileManager:GetProfileByGUID(target)
            if targetProfile then
                roster:AddProfilePointHistory(pointHistoryEntry, targetProfile)
            end
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



PointManager = PointManager
PointManager:Initialize()
resolve(PointManager)
end)

define.module("Constants/PointChangeReason", {}, function(resolve)

-- DO NOT CHANGE THE ID VALUE MAPPING
resolve({
    ON_TIME_BONUS = 1,
    BOSS_KILL_BONUS = 2,
    RAID_COMPLETION_BONUS = 3,
    PROGRESSION_BONUS = 4,
    STANDBY_BONUS = 5,
    UNEXCUSED_ABSENCE = 6,
    CORRECTING_ERROR = 7,
    MANUAL_ADJUSTMENT = 8,
    ZERO_SUM_AWARD = 9,
    IMPORT = 100,
    DECAY = 101,
    INTERVAL_BONUS = 102,
    LINKING_OVERRIDE = 103
})
end)

define.module("Constants/PointChangeReasons", {"Constants/PointChangeReason", "Utils", "L"}, function(resolve, PointChangeReason, UTILS, L)

    local reasons ={
        GENERAL = {  -- Exposed through GUI dropdown, can be localized
            [PointChangeReason.ON_TIME_BONUS] = L["On Time Bonus"],
            [PointChangeReason.BOSS_KILL_BONUS] = L["Boss Kill Bonus"],
            [PointChangeReason.RAID_COMPLETION_BONUS] = L["Raid Completion Bonus"],
            [PointChangeReason.PROGRESSION_BONUS] = L["Progression Bonus"],
            [PointChangeReason.STANDBY_BONUS] = L["Standby Bonus"],
            [PointChangeReason.UNEXCUSED_ABSENCE] = L["Unexcused absence"],
            [PointChangeReason.CORRECTING_ERROR] = L["Correcting error"],
            [PointChangeReason.MANUAL_ADJUSTMENT] = L["Manual adjustment"],
            [PointChangeReason.ZERO_SUM_AWARD] = L["Zero-Sum award"],
        },
        INTERNAL = { -- Not exposed directly to GUI
            [PointChangeReason.IMPORT] = L["Import"],
            [PointChangeReason.DECAY] = L["Decay"],
            [PointChangeReason.INTERVAL_BONUS] = L["Interval Bonus"],
            [PointChangeReason.LINKING_OVERRIDE] = L["Linking override"],
        }
    }

    reasons.ALL = UTILS.mergeDicts(reasons.GENERAL, reasons.INTERNAL)
    resolve(reasons)
end)
define.await({"RaidManager", "Log", "PointManager/PointHistory", "PointManager", "LedgerManager", "PointManager/LedgerEntries","PointManager/update_profile_standings", "Constants/PointChangeReason", "Constants/PointChangeReasons"},
function(RaidManager, LOG, PointHistory, PointManager, LedgerManager, LedgerEntries, update_profile_standings, PointChangeReason, PointChangeReasons)

    local function apply_raid_mutator(entry, mutate)
        local raid = RaidManager:GetRaidByUid(entry:raidUid())
        if not raid then
            LOG:Debug("PointManager apply_raid_mutator(): Unknown raid uid %s", entry:raidUid())
            return
        end
        local roster = raid:Roster()
        if not roster then
            LOG:Debug("PointManager apply_raid_mutator(): Unknown roster")
            return
        end

        local pointHistoryEntry = PointHistory:New(entry, raid:Players())
        PointManager:AddPointHistory(roster, raid:Players(), pointHistoryEntry)
        local playersOnStandby = raid:PlayersOnStandby()
        if entry:standby() and (#playersOnStandby > 0) then
            pointHistoryEntry = PointHistory:New(entry, playersOnStandby, nil, nil, PointChangeReason.STANDBY_BONUS)
            pointHistoryEntry.note = PointChangeReasons.ALL[entry:reason()] or ""
            PointManager:AddPointHistory(roster, playersOnStandby, pointHistoryEntry)
            update_profile_standings(mutate, roster, raid:AllPlayers(), entry:value(), entry:reason(), entry:time(), nil, true)
        else
            update_profile_standings(mutate, roster, raid:Players(), entry:value(), entry:reason(), entry:time(), nil, true)
        end
    end


    LedgerManager:RegisterEntryType(
        LedgerEntries.ModifyRaid,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModifyRaid)")
            apply_raid_mutator(entry, mutate_update_standings)
        end))
end)

define.module("PointManager/update_profile_standings", {"Log", "Utils", "ProfileManager", "EventManager", "Constants/Events"}, function(resolve, LOG, Utils, ProfileManager, EventManager, Events)
local function update_profile_standings(mutate, roster, targets, value, reason, timestamp, pointHistoryEntry, isGUID)
    local alreadyApplied = {}
    local getGuidFromInteger = Utils.getGuidFromInteger
    local getGUID
    if isGUID then
        getGUID = (function(i) return i end)
    else
        getGUID = (function(i) return getGuidFromInteger(i) end)
    end
    for _,target in ipairs(targets) do
        local mainProfile = nil
        local GUID = getGUID(target)
        if not roster:IsProfileInRoster(GUID) then
            LOG:Debug("PointManager apply_mutator(): Unknown profile guid [%s] in roster [%s]", GUID, roster:UID())
            return
        end
        local targetProfile = ProfileManager:GetProfileByGUID(GUID)
        if targetProfile and not targetProfile:IsLocked() then
            if roster:IsProfileInRoster(GUID) and pointHistoryEntry then
                roster:AddProfilePointHistory(pointHistoryEntry, targetProfile)
            end
            -- Check if we have main-alt linking
            if targetProfile:Main() == "" then -- is main
                if targetProfile:HasAlts() then -- has alts
                    mainProfile = targetProfile
                end
            else -- is alt
                mainProfile = ProfileManager:GetProfileByGUID(targetProfile:Main())
            end
            -- Check if we should schedule it for alert
            EventManager:DispatchEvent(Events.USER_RECEIVED_POINTS, { value = value, reason = reason, pointType = roster:GetPointType() }, timestamp, GUID)
            -- If we have a linked case then we alter the GUID to mains guid
            if mainProfile then
                GUID = mainProfile:GUID()
            end
            if roster:IsProfileInRoster(GUID) then
                if not alreadyApplied[GUID] then
                    mutate(roster, GUID, value, timestamp)
                    alreadyApplied[GUID] = true
                    if mainProfile then
                        -- if we have a linked case then we need to mirror the change to all alts
                        roster:MirrorStandings(GUID, mainProfile:Alts(), true)
                    end
                end
            else
                LOG:Debug("PointManager apply_mutator(): Unknown profile guid [%s] in roster [%s]", GUID, roster:UID())
                return
            end
        end
    end
end
    resolve(update_profile_standings)
end)