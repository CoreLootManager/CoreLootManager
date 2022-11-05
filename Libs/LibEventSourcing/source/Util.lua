
local Util, _ = LibStub:NewLibrary("EventSourcing/Util", 1)
if not Util then
return end
-- Searches for the first index that has value >= to the given value
function Util.BinarySearch(list, value, comparator, min, max)
    if type(list) ~= 'table' then
        error("Argument 1 must be a table")
    end

    if min == nil then
        min = 1
        max = #list
    end

    if min > max then
        return nil
    end

    local test = math.floor((max + min) / 2)

    local result = comparator(list[test], value)



    if result == -1 then
        -- Tested element < value, solution not in left side
        return Util.BinarySearch(list, value, comparator, test + 1, max)
    elseif test == min then
        return test
    else
        -- Tested element >= value, solution is in left side or current element
        return Util.BinarySearch(list, value, comparator, min, test)
    end
end

function Util.IsSorted(list, comparator)
    if (comparator == nil) then
        error("Missing argument comparator")
    end
    for i = 1, #list - 1  do
        if comparator(list[i], list[i+1]) == 1 then
            return false
        end
    end
    return true
end

function Util.DumpTable(table, indent)
    indent = indent or 0;

    local keys = {};

    for k in pairs(table) do
        keys[#keys+1] = k;
    end

    print(string.rep('  ', indent)..'{');
    indent = indent + 1;
    for k, v in pairs(table) do

        local key = k;
        if (type(key) == 'string') then
            if not (string.match(key, '^[A-Za-z_][0-9A-Za-z_]*$')) then
                key = "['"..key.."']";
            end
        elseif (type(key) == 'number') then
            key = "["..key.."]";
        end

        if (type(v) == 'table') then
            if (next(v)) then
                print(string.rep('  ', indent), tostring(key), "=");
                Util.DumpTable(v, indent);
            else
                print(string.rep('  ', indent), tostring(key), "= {},");
            end
        elseif (type(v) == 'string') then
            print(string.rep('  ', indent), tostring(key), " = ", "'"..v.."'");
        else
            print(string.rep('  ', indent), tostring(key), " = ", tostring(v));
        end
    end
    indent = indent - 1;
    print(string.rep('  ', indent)..'}');
end

function Util.CreateFieldSorter(field)
    return function(a, b)
        if a[field] < b[field] then
            return -1
        elseif a[field] > b[field] then
            return 1
        else
            return 0
        end
    end
end

-- Return the 1-based unix epoch week number
function Util.WeekNumber(unixtimestamp)
    Util.assertNumber(unixtimestamp, 'unixtimestamp')
    return 1 + math.floor(unixtimestamp / 604800)
end
function Util.WeekStart(week)
    return (week - 1) * 604800
end

local function recursiveCompare(a, b, fields, i)
    if a[fields[i]] == b[fields[i]] then
        if i < #fields then
            return recursiveCompare(a, b, fields, i + 1)
        else
            return 0

        end
    elseif a[fields[i]] < b[fields[i]] then
        return -1
    else
        return 1
    end

end
function Util.CreateMultiFieldSorter(...)
    local fields = {...}
    return function(a, b)
        return recursiveCompare(a, b, fields, 1)
    end
end


function Util.InvertSorter(sorter)
    return function(a, b)
        return -1 * sorter(a, b)
    end
end

function Util.time()
    if GetServerTime then
        return GetServerTime()
    else
        return os.time()
    end
end

function Util.UUID()
    local random = math.random(1, 2^31 - 1)
    local ts = Util.time()

    local hex = string.format('%08x%08x', ts, random)
    return hex
end

function Util.wipe(data)
    if (table.wipe) then
        table.wipe(data)
    else
        for k, _ in pairs(data) do
            data[k] = nil
        end
    end
end




function Util.IntegerToBytes(number)
    return math.floor(number / 2^24),
        math.floor((number % 2^24) / 2^16),
        math.floor((number % 2^16) / 2^8),
        number % 2^8

end

function Util.ByteSum(number)
    return math.floor(number / 2^24)
            + math.floor((number % 2^24) / 2^16) + math.floor((number % 2^16) / 2^8) + number % 2^8;
end
function Util.IntegerChecksumCoroutine()
    -- for i=1, #str do
    -- 		local s = string.byte(str, i, i)
    -- 		a = (a+s)%65521
    -- 		b = (b+a)%65521
    -- 		end
    -- return b*65536+a
    return coroutine.create(function(number)
        local a = 1
        local b = 0
        local b1, b2, b3, b4
        local next = number
        while(true) do
            if type(next) ~= 'number' then
                error("Given element is not a number")
            end
            b1, b2, b3, b4 = Util.IntegerToBytes(math.floor(next))
            a = (a + b1)
            b = (b + a)
            a = (a + b2)
            b = (b + a)
            a = (a + b3)
            b = (b + a)

            a = (a + b4) % 65521
            b = (b + a) % 65521
            next = coroutine.yield(b * 65536 + a)
        end
    end)
end

local defaultCharset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

function Util.random(length, alternativeCharset)
    local charset = alternativeCharset or defaultCharset
    local charsetLength = string.len(charset)
    local result = ""
    while string.len(result) < length do
        local i = math.random(1, charsetLength)
        result = result .. charset.sub(charset, i, i)
    end
    return result
end

function Util.getIntegerGuid(target)
    return Util.getIntegerFromGuid(UnitGUID(target))
end

function Util.getIntegerFromGuid(guid)
    return tonumber(string.sub(guid, -8), 16)
end

local GUIDPrefix = string.sub(UnitGUID("player"), 1, -9)

function Util.getGuidFromInteger(int)
    return GUIDPrefix .. string.format("%08X", int)
end

function Util.guid()
    local hex = '0123456789abcdef'
    return table.concat({
        Util.random(8, hex),
        Util.random(4, hex),
        Util.random(4, hex),
        Util.random(4, hex),
        Util.random(12, hex),
    }, '-')
end

function Util.assertType(arg, name, expectedType, optional)
    if optional and arg == nil then
        return
    end

    if type(arg) ~=  expectedType then
        error(string.format("Expected argument %s to be of type %s, got %s insead", name, expectedType, type(arg)))
    end
end

function Util.assertFunction(arg, name, optional)
    return Util.assertType(arg, name, 'function', optional)
end

function Util.assertTable(arg, name, optional)
    return Util.assertType(arg, name, 'table', optional)
end

function Util.assertString(arg, name, optional)
    return Util.assertType(arg, name, 'string', optional)
end


function Util.assertNumber(arg, name, optional)
    return Util.assertType(arg, name, 'number', optional)
end

function Util.assertTableWithFunctions(arg, funcs, name)
    Util.assertTable(arg, name)
    Util.assertTable(funcs)
    for _, v in ipairs(funcs) do
        Util.assertFunction(arg[v], string.format("%s:%s", name, v))
    end
end

function Util.assertLogger(arg, optional)
    if optional and arg == nil then
        return
    end
    Util.assertTableWithFunctions(arg, {
        "Warning",
        "Info",
        "Error",
        "Trace",
        "Debug",
        "Fatal"
    }, "logger")
end

function Util.assertInstanceOf(arg, type, typeName, optional)
    if optional and arg == nil then
        return
    end
    Util.assertTable(arg)
    if getmetatable(arg) ~= type then
        error(string.format("Argument must be of type %s", typeName))
    end
end
