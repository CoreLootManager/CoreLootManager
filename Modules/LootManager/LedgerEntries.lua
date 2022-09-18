local define = LibDependencyInjection.createContext(...)

define.module("LedgerEntries/LootManager/Award", {"LibStub:EventSourcing/LogEntry", "Utils", "Log", "GetRosterByUid", "LootManager/mutateLootAward"},
function(resolve, LogEntry, Utils, Log, GetRosterByUid, mutateLootAward)
    local GetGUIDFromEntry = Utils.GetGUIDFromEntry
    local Award     = LogEntry:extend("IA")
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

    local awardFields = Utils.mergeLists(LogEntry:fields(), {"r", "p", "i", "v"})
    function Award:fields()
        return awardFields
    end


    local handler = function(entry)
        Log:TraceAndCount("mutator(LootAward)")
        local roster = GetRosterByUid(entry:rosterUid())
        if not roster then
            Log:Debug("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
            return
        end
        mutateLootAward(entry, roster)
    end

    resolve({Award, handler})

end)
define.module("LootManager/LedgerEntries", {
    "Utils",
    "LibStub:EventSourcing/LogEntry",
}, function(resolve, UTILS, LogEntry)

local tonumber = tonumber

local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local mergeLists = UTILS.mergeLists


local Award     = LogEntry:extend("IA")
local RaidAward = LogEntry:extend("II")



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