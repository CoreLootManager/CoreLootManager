--[[
    This event models an amount of points given to a set of players on a specific ledger
]]--
local Factory, _ = LibStub:NewLibrary("EventSourcing/TextMessageEntry", 1)
if not Factory then
    return
end


local LogEntry = LibStub("EventSourcing/LogEntry")
local TextMessageEntry = LogEntry:extend('TME')

function TextMessageEntry:new(message)
    local o = LogEntry.new(self)
    o.m = message
    return o
end


function TextMessageEntry:message()
    return self.m
end

function TextMessageEntry:fields()
    local result = LogEntry:fields()
    table.insert(result, 'm')
    return result
end

function Factory.create(message)
    return TextMessageEntry:new(message)
end

function Factory.class()
    return TextMessageEntry
end
