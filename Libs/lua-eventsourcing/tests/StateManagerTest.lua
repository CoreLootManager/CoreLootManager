beginTests()

local Logger = LibStub("LibLogger")
local StateManager = LibStub("EventSourcing/StateManager")
local LogEntry = LibStub("EventSourcing/LogEntry")

local testData = {}
local sortedList = LogEntry.sortedList(testData)
local stateManager = StateManager:new(sortedList, Logger:New())




local TestEntry = LogEntry:extend('TE')

function TestEntry:new(message)
    local o = LogEntry.new(self)
    o.m = message
    return o
end

local messages = {}
stateManager:registerHandler(TestEntry, function(entry)
    table.insert(messages, entry.m)
end)


stateManager:lag();

assertTrue(type(StateManager) == 'table')
-- Hash starts at 0
assertSame(0, stateManager:stateHash())
assertEmpty(messages)

sortedList:uniqueInsert(TestEntry:new('test'))
stateManager:catchup()
assertCount(1, messages)
for i = 1, 100 do
    sortedList:uniqueInsert(TestEntry:new('test' .. i))
end
stateManager:catchup()
assertCount(101, messages)
assertNotSame(0, stateManager:stateHash())

-- test that state hash is the same if we restart.
local expectedHash = stateManager:stateHash()
stateManager:restart()
assertSame(0, stateManager:stateHash())
stateManager:catchup()
assertSame(expectedHash, stateManager:stateHash())



-- Test that setting an interval registers a timer
stateManager:restart()
stateManager:setUpdateInterval(1000)
assertCount(1, C_Timer.tickers)

assertSame(101, stateManager:lag())
C_Timer.Tick()
assertSame(101 - stateManager:getBatchSize(), stateManager:lag())


printResultsAndExit()
