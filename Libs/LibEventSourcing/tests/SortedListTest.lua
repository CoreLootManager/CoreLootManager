beginTests()

local Util = LibStub("EventSourcing/Util")
local SortedList = LibStub("EventSourcing/SortedList")

local function TestUniqueInsert()

    local cases = {
        { list = { 2, 1}, insert = 4, sorter = Util.InvertSorter(function(a, b)
            if a < b then
                return -1
            elseif a > b then
                return 1
            else
                return 0
            end
        end) },
        { list = { }, insert = 4},
        { list = { 1, 5}, insert = 4},
        { list = { { x = 4 }, { x = 6 }}, insert = { x = 2 }, sorter = Util.CreateFieldSorter('x') },
        { list = { { x = 4 }, { x = 6 }}, insert = { x = 5}, sorter = Util.CreateFieldSorter('x') }
    }


    for _, v in ipairs(cases) do
        local compare = v.sorter or function(a, b)
            if a < b then
                return -1
            elseif a > b then
                return 1
            else
                return 0
            end
        end
        local sortedList = SortedList:new(v.list, compare)
        local startLength = sortedList:length()
        sortedList:insert(v.insert)
        assertSame(0, compare(v.insert, v.insert))

        sortedList:uniqueInsert(v.insert)

        assertTrue(Util.IsSorted(sortedList:entries(), compare) )
        assertSame(startLength + 1, sortedList:length())
    end


end

local function TestInsert()

    local cases = {
        { list = { 2, 1}, insert = 4, sorter = Util.InvertSorter(function(a, b)
            if a < b then
                return -1
            elseif a > b then
                return 1
            else
                return 0
            end
        end) },
        { list = { }, insert = 4},
        { list = { 1, 5}, insert = 4},
        { list = { { x = 4 }, { x = 6 }}, insert = { x = 2 }, sorter = Util.CreateFieldSorter('x') },
        { list = { { x = 4 }, { x = 6 }}, insert = { x = 5}, sorter = Util.CreateFieldSorter('x') }
    }


    for _, v in ipairs(cases) do
        local compare = v.sorter or function(a, b)
            if a < b then
                return -1
            elseif a > b then
                return 1
            else
                return 0
            end
        end
        local sortedList = SortedList:new(v.list, compare)
        sortedList:insert(v.insert)

        assertTrue(Util.IsSorted(sortedList:entries(), compare))


    end


end

TestInsert()
TestUniqueInsert()
printResultsAndExit()
