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
    Util.assertTable(data, "data")
    Util.assertFunction(compare, "compare")
    Util.IsSorted(data, compare)

    local o = {}
    setmetatable(o, self)
    self.__index = self

    o._entries  = data or {}
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

function SortedList:head()
    if #self._entries < 1 then
        error("List is empty")
    end
    return self._entries[1]
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
