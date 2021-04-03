local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local merge = UTILS.merge
-- local typeof = UTILS.typeof
local ClassToNumber = UTILS.ClassToNumber
-- local getIntegerGuid = UTILS.getIntegerGuid
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
-- local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- local inflate = UTILS.inflate
-- local deflate = UTILS.deflate

local ProfileUpdate     = LogEntry:extend("P0")
local ProfileRemove     = LogEntry:extend("P1")
local ProfileLink       = LogEntry:extend("P2")
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

local ProfileUpdateFields = merge(LogEntry:fields(), {"g", "n", "c", "s", "m"})
function ProfileUpdate:fields()
    return ProfileUpdateFields
end

-- ------------- --
-- ProfileRemove --
-- ------------- --
function ProfileRemove:new(GUID)
    local o = LogEntry.new(self);
    o.g = tostring(GUID) or ""
    return o
end

function ProfileRemove:GUID()
    return self.g
end

local ProfileRemoveFields = merge(LogEntry:fields(), {"g"})
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

local ProfileLinkFields = merge(LogEntry:fields(), {"g", "m"})
function ProfileLink:fields()
    return ProfileLinkFields
end

MODELS.LEDGER.PROFILE = {
    Update  = ProfileUpdate,
    Remove  = ProfileRemove,
    Link    = ProfileLink
}