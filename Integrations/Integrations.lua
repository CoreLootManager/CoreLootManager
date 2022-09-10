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

local EXTERNAL_AWARD_EVENT = "CLM_EXTERNAL_EVENT_ITEM_AWARDED"

CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION = {
    NONE = 1,
    AWARD_FOR_FREE = 2,
    AWARD_FOR_BASE = 3,
    AWARD_FOR_SMALL = 4,
    AWARD_FOR_MEDIUM = 5,
    AWARD_FOR_LARGE = 6,
    AWARD_FOR_MAX = 7
}

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

local function StoreWoWDKPBotData(self)
    if not self:GetWoWDKPBotIntegration() then return end
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
    local db = InitializeDB("wowdkpbot") -- luacheck: ignore
    wipe(db)
end

local function RequestWoWDKPBotData(self)
    if not self:GetWoWDKPBotIntegration() then return end
    CLM.MODULES.ProfileInfoManager:RequestSpec()
    CLM.MODULES.ProfileInfoManager:RequestRole()
    CLM.MODULES.ProfileInfoManager:RequestVersion()
end

local function InitializeGargulIntegration(self)
    local options = {
        global_gargul_integration_header = {
            name = CLM.L["Gargul Integration"],
            type = "header",
            width = "full",
            order = 10
        },
        global_gargul_integration = {
            name = CLM.L["Gargul Integration"],
            desc = CLM.L["Enable Gargul integration. This will allow Gargul to take control over some aspects of CLM (starting auction from Gargul, and awarding)."],
            type = "toggle",
            set = function(i, v) self:SetGargulIntegration(v) end,
            get = function(i) return self:GetGargulIntegration() end,
            width = "full",
            order = 10.1
        },
        empty_slot1 = { type = "description", name = "", fontSize = "medium", width = 1, order = 13 },
        empty_slot2 = { type = "description", name = "", fontSize = "medium", width = 1, order = 16 },
    }

    local selections = {
        {
            name = CLM.L["Regular"] .. " " .. CLM.L["MS"],
            order = 11,
            var = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.REGULAR_MS,
        },
        {
            name = CLM.L["Prioritized"] .. " " .. CLM.L["MS"],
            order = 12,
            var = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.PRIORITY_MS,
        },
        {
            name = CLM.L["Regular"] .. " " .. CLM.L["OS"],
            order = 14,
            var = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.REGULAR_OS,
        },
        {
            name = CLM.L["Prioritized"] .. " " .. CLM.L["OS"],
            order = 15,
            var = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.PRIORITY_OS,
        }
    }

    for _,selection in ipairs(selections) do
        options[selection.var] = {
            name = selection.name,
            desc = CLM.L["Action to take upon Gargul loot award event happening during raid."],
            type = "select",
            values = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS_GUI,
            set = (function(i, v)
                self:SetGargulAwardAction(selection.var, v)
            end),
            get = (function(i)
                return self:GetGargulAwardAction(selection.var)
            end),
            order = selection.order
        }
    end

    return options
end

local function InitializeConfigs(self)
    local options = {
        global_wodkpbot_integration = {
            name = CLM.L["WoW DKP Bot Integration"],
            desc = CLM.L["Enble WoW DKP Bot Integration. This will result in additional data stored upon logout."],
            type = "toggle",
            set = function(i, v) self:SetWoWDKPBotIntegration(v) end,
            get = function(i) return self:GetWoWDKPBotIntegration() end,
            width = "full",
            order = 1
        },
    }

    UTILS.mergeDictsInline(options, InitializeGargulIntegration(self))

    CLM.MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.INTEGRATIONS, options)
end

local Integration = {}

local function validateEventStructure(data, source)
    if data.source ~= source then return end
    if not data.itemLink then return end
    if not data.player then return end

    return true
end

local function parseEventStructure(data)
    local itemId = UTILS.GetItemIdFromLink(data.itemLink)
    local isOs = data.isOffSpec and true or false
    local isWishlisted = data.isWishlisted and true or false
    local isPrioritized = data.isPrioritized and true or false
    local isReserved = data.isReserved and true or false

    return data.player, data.itemLink, itemId, isOs, isWishlisted, isPrioritized, isReserved
end

local function getGargulAwardActionName(isOs, isWishlisted, isPrioritized, isReserved)
    if not isOs and     isPrioritized then return CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.PRIORITY_MS end
    if     isOs and     isPrioritized then return CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.PRIORITY_OS end
    if not isOs and not isPrioritized then return CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.REGULAR_MS  end
    if     isOs and not isPrioritized then return CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER.REGULAR_OS  end
end

local awardToTierMap = {
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_BASE]   = CONSTANTS.SLOT_VALUE_TIER.BASE,
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_SMALL]  = CONSTANTS.SLOT_VALUE_TIER.SMALL,
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_MEDIUM] = CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_LARGE]  = CONSTANTS.SLOT_VALUE_TIER.LARGE,
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_MAX]    = CONSTANTS.SLOT_VALUE_TIER.MAX
}

local function getAwardValueFromAction(roster, itemId, action)
    local tier = awardToTierMap[action]
    if not tier then return 0 end -- covers also for FREE
    local values = roster:GetItemValues(itemId)
    return values[tier] or 0
end

-- LootManager:AwardItem(raidOrRoster, name, itemLink, itemId, value, forceInstant)
local function ExternalAwardEventHandler(_, data)
    if Integration:GetGargulIntegration() then
        if not validateEventStructure(data, "Gargul") then
            LOG:Warning("Malformed Gargul Event")
            return
        end
        local player, itemLink, itemId, isOs, isWishlisted, isPrioritized, isReserved = parseEventStructure(data)
        local action = Integration:GetGargulAwardAction(getGargulAwardActionName(isOs, isWishlisted, isPrioritized, isReserved))
        if action == CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE then return end
        local profile = CLM.MODULES.ProfileManager:GetProfileByName(player)
        if not profile then
            LOG:Debug("Gargul item awarded to player without profile")
            return
        end
        local raid = CLM.MODULES.RaidManager:GetProfileRaid(profile:GUID())
        if not raid then
            LOG:Debug("Gargul item awarded outside of raid")
            return
        end
        local value = getAwardValueFromAction(raid:Roster(), itemId, action)
        CLM.MODULES.LootManager:AwardItem(raid, player, itemLink, itemId, value)
    end
end


function Integration:Initialize()
    LOG:Trace("Integration:Initialize()")
    self.db = InitializeDB("global")
    ClearWoWDKPBotData()
    InitializeConfigs(self)

    -- WoW DKP Bot SV Data
    C_TimerAfter(10, (function() RequestWoWDKPBotData(self) end))
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function()
        StoreWoWDKPBotData(self)
    end))
    -- External award integration
    CLM.MODULES.EventManager:RegisterEvent(EXTERNAL_AWARD_EVENT, ExternalAwardEventHandler)

    self.exportInProgress = false
end

function Integration:SetWoWDKPBotIntegration(value)
    self.db.wowdkpbot_integration = value and true or false
end

function Integration:GetWoWDKPBotIntegration()
    return self.db.wowdkpbot_integration
end

function Integration:SetGargulIntegration(value)
    self.db.gargul_integration = value and true or false
end

function Integration:GetGargulIntegration()
    return self.db.gargul_integration
end

function Integration:SetGargulAwardAction(handler, action)
    if not CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLERS[handler] then return end
    local db = InitializeDB("gargul")
    db[handler] = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS[action] and action or CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE
end

function Integration:GetGargulAwardAction(handler)
    local db = InitializeDB("gargul")
    return db[handler] or CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE
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

CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS = UTILS.Set(CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION)

CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS_ORDERED = {
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE,
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_FREE,
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_BASE,
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_SMALL,
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_MEDIUM,
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_LARGE,
    CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_MAX,
}

CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS_GUI = {
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE]             = CLM.L["None"],
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_FREE]   = CLM.L["Award for Free"],
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_BASE]   = CLM.L["Award for Base"],
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_SMALL]  = CLM.L["Award for Small"],
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_MEDIUM] = CLM.L["Award for Medium"],
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_LARGE]  = CLM.L["Award for Large"],
    [CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.AWARD_FOR_MAX]    = CLM.L["Award for Max"],
}

CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER = {
    REGULAR_MS = "rms",
    REGULAR_OS = "ros",
    PRIORITY_MS = "pms",
    PRIORITY_OS = "pos"
}

CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLERS = UTILS.Set(CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION_HANDLER)

CONSTANTS.TIMEFRAME_SCALE_VALUES = UTILS.Set(CONSTANTS.TIMEFRAME_SCALE_VALUE)

CLM.Integration = Integration