

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

-- we use a random property name to guarantee people not accessing it.
local privateStaticPrefix = Util.random(6)
local privateStaticClass = privateStaticPrefix .. '_cls'

--[[
  These are property constants that we replace for more readability in our code
  CHANGING THESE WILL BREAK ALL EXISTING LEDGER ENTRIES
  THIS IS ALWAYS A MAJOR BREAKING CHANGE
  ]]--
local privateCreator = '_a'
local privateCounter = '_b'
local privateTimestamp = '_c'
local privateClass = '_d'



LogEntry.__index = LogEntry
LogEntry[privateStaticClass] = 'LE'

local counter = 0
local lastTimestamp = 0

-- private constructor
local function constructor(self)
    local o = {}
    setmetatable(o, self)
    return o
end

function LogEntry:extend(identifier)
    local o = constructor(self)

    if (identifier == nil or type(identifier) ~= "string" or string.len(identifier) == 0) then
        error("Identifier must be a non-empty string")
    end
    o.__index = o

    -- static properties (won't appear on instances)
    o[privateStaticClass] = identifier
    return o
end

-- Check if the given table is an subclass of LogEntry
function LogEntry.isSubClassType(child)
    return child ~= nil
        and type(child) == "table"
        and child[privateStaticClass] ~= nil
end

function LogEntry.staticClassName(metatable)
    if not LogEntry.isSubClassType(metatable) then
        error("Class is not a child of LogEntry")
    end
    return metatable[privateStaticClass]
end


function LogEntry:new(creator)
    local o = constructor(self)
    o[privateClass] = LogEntry.staticClassName(self)

    o[privateTimestamp] = Util.time()
    if o[privateTimestamp] == lastTimestamp then
        counter = counter + 1
    else
        lastTimestamp = o[privateTimestamp]
        counter = 0
    end
    o[privateCounter] = counter
    if creator == nil then
        o[privateCreator] = Util.getIntegerGuid("player")
    elseif type(creator) == 'string' then
        o[privateCreator] = Util.getIntegerGuid(creator)
        if (o[privateCreator] == nil) then
            error(string.format("Failed to convert string `%s` into number", creator))
        end
    else
        o[privateCreator] = creator
    end

    return o
end

function LogEntry:class()
    return self[privateClass]
end

function LogEntry:time()
    return self[privateTimestamp]
end

function LogEntry:setTime(value)
    self[privateTimestamp] = value
end

function LogEntry:setCounter(value)
    self[privateCounter] = value
end

function LogEntry:setClass(value)
    self[privateClass] = value
end

--[[
    Returns the numbers to be used
]]--
function LogEntry:numbersForHash()
    return {self[privateTimestamp], self[privateCounter], self[privateCreator]}
end

function LogEntry:creator()
    return self[privateCreator]
end

function LogEntry:counter()
    return self[privateCounter]
end

-- return int the weeknumber of this entry
function LogEntry:weekNumber()
    return Util.WeekNumber(self[privateTimestamp])
end

-- Return a sorted list set up for log entries
function LogEntry.sortedList(data)
    local r = SortedList:new(data or {}, Util.CreateMultiFieldSorter(unpack(LogEntry.fields())), true)
    if type(r.uniqueInsert) ~= 'function' then
        error("Error creating sorted list but doesn't have unique insert function")
    end
    return r
end

function LogEntry.fields()
    return {privateTimestamp, privateCounter, privateCreator}
end

function LogEntry:uuid()
    return table.concat(self:numbersForHash(), '-')
end
