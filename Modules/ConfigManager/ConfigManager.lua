local name, CLM = ...;
local LOG = CLM.LOG

local LIBS =  {
    config = LibStub("AceConfig-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local ConfigManager = { enabled = false, options = { type = "group", args = {} } }

function ConfigManager:Initialize()
    LOG:Info("ConfigManager:Initialize()")

    LIBS.gui:AddToBlizOptions(name, "CLM Config")
    -- local config = {
    --     config = {
    --         name = "CLM Config",
    --         desc = "Displays config dialog",
    --         type = "execute",
    --         handler = self,
    --         func = "ToggleUI"
    --     }
    -- }
    -- self:Register()
end

function ConfigManager:Enable()
    LOG:Info("ConfigManager:Enable()")
    self.enabled = true
end

function ConfigManager:Register(options)
    LOG:Info("ConfigManager:Register()")

    if type(table) ~= "table" then
        LOG:Fatal("Provided object is not a table")
        return false
    end

    for option, definition in pairs(options) do
        if self.options.args[option] == nil then
            self.options.args[option] = definition
        else
            LOG:Warning("Option ".. tostring(option) .." already set. Ignoring.")
        end
    end

    LIBS.config:RegisterOptionsTable(name, self.options, "clm")
    return true
end

-- function CM:ToggleUI()
-- {
--     AceConfigDialog:Open("ClassicLootManager")
-- }

CLM.Interconnect.ConfigManager = ConfigManager