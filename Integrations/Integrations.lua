-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local tinsert, wipe = table.insert, wipe
local C_TimerAfter = C_Timer.After
local collectgarbage = collectgarbage
local getGuidFromInteger = UTILS.getGuidFromInteger

local function InitializeDB(key)
    local db = CLM.MODULES.Database:Server()
    if not db.integration then
        db.integration = {}
    end
    if not db.integration[key] then
        db.integration[key] = { }
    end
    return db.integration[key]
end

local function StoreWoWDKPBotData()
    if not CLM.GlobalConfigs:GetWoWDKPBotIntegration() then return end
    local db = InitializeDB("wowdkpbot")
    db.profiles = {}
    -- Fill Profiles
    for GUID,profile in pairs(CLM.MODULES.ProfileManager:GetProfiles()) do
       db.profiles[GUID] = {
            name = profile:Name(),
            class = profile:Class(),
            spec = profile:SpecString(),
            main = profile:Main()
        }
    end
    -- Fill config
    db.config = {}
    for name,roster in pairs(CLM.MODULES.RosterManager:GetRosters()) do
        db.config[name] = {}
        -- Config
        local rounding = roster:GetConfiguration("roundDecimals")
        if rounding > 2 then rounding = 2 end -- fix for default 10-digit rounding
        db.config[name].rounding = rounding
    end
    -- Fill Rosters
    db.rosters = {}
    for name,roster in pairs(CLM.MODULES.RosterManager:GetRosters()) do
        db.rosters[name] = {}
        -- For each profile in roster
        for GUID, value in pairs(roster.standings) do
            db.rosters[name][GUID] = {
                dkp = value, -- set standings
                loot = {},
                history = {}
            }
            local data = db.rosters[name][GUID]
            -- set loot
            for _, lootEntry in ipairs(roster:GetProfileLootByGUID(GUID)) do
                local loot = {
                    id = lootEntry:Id(),
                    time = lootEntry:Timestamp(),
                    value = lootEntry:Value()
                }
                local lootName = GetItemInfo(lootEntry:Id())
                loot.name = lootName or "???"
                tinsert(data.loot, loot)
            end
            -- set point history
            for _, historyEntry in ipairs(roster:GetProfilePointHistoryByGUID(GUID)) do
                local history = {
                    reason = historyEntry:Reason(),
                    time = historyEntry:Timestamp(),
                    value = historyEntry:Value(),
                    creator = getGuidFromInteger(historyEntry:Creator())
                }
                tinsert(data.history, history)
            end
        end

    end
end

local function ClearWoWDKPBotData()
    if not CLM.GlobalConfigs:GetWoWDKPBotIntegration() then return end
    local db = InitializeDB("wowdkpbot") -- luacheck: ignore
    wipe(db)
end

local function RequestWoWDKPBotData()
    if not CLM.GlobalConfigs:GetWoWDKPBotIntegration() then return end
    CLM.MODULES.ProfileInfoManager:RequestSpec()
    CLM.MODULES.ProfileInfoManager:RequestVersion()
end

local function InitializeGargulIntegration(self)

end

local Integration = {}
function Integration:Initialize()
    LOG:Trace("Integration:Initialize()")
    ClearWoWDKPBotData()
    -- WoW DKP Bot SV Data
    C_TimerAfter(10, RequestWoWDKPBotData)

    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function()
        StoreWoWDKPBotData()
    end))
    -- Gargul
    InitializeGargulIntegration(self)
    -- Generic Data
    self.exportInProgress = false
end

function Integration:Export(config, completeCallback, updateCallback)
    if self.exportInProgress then
        LOG:Error("Integration: Export in progress")
        return
    end
    if config.format == CONSTANTS.FORMAT_VALUE.CSV then
        LOG:Warning("Integration: Unsupported format %s", tostring("CSV"))
    elseif not CONSTANTS.FORMAT_VALUES[config.format] then
        LOG:Error("Integration: Unknown export format %d", tostring(config.format))
        return
    end
    self.exportInProgress = true
    CLM.MODELS.Exporter:New(config):Run((function(data)
        completeCallback(data)
        self.exportInProgress = false
        collectgarbage("collect")
    end), updateCallback)
end

CONSTANTS.FORMAT_VALUE = {
    XML  = 0,
    CSV  = 1,
    JSON = 2
}
CONSTANTS.FORMAT_VALUES = UTILS.Set(CONSTANTS.FORMAT_VALUE)

CONSTANTS.EXPORT_DATA_TYPE = {
    STANDINGS = 0,
    POINT_HISTORY = 1,
    LOOT_HISTORY = 2,
    RAIDS = 3,
    CONFIGS = 4,
}

CONSTANTS.TIMEFRAME_SCALE_VALUE = {
    HOURS = 0,
    DAYS = 1,
    WEEKS = 2,
    MONTHS = 3,
    YEARS  = 4
}

CONSTANTS.TIMEFRAME_SCALE_VALUES = UTILS.Set(CONSTANTS.TIMEFRAME_SCALE_VALUE)

CLM.Integration = Integration