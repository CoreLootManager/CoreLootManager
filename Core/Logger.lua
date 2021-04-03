local _, CLM = ...
local Logger = CLM.LOG

local MODULES = CLM.MODULES

local SEVERITY =
{
    DEBUG   = 0,
    INFO    = 10,
    WARNING = 20,
    ERROR   = 30
}

local SEVERITY_LEVEL =
{
    [0]     = "DEBUG",
    [10]    = "INFO",
    [20]    = "WARNING",
    [30]    = "ERROR"
}

local SEVERITY_COLOR =
{
    [0]     = "6699ff",
    [10]    = "00cc00",
    [20]    = "ffcc00",
    [30]    = "cc0000"
}

local LogEntry = { t = nil, s = nil, m = nil  }
function LogEntry:new(severity, message)
    local o = {}

    setmetatable(o, self)
    self.__index = self

	o.s = severity or SEVERITY.INFO
    o.m = message or ""
    o.t = GetServerTime()

    return o
end

local function getColoredSeverity(severity)
    local color = SEVERITY_COLOR[severity]
    if color then
        return string.format("|cff%s%s|r ", color, SEVERITY_LEVEL[severity])
    else
        return nil
    end
end

 local function _print(severity, timestamp, message)
    local prefix = "|cffebb434CLM|r "
    local severityMessage = getColoredSeverity(severity) or ""
    local time
    if timestamp then
        time = date("%H:%M:%S ", timestamp)
    else
        time = ""
    end
    print(prefix .. severityMessage .. time .. message)
 end

local function _format(fmt, message)
    if fmt == nil then return "" end
    if message == nil then message = fmt end
    return string.format(fmt, message)
end

local function log(severity, fmt, message, force)
    if (Logger.severity or 1000) >= severity then
        local entry = LogEntry:new(severity, _format(fmt, message))
        if Logger.verbose or force then
            _print(entry.s, entry.t, entry.m)
        end
        table.insert(CLM_Logs, entry)
    end
end

function Logger:log(severity, fmt, message, force)
    pcall(log, severity, fmt, message, force)
end

function Logger:Message(fmt, message)
    _print(nil, GetServerTime(), _format(fmt, message))
end

function Logger:Debug(fmt, message)
    self:log(SEVERITY.DEBUG, fmt, message)
end

function Logger:Info(fmt, message)
    self:log(SEVERITY.INFO, fmt, message)
end

function Logger:Warning(fmt, message)
    self:log(SEVERITY.WARNING, fmt, message)
end

function Logger:Error(fmt, message)
    self:log(SEVERITY.ERROR, fmt, message, true)
end

function Logger:Display(info, count)
    -- local countSanitized = (type(count) == 'number') and tonumber(count) or 10
    -- local numEntries = #CLM_Logs
    -- if numEntries >= countSanitized then
    --     for i = numEntries - countSanitized, numEntries - 1 do
    --         print(self:format(CLM_Logs[i]))
    --     end
    -- else
    --     for _, v in ipairs(CLM_Logs) do
    --         print(self:format(v))
    --     end
    -- end
end

-- Module part
function Logger:Initialize()
    CLM.LOG:Info("Logger:Initialize()")
    self.verbose = true
    self.severity = SEVERITY.WARNING

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
            set = function(i, v) self.verbose = v end,
            get = function(i) return self.verbose end
          },
          logger_severity = {
            name = "Logging level",
            desc = "Select logging level for troubleshooting",
            type = "select",
            values = SEVERITY_LEVEL,
            set = function(i, v) self.severity = v end,
            get = function(i) return self.severity end
        },
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

-- Publish API
MODULES.Logger = Logger



