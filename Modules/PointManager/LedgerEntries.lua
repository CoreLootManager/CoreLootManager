-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local tonumber, tostring = tonumber, tostring

local mergeLists = UTILS.mergeLists
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Modify        = LogEntry:extend("DM")
local ModifyRaid    = LogEntry:extend("DR")
local ModifyRoster  = LogEntry:extend("DO")
local Set           = LogEntry:extend("DS")
local Decay         = LogEntry:extend("DD")
local DecayRoster   = LogEntry:extend("DT")

function Modify:new(rosterUid, playerList, value, reason, note, spent)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    note = note or ""
    o.t = tostring(note)
    o.n = spent and true or false
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

function Modify:spent()
    return self.n
end

local modifyFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t", "n"})
function Modify:fields()
    return modifyFields
end

function ModifyRaid:new(raidUid, value, reason, note, includeStandby, spent)
    local o = LogEntry.new(self);
    o.r = raidUid or ""
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    note = note or ""
    o.t = tostring(note)
    o.s = includeStandby and true or false
    o.n = spent and true or false
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

function ModifyRaid:spent()
    return self.n
end

local modifyRaidFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "t", "s", "n"})
function ModifyRaid:fields()
    return modifyRaidFields
end

function ModifyRoster:new(rosterUid, value, reason, note, spent)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    note = note or ""
    o.t = tostring(note)
    o.n = spent and true or false
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

function ModifyRoster:spent()
    return self.n
end

-- Required for proper decay handling in common mutator
function ModifyRoster:ignoreNegatives()
    return false
end

local modifyRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "t", "n"})
function ModifyRoster:fields()
    return modifyRosterFields
end

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

CLM.MODELS.LEDGER.POINTS = {
    Modify = Modify,
    Set = Set,
    Decay = Decay,
    ModifyRaid = ModifyRaid,
    ModifyRoster = ModifyRoster,
    DecayRoster = DecayRoster
}
