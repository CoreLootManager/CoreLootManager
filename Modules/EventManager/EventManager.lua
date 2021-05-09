local _, CLM = ...

local CORE = CLM.CORE
local LOG = CLM.LOG
local MODULES = CLM.MODULES

local EventManager = {}

function EventManager:Initialize()
    LOG:Trace("EventManager:Initialize()")
    self.callbacks = {}
    self.bucketCallbacks = {}
end

function EventManager:RegisterEvent(event, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterEvent()")
    local callback
    if type(functionOrObject) == "table" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Error("EventManager:RegisterEvent(): Invalid handler input")
    end
    if not self.callbacks[event] then-- lazy load event handlers
        self.callbacks[event] = {}
        CORE[event] = (function(...)
            LOG:Debug("Handling [" .. event .. "]")
            for _,cb in pairs(self.callbacks[event]) do
                local status, error = pcall(cb, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                if not status then
                    LOG:Error("Error during handling %s event: %s", event, tostring(error))
                end
            end
        end)
        CORE:RegisterEvent(event)
    end
    table.insert(self.callbacks[event], callback)
end

function EventManager:RegisterBucketEvent(event, interval, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterBucketEvent()")
    local callback
    if type(functionOrObject) == "table" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Error("EventManager:RegisterBucketEvent(): Invalid handler input")
    end
    if not self.bucketCallbacks[event] then-- lazy load event handlers
        self.bucketCallbacks[event] = {}
        local handlerName = event .. "_bucket"
        CORE[handlerName] = (function(...)
            LOG:Debug("Bucket handling [" .. event .. "]")
            for _,cb in pairs(self.bucketCallbacks[event]) do
                local status, error = pcall(cb, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                if not status then
                    LOG:Error("Error during bucket handling %s event: %s", event, tostring(error))
                end
            end
        end)
        CORE:RegisterBucketEvent(event, interval or 1, handlerName)
    end
    table.insert(self.bucketCallbacks[event], callback)
end

MODULES.EventManager = EventManager