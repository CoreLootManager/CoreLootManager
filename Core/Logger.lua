local _, CLM = ...
CLM.LOG = { verbose = true }
local Logger = CLM.LOG

local function print(...) _G.print("|cffebb434CLM:|r", ...) end

local SEVERITY =
{
    DEBUG   = "DEBUG",
    INFO    = "INFO",
    WARNING = "WARNING",
    ERROR   = "ERROR",
    FATAL   = "FATAL"
}

local LogEntry = { severity = nil, message = nil, timestamp = nil  }
function LogEntry:new(severity, message)
    local o = {}

    setmetatable(o, self)
    self.__index = self

	o.severity = severity or SEVERITY.INFO
    o.message = message or ""
    o.timestamp = time()

    return o
 end

function Logger:format(entry)
    return string.format("[%s]: %s", entry.severity, entry.message)
end

function Logger:log(entry)
    if self.verbose == true then
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
    self:log(LogEntry:new(SEVERITY.ERROR, message))
end

function Logger:Fatal(message)
    self:log(LogEntry:new(SEVERITY.FATAL, message))
end

function Logger:Display(info, count)
    local countSanitzied = type(count) == 'number' and tonumber(count) or 10
    local numEntries = #CLM_Logs
    print(numEntries)
    if numEntries >= countSanitzied then
        for i = numEntries - countSanitzied, numEntries - 1 do
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
    CLM.LOG:Info("Logger initializing")
    local options = {
        logs = {
            name = "CLM Logs",
            desc = "Displays last CLM logs",
            type = "execute",
            handler = self,
            func = "Display"
        },
        verbose = {
            name = "Verbose",
            desc = "Enables / disables verbose data printing during logging",
            type = "toggle",
            set = function(i, v) CLM.LOG.verbose = v end,
            get = function(i) return CLM.LOG.verbose end
          },

    }
    CLM.Interconnect.ConfigManager.Register(options)
end

CLM.Interconnect.Logger.Initialize = function() Logger:Initialize() end



