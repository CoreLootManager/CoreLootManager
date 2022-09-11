local define = LibDependencyInjection.createContext(...)

define.module("LootManager/LedgerEntries", {
    "Utils",
    "LibStub:EventSourcing/LogEntry",
}, function(resolve, UTILS, LogEntry)

local tonumber = tonumber

local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local mergeLists = UTILS.mergeLists


local Award     = LogEntry:extend("IA")
local RaidAward = LogEntry:extend("II")

function Award:new(rosterUid, profile, itemId, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = GetGUIDFromEntry(profile) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
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

function RaidAward:new(raidUid, profile, itemId, value)
    local o = LogEntry.new(self);
    o.r = raidUid or ""
    o.p = GetGUIDFromEntry(profile) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
end

function RaidAward:raidUid()
    return self.r
end

function RaidAward:profile()
    return self.p
end

function RaidAward:item()
    return self.i
end

function RaidAward:value()
    return self.v
end

local raidAwardFields = mergeLists(LogEntry:fields(), {"r", "p", "i", "v"})
function RaidAward:fields()
    return raidAwardFields
end

resolve({
    Award = Award,
    RaidAward = RaidAward
})
end)