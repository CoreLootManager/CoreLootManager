-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local type, pairs, ipairs = type, pairs, ipairs

local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local ConfigManager = { enabled = false }

local function ConfigGenerator(config)
    return ConfigManager.options[config]
end

function ConfigManager:Initialize()
    LOG:Trace("ConfigManager:Initialize()")
    self.generators = {
        [CONSTANTS.CONFIGS.GROUP.GLOBAL] = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.GLOBAL) end),
        [CONSTANTS.CONFIGS.GROUP.ROSTER] = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.ROSTER) end),
        [CONSTANTS.CONFIGS.GROUP.INTEGRATIONS] = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.INTEGRATIONS) end)
    }

    self.options = {}
    for _, config in ipairs(CONSTANTS.CONFIGS.ORDERED_GROUPS) do
        local parent = nil
        if config ~= CONSTANTS.CONFIGS.GROUP.GLOBAL then
            parent = CONSTANTS.CONFIGS.GROUP.GLOBAL
        end
        self.options[config] = { type = "group", childGroups = "tab", args = {}}
        AceConfigRegistry:RegisterOptionsTable(config, self.generators[config])
        AceConfigDialog:AddToBlizOptions(config, config, parent)
    end
    self.slash_options = { type = "group", args = {}}
end

function ConfigManager:Enable()
    LOG:Trace("ConfigManager:Enable()")
    self.enabled = true
end

function ConfigManager:Register(group, options, clean)
    LOG:Trace("ConfigManager:Register()")

    if type(options) ~= "table" then
        LOG:Error("ConfigManager:Register(): Object is not a table")
        return false
    end

    if type(group) ~= "string" then
        LOG:Error("ConfigManager:Register(): Group is not a string")
        return false
    end

    if not CONSTANTS.CONFIGS.GROUPS[group] then
        LOG:Error("ConfigManager:Register(): Group %s is not supported", group)
        return false
    end

    if clean then
        for option, _ in pairs(self.options[group].args) do
            self.options[group].args[option] = nil
        end
    end

    for option, definition in pairs(options) do
        self.options[group].args[option] = definition
    end

    return true
end

function ConfigManager:RegisterSlash(options)
    LOG:Trace("ConfigManager:RegisterSlash()")

    if type(options) ~= "table" then
        LOG:Error("ConfigManager:RegisterSlash(): Object is not a table")
        return false
    end

    for option, definition in pairs(options) do
        if self.slash_options.args[option] == nil then
            self.slash_options.args[option] = definition
        else
            LOG:Warning("Option %s already set. Ignoring.", option)
        end
    end

    AceConfig:RegisterOptionsTable("CLM", self.slash_options, {"clm", "classiclootmanager"})
    return true
end

function ConfigManager:UpdateOptions(group, register)
    if not CONSTANTS.CONFIGS.GROUPS[group] then
        LOG:Warning("ConfigManager:Update(): Group %s is not supported", group)
        return
    end
    if register then
        AceConfig:RegisterOptionsTable(group, self.generators[group])
    end
    AceConfigRegistry:NotifyChange(group)
end

-- Publish API
CLM.MODULES.ConfigManager = ConfigManager

CONSTANTS.CONFIGS = {
    GROUPS = UTILS.Set({
        "Classic Loot Manager",
        CLM.L["Rosters"],
        CLM.L["Integrations"]
    }),
    ORDERED_GROUPS = {
        "Classic Loot Manager",
        CLM.L["Rosters"],
        CLM.L["Integrations"]
    },
    GROUP = {
        GLOBAL = "Classic Loot Manager",
        ROSTER = CLM.L["Rosters"],
        INTEGRATIONS = CLM.L["Integrations"]
    },
}