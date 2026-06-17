-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

---@class Award
---@field r number rosterUid
---@field p number profile GUID
---@field i number itemId
---@field v number value
---@field e string extra
local Award          = LogEntry:extend("IA")
---@class RaidAward
---@field r string raidUid
---@field p number profile GUID
---@field i number itemId
---@field v number value
---@field e string extra
local RaidAward      = LogEntry:extend("II")
---@class Disenchant
---@field r number rosterUid
---@field i number itemId
---@field e string extra
local Disenchant     = LogEntry:extend("ID")
---@class RaidDisenchant
---@field r string raidUid
---@field i number itemId
---@field e string extra
local RaidDisenchant = LogEntry:extend("IE")

---@param rosterUid number
---@param profile Profile|number
---@param itemId number
---@param value number
---@param extra? string
---@return Award
function Award:new(rosterUid, profile, itemId, value, extra)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = GetGUIDFromEntry(profile) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    o.e = extra and tostring(extra) or extra
    return o
end

---@return number
function Award:rosterUid()
    return self.r
end

---@return number
function Award:profile()
    return self.p
end

---@return number
function Award:item()
    return self.i
end

---@return number
function Award:value()
    return self.v
end

---@return string
function Award:extra()
    return self.e or ""
end

local awardFields = mergeLists(LogEntry:fields(), {"r", "p", "i", "v", "e"})
function Award:fields()
    return awardFields
end

---@param raidUid string
---@param profile Profile|number
---@param itemId number
---@param value number
---@param extra? string
---@return RaidAward
function RaidAward:new(raidUid, profile, itemId, value, extra)
    local o = LogEntry.new(self);
    o.r = raidUid or ""
    o.p = GetGUIDFromEntry(profile) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    o.e = extra and tostring(extra) or extra
    return o
end

---@return string
function RaidAward:raidUid()
    return self.r
end

---@return number
function RaidAward:profile()
    return self.p
end

---@return number
function RaidAward:item()
    return self.i
end

---@return number
function RaidAward:value()
    return self.v
end

---@return string
function RaidAward:extra()
    return self.e or ""
end

local raidAwardFields = mergeLists(LogEntry:fields(), {"r", "p", "i", "v", "e"})
function RaidAward:fields()
    return raidAwardFields
end

---@param rosterUid number
---@param itemId number
---@param extra? string
---@return Disenchant
function Disenchant:new(rosterUid, itemId, extra)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.i = tonumber(itemId) or 0
    o.e = extra and tostring(extra) or extra
    return o
end

---@return number
function Disenchant:rosterUid()
    return self.r
end

---@return number
function Disenchant:item()
    return self.i
end

---@return string
function Disenchant:extra()
    return self.e or ""
end

local disenchantFields = mergeLists(LogEntry:fields(), {"r", "i", "e"})
function Disenchant:fields()
    return disenchantFields
end

---@param raidUid string
---@param itemId number
---@param extra? string
---@return RaidDisenchant
function RaidDisenchant:new(raidUid, itemId, extra)
    local o = LogEntry.new(self);
    o.r = raidUid or ""
    o.i = tonumber(itemId) or 0
    o.e = extra and tostring(extra) or extra
    return o
end

---@return string
function RaidDisenchant:raidUid()
    return self.r
end

---@return number
function RaidDisenchant:item()
    return self.i
end

---@return string
function RaidDisenchant:extra()
    return self.e or ""
end

local raidDisenchantFields = mergeLists(LogEntry:fields(), {"r", "i", "e"})
function RaidDisenchant:fields()
    return raidDisenchantFields
end

CLM.MODELS.LEDGER.LOOT = {
    Award = Award,
    RaidAward = RaidAward,
    Disenchant = Disenchant,
    RaidDisenchant = RaidDisenchant,
}
