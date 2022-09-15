local define = LibDependencyInjection.createContext(...)

define.module("EventManager", {
    "Utils", "Log", "LibStub:EventDispatcher", "Core", "Modules"
}, function(resolve, UTILS, LOG,  eventDispatcher, Core, Modules)

local type, pcall, pairs, ipairs = type, pcall, pairs, ipairs
local tinsert = table.insert

local myGUID = UTILS.whoamiGUID()

local CLM_HISTORICAL_TTL = 5

local EventManager = {
    callbacks = {},
    bucketCallbacks = {}

}

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
            Core[event] = (function(...)
                LOG:Debug("Handling [" .. event .. "]")
                for _,cb in pairs(self.callbacks[event]) do
                    local status, error = pcall(cb, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                    if not status then
                        LOG:Error("Error during handling %s event: %s", event, tostring(error))
                    end
                end
            end)
            Core:RegisterEvent(event)
        end

        tinsert(self.callbacks[event], callback)
    end
end

function EventManager:UnregisterWoWEvent(events)
    LOG:Trace("EventManager:RegisterWoWEvent()")
    if not events then
        LOG:Fatal("EventManager:UnregisterWoWEvent(): Invalid events")
        return
    end
    if type(events) == "string" then events = { events } end
    for _,event in ipairs(events) do
        Core:UnregisterEvent(event)
        self.callbacks[event] = nil
    end
end

function EventManager:RegisterWoWBucketEvent(events, interval, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterWoWBucketEvent()")
    if type(events) == "string" then events = { events } end
    for _,event in ipairs(events) do
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
            Core[handlerName] = (function(...)
                LOG:Debug("Bucket handling [" .. event .. "]")
                for _,cb in pairs(self.bucketCallbacks[event]) do
                    local status, error = pcall(cb, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                    if not status then
                        LOG:Error("Error during bucket handling %s event: %s", event, tostring(error))
                    end
                end
            end)
            Core:RegisterBucketEvent(event, interval or 1, handlerName)
        end
        tinsert(self.bucketCallbacks[event], callback)
    end
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

function EventManager:RegisterEvent(event, callback)
    eventDispatcher.addEventListener(event, callback)
end

Modules.EventManager = EventManager
resolve(EventManager)
end)

define.module("Constants/Events", {}, function(resolve)

resolve({
    USER_RECEIVED_ITEM = "CLM_USER_RECEIVED_ITEM",
    USER_RECEIVED_POINTS = "CLM_USER_RECEIVED_POINTS",
    USER_BID_ACCEPTED = "CLM_BID_ACCEPTED",
    USER_BID_DENIED = "CLM_BID_DENIED",
    GLOBAL_LOOT_REMOVED = "CLM_GLOBAL_LOOT_REMOVED"
})
end)