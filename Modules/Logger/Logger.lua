local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES

-- Module part
local Logger = {}
function Logger:Initialize()
    LOG:Trace("Logger:Initialize()")
    self.db = MODULES.Database:Logger()

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
            set = function(i, v) self:SetVerbosity(v) end,
            get = function(i) return self:GetVerbosity() end
          },
          logger_severity = {
            name = "Logging level",
            desc = "Select logging level for troubleshooting",
            type = "select",
            values = LOG.SEVERITY_LEVEL,
            set = function(i, v) self:SetSeverity(v) end,
            get = function(i) return self:GetSeverity() end
        },
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function Logger:SetSeverity(severity)
    self.db.severity = severity
    LOG:SetSeverity(self.db.severity)
end

function Logger:SetVerbosity(verbosity)
    self.db.verbosity = verbosity
    LOG:SetVerbosity(self.db.verbosity)
end

function Logger:GetSeverity()
    return LOG:GetSeverity()
end

function Logger:GetVerbosity()
    return LOG:GetVerbosity()
end

-- Publish API
MODULES.Logger = Logger



