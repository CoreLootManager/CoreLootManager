local define = LibDependencyInjection.createContext(...)

local function mutate_update_standings(roster, GUID, value, timestamp)
    roster:UpdateStandings(GUID, value, timestamp)
end
local function mutate_set_standings(roster, GUID, value, _)
    roster:SetStandings(GUID, value)
end



define.module("LedgerEntries/PointManager/Modify", {"Utils", "LibStub:EventSourcing/LogEntry", "PointManager/apply_mutator", "Log"},
function(resolve, UTILS, LogEntry, apply_mutator, Log)
    local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists
local CreateGUIDList = UTILS.CreateGUIDList
    local Modify        = LogEntry:extend("DM")
    function Modify:new(rosterUid, playerList, value, reason, note)
        local o = LogEntry.new(self);
        o.r = tonumber(rosterUid) or 0
        o.p = CreateGUIDList(playerList)
        o.v = tonumber(value) or 0
        o.e = tonumber(reason) or 0
        note = note or ""
        o.t = tostring(note)
        return o
    end

    function Modify:rosterUid()
        return self.r
    end

    function Modify:targets()
        return self.p
    end

    function Modify:value()
        return self.v
    end

    function Modify:reason()
        return self.e
    end

    function Modify:note()
        return self.t or ""
    end

    local modifyFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t"})
    function Modify:fields()
        return modifyFields
    end

    local handler = function(entry)
        Log:TraceAndCount("mutator(DKPModify)")
        apply_mutator(entry, mutate_update_standings)
    end

    resolve({Modify, handler})

end)
define.module("LedgerEntries/PointManager/Set", {"Utils", "LibStub:EventSourcing/LogEntry", "PointManager/apply_mutator", "Log"},
function(resolve, UTILS, LogEntry, apply_mutator, Log)
    local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists
local CreateGUIDList = UTILS.CreateGUIDList
local Set           = LogEntry:extend("DS")
function Set:new(rosterUid, playerList, value, reason, note)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    o.t = tostring(note)
    return o
end

function Set:rosterUid()
    return self.r
end

function Set:targets()
    return self.p
end

function Set:value()
    return self.v
end

function Set:reason()
    return self.e
end

function Set:note()
    return self.t or ""
end

local setFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t"})
function Set:fields()
    return setFields
end

    local handler = function(entry)
        Log:TraceAndCount("mutator(DKPSet)")
        apply_mutator(entry, mutate_set_standings)
    end

    resolve({Set, handler})

end)

define.module("LedgerEntries/PointManager/Decay", {"Utils", "LibStub:EventSourcing/LogEntry", "PointManager/apply_mutator", "Log"},
function(resolve, UTILS, LogEntry, apply_mutator, Log)

local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists
local CreateGUIDList = UTILS.CreateGUIDList
local Decay         = LogEntry:extend("DD")
function Decay:new(rosterUid, playerList, value, reason, note)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    note = note or ""
    o.t = tostring(note)
    return o
end

function Decay:rosterUid()
    return self.r
end

function Decay:targets()
    return self.p
end

function Decay:value()
    return self.v
end

function Decay:reason()
    return self.e
end

function Decay:note()
    return self.t or ""
end

local decayFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t"})
function Decay:fields()
    return decayFields
end

local handler = function(entry)
    Log:TraceAndCount("mutator(DKPDecay)")
    apply_mutator(entry, mutate_decay_standings)
end
resolve({Decay, handler})
end)



define.module("LedgerEntries/PointManager/ModifyRaid", {"Utils", "LibStub:EventSourcing/LogEntry", "PointManager/apply_raid_mutator", "Log"},
function(resolve, UTILS, LogEntry, apply_raid_mutator, Log)

local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists
local ModifyRaid    = LogEntry:extend("DR")
function ModifyRaid:new(raidUid, value, reason, note, includeStandby)
    local o = LogEntry.new(self);
    o.r = raidUid or ""
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    note = note or ""
    o.t = tostring(note)
    o.s = includeStandby and true or false
    return o
end

function ModifyRaid:raidUid()
    return self.r
end

function ModifyRaid:value()
    return self.v
end

function ModifyRaid:reason()
    return self.e
end

function ModifyRaid:note()
    return self.t or ""
end

function ModifyRaid:standby()
    return self.s
end

local modifyRaidFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "t", "s"})
function ModifyRaid:fields()
    return modifyRaidFields
end
local handler = function(entry)
    Log:TraceAndCount("mutator(DKPModifyRaid)")
    apply_raid_mutator(entry, mutate_update_standings)
end
resolve({ModifyRaid, handler})
end)

define.module("LedgerEntries/PointManager/ModifyRoster", {"Utils", "LibStub:EventSourcing/LogEntry", "PointManager/apply_roster_mutator", "Log"},
function(resolve, UTILS, LogEntry, apply_roster_mutator, Log)

local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists
local ModifyRoster  = LogEntry:extend("DO")







function ModifyRoster:new(rosterUid, value, reason, note)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    note = note or ""
    o.t = tostring(note)
    return o
end

function ModifyRoster:rosterUid()
    return self.r
end

function ModifyRoster:value()
    return self.v
end

function ModifyRoster:reason()
    return self.e
end

function ModifyRoster:note()
    return self.t or ""
end

-- Required for proper decay handling in common mutator
function ModifyRoster:ignoreNegatives()
    return false
end

local modifyRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "t"})
function ModifyRoster:fields()
    return modifyRosterFields
end

local handler = function(entry)
    Log:TraceAndCount("mutator(DKPModifyRoster)")
    apply_roster_mutator(entry, mutate_update_standings)
end
resolve({ ModifyRoster, handler})
end)

define.module("LedgerEntries/PointManager/ModifyRoster", {"Utils", "LibStub:EventSourcing/LogEntry", "PointManager/apply_roster_mutator", "Log"},
function(resolve, UTILS, LogEntry, apply_roster_mutator, Log)

local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists

local DecayRoster   = LogEntry:extend("DT")
function DecayRoster:new(rosterUid, value, reason, ignoreNegatives, note)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    o.n = ignoreNegatives and true or false
    note = note or ""
    o.t = tostring(note)
    return o
end

function DecayRoster:rosterUid()
    return self.r
end

function DecayRoster:value()
    return self.v
end

function DecayRoster:reason()
    return self.e
end

function DecayRoster:ignoreNegatives()
    return self.n
end

function DecayRoster:note()
    return self.t or ""
end

local decayRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "n", "t"})
function DecayRoster:fields()
    return decayRosterFields
end

local function mutate_decay_standings(roster, GUID, value, _)
    roster:DecayStandings(GUID, value)
end

local handler = function(entry)
    Log:TraceAndCount("mutator(DKPDecayRoster)")
    apply_roster_mutator(entry, mutate_decay_standings)
end
resolve({DecayRoster, handler})

end)