-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local HYDROSS_ENCOUNTER_ID = 623
local HYDROSS_NPC_ID = 21216

local RAID_AWARD_LEDGER_CLASS = "DR"

local multiWoWDifficultyIDs = {
    [0] = 0, -- World Bosses
    [3] = 3, -- 10 man
    [4] = 4, -- 25 man
    [5] = 5, -- 10 man HC
    [6] = 6, -- 25 man HC
    [9] = 9, -- 40 man
    [148] = 148,
    [175] = 3, -- 10 man
    [176] = 4, -- 25 man
    [185] = 148, -- 20 man
    [186] = 9, -- 40 man
    [197] = 3, -- 10 man SoD
    [198] = 3, -- 10 man SoD
    [215] = 148,
    [14] = 14,
    [15] = 15,
    [16] = 16,
    [17] = 17,
}

local bossKillEncounterWorkaround = {
    -- EoE / OS / VoA
    [742] = 1090,
    [738] = 1091,
    [736] = 1092,
    [740] = 1093,
    [734] = 1094,
    [772] = 1126,
    [774] = 1127,
    [776] = 1128,
    [885] = 1129,
    -- Ulduar
    [757] = 1130,
    [750] = 1131,
    [744] = 1132,
    [753] = 1133,
    [755] = 1134,
    [751] = 1135,
    [745] = 1136,
    [749] = 1137,
    [754] = 1138,
    [746] = 1139,
    [748] = 1140,
    [752] = 1141,
    [747] = 1142,
    [756] = 1143,
    -- Trial of the Grand Crusader
    [629] = 1088,
    [633] = 1087,
    [637] = 1086,
    [641] = 1089,
    [645] = 1085,
    -- ICC
    [852] = 1095,
    [848] = 1096,
    [849] = 1097,
    [854] = 1098,
    [847] = 1099,
    [846] = 1100,
    [845] = 1101,
    [851] = 1102,
    [853] = 1103,
    [850] = 1104,
    [855] = 1105,
    [856] = 1106,
    -- Ruby Sanctum
    [890] = 1147,
    [893] = 1148,
    [891] = 1149,
    [887] = 1150,
}

local function normalizeDifficultyId(difficultyId)
    return multiWoWDifficultyIDs[difficultyId] or -1
end

local function awardBonusValue(id, value)
    if value ~= 0 then
        CLM.MODULES.PointManager:UpdateRaidPoints(CLM.MODULES.RaidManager:GetRaid(), value, CONSTANTS.POINT_CHANGE_REASON.BOSS_KILL_BONUS, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, tostring(id), CONSTANTS.POINT_CHANGE_TYPE.POINTS)
    end
end

local POPUP = "CLM_BOSS_KILL_BONUS_HARD_MODE"

StaticPopupDialogs[POPUP] = {
    text = CLM.L["Select |cffeeee00%s|r encounter difficulty for bonus value award (%s)."],
    button1 = CLM.L["Normal Mode"],
    button2 = CLM.L["Hard Mode"],
    OnButton1 = function(self)
        awardBonusValue(self.encounterId, self.bonus.normal)
     end,
    OnButton2 = function(self)
        awardBonusValue(self.encounterId, self.bonus.hardMode)
    end,
    OnButton3 = function()
    end,
    -- sound =
    multiple = true,
    enterClicksFirstButton = false,
    noCancelOnReuse = true,
    notClosableByLogout = true,
    timeout = 60,
    whileDead = true,
    hideOnEscape = false,
    selectCallbackByIndex = true
}

local function awardBossKillBonus(id, difficultyId)
    if not difficultyId then
        local _, _, difficultyID = GetInstanceInfo()
        difficultyId = difficultyID
    end
    id = bossKillEncounterWorkaround[id] or id
    difficultyId = normalizeDifficultyId(difficultyId)
    LOG:Info("Award Boss Kill Bonus for %s %s", id, difficultyId)
    if CLM.MODULES.RaidManager:IsInActiveRaid() then
        local roster = CLM.MODULES.RaidManager:GetRaid():Roster()
        local config = CLM.MODULES.RaidManager:GetRaid():Configuration()
        if config:Get("bossKillBonus") then
            local normalBonus = roster:GetBossKillBonusValue(id, difficultyId, false)
            local hardModeBonus = roster:GetBossKillBonusValue(id, difficultyId, true)
            if CLM.EncounterHasHardMode[id] and hardModeBonus ~= normalBonus then
                local bonusValueString  = string.format("|cff44ee44%d|r/|cffee4444%d|r", normalBonus, hardModeBonus)
                local dialog = StaticPopup_Show(POPUP, CLM.EncounterIDsMap[id], bonusValueString)
                if dialog then
                    dialog.encounterId = id
                    dialog.bonus = {
                        normal = normalBonus,
                        hardMode = hardModeBonus
                    }
                end
            else
                awardBonusValue(id, normalBonus)
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

local function handleBossWorkaround(self, targets)
    if self:IsEnabled() and self:IsBossKillBonusAwardingEnabled() then
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
    if not self:IsEnabled() then return end
    if not self:IsIntervalBonusAwardingEnabled() then return end
    if not CLM.MODULES.RaidManager:IsInProgressingRaid() then return end
    -- Validate roster
    local raid = CLM.MODULES.RaidManager:GetRaid()
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
                (pointHistoryEntry:Reason() == CONSTANTS.POINT_CHANGE_REASON.INTERVAL_BONUS) then -- skip only for interval awards
                award = false
                break
            end
        end
    end
    if award then
        CLM.MODULES.PointManager:UpdateRaidPoints(raid, value, CONSTANTS.POINT_CHANGE_REASON.INTERVAL_BONUS, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, nil, CONSTANTS.POINT_CHANGE_TYPE.POINTS)
    end
end

local instancesToWorkaround = CLM.UTILS.Set({548})
local encountersToWorkaround = CLM.UTILS.Set({HYDROSS_ENCOUNTER_ID})

local isWorkaroundRegistered = false
local function registerWorkaroundHandler(self)
    if isWorkaroundRegistered then return end
    CLM.MODULES.EventManager:RegisterWoWEvent({"COMBAT_LOG_EVENT_UNFILTERED"}, (function(...)
        handleBossWorkaround(self, {
            [HYDROSS_NPC_ID] = HYDROSS_ENCOUNTER_ID
        })
    end))
    isWorkaroundRegistered = true
end

local AutoAwardManager = {}
function AutoAwardManager:Initialize()
    LOG:Trace("AutoAwardManager:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    self.enabled = false
    self:DisableBossKillBonusAwarding()
    self:DisableIntervalBonusAwarding()
    CLM.MODULES.EventManager:RegisterWoWEvent({"ENCOUNTER_START"}, (function(_, _, _, id, ...)
        if encountersToWorkaround[id] then
            registerWorkaroundHandler(self)
        end
    end))
    -- Handle boss kill when not in encounter
    CLM.MODULES.EventManager:RegisterWoWEvent({"BOSS_KILL"}, (function(...)
        handleBossKill(self, ...)
    end))
    -- Boss workarounds
    local _, _, _, _, _, _, _, instanceID = GetInstanceInfo()
    if instancesToWorkaround[instanceID] then
        registerWorkaroundHandler(self)
    end


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

CLM.MODULES.AutoAwardManager = AutoAwardManager

--@do-not-package@
CLM.awardBossKillBonus = awardBossKillBonus
--@end-do-not-package@
