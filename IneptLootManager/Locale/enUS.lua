local _, ILM = ...

local L = {}

-- For Lazy creating localization during runtime throug ILM.L[string]
setmetatable(L, {
    __index = function (_, key)
        return tostring(key)
    end
})

ILM.L = L
