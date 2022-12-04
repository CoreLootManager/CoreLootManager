-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local type, pcall, pairs, ipairs = type, pcall, pairs, ipairs
local tinsert = table.insert

local eventDispatcher = LibStub("EventDispatcher")

local myGUID = UTILS.whoamiGUID()

local CLM_HISTORICAL_TTL = 5

local EventManager = {}
function EventManager:Initialize()
    LOG:Trace("EventManager:Initialize()")
    -- WoW
    self.callbacks = {}
    self.bucketCallbacks = {}
    -- External API
    self.messageCallbacks = {}
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
            CLM.CORE[event] = (function(...)
                LOG:Debug("Handling [" .. event .. "]")
                for _,cb in pairs(self.callbacks[event]) do
                    local status, error = pcall(cb, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                    if not status then
                        LOG:Error("Error during handling %s event: %s", event, tostring(error))
                    end
                end
            end)
            CLM.CORE:RegisterEvent(event)
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
        CLM.CORE:UnregisterEvent(event)
        self.callbacks[event] = nil
    end
end

function EventManager:RegisterMessage(messages, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterMessage()")
    local callback
    if type(functionOrObject) == "table" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Fatal("EventManager:RegisterMessage(): Invalid handler input")
        return
    end
    if not messages then
        LOG:Fatal("EventManager:RegisterMessage(): Invalid message")
        return
    end
    if type(messages) == "string" then messages = { messages } end
    for _,message in ipairs(messages) do
        if not self.messageCallbacks[message] then-- lazy load event handlers
            self.messageCallbacks[message] = {}
            CLM.CORE:RegisterMessage(message, (function(...)
                LOG:Debug("Handling [" .. message .. "]")
                for _,cb in pairs(self.messageCallbacks[message]) do
                    local status, error = pcall(cb, ...) -- if there are multiple handlers for an message we don't one to error out all of them
                    if not status then
                        LOG:Error("Error during handling %s message: %s", message, tostring(error))
                    end
                end
            end))
        end

        tinsert(self.messageCallbacks[message], callback)
    end
end

function EventManager:UnregisterMessage(messages)
    LOG:Trace("EventManager:UnregisterMessage()")
    if not messages then
        LOG:Fatal("EventManager:UnregisterMessage(): Invalid messages")
        return
    end
    if type(messages) == "string" then messages = { messages } end
    for _,message in ipairs(messages) do
        CLM.CORE:UnregisterMessage(message)
        self.messageCallbacks[message] = nil
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
            CLM.CORE[handlerName] = (function(...)
                LOG:Debug("Bucket handling [" .. event .. "]")
                for _,cb in pairs(self.bucketCallbacks[event]) do
                    local status, error = pcall(cb, ...) -- if there are multiple handlers for an event we don't one to error out all of them
                    if not status then
                        LOG:Error("Error during bucket handling %s event: %s", event, tostring(error))
                    end
                end
            end)
            CLM.CORE:RegisterBucketEvent(event, interval or 1, handlerName)
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

CONSTANTS.EVENTS = {
    USER_RECEIVED_ITEM = "CLM_USER_RECEIVED_ITEM",
    USER_RECEIVED_POINTS = "CLM_USER_RECEIVED_POINTS",
    USER_BID_ACCEPTED = "CLM_BID_ACCEPTED",
    USER_BID_DENIED = "CLM_BID_DENIED",
    GLOBAL_LOOT_REMOVED = "CLM_GLOBAL_LOOT_REMOVED"
}

CLM.MODULES.EventManager = EventManager