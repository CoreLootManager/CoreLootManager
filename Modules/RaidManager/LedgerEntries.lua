local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local CreateGUIDList = UTILS.CreateGUIDList
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Create    = LogEntry:extend("AC")
local Start     = LogEntry:extend("AS")
local End       = LogEntry:extend("AE")
local Update    = LogEntry:extend("AU")

MODELS.LEDGER.RAID = {
    Create = Create,
    Start = Start,
    End = End,
    Update = Update
}

function Create:new(rosterUid, name, config)
    local o = LogEntry.new(self)
    o.r = tonumber(rosterUid) or 0
    o.n = name or ""
    o.c = config:deflate()
    return o
end

function Create:rosterUid()
    return self.r
end

function Create:name()
    return self.n
end

function Create:config()
    return self.c
end

local CreateFields = mergeLists(LogEntry:fields(), {"r", "n", "c"})
function Create:fields()
    return CreateFields
end

function Start:new(raidUid, players, standby)
    local o = LogEntry.new(self)
    o.r = raidUid
    o.p = CreateGUIDList(players)
    o.s = CreateGUIDList(standby)
    return o
end

function Start:raid()
    return self.r
end

function Start:players()
    return self.p
end

function Start:standby()
    return self.s
end

local StartFields = mergeLists(LogEntry:fields(), {"r", "p","s"})
function Start:fields()
    return StartFields
end

function End:new(raidUid)
    local o = LogEntry.new(self)
    o.r = raidUid
    return o
end

function End:raid()
    return self.r
end

local EndFields = mergeLists(LogEntry:fields(), {"r"})
function End:fields()
    return EndFields
end

function Update:new(raidUid, leavers, joiners, standby, removed)
    local o = LogEntry.new(self)
    o.r = raidUid or 0
    o.l = CreateGUIDList(leavers)
    o.j = CreateGUIDList(joiners)
    if #o.l + #o.j == 0 then
        error("Must provide at least one leaver or joiner")
    end
    o.s = CreateGUIDList(standby)
    o.e = CreateGUIDList(removed)
    return o
end

function Update:raid()
    return self.r
end

function Update:leavers()
    return self.l
end

function Update:joiners()
    return self.j
end

function Update:standby()
    return self.s
end

function Update:removed()
    return self.e
end

local updateFields = mergeLists(LogEntry:fields(), {"r", "l", "j", "s", "e"})
function Update:fields()
    return updateFields
end
