local define = LibDependencyInjection.createContext(...)

define.module("ConfigManager", {
    "Utils", "Log",
    "Constants",  "Meta:ADDON_TABLE", "L", "LibStub:AceConfigRegistry-3.0",  "LibStub:AceConfig-3.0", "LibStub:AceConfigDialog-3.0", "Constants/Configs"
}, function(resolve, UTILS, LOG, CONSTANTS, CLM, L, AceConfigRegistry, AceConfig, AceConfigDialog, Configs)
local type, pairs, ipairs = type, pairs, ipairs

local ConfigManager = { enabled = false }

local function ConfigGenerator(config)
    return ConfigManager.options[config]
end

function ConfigManager:Initialize()
    LOG:Trace("ConfigManager:Initialize()")
    self.generators = {
        [Configs.GROUP.GLOBAL] = (function() return ConfigGenerator(Configs.GROUP.GLOBAL) end),
        [Configs.GROUP.ROSTER] = (function() return ConfigGenerator(Configs.GROUP.ROSTER) end),
        [Configs.GROUP.INTEGRATIONS] = (function() return ConfigGenerator(Configs.GROUP.INTEGRATIONS) end)
    }

    self.options = {}
    for _, config in ipairs(Configs.ORDERED_GROUPS) do
        local parent = nil
        if config ~= Configs.GROUP.GLOBAL then
            parent = Configs.GROUP.GLOBAL
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

    if not Configs.GROUPS[group] then
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
    if not Configs.GROUPS[group] then
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


ConfigManager:Initialize()

resolve(ConfigManager)


end)
define.module("Constants/Configs", {"L", "Utils"}, function(resolve, L, Utils)

resolve({
    GROUPS = Utils.Set({
        "Classic Loot Manager",
        L["Rosters"],
        L["Integrations"]
    }),
    ORDERED_GROUPS = {
        "Classic Loot Manager",
        L["Rosters"],
        L["Integrations"]
    },
    GROUP = {
        GLOBAL = "Classic Loot Manager",
        ROSTER = L["Rosters"],
        INTEGRATIONS = L["Integrations"]
    },
})
end)