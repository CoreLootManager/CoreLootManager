

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
LogEntry._counter = 0
LogEntry._lastTimestamp = 0

-- private constructor
local function constructor(self)
    local o = {}
    setmetatable(o, self)
    return o
end

function LogEntry:extend(identifier, snapshot)
    local o = constructor(self)

    if (identifier == nil or type(identifier) ~= "string" or string.len(identifier) == 0) then
        error("Identifier must be a non-empty string")
    end
    o.__index = o

    -- static properties (won't appear on instances)
    o._cls = identifier
    o._snapshot = snapshot or false
    return o
end


function LogEntry:new(creator)
    local o = constructor(self)

    o.cls = self._cls
    if (self._cls == nil or type(self._cls) ~= "string" or string.len(self._cls) == 0) then
        error("Could not determine class")
    end

    o.t = Util.time()
    if o.t == LogEntry._lastTimestamp then
        LogEntry._counter = LogEntry._counter + 1
    else
        LogEntry._lastTimestamp = o.t
        LogEntry._counter = 0
    end
    o.co = LogEntry._counter
    if creator == nil then
        o.cr = Util.getIntegerGuid("player")
    elseif type(creator) == 'string' then
        o.cr = Util.getIntegerGuid(creator)
        if (o.cr == nil) then
            error(string.format("Failed to convert string `%s` into number", creator))
        end
    else
        o.cr = creator
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

--[[
    Returns the numbers to be used
]]--
function LogEntry:numbersForHash()
    return {self.t, self.cr, self.co}
end

function LogEntry:creator()
    return self.cr
end


-- return int the weeknumber of this entry
function LogEntry:weekNumber()
    return Util.WeekNumber(self.t)
end

-- Return a sorted list set up for log entries
function LogEntry.sortedList(data)
    local r = SortedList:new(data or {}, Util.CreateMultiFieldSorter('t', 'cr', 'co'), true)
    if type(r.uniqueInsert) ~= 'function' then
        error("Error creating sorted list but doesn't have function")
    end
    return r
end

function LogEntry:fields()
    return { "t", "cr", "co"}
end
