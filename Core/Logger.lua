local _, CLM = ...
-- TODO:
-- 1) varargs
-- 2) delay variables unrolling
-- 3) logging level
local Logger = CLM.LOG

local MODULES = CLM.MODULES
local function print(...) _G.print("|cffebb434CLM:|r", ...) end

local SEVERITY =
{
    DEBUG   = "DEBUG",
    INFO    = "INFO",
    WARNING = "WARNING",
    ERROR   = "ERROR",
    FATAL   = "FATAL"
}

local LogEntry = { t = nil, s = nil, m = nil  }
function LogEntry:new(severity, message)
    local o = {}

    setmetatable(o, self)
    self.__index = self

	o.s = severity or SEVERITY.INFO
    o.m = message or ""
    o.t = time()

    return o
 end

function Logger:format(entry)
    return string.format("[%s]: %s", entry.s, entry.m)
end

function Logger:log(entry, verbose)
    if self.verbose or verbose then
        print(self:format(entry))
    end
    table.insert(CLM_Logs, entry)
end

function Logger:Message(message)
    print(message)
end

function Logger:Debug(message)
    local entry = LogEntry:new(SEVERITY.DEBUG, message)
    self:log(entry)
end

function Logger:Info(message)
    self:log(LogEntry:new(SEVERITY.INFO, message))
end

function Logger:Warning(message)
    self:log(LogEntry:new(SEVERITY.WARNING, message))
end

function Logger:Error(message)
    self:log(LogEntry:new(SEVERITY.ERROR, message), true)
end

function Logger:Fatal(message)
    self:log(LogEntry:new(SEVERITY.FATAL, message), true)
end

function Logger:Display(info, count)
    local countSanitized = (type(count) == 'number') and tonumber(count) or 10
    local numEntries = #CLM_Logs
    if numEntries >= countSanitized then
        for i = numEntries - countSanitized, numEntries - 1 do
            print(self:format(CLM_Logs[i]))
        end
    else
        for _, v in ipairs(CLM_Logs) do
            print(self:format(v))
        end
    end
end

-- Module part
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
            set = function(i, v) CLM.LOG.verbose = v end,
            get = function(i) return CLM.LOG.verbose end
          }
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

-- Publish API
MODULES.Logger = Logger



