-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local wipe, collectgarbage = wipe, collectgarbage

-- Module part
local Logger = {}
function Logger:Initialize()
    LOG:Trace("Logger:Initialize()")
    self.db = CLM.MODULES.Database:Logger()

    local options = {
        logger_header = {
            type = "header",
            name = CLM.L["Logging"],
            order = 1000
        },
        logger_severity = {
            name = CLM.L["Logging level"],
            desc = CLM.L["Select logging level for troubleshooting"],
            type = "select",
            values = LOG.SEVERITY_LEVEL,
            set = function(i, v) self:SetSeverity(v) end,
            get = function(i) return self:GetSeverity() end,
            order = 1001
        },
        logger_verbose = {
            name = CLM.L["Verbose"],
            desc = CLM.L["Enables / disables verbose data printing during logging"],
            type = "toggle",
            set = function(i, v) self:SetVerbosity(v) end,
            get = function(i) return self:GetVerbosity() end,
            order = 1002
          },
          logger_wipe = {
            name = CLM.L["Wipe"],
            desc = CLM.L["Wipes the log history"],
            type = "execute",
            confirm = true,
            func = function(i, v) self:Wipe() end,
            order = 1003
          }
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
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

function Logger:Wipe()
    local db = LOG:GetDatabase() -- luacheck: ignore
    wipe(db)
    collectgarbage()
end

-- Publish API
CLM.MODULES.Logger = Logger
