if (GetTime == nil) then
    require "./wow"
    require "Util"
    require "./modules/LibStub"
    require "./LogEntry"
    require "./source/StartEntry"
    require "./source/PlayerAmountEntry"
    require "./source/PercentageDecayEntry"
    require "./StateManager"
    require "./ListSync"
    require "./LedgerFactory"
    require "./string"
    require "./SortedList"
    math.randomseed(os.time())
end



local PlayerAmountEntry = LibStub("EventSourcing/PlayerAmountEntry")
local StartEntry = LibStub("EventSourcing/StartEntry")

local function assertTrue(param, message)
    if param ~= true then
        error("Assertion failed: " .. message)
    else
        print("Assertion ok")
    end
end
local function assertSame(expected, value)
    if expected ~= value then
        error("Failed assert that expected " .. expected .. " matches " .. value)
    else
        print("Assertion OK")
    end
end
local function assertError(cb)
    if pcall(cb) then
        error("Assert failed: Expected error")
    end
end


local subject
subject = PlayerAmountEntry.create({}, 10, 1234)
assertSame(subject:creator(), 1234)
assertSame(subject:amount(), 10)
assertSame(subject:class(), 'PAE')

assertError(function()
    PlayerAmountEntry.create({}, 15, 'bob')
end)


subject = StartEntry.create(1234)
assertSame(subject:creator(), 1234)
assertTrue(true)
