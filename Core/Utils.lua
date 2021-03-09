local _, CLM = ...
local LOG = CLM.LOG
CLM.UTILS = {}

local UTILS = CLM.UTILS

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