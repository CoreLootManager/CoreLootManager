beginTests()


local Util = LibStub("EventSourcing/Util")


local int, realm = Util.getIntegerGuid("player")
local guid = Util.getGuidFromInteger(int, realm)

assertSame(guid, UnitGUID("player"))

local function TestBinarySearch()
    local comparator = function(a, b)
        if a < b then
            return -1
        elseif a > b then
            return 1
        else
            return 0
        end
    end
    local cases = {
        { list = { 1, 2}, search = 2, expected = 2 },
        { list = { 1, 2, 3}, search = 2, expected = 2 },
        { list = { 1, 2, 3, 4, 5, 6}, search = 14, expected = nil },
        { list = { 1, 2, 3, 4, 5, 6}, search = 2, expected = 2 },
        { list = { 10, 20, 30, 40, 50, 60}, search = 20, expected = 2 },
        { list = { 1, 2, 4, 5, 6}, search = 4, expected = 3 },
        { list = { 1, 2, 3, 5, 6}, search = 4, expected = 4 }

    }

    for _, v in ipairs(cases) do
        local result = Util.BinarySearch(v.list, v.search, comparator)
        assertSame(v.expected, result)
    end

end

TestBinarySearch()
printResultsAndExit()
