-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local CreateGUIDList = UTILS.CreateGUIDList
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

---@class Create
---@field r number rosterUid
---@field n string name
---@field c table config deflated
local Create    = LogEntry:extend("AC")
---@class Start
---@field r string raidUid
---@field p table player GUID list
---@field s table standby GUID list
local Start     = LogEntry:extend("AS")
---@class End
---@field r string raidUid
local End       = LogEntry:extend("AE")
---@class Update
---@field r string raidUid
---@field l table leavers GUID list
---@field j table joiners GUID list
---@field s table standby GUID list
---@field e table removed GUID list
local Update    = LogEntry:extend("AU")

CLM.MODELS.LEDGER.RAID = {
    Create = Create,
    Start = Start,
    End = End,
    Update = Update
}

---@param rosterUid number
---@param name string
---@param config table
---@return Create
function Create:new(rosterUid, name, config)
    local o = LogEntry.new(self)
    o.r = tonumber(rosterUid) or 0
    o.n = strsub(tostring(name or ""), 1, 128)
    o.c = config:deflate()
    return o
end

---@return number
function Create:rosterUid()
    return self.r
end

---@return string
function Create:name()
    return self.n
end

---@return table
function Create:config()
    return self.c
end

local CreateFields = mergeLists(LogEntry:fields(), {"r", "n", "c"})
function Create:fields()
    return CreateFields
end

---@param raidUid string
---@param players table
---@param standby table
---@return Start
function Start:new(raidUid, players, standby)
    local o = LogEntry.new(self)
    o.r = raidUid
    o.p = CreateGUIDList(players)
    o.s = CreateGUIDList(standby)
    return o
end

---@return string
function Start:raid()
    return self.r
end

---@return table
function Start:players()
    return self.p
end

---@return table
function Start:standby()
    return self.s or {}
end

local StartFields = mergeLists(LogEntry:fields(), {"r", "p","s"})
function Start:fields()
    return StartFields
end

---@param raidUid string
---@return End
function End:new(raidUid)
    local o = LogEntry.new(self)
    o.r = raidUid
    return o
end

---@return string
function End:raid()
    return self.r
end

local EndFields = mergeLists(LogEntry:fields(), {"r"})
function End:fields()
    return EndFields
end

---@param raidUid string
---@param leavers? table
---@param joiners? table
---@param standby? table
---@param removed? table
---@return Update
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

---@return string
function Update:raid()
    return self.r
end

---@return table
function Update:leavers()
    return self.l
end

---@return table
function Update:joiners()
    return self.j
end

---@return table
function Update:standby()
    return self.s or {}
end

---@return table
function Update:removed()
    return self.e or {}
end

local updateFields = mergeLists(LogEntry:fields(), {"r", "l", "j", "s", "e"})
function Update:fields()
    return updateFields
end
