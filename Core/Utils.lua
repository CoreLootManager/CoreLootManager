local _, CLM = ...
local LOG = CLM.LOG
CLM.UTILS = {}

local UTILS = CLM.UTILS

local getGuidFromInteger = LibStub("EventSourcing/Util").getGuidFromInteger
local DumpTable = LibStub("EventSourcing/Util").DumpTable

local classColors = {
    ["druid"]   = { r = 1,    g = 0.49, b = 0.04, hex = "FF7D0A" },
    ["hunter"]  = { r = 0.67, g = 0.83, b = 0.45, hex = "ABD473" },
    ["mage"]    = { r = 0.25, g = 0.78, b = 0.92, hex = "40C7EB" },
    ["priest"]  = { r = 1,    g = 1,    b = 1,    hex = "FFFFFF" },
    ["rogue"]   = { r = 1,    g = 0.96, b = 0.41, hex = "FFF569" },
    ["shaman"]  = { r = 0.01, g = 0.44, b = 0.87, hex = "0270DD" },
    ["paladin"] = { r = 0.96, g = 0.55, b = 0.73, hex = "F58CBA" },
    ["warlock"] = { r = 0.53, g = 0.53, b = 0.93, hex = "8787ED" },
    ["warrior"] = { r = 0.78, g = 0.61, b = 0.43, hex = "C79C6E" }
}

function UTILS.GetClassColor(className)
    local color = classColors[string.lower(className)]
    return (color or { r = 0.627, g = 0.627, b = 0.627, hex = "A0A0A0" })
end

function UTILS.ColorCodeText(text, color)
    return string.format("|cff%s%s|r", color, text);
end

function UTILS.ColorCodeClass(className)
    return UTILS.ColorCodeText(className, UTILS.GetClassColor(className).hex);
end

function UTILS.UniversalCliMethodExecutor(name, object, cli)
    local values = {strsplit(" ", cli)}
    local method, args, parameters = values[1], {}, ""
    for i=2,#values do
        args[i - 1] = values[i]
        parameters = parameters .. tostring(values[i]) ..  ", "
    end

    if type(object[method]) == "function" then
        LOG:Info("Execute [" .. name .. "(" .. method .. "(" .. parameters .. ")]")
        object[method](object, unpack(args))
    else
        -- print available methods:
        print("Available methods:")
        for methodName,ref in pairs(object) do
            if type(ref) == "function" then
                print(methodName)
            end
        end
    end
end

local StorageQualifiedObject = {}
function StorageQualifiedObject:New(storage)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Virtual profile that is not stored
    -- It's not a bug. It's a feature.
    if storage == nil then
        LOG:Warning("Virtual storage qualified object. Is this intended?")
        local s = {}
        o.persistent = s
    else
        o.persistent = storage
    end

    o.volatile = {}

    return o
end

function UTILS.NewStorageQualifiedObject(storage, o)
    local sqo = StorageQualifiedObject:New(storage)
    o = o or {}
    setmetatable(sqo, o)
    o.__index = o
    return sqo
end

function UTILS.GenerateItemLink(itemId)
    return string.format("item:%d:0:0:0:0:0:0:0:0:0:0:0:0", itemId)
end

function UTILS.Set(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

-- http://lua-users.org/wiki/CopyTable
function UTILS.ShallowCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- http://lua-users.org/wiki/CopyTable
function UTILS.DeepCopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[UTILS.DeepCopy(orig_key, copies)] = UTILS.DeepCopy(orig_value, copies)
            end
            setmetatable(copy, UTILS.DeepCopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function UTILS.RemoveServer(name)
    name, _ = strsplit("-", name)
    return name
end

function UTILS.GetUnitName(unit)
    local name = GetUnitName(unit)
    return UTILS.RemoveServer(name)
end

function UTILS.typeof(object, objectType)
    return getmetatable(object) == objectType
end

function UTILS.getIntegerGuid(GUID)
    return tonumber(string.sub(GUID, -8), 16)
end

local GUIDPrefix = string.sub(UnitGUID("player"), 1, -9)
function UTILS.getGuidFromInteger(int)
    return GUIDPrefix .. string.format("%08X", int)
end

function UTILS.DumpTable(t)
    return DumpTable(t)
end