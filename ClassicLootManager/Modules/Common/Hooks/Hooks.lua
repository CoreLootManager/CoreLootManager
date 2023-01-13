-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
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

CLM.MODULES.Hooks = Hooks