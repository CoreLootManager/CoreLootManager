local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES

-- Module part
local Logger = {}
function Logger:Initialize()
    CLM.LOG:Info("Logger:Initialize()")
    local options = {
        logger_header = {
            type = "header",
            name = "Logging"
        },
        logger_print = {
            name = "CLM Logs",
            desc = "Displays last CLM logs",
            type = "execute",
            handler = self,
            func = "Display"
        },
        logger_verbose = {
            name = "Verbose",
            desc = "Enables / disables verbose data printing during logging",
            type = "toggle",
            set = function(i, v) LOG:SetVerbosity(v) end,
            get = function(i) return LOG:GetVerbosity() end
          },
          logger_severity = {
            name = "Logging level",
            desc = "Select logging level for troubleshooting",
            type = "select",
            values = LOG.SEVERITY_LEVEL,
            set = function(i, v) print(v);LOG:SetSeverity(v) end,
            get = function(i) return LOG:GetSeverity() end
        },
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

-- Publish API
MODULES.Logger = Logger



