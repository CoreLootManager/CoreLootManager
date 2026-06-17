-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local mergeLists = UTILS.mergeLists
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

---@class Modify
---@field r number rosterUid
---@field p table player GUID list
---@field v number value
---@field e number reason
---@field t string note
---@field n boolean spent
local Modify        = LogEntry:extend("DM")
---@class ModifyRaid
---@field r string raidUid
---@field v number value
---@field e number reason
---@field t string note
---@field s boolean includeStandby
---@field n boolean spent
local ModifyRaid    = LogEntry:extend("DR")
---@class ModifyRoster
---@field r number rosterUid
---@field v number value
---@field e number reason
---@field t string note
---@field n boolean spent
local ModifyRoster  = LogEntry:extend("DO")
---@class Set
---@field r number rosterUid
---@field p table player GUID list
---@field v number value
---@field e number reason
---@field t string note
---@field n boolean spent
local Set           = LogEntry:extend("DS")
---@class Decay
---@field r number rosterUid
---@field p table player GUID list
---@field v number value
---@field e number reason
---@field t string note
---@field i number pointType
local Decay         = LogEntry:extend("DD")
---@class DecayRoster
---@field r number rosterUid
---@field v number value
---@field e number reason
---@field n boolean ignoreNegatives
---@field t string note
---@field i number pointType
local DecayRoster   = LogEntry:extend("DT")

---@param rosterUid number
---@param playerList table
---@param value number
---@param reason number
---@param note? string
---@param spent? boolean
---@return Modify
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

---@return number
function Modify:rosterUid()
    return self.r
end

---@return table
function Modify:targets()
    return self.p
end

---@return number
function Modify:value()
    return self.v
end

---@return number
function Modify:reason()
    return self.e
end

---@return string
function Modify:note()
    return self.t or ""
end

---@return boolean
function Modify:spent()
    return self.n
end

---@return number
function Modify:type()
    return self.n and CLM.CONSTANTS.POINT_CHANGE_TYPE.SPENT or CLM.CONSTANTS.POINT_CHANGE_TYPE.POINTS
end

local modifyFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t", "n"})
function Modify:fields()
    return modifyFields
end

---@param raidUid string
---@param value number
---@param reason number
---@param note? string
---@param includeStandby? boolean
---@param spent? boolean
---@return ModifyRaid
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

---@return string
function ModifyRaid:raidUid()
    return self.r
end

---@return number
function ModifyRaid:value()
    return self.v
end

---@return number
function ModifyRaid:reason()
    return self.e
end

---@return string
function ModifyRaid:note()
    return self.t or ""
end

---@return boolean
function ModifyRaid:standby()
    return self.s
end

---@return boolean
function ModifyRaid:spent()
    return self.n
end

---@return number
function ModifyRaid:type()
    return self.n and CLM.CONSTANTS.POINT_CHANGE_TYPE.SPENT or CLM.CONSTANTS.POINT_CHANGE_TYPE.POINTS
end

local modifyRaidFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "t", "s", "n"})
function ModifyRaid:fields()
    return modifyRaidFields
end

---@param rosterUid number
---@param value number
---@param reason number
---@param note? string
---@param spent? boolean
---@return ModifyRoster
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

---@return number
function ModifyRoster:rosterUid()
    return self.r
end

---@return number
function ModifyRoster:value()
    return self.v
end

---@return number
function ModifyRoster:reason()
    return self.e
end

---@return string
function ModifyRoster:note()
    return self.t or ""
end

---@return boolean
function ModifyRoster:spent()
    return self.n
end

-- Required for proper decay handling in common mutator
---@return boolean
function ModifyRoster:ignoreNegatives()
    return false
end

---@return number
function ModifyRoster:type()
    return self.n and CLM.CONSTANTS.POINT_CHANGE_TYPE.SPENT or CLM.CONSTANTS.POINT_CHANGE_TYPE.POINTS
end

local modifyRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "t", "n"})
function ModifyRoster:fields()
    return modifyRosterFields
end

---@param rosterUid number
---@param playerList table
---@param value number
---@param reason number
---@param note? string
---@param spent? boolean
---@return Set
function Set:new(rosterUid, playerList, value, reason, note, spent)
    local o = LogEntry.new(self)
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    o.t = note and tostring(note) or ""
    o.n = spent and true or false
    return o
end

---@return number
function Set:rosterUid()
    return self.r
end

---@return table
function Set:targets()
    return self.p
end

---@return number
function Set:value()
    return self.v
end

---@return number
function Set:reason()
    return self.e
end

---@return string
function Set:note()
    return self.t or ""
end

---@return boolean
function Set:spent()
    return self.n
end

---@return number
function Set:type()
    return self.n and CLM.CONSTANTS.POINT_CHANGE_TYPE.SPENT or CLM.CONSTANTS.POINT_CHANGE_TYPE.POINTS
end

local setFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t", "n"})
function Set:fields()
    return setFields
end

---@param rosterUid number
---@param playerList table
---@param value number
---@param reason number
---@param note? string
---@param pointType? number
---@return Decay
function Decay:new(rosterUid, playerList, value, reason, note, pointType)
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
    o.i = tonumber(pointType) or CLM.CONSTANTS.POINT_CHANGE_TYPE.TOTAL
    return o
end

---@return number
function Decay:rosterUid()
    return self.r
end

---@return table
function Decay:targets()
    return self.p
end

---@return number
function Decay:value()
    return self.v
end

---@return number
function Decay:reason()
    return self.e
end

---@return string
function Decay:note()
    return self.t or ""
end

---@return boolean
function Decay:spent()
    return false
end

---@return number
function Decay:type()
    return self.i or CLM.CONSTANTS.POINT_CHANGE_TYPE.TOTAL
end

local decayFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e", "t", "i"})
function Decay:fields()
    return decayFields
end

---@param rosterUid number
---@param value number
---@param reason number
---@param ignoreNegatives? boolean
---@param note? string
---@param pointType? number
---@return DecayRoster
function DecayRoster:new(rosterUid, value, reason, ignoreNegatives, note, pointType)
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
    o.i = tonumber(pointType) or CLM.CONSTANTS.POINT_CHANGE_TYPE.TOTAL
    return o
end

---@return number
function DecayRoster:rosterUid()
    return self.r
end

---@return number
function DecayRoster:value()
    return self.v
end

---@return number
function DecayRoster:reason()
    return self.e
end

---@return boolean
function DecayRoster:ignoreNegatives()
    return self.n
end

---@return string
function DecayRoster:note()
    return self.t or ""
end

---@return boolean
function DecayRoster:spent()
    return false
end

---@return number
function DecayRoster:type()
    return self.i or CLM.CONSTANTS.POINT_CHANGE_TYPE.TOTAL
end

local decayRosterFields = mergeLists(LogEntry:fields(), {"r", "v", "e", "n", "t", "i"})
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
