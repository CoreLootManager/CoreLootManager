local _, CLM = ...;

local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULE = CLM.MODULE
local UTILS = CLM.UTILS

local function Set(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    config = LibStub("AceConfig-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local ConfigManager = { enabled = false }

local function ConfigGenerator(config)
    return ConfigManager.options[config]
end

local function ConfigGenerator_Global()
    return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.GLOBAL)
end

local function ConfigGenerator_Personal()
    return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.PERSONAL)
end

local function ConfigGenerator_Guild()
    return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.GUILD)
end

local function ConfigGenerator_Roster()
    return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.ROSTER)
end

local function ConfigGenerator_BIST()
    return ConfigGenerator(CONSTANTS.CONFIGS.GROUP.BIST)
end

function ConfigManager:Initialize()
    LOG:Info("ConfigManager:Initialize()")
    -- TODO: cleanup this shit all around when removing BIST
    local groups = {
        CONSTANTS.CONFIGS.GROUP.GLOBAL,
        CONSTANTS.CONFIGS.GROUP.PERSONAL,
        CONSTANTS.CONFIGS.GROUP.GUILD,
        CONSTANTS.CONFIGS.GROUP.ROSTER,
        CONSTANTS.CONFIGS.GROUP.BIST
    }
    -- TODO: cleanup this shit all around when removing BIST
    self.generators = {
        ["Classic Loot Manager"] = ConfigGenerator_Global,
        ["Personal"] = ConfigGenerator_Personal,
        ["Guild"] = ConfigGenerator_Guild,
        ["Roster"] = ConfigGenerator_Roster,
        ["BIST"] = ConfigGenerator_BIST
    }
    self.options = {}
    for _, config in pairs(groups) do
        local parent = CONSTANTS.CONFIGS.GROUP.GLOBAL
        if config == CONSTANTS.CONFIGS.GROUP.GLOBAL then
            parent = nil
        end
        self.options[config] = { type = "group", args = {}}
        LIBS.config:RegisterOptionsTable(config, self.generators[config])
        LIBS.gui:AddToBlizOptions(config, config, parent)
    end
    self.slash_options = { type = "group", args = {}}
end

function ConfigManager:Enable()
    LOG:Info("ConfigManager:Enable()")
    self.enabled = true
end

function ConfigManager:Register(group, options, clean)
    LOG:Info("ConfigManager:Register()")

    if type(options) ~= "table" then
        LOG:Error("ConfigManager:Register(): Object is not a table")
        return false
    end

    if type(group) ~= "string" then
        LOG:Error("ConfigManager:Register(): Group is not a string")
        return false
    end

    if not CONSTANTS.CONFIGS.GROUPS[group] then
        LOG:Error("ConfigManager:Register(): Group " .. tostring(group) .. " is not supported")
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
    LOG:Info("ConfigManager:RegisterSlash()")

    if type(options) ~= "table" then
        LOG:Error("ConfigManager:RegisterSlash(): Object is not a table")
        return false
    end

    for option, definition in pairs(options) do
        if self.slash_options.args[option] == nil then
            self.slash_options.args[option] = definition
        else
            LOG:Warning("Option ".. tostring(option) .." already set. Ignoring.")
        end
    end
    LIBS.config:RegisterOptionsTable("CLM", self.slash_options, {"clm", "classiclootmanager"})
    return true
end

function ConfigManager:RegisterUniversalExecutor(command, name, object)
    local options = {
        [command] = {
            type = "input",
            name = name .. " Debug",
            desc = "Debug Execute any " .. name .. " API",
            set = function(info, value) UTILS.UniversalCliMethodExecutor(name, object, value) end
        }
    }
    self:RegisterSlash(options)
end

function ConfigManager:UpdateOptions(group)
    if not CONSTANTS.CONFIGS.GROUPS[group] then
        LOG:Warning("ConfigManager:Update(): Group " .. tostring(group) .. " is not supported")
        return
    end
    LIBS.config:RegisterOptionsTable(group, self.generators[group])
    LIBS.registry:NotifyChange(group)
end

-- Publish API
MODULE.ConfigManager = ConfigManager

-- TODO: cleanup this shit all around when removing BIST
CONSTANTS.CONFIGS = {
    GROUPS = Set({
        "Classic Loot Manager",
        "Personal",
        "Guild",
        "Roster",
        "BIST"
    }),
    GROUP = {
        GLOBAL = "Classic Loot Manager",
        PERSONAL = "Personal",
        GUILD = "Guild",
        ROSTER = "Roster",
        BIST = "BIST"
    },
}