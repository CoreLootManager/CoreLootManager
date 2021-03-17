--[[
    This event models an amount of points given to a set of players on a specific ledger
]]--
local Factory, _ = LibStub:NewLibrary("EventSourcing/Entries", 1)
if not Factory then
    return
end

local LogEntry = LibStub("EventSourcing/LogEntry")

local SnapshotEntry = LogEntry:extend('SNAP', true)

function SnapshotEntry:new(state, creator)
    local o = LogEntry.new(self, creator)
    o.savedstate = state
    return o
end

function SnapshotEntry:extend(identifier)
    return LogEntry:extend('START', true):extend(identifier, true)
end

function Factory.create(state, creator)
    return SnapshotEntry:new(state, creator)
end

function Factory.class()
    return SnapshotEntry
end
