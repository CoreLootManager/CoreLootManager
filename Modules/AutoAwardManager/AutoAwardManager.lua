local define = LibDependencyInjection.createContext(...)

define.module("AutoAwardManager", {
    "Utils", "Log",
    "Constants",  "PointManager", "Constants/PointChangeReason", "EventManager", "Acl"
}, function(resolve, UTILS, LOG, CONSTANTS, PointManager, PointChangeReason,EventManager, Acl)
local tonumber, tostring = tonumber, tostring
local IsInRaid, CombatLogGetCurrentEventInfo = IsInRaid, CombatLogGetCurrentEventInfo
local strsplit, GetServerTime, C_TimerNewTicker = strsplit, GetServerTime, C_Timer.NewTicker

local HYDROSS_ENCOUNTER_ID = 623
local HYDROSS_NPC_ID = 21216

local RAID_AWARD_LEDGER_CLASS = "DR"

local multiWoWDifficultyIDs = {
    [3] = 3,
    [4] = 4,
    [5] = 5,
    [6] = 6,
    [9] = 9,
    [148] = 148,
    [175] = 3,
    [176] = 4,
}

local function normalizeDifficultyId(difficultyId)
    return multiWoWDifficultyIDs[difficultyId] or -1
end

local function awardBossKillBonus(id, difficultyId)
    if not difficultyId then
        local _, _, difficultyID = GetInstanceInfo()
        difficultyId = difficultyID
    end
    difficultyId = normalizeDifficultyId(difficultyId)
    LOG:Info("Award Boss Kill Bonus for %s %s", id, difficultyId)
    if RaidManager:IsInActiveRaid() then
        local roster = RaidManager:GetRaid():Roster()
        local config = RaidManager:GetRaid():Configuration()
        if config:Get("bossKillBonus") then
            local value = roster:GetBossKillBonusValue(id, difficultyId)
            if value > 0 then
                PointManager:UpdateRaidPoints(RaidManager:GetRaid(), value, PointChangeReason.BOSS_KILL_BONUS, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, tostring(id))
            end
        end
    end
end

local function handleBossKill(self, addon, event, id, name)
    LOG:Debug("[%s %s]: <%s %s>", addon, event, id, name)
    if RaidManager:ShouldBossKillAward() then
        awardBossKillBonus(id)
    end
end

local function handleBossWorkaround(self, targets)
    if RaidManager:ShouldBossKillAward() then
        local _, subevent, _, _, _, _, _, guid, _   = CombatLogGetCurrentEventInfo()
        if subevent == "UNIT_DIED" then
            local _, _, _, _, _, npc_id = strsplit("-", guid)
            local encounterId = targets[tonumber(npc_id)]
            if encounterId then
                awardBossKillBonus(encounterId)
            end
        end
    end
end

local function handleIntervalBonus(self)
    LOG:Trace("AutoAwardManager handleIntervalBonus()")
    if not IsInRaid() then return end
    if not RaidManager:ShouldIntervalAward() then return end
    -- Validate roster
    local raid = RaidManager:GetRaid()
    local roster = raid:Roster()
    if not roster then
        LOG:Warning("No roster in raid for handleIntervalBonus()")
        return
    end
    local config = raid:Configuration()
    -- Validate settings
    if not config:Get("intervalBonus") then return end
    local interval = config:Get("intervalBonusTime")
    if interval <= 0 then return end
    local value = config:Get("intervalBonusValue")
    if value <= 0 then return end
    interval = interval * 60 -- minutes in seconds
    local now = GetServerTime()
    local pointHistory = roster:GetRaidPointHistory()
    local award = true
    -- Check if at least interval passed since raid start
    if now - raid:StartTime() < interval then return end
    -- Check History
    for i = #pointHistory, 1, -1 do
        local pointHistoryEntry = pointHistory[i]
        -- If we are already so deep in history we missed the interval
        if now - pointHistoryEntry:Timestamp() >= interval then
            break
        end
        local entry = pointHistoryEntry:Entry()
        -- zero-sum and start/end raid dkp dont have directly related entries at this point
        -- and are also not considered for this calculation
        -- also this is a bit of workaround:
        -- if history would know if its a select/roster/raid we would not need to touch entry
        -- TODO: this ^
        if entry then
            -- if its raid award entry to our raid for interval
            if  (entry:class() == RAID_AWARD_LEDGER_CLASS) and
                (entry:raidUid() == raid:UID()) and
                (pointHistoryEntry:Reason() == PointChangeReason.INTERVAL_BONUS) then -- skip only for interval awards
                award = false
                break
            end
        end
    end
    if award then
        PointManager:UpdateRaidPoints(raid, value, PointChangeReason.INTERVAL_BONUS, CONSTANTS.POINT_MANAGER_ACTION.MODIFY)
    end
end

local instancesToWorkaround = UTILS.Set({548})
local encountersToWorkaround = UTILS.Set({HYDROSS_ENCOUNTER_ID})

local isWorkaroundRegistered = false
local function registerWorkaroundHandler(self)
    if isWorkaroundRegistered then return end
    EventManager:RegisterWoWEvent({"COMBAT_LOG_EVENT_UNFILTERED"}, (function(...)
        handleBossWorkaround(self, {
            [HYDROSS_NPC_ID] = HYDROSS_ENCOUNTER_ID
        })
    end))
    isWorkaroundRegistered = true
end

local AutoAwardManager = {
    encounterInProgress = 0,
}
function AutoAwardManager:Initialize()
    LOG:Trace("AutoAwardManager:Initialize()")
    if not Acl:IsTrusted() then return end
    EventManager:RegisterWoWEvent({"ENCOUNTER_START"}, (function(_, _, _, id, ...)
        if encountersToWorkaround[id] then
            registerWorkaroundHandler(self)
        end
    end))
    -- Handle boss kill when not in encounter
    EventManager:RegisterWoWEvent({"BOSS_KILL"}, (function(...)
        handleBossKill(self, ...)
    end))
    -- Boss workarounds
    local _, _, _, _, _, _, _, instanceID = GetInstanceInfo()
    if instancesToWorkaround[instanceID] then
        registerWorkaroundHandler(self)
    end


end


resolve(AutoAwardManager)


end)