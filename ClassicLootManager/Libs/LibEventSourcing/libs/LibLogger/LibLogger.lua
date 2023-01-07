local LibLogger

do
	local _MAJOR = "LibLogger"
	local _MINOR = 1

	if LibStub then
		local lib, minor = LibStub:GetLibrary(_MAJOR, true)
		if lib and minor and minor >= _MINOR then
			return lib
		else
			LibLogger = LibStub:NewLibrary(_MAJOR, _MINOR)
		end
	else
		LibLogger = {}
	end
end

LibLogger.SEVERITY =
{
    TRACE   = 0,
    DEBUG   = 10,
    INFO    = 20,
    WARNING = 30,
    ERROR   = 40,
    FATAL   = 50
}

LibLogger.SEVERITY_LEVEL =
{
    [0]     = "TRACE",
    [10]    = "DEBUG",
    [20]    = "INFO",
    [30]    = "WARNING",
    [40]    = "ERROR",
    [50]    = "FATAL"
}

local SEVERITY_COLOR =
{
    [0]     = "a0a0a0",
    [10]    = "6699ff",
    [20]    = "00cc00",
    [30]    = "ffcc00",
    [40]    = "cc0000",
    [50]    = "ff0000"
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
        return string.format("|cff%s%s|r ", color, LibLogger.SEVERITY_LEVEL[severity])
    else
        return nil
    end
end

local print = print
local function _print(severity, timestamp, message, prefix)
    local severityMessage = getColoredSeverity(severity) or ""
    local time
    if timestamp then
        time = date("%H:%M:%S", timestamp)
    else
        time = ""
    end
    if prefix then
        print("|cffebb434" .. prefix .."|r " .. time .. " "  .. severityMessage .. " " .. message)
    else
        print(time .. " " .. severityMessage .. " " .. message)
    end
end

local function _format(fmt, ...)
    if fmt == nil then return "" end
    return string.format(fmt, ...)
end

local function log(logger, severity, force, fmt, ...)
    if severity >= logger.severity then
        local entry = LogEntry:new(severity, _format(fmt, ...))
        table.insert(logger.database, entry)
        if logger.verbosity or force then
            _print(entry.s, entry.t, entry.m, logger.prefix)
        end
    end
end

local function _log(logger, severity, force, fmt, ...)
    pcall(log, logger, severity, force, fmt, ...)
end

function LibLogger:New(database)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.database = database or {}
    o.verbosity = true
    o.severity = LibLogger.SEVERITY.WARNING
    o.prefix = nil

    return o
end

function LibLogger:Message(fmt, ...)
    _print(nil, GetServerTime(), _format(fmt, ...), self.prefix)
end

function LibLogger:Trace(fmt, ...)
    _log(self, LibLogger.SEVERITY.TRACE, false, fmt, ...)
end

function LibLogger:Debug(fmt, ...)
    _log(self, LibLogger.SEVERITY.DEBUG, false, fmt, ...)
end

function LibLogger:Info(fmt, ...)
    _log(self, LibLogger.SEVERITY.INFO, false, fmt, ...)
end

function LibLogger:Warning(fmt, ...)
    _log(self, LibLogger.SEVERITY.WARNING, false, fmt, ...)
end

function LibLogger:Error(fmt, ...)
    _log(self, LibLogger.SEVERITY.ERROR, true, fmt, ...)
end

function LibLogger:Fatal(fmt, ...)
    _log(self, LibLogger.SEVERITY.FATAL, true, fmt, ...)
end

function LibLogger:SetSeverity(severity)
    severity = severity or self.severity.WARNING
    self.severity = severity
end

function LibLogger:GetSeverity()
    return self.severity
end

function LibLogger:SetVerbosity(verbosity)
    self.verbosity = verbosity
end

function LibLogger:GetVerbosity()
    return self.verbosity
end

function LibLogger:SetPrefix(prefix)
    self.prefix = (type(prefix) == "string") and prefix or nil
end

function LibLogger:GetPrefix()
    return self.prefix
end

function LibLogger:SetDatabase(object)
    for _, entry in ipairs(self.database) do
        table.insert(object, entry)
    end
    self.database = object
end

function LibLogger:GetDatabase()
    return self.database
end

return LibLogger