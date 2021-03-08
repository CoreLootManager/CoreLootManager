local _, CLM = ...;
local LOG = CLM.LOG

local function Set(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

CLM.CONSTANTS.CONFIGS = {
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
    return ConfigGenerator(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL)
end

local function ConfigGenerator_Personal()
    return ConfigGenerator(CLM.CONSTANTS.CONFIGS.GROUP.PERSONAL)
end

local function ConfigGenerator_Guild()
    return ConfigGenerator(CLM.CONSTANTS.CONFIGS.GROUP.GUILD)
end

local function ConfigGenerator_Roster()
    return ConfigGenerator(CLM.CONSTANTS.CONFIGS.GROUP.ROSTER)
end

local function ConfigGenerator_BIST()
    return ConfigGenerator(CLM.CONSTANTS.CONFIGS.GROUP.BIST)
end

function ConfigManager:Initialize()
    LOG:Info("ConfigManager:Initialize()")
    local groups = {
        CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL,
        CLM.CONSTANTS.CONFIGS.GROUP.PERSONAL,
        CLM.CONSTANTS.CONFIGS.GROUP.GUILD,
        CLM.CONSTANTS.CONFIGS.GROUP.ROSTER,
        CLM.CONSTANTS.CONFIGS.GROUP.BIST
    }
    self.generators = {
        ["Classic Loot Manager"] = ConfigGenerator_Global,
        ["Personal"] = ConfigGenerator_Personal,
        ["Guild"] = ConfigGenerator_Guild,
        ["Roster"] = ConfigGenerator_Roster,
        ["BIST"] = ConfigGenerator_BIST,
    }
    self.options = {}
    for _, config in pairs(groups) do
        local parent = CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL
        if config == CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL then
            parent = nil
        end
        self.options[config] = { type = "group", args = {}}
        LIBS.config:RegisterOptionsTable(config, self.generators[config])
        LIBS.gui:AddToBlizOptions(config, config, parent)
    end
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

    if not CLM.CONSTANTS.CONFIGS.GROUPS[group] then
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

function ConfigManager:Refresh(group)
    if not CLM.CONSTANTS.CONFIGS.GROUPS[group] then
        LOG:Warning("ConfigManager:Refresh(): Group " .. tostring(group) .. " is not supported")
        return
    end
    LIBS.config:RegisterOptionsTable(group, self.generators[group])
    LIBS.registry:NotifyChange(group)
end

CLM.Interconnect.ConfigManager = ConfigManager