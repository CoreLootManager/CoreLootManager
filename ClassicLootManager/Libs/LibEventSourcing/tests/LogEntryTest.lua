beginTests()
local LogEntry = LibStub("EventSourcing/LogEntry")
local Util = LibStub("EventSourcing/Util")

local data = {}
local sortedList = LogEntry.sortedList(data)

local entries = {}
for i = 1, 100 do
    local entry = LogEntry:new(15, 123)
    entries[#entries + 1] = entry
    sortedList:uniqueInsert(entry)
    -- try duplicate insert
    sortedList:uniqueInsert(entry)
end

local compareFunc = Util.CreateMultiFieldSorter(unpack(LogEntry.fields()))
assertSame(-1, compareFunc(entries[1], entries[2]))
assertSame(100, sortedList:length())



-- Test extending hte class.
local Extension = LogEntry:extend('TEST');
assertSame('TEST', Extension:staticClassName())
local extension = Extension:new()
assertSame(Extension:staticClassName(), extension:class())

printResultsAndExit()
