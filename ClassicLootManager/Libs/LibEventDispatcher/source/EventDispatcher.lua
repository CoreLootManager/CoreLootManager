-- Publisher / subcriber events.

--[[

Requirements:
- Any addon should be able to trigger an event.
- Any addon should be able to listen to events.


Design decisions:

- Events handlers are closures
- Event handlers are passed an event object:
  - The event has 2 read only properties
    - name: string
    - data: table --> the elements in the table are mutable

]]

if LibStub == nil then
    error("EventDispatcher requires LibStub")
end

local EventDispatcher, _ = LibStub:NewLibrary("EventDispatcher", 1)

if EventDispatcher == nil then return end

local listeners = {}

local function dispatch(name, data)
    local eventListeners = listeners[name]
    if eventListeners == nil then
        return
    end
    -- todo:
    -- profiling
    for i = eventListeners.min, eventListeners.max - 1 do
        if eventListeners[i] and not pcall(eventListeners[i], name, data) then
            print("Event handler resulted in error")
        end
    end
end

local DEFAULT_TTL = 5


local EventDispatcherMeta = {
    __metatable = false,
    __index = {
        addEventListener = function(eventName, callback, prepend)
            if listeners[eventName] == nil then
                -- we store min and max to allow for prepending
                listeners[eventName] = {
                    min = 1,
                    max = 1
                }
            end
            if prepend or false then
                listeners[eventName].min = listeners[eventName].min - 1
                listeners[eventName][listeners[eventName].min] = callback
            else
                listeners[eventName][listeners[eventName].max] = callback
                listeners[eventName].max = listeners[eventName].max + 1
            end

        end,
        removeEventListener = function(eventName, callback)
            error("not yet supported, instead just ignore the event in your code")

        end,
        dispatchEvent = dispatch,
        dispatchEventWithTTL = function(name, data, timestamp, ttl)
            if timestamp ~= nil and timestamp + (ttl or DEFAULT_TTL) < GetServerTime() then
                return
            end
            dispatch(name, data)
        end

    },
    __newindex = function(table, key, value)
        error(string.format("Cannot write read-only or unknown property '%s'", key))
    end
}
setmetatable(EventDispatcher, EventDispatcherMeta)