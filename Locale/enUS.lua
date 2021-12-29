local _, CLM = ...

local L = {}

-- For Lazy creating localization during runtime throug CLM.L[string]
setmetatable(L, {
    __index = function (table, key)
        return tostring(key)
    end
})

CLM.L = L
