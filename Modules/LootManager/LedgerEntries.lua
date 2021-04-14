local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local merge = UTILS.merge

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Award     = LogEntry:extend("IA")
local Revoke    = LogEntry:extend("IR")

function Award:new(rosterUid, player, itemId, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = GetGUIDFromEntry(player) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
end

function Award:rosterUid()
    return self.r
end

function Award:player()
    return self.p
end

function Award:item()
    return self.i
end

function Award:value()
    return self.v
end

local awardFields = merge(LogEntry:fields(), {"r", "p", "i", "v"})
function Award:fields()
    return awardFields
end

function Revoke:new(rosterUid, player, itemId, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = GetGUIDFromEntry(player) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
end

function Revoke:rosterUid()
    return self.r
end

function Revoke:player()
    return self.p
end

function Revoke:item()
    return self.i
end

function Revoke:value()
    return self.v
end

local revokeFields = merge(LogEntry:fields(), {"r", "p", "i", "v"})
function Revoke:fields()
    return revokeFields
end

MODELS.LEDGER.LOOT = {
    Award = Award,
    Revoke = Revoke
}
