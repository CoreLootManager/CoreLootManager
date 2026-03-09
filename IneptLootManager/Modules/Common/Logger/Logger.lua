-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --

-- Module part
local Logger = {}
function Logger:Initialize()
    LOG:Trace("Logger:Initialize()")
    self.db = ILM.MODULES.Database:Logger()

    local options = {
        logger_header = {
            type = "header",
            name = ILM.L["Logging"],
            order = 1000
        },
        logger_severity = {
            name = ILM.L["Logging level"],
            desc = ILM.L["Select logging level for troubleshooting"],
            type = "select",
            values = LOG.SEVERITY_LEVEL,
            set = function(i, v) self:SetSeverity(v) end,
            get = function(i) return self:GetSeverity() end,
            order = 1001
        },
        logger_verbose = {
            name = ILM.L["Verbose"],
            desc = ILM.L["Enables / disables verbose data printing during logging"],
            type = "toggle",
            set = function(i, v) self:SetVerbosity(v) end,
            get = function(i) return self:GetVerbosity() end,
            order = 1002
          },
          logger_wipe = {
            name = ILM.L["Wipe"],
            desc = ILM.L["Wipes the log history"],
            type = "execute",
            confirm = true,
            func = function(i, v) self:Wipe() end,
            order = 1003
          }
    }
    ILM.MODULES.ConfigManager:Register(ILM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
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
ILM.MODULES.Logger = Logger
