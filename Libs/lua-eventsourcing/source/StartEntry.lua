--[[
    Example start entry
]]--

local Factory, _ = LibStub:NewLibrary("EventSourcing/StartEntry", 1)
if not Factory then
    return
end

local LogEntry = LibStub("EventSourcing/LogEntry")

local StartEntry = LogEntry:extend("START", true)


function StartEntry:new(creator)
    local o = LogEntry.new(self, creator)
    return o
end

function Factory.create(creator)
    return StartEntry:new(creator)
end

function Factory.class()
    return StartEntry
end
