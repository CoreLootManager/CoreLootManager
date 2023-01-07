-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local tonumber = tonumber

local CreateGUIDList = UTILS.CreateGUIDList
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Create    = LogEntry:extend("AC")
local Start     = LogEntry:extend("AS")
local End       = LogEntry:extend("AE")
local Update    = LogEntry:extend("AU")

CLM.MODELS.LEDGER.RAID = {
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
    return self.s or {}
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
    o.l = CreateGUIDList(leavers or {})
    o.j = CreateGUIDList(joiners or {})
    o.s = CreateGUIDList(standby or {})
    o.e = CreateGUIDList(removed or {})
    if #o.l + #o.j + #o.s + #o.e == 0 then
        error("Must provide at least one profile in any of the categories")
    end
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
    return self.s or {}
end

function Update:removed()
    return self.e or {}
end

local updateFields = mergeLists(LogEntry:fields(), {"r", "l", "j", "s", "e"})
function Update:fields()
    return updateFields
end
