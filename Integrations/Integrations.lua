-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local tinsert, tremove, wipe = table.insert, table.remove, wipe
local sfind, strlower = string.find, strlower
local C_TimerAfter = C_Timer.After
local collectgarbage = collectgarbage
local getGuidFromInteger = UTILS.getGuidFromInteger

local EXTERNAL_AWARD_EVENT = "CLM_EXTERNAL_EVENT_ITEM_AWARDED"
local RCLC_AWARD_EVENT = "RCMLAwardSuccess"

local _, _, _, isRCLC = GetAddOnInfo("RCLootCouncil_Classic")

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

local function GetRCLCReasonsAndResponses()
    local info = {}
    if not RCLootCouncil then return end

    local numAwardReasons = RCLootCouncil.db.profile.numAwardReasons
    -- Reasons
    for i=1,3 do
        if i <= numAwardReasons then
            local reason = RCLootCouncil.db.profile.awardReasons[i]
            info[#info+1] = reason and reason.txt or RCLootCouncil.db.profile.awardReasons[i].text
        end
    end
    for i=4,10 do
        if i <= numAwardReasons then
            local reason = RCLootCouncil.db.profile.awardReasons[i]
            if reason then
                info[#info+1] = reason.txt
            end
        end
    end
    -- Buttons and responses
    for section, buttons in pairs (RCLootCouncil.db.profile.responses) do
        if RCLootCouncil.db.profile.enabledButtons[section] or section == "default" then
            for _,button in ipairs(buttons) do
                if button.text and strsub(button.text, 1, 6) ~= "Button" then
                    info[#info+1] = button.text
                end
            end
        end
    end

    return info
end

local function InitializeRCLCIntegration(self)
    local db = InitializeDB("rclc.handlers")
    if #db == 0 then
        local success, result = pcall(GetRCLCReasonsAndResponses)
        if success then
            result = result or {}
            for _,text in ipairs(result) do
                db[#db+1] = {
                    trigger = text,
                    action = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE
                }
            end
            self:InitializeConfigs()
        end
    end
end

local function CreateRCLCIntegration(self)
    local db = InitializeDB("rclc.handlers")
    local options = {
        global_rclc_integration_header = {
            name = CLM.L["RCLC Integration"],
            type = "header",
            width = "full",
            order = 20
        },
        global_rclc_integration = {
            name = CLM.L["RCLC Integration"],
            desc = CLM.L["Enable RCLC integration. This will allow awarding DKP/GP points on RCLC item award. Requires /reload."],
            type = "toggle",
            set = function(i, v)
                self:SetRCLCIntegration(v)
                if v then
                    InitializeRCLCIntegration(self)
                end
            end,
            get = function(i) return self:GetRCLCIntegration() end,
            width = 1,
            order = 21
        },
        global_rclc_add_reason = {
            name = CLM.L["Create"],
            desc = CLM.L["Creates new trigger to be used during RCLC award."],
            type = "execute",
            func = (function(i)
                db[#db+1] = {
                    trigger = "",
                    action = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE
                }
                self:InitializeConfigs()
            end),
            order = 22,
            width = 1
        },
        global_rclc_desc = {
            name = CLM.L["Action to take upon RCLC loot award event happening during raid. Trigger is based on RCLC award reason or player response if reason is not used. On Integration Enable the buttons will be prefilled with existing ones."],
            type = "description",
            width = "full",
            fontSize = "medium",
            order = 23
        },
    }

    local order = 24
    local prefix = "rclc_condition_"
    for conditionId, condition in ipairs(db) do
        options[prefix.."trigger"..conditionId] = {
            name = CLM.L["if reason/response contains"],
            type = "input",
            hidden = (function() return (conditionId > #db) end),
            set = (function(i, v) self:SetRCLCAwardTrigger(conditionId, v) end),
            get = (function(i) return self:GetRCLCAwardTrigger(conditionId) end),
            order = order,
            width = 1.25
        }
        order = order + 1
        options[prefix.."action"..conditionId] = {
            name = CLM.L["then"],
            type = "select",
            hidden = (function() return (conditionId > #db) end),
            values = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS_GUI,
            set = (function(i, v) self:SetRCLCAwardAction(conditionId, v) end),
            get = (function(i) return self:GetRCLCAwardAction(conditionId) end),
            order = order,
            width = 1.25
        }
        order = order + 1
        options[prefix.."up"..conditionId] = {
            name = "",
            type = "execute",
            hidden = (function() return (conditionId > #db) end),
            width = 0.15,
            image = "Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Up",
            disabled = (function() return conditionId == 1 end),
            func = function()
                tremove(db, conditionId)
                tinsert(db, conditionId - 1, condition)
                self:InitializeConfigs()
            end,
            order = order
        }
        order = order + 1
        options[prefix.."down"..conditionId] = {
            name = "",
            type = "execute",
            hidden = (function() return (conditionId > #db) end),
            width = 0.15,
            image = "Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up",
            disabled = (function() return conditionId == #db end),
            func = function()
                tremove(db, conditionId)
                tinsert(db, conditionId+1, condition)
                self:InitializeConfigs()
            end,
            order = order
        }
        order = order + 1
        options[prefix.."remove"..conditionId] = {
            name = "",
            type = "execute",
            hidden = (function() return (conditionId > #db) end),
            width = 0.15,
            image = "Interface\\Buttons\\UI-Panel-MinimizeButton-Up",
            func = function()
                tremove(db, conditionId)
                self:InitializeConfigs()
            end,
            order = order
        }
        order = order + 1
        if (conditionId < #db) then
            options[prefix.."else"..conditionId] = {
                name = CLM.L["else"],
                type = "description",
                fontSize = "medium",
                hidden = (function() return (conditionId >= #db) end),
                width = 0.3,
                order = order,
            }
            order = order + 1
        end
    end

    return options
end

local Integration = {}
function Integration:InitializeConfigs()
    local options = {
        global_wodkpbot_integration = {
            name = CLM.L["WoW DKP Bot Integration"],
            desc = CLM.L["Enable WoW DKP Bot Integration. This will result in additional data stored upon logout."],
            type = "toggle",
            set = function(i, v) self:SetWoWDKPBotIntegration(v) end,
            get = function(i) return self:GetWoWDKPBotIntegration() end,
            width = "full",
            order = 1
        },
    }

    UTILS.mergeDictsInline(options, InitializeGargulIntegration(self))
    UTILS.mergeDictsInline(options, CreateRCLCIntegration(self))

    CLM.MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.INTEGRATIONS, options)
end

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
    if not Integration:GetGargulIntegration() then return end
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

local function RCLCAwardMessageHandler(eventName, _, winner, _, link, response)
    if not Integration:GetRCLCIntegration() then return end

    local action = Integration:SearchRCLCAwardAction(response)
    if action == CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE then return end
    if type(link) ~= "string" then
        LOG:Debug("RCLCAwardMessageHandler() Missing Link")
        return
    end

    local itemId = UTILS.GetItemIdFromLink(link)
    if not GetItemInfoInstant(itemId) then
        LOG:Debug("RCLCAwardMessageHandler() Unknown Item ID for %s", link)
        return
    end

    if type(winner) ~= "string" then
        LOG:Debug("RCLCAwardMessageHandler() Missing Winner")
        return
    end

    winner = UTILS.RemoveServer(winner)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(winner)
    if not profile then
        LOG:Debug("RCLCAwardMessageHandler() item awarded to player without profile")
        return
    end

    local raid = CLM.MODULES.RaidManager:GetProfileRaid(profile:GUID())
    if not raid then
        LOG:Debug("RCLCAwardMessageHandler() item awarded outside of raid")
        return
    end
    local value = getAwardValueFromAction(raid:Roster(), itemId, action)
    CLM.MODULES.LootManager:AwardItem(raid, winner, link, itemId, value)
end

local function RCLC_PR(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
    local value = 0
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(UTILS.RemoveServer(data[realrow].name or ""))
    if profile then
        local raid = CLM.MODULES.RaidManager:GetRaid()
        if raid then
            value = raid:Roster():Priority(profile:GUID())
        end
    end

    data[realrow].cols[column].value = value
    frame.text:SetText(data[realrow].cols[column].value)
end

function Integration:Initialize()
    LOG:Trace("Integration:Initialize()")
    self.db = InitializeDB("global")
    ClearWoWDKPBotData()
    self:InitializeConfigs()

    -- WoW DKP Bot SV Data
    C_TimerAfter(10, (function() RequestWoWDKPBotData(self) end))
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function()
        StoreWoWDKPBotData(self)
    end))
    -- External award integration
    CLM.MODULES.EventManager:RegisterEvent(EXTERNAL_AWARD_EVENT, ExternalAwardEventHandler)
    -- RCLC award integartion
    CLM.MODULES.EventManager:RegisterMessage(RCLC_AWARD_EVENT, RCLCAwardMessageHandler)
    if self:GetRCLCIntegration() and isRCLC and RCLootCouncil then
        local RCVF = RCLootCouncil:GetModule("RCVotingFrame")
        if RCVF then
            local responseColumn = RCVF:GetColumnIndexFromName("response")
            local sortnext = RCVF.scrollCols[responseColumn].sortnext
            local column = {name = "PR", colName = "clmpr", width = 50, align = "CENTER", DoCellUpdate = RCLC_PR, sortnext = sortnext}
            table.insert(RCVF.scrollCols, column)
            local prColumn = RCVF:GetColumnIndexFromName("clmpr")
            RCVF.scrollCols[responseColumn].sortnext = prColumn
            RCVF:GetFrame().st:SetDisplayCols(RCVF.scrollCols)
        end
    end
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

function Integration:SetRCLCIntegration(value)
    self.db.rclc_integration = value and true or false
end

function Integration:GetRCLCIntegration()
    return self.db.rclc_integration
end

function Integration:SetRCLCAwardTrigger(conditionNum, trigger)
    local db = InitializeDB("rclc.handlers")
    if not db[conditionNum] then return end
    db[conditionNum].trigger = trigger or ""
end

function Integration:GetRCLCAwardTrigger(conditionNum)
    local db = InitializeDB("rclc.handlers")
    if not db[conditionNum] then return end
    return db[conditionNum].trigger
end

function Integration:SetRCLCAwardAction(conditionNum, action)
    local db = InitializeDB("rclc.handlers")
    if not db[conditionNum] then return end
    db[conditionNum].action = CONSTANTS.EXTERNAL_LOOT_AWARD_ACTIONS[action] and action or CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE
end

function Integration:GetRCLCAwardAction(conditionNum)
    local db = InitializeDB("rclc.handlers")
    if not db[conditionNum] then return end
    return db[conditionNum].action
end

function Integration:SearchRCLCAwardAction(response)
    response = strlower(tostring(response) or "")
    for _, condition in ipairs(InitializeDB("rclc.handlers")) do
        if(sfind(response, ".*" .. strlower(condition.trigger) .. ".*")) then
            return condition.action
        end
    end

    return CONSTANTS.EXTERNAL_LOOT_AWARD_ACTION.NONE
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
    JSON = 2,
    TMB = 3
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