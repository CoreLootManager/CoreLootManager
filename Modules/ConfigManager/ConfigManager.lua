local _, CLM = ...;

local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    config = LibStub("AceConfig-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local ConfigManager = { enabled = false }

local function ConfigGenerator(config)
    return ConfigManager.options[config]
end

function ConfigManager:Initialize()
    LOG:Trace("ConfigManager:Initialize()")
    self.generators = {
        [CONSTANTS.CONFIGS.GROUP.GLOBAL]   = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.GLOBAL) end),
        -- [CONSTANTS.CONFIGS.GROUP.PERSONAL] = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.PERSONAL) end),
        -- [CONSTANTS.CONFIGS.GROUP.GUILD]    = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.GUILD) end),
        [CONSTANTS.CONFIGS.GROUP.ROSTER]   = (function() return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.ROSTER) end)
    }

    self.options = {}
    for _, config in ipairs(CONSTANTS.CONFIGS.ORDERED_GROUPS) do
        local parent = CONSTANTS.CONFIGS.GROUP.GLOBAL
        if config == CONSTANTS.CONFIGS.GROUP.GLOBAL then
            parent = nil
        end
        self.options[config] = { type = "group", args = {}}
        LIBS.registry:RegisterOptionsTable(config, self.generators[config])
        LIBS.gui:AddToBlizOptions(config, config, parent)
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

    LIBS.config:RegisterOptionsTable("CLM", self.slash_options, {"clm", "classiclootmanager"})
    return true
end

function ConfigManager:RegisterUniversalExecutor(command, name, object)
    -- @debug@
    local options = {
        [command] = {
            type = "input",
            name = name .. " Debug",
            desc = "Debug Execute any " .. name .. " API",
            set = function(info, value) UTILS.UniversalCliMethodExecutor(name, object, value) end
        }
    }

    self:RegisterSlash(options)
    -- @end-debug@
end

function ConfigManager:UpdateOptions(group, register)
    if not CONSTANTS.CONFIGS.GROUPS[group] then
        LOG:Warning("ConfigManager:Update(): Group %s is not supported", group)
        return
    end
    if register then
        LIBS.config:RegisterOptionsTable(group, self.generators[group])
    end
    LIBS.registry:NotifyChange(group)
end

-- Publish API
MODULES.ConfigManager = ConfigManager

CONSTANTS.CONFIGS = {
    GROUPS = UTILS.Set({
        "Classic Loot Manager",
        -- "Personal",
        -- "Guild",
        "Rosters"
    }),
    ORDERED_GROUPS = {
        "Classic Loot Manager",
        -- "Personal",
        -- "Guild",
        "Rosters"
    },
    GROUP = {
        GLOBAL = "Classic Loot Manager",
        -- PERSONAL = "Personal",
        -- GUILD = "Guild",
        ROSTER = "Rosters"
    },
}