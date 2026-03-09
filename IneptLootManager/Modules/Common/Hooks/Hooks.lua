-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
-- local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --

local Hooks = {}

function Hooks:Initialize()
    self.handlers = {}
end

function Hooks:RegisterHandler(hookName, handler)
    if not self.handlers[hookName] then
        self.handlers[hookName] = {}
        hooksecurefunc(hookName, (function(...)
            for _, callback in ipairs(self.handlers[hookName]) do
                callback(...)
            end
        end))
    end
    self.handlers[hookName][#self.handlers[hookName]+1] = handler
end

local function GetModifierCombination()
    local combination = ""
    if IsAltKeyDown() then combination = combination .. "a" end
    if IsShiftKeyDown() then combination = combination .. "s" end
    if IsControlKeyDown() then combination = combination .. "c" end
    return combination
end

function Hooks:RegisterModifiedItemLinkClickHandler(callback)
    self:RegisterHandler("HandleModifiedItemClick", (function(itemLink)
        callback(GetModifierCombination(), itemLink)
    end))
end

ILM.MODULES.Hooks = Hooks