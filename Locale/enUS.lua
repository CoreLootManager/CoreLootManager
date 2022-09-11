
local define = LibDependencyInjection.createContext(...)

define.module("Locale.enUS", {"Meta:ADDON_TABLE"}, function(resolve, CLM)
    local L = {}

    -- For Lazy creating localization during runtime throug CLM.L[string]
    setmetatable(L, {
        __index = function (table, key)
            return tostring(key)
        end
    })

    CLM.L = L
    resolve(L)
end)
