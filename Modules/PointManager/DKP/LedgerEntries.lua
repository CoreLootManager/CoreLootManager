local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local mergeLists = UTILS.mergeLists
-- local typeof = UTILS.typeof
-- local getIntegerGuid = UTILS.getIntegerGuid
-- local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- Point DKP X
local Modify        = LogEntry:extend("DM")
local ModifyRaid    = LogEntry:extend("DR")
local ModifyRoster  = LogEntry:extend("DO")
local Set           = LogEntry:extend("DS")
local Decay         = LogEntry:extend("DD")
local DecayRoster   = LogEntry:extend("DT")

function Modify:new(rosterUid, playerList, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
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

local modifyFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e"})
function Modify:fields()
    return modifyFields
end

function ModifyRaid:new(raidUid, value, reason)
    local o = LogEntry.new(self);
    o.r = raidUid or ""
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
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

local modifyRaidFields = mergeLists(LogEntry:fields(), {"r", "v", "e"})
function ModifyRaid:fields()
    return modifyRaidFields
end

function ModifyRoster:new(rosterUid, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
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

local modifyRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e"})
function ModifyRoster:fields()
    return modifyRosterFields
end

function Set:new(rosterUid, playerList, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
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

local setFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e"})
function Set:fields()
    return setFields
end

function Decay:new(rosterUid, playerList, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
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

local decayFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e"})
function Decay:fields()
    return decayFields
end

function DecayRoster:new(rosterUid, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
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

local decayRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e"})
function DecayRoster:fields()
    return decayRosterFields
end

MODELS.LEDGER.DKP = {
    Modify = Modify,
    Set = Set,
    Decay = Decay,
    ModifyRaid = ModifyRaid,
    ModifyRoster = ModifyRoster,
    DecayRoster = DecayRoster
}
