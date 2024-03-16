-- ------------------------------- --
local CLM = select(2, ...) ---@class CLM
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local mergeLists = UTILS.mergeLists
local CanonicalClassToNumber = UTILS.CanonicalClassToNumber
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry") --[[@as LogEntry]]

---@class ProfileUpdate : LogEntry
---@field g shortGuid
---@field n string
---@field c integer
---@field s string
---@field m shortGuid
local ProfileUpdate =  LogEntry:extend("P0")

---@class ProfileRemove : LogEntry
---@field g shortGuid
local ProfileRemove =  LogEntry:extend("P1")

---@class ProfileLink : LogEntry
---@field g shortGuid
---@field m shortGuid
local ProfileLink =  LogEntry:extend("P2")

---@class ProfileLock : LogEntry
---@field p shortGuid[]
---@field l boolean
local ProfileLock =  LogEntry:extend("P3")

-- ------------- --
-- ProfileUpdate --
-- ------------- --
---@param GUID possibleGuidSource
---@param name string
---@param class canonicalClass
---@param spec any?
---@param main playerGuid?
---@return ProfileUpdate
function ProfileUpdate:new(GUID, name, class, spec, main)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.n = (name ~= nil) and tostring(name) or ""
    o.c = CanonicalClassToNumber(class)
    o.s = (spec ~= nil) and tostring(spec) or ""
    o.m = GetGUIDFromEntry(main or 0)
    return o
end

function ProfileUpdate:GUID()
    return self.g
end

function ProfileUpdate:name()
    return self.n
end

function ProfileUpdate:ingameClass()
    return self.c
end

function ProfileUpdate:spec()
    return self.s
end

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
---@param GUID possibleGuidSource
---@return ProfileRemove
function ProfileRemove:new(GUID)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    return o
end

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
---@param GUID possibleGuidSource
---@param main possibleGuidSource?
---@return ProfileLink
function ProfileLink:new(GUID, main)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.m = GetGUIDFromEntry(main or 0)
    return o
end

function ProfileLink:GUID()
    return self.g
end

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
---@param playerList possibleGuidSource[]
---@param lock boolean
---@return ProfileLock
function ProfileLock:new(playerList, lock)
    local o = LogEntry.new(self);
    o.p = CreateGUIDList(playerList)
    o.l = lock and true or false
    return o
end

function ProfileLock:targets()
    return self.p
end

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