local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Award     = LogEntry:extend("IA")
local Revoke    = LogEntry:extend("IR")

function Award:new(rosterUid, profile, itemId, value, raidUid)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = GetGUIDFromEntry(profile) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    o.ra = tonumber(raidUid) or 0
    return o
end

function Award:raidUid()
    return self.ra;
end
function Award:rosterUid()
    return self.r
end

function Award:profile()
    return self.p
end

function Award:item()
    return self.i
end

function Award:value()
    return self.v
end

local awardFields = mergeLists(LogEntry:fields(), {"r", "p", "i", "v"})
function Award:fields()
    return awardFields
end

function Revoke:new(rosterUid, profile, itemId, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = GetGUIDFromEntry(profile) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
end

function Revoke:rosterUid()
    return self.r
end

function Revoke:profile()
    return self.p
end

function Revoke:item()
    return self.i
end

function Revoke:value()
    return self.v
end

local revokeFields = mergeLists(LogEntry:fields(), {"r", "p", "i", "v"})
function Revoke:fields()
    return revokeFields
end

MODELS.LEDGER.LOOT = {
    Award = Award,
    Revoke = Revoke
}
