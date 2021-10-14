local _, CLM = ...
local eventDispatcher = LibStub("EventDispatcher")

local CORE = CLM.CORE
local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS

local myGUID = CLM.UTILS.whoamiGUID()

local CLM_HISTORICAL_TTL = 5

local EventManager = {}
function EventManager:Initialize()
    LOG:Trace("EventManager:Initialize()")
    -- WoW
    self.callbacks = {}
    self.bucketCallbacks = {}
    -- External API
end

function EventManager:RegisterWoWEvent(events, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterWoWEvent()")
    local callback
    if type(functionOrObject) == "table" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Fatal("EventManager:RegisterWoWEvent(): Invalid handler input")
        return
    end
    if not events then
        LOG:Fatal("EventManager:RegisterWoWEvent(): Invalid event")
        return
    end
    if type(events) == "string" then events = { events } end
    for _,event in ipairs(events) do
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
end

function EventManager:RegisterWoWBucketEvent(event, interval, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterWoWBucketEvent()")
    local callback
    if type(functionOrObject) == "table" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Error("EventManager:RegisterWoWBucketEvent(): Invalid handler input")
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

function EventManager:DispatchEvent(event, params, timestamp, guid)

    local dispatch = true

    -- If we pass guid then it's a self only event
    if guid then
        dispatch = (myGUID == guid)
    end
    if not dispatch then return end

    -- If we pass timestamp then it should be dispatched only if meets TTL
    if timestamp then
        timestamp = timestamp + CLM_HISTORICAL_TTL
        dispatch = (timestamp >= GetServerTime())
    end
    if not dispatch then return end

    eventDispatcher.dispatchEventWithTTL(event, params, timestamp)
end

CONSTANTS.EVENTS = {
    USER_RECEIVED_ITEM = "CLM_USER_RECEIVED_ITEM",
    USER_RECEIVED_POINTS = "CLM_USER_RECEIVED_POINTS"
}

MODULES.EventManager = EventManager