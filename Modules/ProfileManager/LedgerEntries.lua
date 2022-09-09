-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local tostring = tostring

local mergeLists = UTILS.mergeLists
local ClassToNumber = UTILS.ClassToNumber
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

local ProfileUpdate     = LogEntry:extend("P0")
local ProfileRemove     = LogEntry:extend("P1")
local ProfileLink       = LogEntry:extend("P2")
local ProfileLock       = LogEntry:extend("P3")
-- ------------- --
-- ProfileUpdate --
-- ------------- --
function ProfileUpdate:new(GUID, name, class, spec, main)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.n = (name ~= nil) and tostring(name) or ""
    o.c = ClassToNumber(class)
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