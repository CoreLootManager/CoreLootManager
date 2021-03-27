local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local merge = UTILS.merge
-- local typeof = UTILS.typeof
-- local getIntegerGuid = UTILS.getIntegerGuid
-- local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- Point DKP X
local Modify = LogEntry:extend("DM")
local Set    = LogEntry:extend("DS")
local Decay  = LogEntry:extend("DD")

function Modify:new(rosterUid, playerList, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
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

local modifyFields = merge(LogEntry:fields(), {"r", "p", "v"})
function Modify:fields()
    return modifyFields
end

function Set:new(rosterUid, playerList, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
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

local setFields = merge(LogEntry:fields(), {"r", "p", "v"})
function Set:fields()
    return setFields
end

function Decay:new(rosterUid, playerList, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = value
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

local decayFields = merge(LogEntry:fields(), {"r", "p", "v"})
function Decay:fields()
    return decayFields
end

MODELS.LEDGER.DKP = {
    Modify = Modify,
    Set = Set,
    Decay = Decay
}
