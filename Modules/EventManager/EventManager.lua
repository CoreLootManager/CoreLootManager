-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

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

function EventManager:RegisterEvent(events, functionOrObject, methodName)
    LOG:Trace("EventManager:RegisterEvent()")
    local callback
    if type(functionOrObject) == "table" and type(methodName) == "string" then
        callback = (function(...) return functionOrObject[methodName](functionOrObject, ...) end)
    elseif type(functionOrObject) == "function" then
        callback = functionOrObject
    else
        LOG:Fatal("EventManager:RegisterEvent(): Invalid handler input")
        return
    end
    if not events then
        LOG:Fatal("EventManager:RegisterEvent(): Invalid event")
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