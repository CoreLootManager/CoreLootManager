local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS

local ACL = MODULES.ACL
local PointManager = MODULES.PointManager
local RaidManager = MODULES.RaidManager
local EventManager = MODULES.EventManager

local HYDROSS_ENCOUNTER_ID = 623
-- local HYDROSS_ENCOUNTER_NAME = "Hydross the Unstable"
local HYDROSS_NPC_ID = 21216

local RAID_AWARD_LEDGER_CLASS = "DR"

local function awardBossKillBonus(id)
    LOG:Info("Award Boss Kill Bonus for %s", id)
    if RaidManager:IsInActiveRaid() then
        local roster = RaidManager:GetRaid():Roster()
        local config = RaidManager:GetRaid():Configuration()
        if config:GetConfiguration("bossKillBonus") then
            local value = roster:GetBossKillBonusValue(id)
            if value > 0 then
                PointManager:UpdateRaidPoints(RaidManager:GetRaid(), value, CONSTANTS.POINT_CHANGE_REASON.BOSS_KILL_BONUS, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, tostring(id))
            end
        end
    end
end

-- local function handleEncounterStart(self, addon, event, id, name, difficulty, groupSize)
--     LOG:Debug("[%s %s]: <%s, %s, %s, %s>", addon, event, id, name, difficulty, groupSize)
--     if self:IsEnabled() and self:IsBossKillBonusAwardingEnabled() then
--         self.encounterInProgress = id
--     end
-- end

-- local function handleEncounterEnd(self, addon, event, id, name, difficulty, groupSize, success)
--     LOG:Debug("[%s %s]: <%s, %s, %s, %s, %s>", addon, event, id, name, difficulty, groupSize, success)
--     if self:IsEnabled() and self:IsBossKillBonusAwardingEnabled() and self:EncounterInProgress() then
--         if self.encounterInProgress == id then
--             if success == 1 then
--                 awardBossKillBonus(id)
--             end
--             self.encounterInProgress = 0
--         end
--     end
-- end

local function handleBossKill(self, addon, event, id, name)
    LOG:Debug("[%s %s]: <%s %s>", addon, event, id, name)
    if self:IsEnabled() and self:IsBossKillBonusAwardingEnabled() then
        awardBossKillBonus(id)
    end
end

local function handleHydrossWorkaround(self, addon, event)
    if self:IsEnabled() and self:IsBossKillBonusAwardingEnabled() then
        local _, subevent, _, _, _, _, _, guid, _   = CombatLogGetCurrentEventInfo()
        if subevent == "UNIT_DIED" then
            local _, _, _, _, _, npc_id = strsplit("-", guid)
            if tonumber(npc_id) == HYDROSS_NPC_ID then
                awardBossKillBonus(HYDROSS_ENCOUNTER_ID)
            end
        end
    end
end

local function handleIntervalBonus(self)
    LOG:Trace("AutoAwardManager handleIntervalBonus()")
    if not IsInRaid() then return end
    if not self:IsEnabled() then return end
    if not self:IsIntervalBonusAwardingEnabled() then return end
    if not RaidManager:IsInProgressingRaid() then return end
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
    for _,pointHistoryEntry in ipairs(pointHistory) do
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
                (pointHistoryEntry:Reason() == CONSTANTS.POINT_CHANGE_REASON.INTERVAL_BONUS) then -- skip only for interval awards
                award = false
                break
            end
        end
    end
    if award then
        PointManager:UpdateRaidPoints(raid, value, CONSTANTS.POINT_CHANGE_REASON.INTERVAL_BONUS, CONSTANTS.POINT_MANAGER_ACTION.MODIFY)
    end
end

local AutoAwardManager = {}
function AutoAwardManager:Initialize()
    LOG:Trace("AutoAwardManager:Initialize()")
    if not ACL:IsTrusted() then return end
    self.enabled = false
    self:DisableBossKillBonusAwarding()
    self:DisableIntervalBonusAwarding()
    -- EventManager:RegisterWoWEvent({"ENCOUNTER_START"}, (function(...)
    --     handleEncounterStart(self, ...)
    -- end))
    -- EventManager:RegisterWoWEvent({"ENCOUNTER_END"}, (function(...)
    --     handleEncounterEnd(self, ...)
    -- end))
    -- Handle boss kill when not in encounter
    EventManager:RegisterWoWEvent({"BOSS_KILL"}, (function(...)
        handleBossKill(self, ...)
    end))
    -- Hydross workaround
    EventManager:RegisterWoWEvent({"COMBAT_LOG_EVENT_UNFILTERED"}, (function(...)
        handleHydrossWorkaround(self, ...)
    end))
    MODULES.ConfigManager:RegisterUniversalExecutor("aam", "AutoAwardManager", self)
end

function AutoAwardManager:Enable()
    LOG:Trace("AutoAwardManager:Enable()")
    self.enabled = true
end

function AutoAwardManager:Disable()
    LOG:Trace("AutoAwardManager:Disable()")
    self.enabled = false
end

function AutoAwardManager:IsEnabled()
    LOG:Trace("AutoAwardManager:IsEnabled()")
    return self.enabled
end

function AutoAwardManager:EncounterInProgress()
    LOG:Trace("AutoAwardManager:EncounterInProgress()")
    return (self.encounterInProgress ~= 0)
end

function AutoAwardManager:EnableBossKillBonusAwarding()
    LOG:Trace("AutoAwardManager:EnableBossKillBonusAwarding()")
    self.bossKillBonusAwardingEnabled = true
end

function AutoAwardManager:DisableBossKillBonusAwarding()
    LOG:Trace("AutoAwardManager:DisableBossKillBonusAwarding()")
    self.encounterInProgress = 0
    self.bossKillBonusAwardingEnabled = false
end

function AutoAwardManager:IsBossKillBonusAwardingEnabled()
    LOG:Trace("AutoAwardManager:IsBossKillBonusAwardingEnabled()")
    return self.bossKillBonusAwardingEnabled
end

function AutoAwardManager:EnableIntervalBonusAwarding()
    LOG:Trace("AutoAwardManager:EnableIntervalBonusAwarding()")
    self.intervalBonusAwardingEnabled = true
    handleIntervalBonus(self) -- additional handle for cases of relogs / reloads if time has already passed
    if not self.intervalTimer then
        self.intervalTimer = C_Timer.NewTicker(60, function()
            handleIntervalBonus(self)
        end)
    end
end

function AutoAwardManager:DisableIntervalBonusAwarding()
    LOG:Trace("AutoAwardManager:DisableIntervalBonusAwarding()")
    self.intervalBonusAwardingEnabled = false
end

function AutoAwardManager:IsIntervalBonusAwardingEnabled()
    LOG:Trace("AutoAwardManager:IsIntervalBonusAwardingEnabled()")
    return self.intervalBonusAwardingEnabled
end

MODULES.AutoAwardManager = AutoAwardManager
