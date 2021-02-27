local name, CLM = ...;
local CM = LibStub("AceConfig-3.0")
local LOG = CLM.LOG

function CM:Initialize()
    LOG:Info("Config Manager initialized")
    self.options = { type = "group", args = {}}
end

function CM:Register(options, slashcmd)
    LOG:Info("Registering new option")

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

    self:RegisterOptionsTable(name, self.options, "clm")
    return true
end

CLM.Interconnect.ConfigManager.Initialize = function() CM:Initialize() end
CLM.Interconnect.ConfigManager.Register = function(o, s) CM:Register(o, s) end
--CLM.Interconnect.Update = CM:Update