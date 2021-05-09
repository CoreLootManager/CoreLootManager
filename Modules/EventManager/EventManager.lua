local _, CLM = ...

local CORE = CLM.CORE
local LOG = CLM.LOG
local MODULES = CLM.MODULES

local EventManager = {}

function EventManager:Initialize()
    LOG:Trace("EventManager:Initialize()")
    self.callbacks = {}
end

function EventManager:RegisterEvent(event, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterEvent()")
    local callback
    if type(functionOrObject) == "array" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Error("EventManager:RegisterEvent(): Invalid handler input")
    end
    if not self.callbacks[event] then-- kazy load event handlers
        self.callbacks[event] = {}
        CORE[event] = (function(self, ...)
            for _,callback in pairs(self.callbacks[event]) do
                status, error = pcall(callback, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                if not status then
                    LOG:Error("Error during handling %s event: %s", event, tostring(error))
                end
            end
            CORE:RegisterEvent(event)
        end)
    end
    table.insert(self.callback[event], callback)
end

MODULES.EventManager = EventManager