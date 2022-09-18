local define = LibDependencyInjection.createContext(...)

define.module("ConfigManager", {
    "Log",
    "LibStub:AceConfigRegistry-3.0",  "LibStub:AceConfig-3.0", "LibStub:AceConfigDialog-3.0", "Constants/Configs", "L", "Utils"
}, function(resolve, LOG, AceConfigRegistry, AceConfig, AceConfigDialog, Configs, L, Utils)
local type, pairs, ipairs = type, pairs, ipairs

local ConfigManager = { enabled = false }

local appName = "Classic Loot Manager"

function ConfigManager:Initialize()
    LOG:Trace("ConfigManager:Initialize()")
    -- use 1 table instead.

    self.options = {
        type = "group",
        args = {
            GLOBAL = {
                name = "Global",
                type = "group",
                args = {}
            },
            ROSTERS = {
                name = L["Rosters"],
                type = "group",
                args = {}
            },
            INTEGRATIONS = {
                type = "group",
                name =  L["Integrations"],
                args = {}
            }
        }
    }
    AceConfigRegistry:RegisterOptionsTable(appName, self.options)
    AceConfigDialog:AddToBlizOptions(appName, appName, nil, "GLOBAL")
    AceConfigDialog:AddToBlizOptions(appName, L["Rosters"], appName, "ROSTERS")
    AceConfigDialog:AddToBlizOptions(appName, L["Integrations"], appName, "INTEGRATIONS")

    self.slash_options = { type = "group", args = {}}
end

function ConfigManager:Enable()
    LOG:Trace("ConfigManager:Enable()")
    self.enabled = true
end

function ConfigManager:RegisterGlobal(options, clean)
    return self:Register("GLOBAL", options, clean)
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

    if not self.options.args[group] then
        LOG:Error("ConfigManager:Register(): Group %s is not supported", group)
        return false
    end

    if clean then
        for option, _ in pairs(self.options.args[group].args) do
            self.options.args[group].args[option] = nil
        end
    end
    Utils.DumpTable(options)
    for option, definition in pairs(options) do
        self.options.args[group].args[option] = definition
        print("Adding option", group, option)
        Utils.DumpTable(definition)
    end

    AceConfigRegistry:NotifyChange(appName)

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