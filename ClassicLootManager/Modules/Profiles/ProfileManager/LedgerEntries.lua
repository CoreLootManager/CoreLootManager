-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local mergeLists = UTILS.mergeLists
local CanonicalClassToNumber = UTILS.CanonicalClassToNumber
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

---@class ProfileUpdate
---@field g number GUID
---@field n string name
---@field c number class
---@field s string backwards compat
---@field m number main GUID
local ProfileUpdate     = LogEntry:extend("P0")
---@class ProfileRemove
---@field g number GUID
local ProfileRemove     = LogEntry:extend("P1")
---@class ProfileLink
---@field g number GUID
---@field m number main GUID
local ProfileLink       = LogEntry:extend("P2")
---@class ProfileLock
---@field p table player GUID list
---@field l boolean lock
local ProfileLock       = LogEntry:extend("P3")
-- ------------- --
-- ProfileUpdate --
-- ------------- --
---@param GUID number|string
---@param name? string
---@param class? number|string
---@return ProfileUpdate
function ProfileUpdate:new(GUID, name, class)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.n = (name ~= nil) and tostring(name) or ""
    o.c = CanonicalClassToNumber(class)
    o.s = "" -- Backwards compatibility
    o.m = GetGUIDFromEntry(0)
    return o
end

---@return number
function ProfileUpdate:GUID()
    return self.g
end

---@return string
function ProfileUpdate:name()
    return self.n
end

---@return number
function ProfileUpdate:ingameClass()
    return self.c
end

---@return number
function ProfileUpdate:main()
    return self.m
end

local ProfileUpdateFields = mergeLists(LogEntry:fields(), {"g", "n", "c", "s", "m"})
function ProfileUpdate:fields()
    return ProfileUpdateFields
end

-- ------------- --
-- ProfileRemove --
-- ------------- --
---@param GUID number|string
---@return ProfileRemove
function ProfileRemove:new(GUID)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    return o
end

---@return number
function ProfileRemove:GUID()
    return self.g
end

local ProfileRemoveFields = mergeLists(LogEntry:fields(), {"g"})
function ProfileRemove:fields()
    return ProfileRemoveFields
end

-- ------------- --
-- ProfileLink --
-- ------------- --
---@param GUID number|string
---@param main? number|string
---@return ProfileLink
function ProfileLink:new(GUID, main)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.m = GetGUIDFromEntry(main or 0)
    return o
end

---@return number
function ProfileLink:GUID()
    return self.g
end

---@return number
function ProfileLink:main()
    return self.m
end

local ProfileLinkFields = mergeLists(LogEntry:fields(), {"g", "m"})
function ProfileLink:fields()
    return ProfileLinkFields
end

-- ------------- --
-- ProfileLink --
-- ------------- --
---@param playerList table
---@param lock boolean
---@return ProfileLock
function ProfileLock:new(playerList, lock)
    local o = LogEntry.new(self);
    o.p = CreateGUIDList(playerList)
    o.l = lock and true or false
    return o
end

---@return table
function ProfileLock:targets()
    return self.p
end

---@return boolean
function ProfileLock:lock()
    return self.l
end

local ProfileLockFields = mergeLists(LogEntry:fields(), {"p", "l"})
function ProfileLock:fields()
    return ProfileLockFields
end

CLM.MODELS.LEDGER.PROFILE = {
    Update  = ProfileUpdate,
    Remove  = ProfileRemove,
    Link    = ProfileLink,
    Lock    = ProfileLock
}