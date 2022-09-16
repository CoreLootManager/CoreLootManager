local define = LibDependencyInjection.createContext(...)


define.module("Logger", {"Modules", "Database", "Log", "ConfigManager", "L", "Constants/Configs"}, function(resolve, MODULES, Database, LOG, ConfigManager, L, Configs)

    local wipe, collectgarbage = wipe, collectgarbage

-- Module part
local Logger = {}
function Logger:Initialize()
    LOG:Trace("Logger:Initialize()")
    self.db = Database:Logger()

    local options = {
        logger_header = {
            type = "header",
            name = L["Logging"],
            order = 1000
        },
        logger_severity = {
            name = L["Logging level"],
            desc = L["Select logging level for troubleshooting"],
            type = "select",
            values = LOG.SEVERITY_LEVEL,
            set = function(i, v) self:SetSeverity(v) end,
            get = function(i) return self:GetSeverity() end,
            order = 1001
        },
        logger_verbose = {
            name = L["Verbose"],
            desc = L["Enables / disables verbose data printing during logging"],
            type = "toggle",
            set = function(i, v) self:SetVerbosity(v) end,
            get = function(i) return self:GetVerbosity() end,
            order = 1002
          },
          logger_wipe = {
            name = L["Wipe"],
            desc = L["Wipes the log history"],
            type = "execute",
            confirm = true,
            func = function(i, v) self:Wipe() end,
            order = 1003
          }
    }
    ConfigManager:Register(Configs.GROUP.GLOBAL, options)
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
    MODULES.Logger = Logger
    Logger:Initialize()
    resolve(Logger)
end)
