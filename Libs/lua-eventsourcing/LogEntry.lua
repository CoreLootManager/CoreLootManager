

local LogEntry, _ = LibStub:NewLibrary("EventSourcing/LogEntry", 1)
if not LogEntry then
    return
end

local Util = LibStub("EventSourcing/Util")
local SortedList = LibStub("EventSourcing/SortedList")

--[[
    LogEntry models an entry in the event log
    We use short field names because the field names are serialized to disk.
    The assumption is that all field names are private to this file and other files will use functions to get what they need.
    Since functions are not serialized we do use descriptive names for the functions
]]--
LogEntry.__index = LogEntry
LogEntry._cls = 'LE'

-- private constructor
local function constructor(self)
    local o = {}
    setmetatable(o, self)
    return o
end

function LogEntry:extend(identifier, snapshot)
    local o = constructor(self)
    o.__index = o

    -- static properties (won't appear on instances)
    o._cls = identifier
    o._snapshot = snapshot or false
    return o
end

function LogEntry:new(creator)
    local o = constructor(self)

    o.cls = self._cls

    o.t = Util.time()
    if creator == nil then
        o.c = Util.getIntegerGuid("player")
    elseif type(creator) == 'string' then
        o.c = Util.getIntegerGuid(creator)
        if (o.c == nil) then
            error(string.format("Failed to convert string `%s` into number", creator))
        end
    else
        o.c = creator
    end

    return o
end

function LogEntry:class()
    return self.cls
end

-- return bool whether this is a snapshot entry
function LogEntry:snapshot()
    -- this is a property of the class, not of the instance
    -- this therefore is not serialized to saved variables
    return self._snapshot
end

function LogEntry:time()
    return self.t
end

function LogEntry:creator()
    return self.c
end


-- return int the weeknumber of this entry
function LogEntry:weekNumber()
    return Util.WeekNumber(self.t)
end

-- Return a sorted list set up for log entries
function LogEntry.sortedList(data)
    local r = SortedList:new(data or {}, Util.CreateMultiFieldSorter('t', 'c'), true)
    if type(r.uniqueInsert) ~= 'function' then
        error("Error creating sorted list but doesn't have function")
    end
    return r
end

function LogEntry:fields()
    return { "t", "c"}
end
