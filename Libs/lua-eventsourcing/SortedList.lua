--[[
    Sorted lists with an insert API
]]--

local SortedList, _ = LibStub:NewLibrary("EventSourcing/SortedList", 1)
if not SortedList then
    return end

local Util = LibStub("EventSourcing/Util")

--[[
 Create a new sorted list
 @param data the initial data, this must be already sorted or things will break
 @param compare the comparison function to use. This function should return -1 if a < b, 0 if a == b and 1 if a > b.
]]--
function SortedList:new(data, compare, unique)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o._entries  = data or {}
    if type(o._entries) ~= 'table' then
        error('Entries not initialized to a table')
    end
    if type(compare) ~= 'function' then
        error('Argument missing: compare function')
    end
    o._compare = compare
    o._unique = unique or false
    o._state = 1
    return o
end

function SortedList:entries()
    return self._entries
end

function SortedList:length()
    return #self._entries
end

function SortedList:state()
    return self._state
end
function SortedList:insert(element)
    if (self._unique) then
        error("This list only supports uniqueInsert")
    end
    self._state = self._state + 1
    -- since we expect elements to be mostly appended, we do a shortcut check.
    if (#self._entries == 0 or self._compare(self._entries[#self._entries], element) == -1) then
        table.insert(self._entries, element)
        return
    end

    local position = Util.BinarySearch(self._entries, element, self._compare)
    if position == nil then
        table.insert(self._entries, element)
    else
        table.insert(self._entries, position, element)
    end
end

--[[
  Insert an element into the list, if it doesn't exist already. Uniqueness is determined via the
  compare function only, if the element already exists it is silently ignored

  @returns bool indicating whether a new element was inserted
]]--
function SortedList:uniqueInsert(element)
    self._state = self._state + 1
    if (#self._entries == 0 or self._compare(self._entries[#self._entries], element) == -1) then
        table.insert(self._entries, element)
        return true
    end

    local position = Util.BinarySearch(self._entries, element, self._compare)
    if position == nil then
        table.insert(self._entries, element)
    elseif self._compare(self._entries[position], element) ~= 0 then
        table.insert(self._entries, position, element)
    else
        return false
    end
    return true
end

function SortedList:wipe()
    for i, _ in ipairs(self._entries) do
        self._entries[i] = nil
    end
    self._state = self._state + 1
end
-- We don't return a value since we are change the table, this makes it clear for consuming code
--function SortedList:cast(table, compare)
--    if (table._entries == nil) then
--        error("This is not a sorted list table")
--    end
--    setmetatable(table, SortedList)
--    table._compare = compare
--end



function SortedList:searchGreaterThanOrEqual(entry)
    return Util.BinarySearch(self._entries, entry, self._compare)
end



function SortedList.TestUniqueInsert()

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
        if compare(v.insert, v.insert) ~= 0 then
            print("Test FAIL, compare not correct")
        end

        sortedList:uniqueInsert(v.insert)


        if not Util.IsSorted(sortedList:entries(), compare) or sortedList:length() - startLength > 1 then

            io.write(string.format("Test FAIL got length %d, expected %d\n", sortedList:length(), startLength + 1))
--            Util.DumpTable({
--                insert = v.insert,
--                list = v.list
--            })
        else
            print("Test PASS")
        end

    end


end

function SortedList.TestInsert()

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

        if not Util.IsSorted(sortedList:entries(), compare) then

            io.write("Test FAIL =>")
            Util.DumpTable({
                insert = v.insert,
                list = v.list
            })
        else
            print("Test PASS")
        end

    end


end
