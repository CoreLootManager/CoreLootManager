local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS = CLM.MODELS

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager
local EventManager = MODULES.EventManager

local LEDGER_DKP = MODELS.LEDGER.DKP
local Profile = MODELS.Profile
local Roster = MODELS.Roster
local Raid = MODELS.Raid
local PointHistory = MODELS.PointHistory
local FakePointHistory = MODELS.FakePointHistory

local typeof = UTILS.typeof
local getGuidFromInteger = UTILS.getGuidFromInteger

local function update_profile_standings(mutate, roster, targets, value, reason, timestamp, pointHistoryEntry, isGUID)
    local alreadyApplied = {}
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
        if targetProfile then
            if roster:IsProfileInRoster(GUID) then
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
            EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_RECEIVED_POINTS, { value = value, reason = reason }, timestamp, GUID)
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

local function apply_mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if not roster then
        LOG:Debug("PointManager apply_mutator(): Unknown roster uid %s", entry:rosterUid())
        return
    end

    local pointHistoryEntry = PointHistory:New(entry)
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate, roster, entry:targets(), entry:value(), entry:reason(), entry:time(), pointHistoryEntry)
end

local function apply_roster_mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if not roster then
        LOG:Debug("PointManager apply_roster_mutator(): Unknown roster uid %s", entry:rosterUid())
        return
    end

    local pointHistoryEntry = PointHistory:New(entry, roster:Profiles())
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate, roster, roster:Profiles(), entry:value(), entry:reason(), entry:time(), pointHistoryEntry, true)
end

local function apply_raid_mutator(entry, mutate)
    local raid = MODULES.RaidManager:GetRaidByUid(entry:raidUid())
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
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate, roster, raid:Players(), entry:value(), entry:reason(), entry:time(), pointHistoryEntry, true)
end

local function mutate_update_standings(roster, GUID, value, timestamp)
    roster:UpdateStandings(GUID, value, timestamp)
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
        LEDGER_DKP.Modify,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModify)")
            apply_mutator(entry, mutate_update_standings)
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Set,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPSet)")
            apply_mutator(entry, mutate_set_standings)
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.Decay,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPDecay)")
            apply_mutator(entry, mutate_decay_standings)
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.ModifyRoster,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModifyRoster)")
            apply_roster_mutator(entry, mutate_update_standings)
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.DecayRoster,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPDecayRoster)")
            apply_roster_mutator(entry, mutate_decay_standings)
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_DKP.ModifyRaid,
        (function(entry)
            LOG:TraceAndCount("mutator(DKPModifyRaid)")
            apply_raid_mutator(entry, mutate_update_standings)
        end))

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
    elseif type(targets) ~= "table" then
        LOG:Error("PointManager:UpdatePoints(): Invalid targets list")
        return
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
        LOG:Error("PointManager:UpdatePoints(): Empty targets list")
        return
    end

    LedgerManager:Submit(entry, forceInstant)
end

function PointManager:UpdateRosterPoints(roster, value, reason, action, forceInstant)
    LOG:Trace("PointManager:UpdateRosterPoints()")
    if not CONSTANTS.POINT_MANAGER_ACTIONS[action] then
        LOG:Error("PointManager:UpdateRosterPoints(): Unknown action")
        return
    end
    if type(value) ~= "number" then
        LOG:Error("PointManager:UpdateRosterPoints(): Value is not a number")
        return
    end
    if not typeof(roster, Roster) then
        LOG:Error("PointManager:UpdateRosterPoints(): Missing valid roster")
        return
    end

    local uid = roster:UID()

    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LEDGER_DKP.ModifyRoster:new(uid, value, reason)
    -- elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
    --     entry = LEDGER_DKP.Set:new(uid, targets, value, reason)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
        entry = LEDGER_DKP.DecayRoster:new(uid, value, reason)
    end

    LedgerManager:Submit(entry, forceInstant)
end

function PointManager:UpdateRaidPoints(raid, value, reason, action, forceInstant)
    LOG:Trace("PointManager:UpdateRaidPoints()")
    if not CONSTANTS.POINT_MANAGER_ACTIONS[action] then
        LOG:Error("PointManager:UpdateRaidPoints(): Unknown action")
        return
    end
    if type(value) ~= "number" then
        LOG:Error("PointManager:UpdateRaidPoints(): Value is not a number")
        return
    end
    if not typeof(raid, Raid) then
        LOG:Error("PointManager:UpdateRaidPoints(): Missing valid raid")
        return
    end

    local uid = raid:UID()
    local entry
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = LEDGER_DKP.ModifyRaid:new(uid, value, reason)
    -- elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
    --     entry = LEDGER_DKP.Set:new(uid, targets, value, reason)
    -- elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
    --     entry = LEDGER_DKP.DecayRoster:new(uid, value, reason)
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

function PointManager:UpdatePointsDirectly(roster, targets, value, reason, timestamp, creator)
    LOG:Trace("PointManager:UpdatePointsDirectly()")
    if not roster then
        LOG:Debug("PointManager:UpdatePointsDirectly(): Missing roster")
        return
    end

    local pointHistoryEntry = FakePointHistory:New(targets, timestamp, value, reason, creator)
    roster:AddRosterPointHistory(pointHistoryEntry)

    update_profile_standings(mutate_update_standings, roster, targets, value, reason, timestamp, pointHistoryEntry, true)
end

CONSTANTS.POINT_MANAGER_ACTION =
{
    MODIFY = 0,
    SET = 1,
    DECAY = 2
}

CONSTANTS.POINT_MANAGER_ACTIONS = UTILS.Set({ 0, 1, 2 })

-- DO NOT CHANGE THE ID VALUE MAPPING
CONSTANTS.POINT_CHANGE_REASON = {
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
    INTERVAL_BONUS = 102
}

CONSTANTS.POINT_CHANGE_REASONS = {
    GENERAL = {  -- Exposed through GUI dropdown, can  be localized
        [CONSTANTS.POINT_CHANGE_REASON.ON_TIME_BONUS] = "On Time Bonus",
        [CONSTANTS.POINT_CHANGE_REASON.BOSS_KILL_BONUS] = "Boss Kill Bonus",
        [CONSTANTS.POINT_CHANGE_REASON.RAID_COMPLETION_BONUS] = "Raid Completion Bonus",
        [CONSTANTS.POINT_CHANGE_REASON.PROGRESSION_BONUS] = "Progression Bonus",
        [CONSTANTS.POINT_CHANGE_REASON.STANDBY_BONUS] = "Standby Bonus",
        [CONSTANTS.POINT_CHANGE_REASON.UNEXCUSED_ABSENCE] = "Unexcused absence",
        [CONSTANTS.POINT_CHANGE_REASON.CORRECTING_ERROR] = "Correcting error",
        [CONSTANTS.POINT_CHANGE_REASON.MANUAL_ADJUSTMENT] = "Manual adjustment",
        [CONSTANTS.POINT_CHANGE_REASON.ZERO_SUM_AWARD] = "Zero-Sum award",
    },
    INTERNAL = { -- Not exposed directly to GUI
        [CONSTANTS.POINT_CHANGE_REASON.IMPORT] = "Import",
        [CONSTANTS.POINT_CHANGE_REASON.DECAY] = "Decay",
        [CONSTANTS.POINT_CHANGE_REASON.INTERVAL_BONUS] = "Interval Bonus"
    }
}

CONSTANTS.POINT_CHANGE_REASONS.ALL = UTILS.mergeDicts(CONSTANTS.POINT_CHANGE_REASONS.GENERAL, CONSTANTS.POINT_CHANGE_REASONS.INTERNAL)

MODULES.PointManager = PointManager