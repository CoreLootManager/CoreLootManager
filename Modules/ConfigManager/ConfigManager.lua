local name, CLM = ...;
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
        "Roster"
    }),
    GROUP = {
        GLOBAL = "Classic Loot Manager",
        PERSONAL = "Personal",
        GUILD = "Guild",
        ROSTER = "Roster"
    },
}

local LIBS =  {
    config = LibStub("AceConfig-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local ConfigManager = { 
    enabled = false
}

local top = "Classic Loot Manager"

function ConfigManager:Initialize()
    LOG:Info("ConfigManager:Initialize()")
    local groups = {
        CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL,
        CLM.CONSTANTS.CONFIGS.GROUP.PERSONAL,
        CLM.CONSTANTS.CONFIGS.GROUP.GUILD,
        CLM.CONSTANTS.CONFIGS.GROUP.ROSTER
    }
    self.options = {}
    for _, config in pairs(groups) do
        local parent = CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL
        if config == CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL then
            parent = nil
        end
        self.options[config] = { type = "group", args = {} }
        LIBS.config:RegisterOptionsTable(config, self.options[config])
        LIBS.gui:AddToBlizOptions(config, config, parent)
    end
end

function ConfigManager:Enable()
    LOG:Info("ConfigManager:Enable()")
    self.enabled = true
end

function ConfigManager:Register(group, options)
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
        LOG:Error("ConfigManager:Register(): Group is not supported")
        return false
    end
   

    for option, definition in pairs(options) do
        if self.options[group].args[option] == nil then
            self.options[group].args[option] = definition
        else
            LOG:Warning("Option ".. tostring(option) .." already set. Ignoring.")
        end
    end

    return true
end

-- function CM:ToggleUI()
-- {
--     LIBS.gui:Open(top)
-- }

CLM.Interconnect.ConfigManager = ConfigManager