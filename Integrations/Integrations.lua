local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local getGuidFromInteger = UTILS.getGuidFromInteger

local EventManager = MODULES.EventManager
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local ProfileInfoManager = MODULES.ProfileInfoManager

local Integration = {}

local function InitializeDB(key)
    local db = MODULES.Database:Server()
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
    for GUID,profile in pairs(ProfileManager:GetProfiles()) do
       db.profiles[GUID] = {
            name = profile:Name(),
            class = profile:Class(),
            spec = profile:SpecString(),
            main = profile:Main()
        }
    end
    -- Fill config
    db.config = {}
    for name,roster in pairs(RosterManager:GetRosters()) do
        db.config[name] = {}
        -- Config
        local rounding = roster:GetConfiguration("roundDecimals")
        if rounding > 2 then rounding = 2 end -- fix for default 10-digit rounding
        db.config[name].rounding = rounding
    end
    -- Fill Rosters
    db.rosters = {}
    for name,roster in pairs(RosterManager:GetRosters()) do
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
                table.insert(data.loot, loot)
            end
            -- set point history
            for _, historyEntry in ipairs(roster:GetProfilePointHistoryByGUID(GUID)) do
                local history = {
                    reason = historyEntry:Reason(),
                    time = historyEntry:Timestamp(),
                    value = historyEntry:Value(),
                    creator = getGuidFromInteger(historyEntry:Creator())
                }
                table.insert(data.history, history)
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
    ProfileInfoManager:RequestSpec()
    ProfileInfoManager:RequestVersion()
end

function Integration:Initialize()
    LOG:Trace("Integration:Initialize()")
    ClearWoWDKPBotData()
    -- WoW DKP Bot SV Data
    C_Timer.After(10, RequestWoWDKPBotData)

    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function()
        StoreWoWDKPBotData()
    end))
    -- Generic Data
    self.exportInProgress = false
end

function Integration:Export(config, completeCallback, updateCallback)
    -- if self.exportInProgress then
    --     LOG:Error("Integration: Export in progress")
    -- end
    if config.format == CLM.CONSTANTS.FORMAT_VALUE.XML then
        -- LOG:Warning("Integration: Unsupported format %d", tostring("XML"))
    elseif config.format == CLM.CONSTANTS.FORMAT_VALUE.CSV then
        LOG:Warning("Integration: Unsupported format %s", tostring("CSV"))
    elseif config.format == CLM.CONSTANTS.FORMAT_VALUE.JSON then
        LOG:Warning("Integration: Unsupported format %s", tostring("JSON"))
    else
        LOG:Error("Integration: Unknown export format %d", tostring(config.format))
    end
    self.exportInProgress = true
    CLM.MODELS.Exporter:New(config):Run((function(data)
        completeCallback(data)
        self.exportInProgress = false
        collectgarbage("collect")
    end), updateCallback)
end

CLM.CONSTANTS.FORMAT_VALUE = {
    XML  = 0,
    CSV  = 1,
    JSON = 2
}
CLM.CONSTANTS.FORMAT_VALUES = UTILS.Set(CLM.CONSTANTS.FORMAT_VALUE)

CLM.CONSTANTS.EXPORT_DATA_TYPE = {
    STANDINGS = 0,
    POINT_HISTORY = 1,
    LOOT_HISTORY = 2,
    RAIDS = 3,
    -- CONFIGS = 4,
}

CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE = {
    HOURS = 0,
    DAYS = 1,
    WEEKS = 2,
    MONTHS = 3,
    YEARS  = 4
}

CLM.CONSTANTS.TIMEFRAME_SCALE_VALUES = UTILS.Set(CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE)

CLM.Integration = Integration