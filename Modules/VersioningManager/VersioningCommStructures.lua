local _, CLM = ...

local MODELS = CLM.MODELS
local CONSTANTS = CLM.CONSTANTS


local VersioningCommAnnounceVersion = {}
function VersioningCommAnnounceVersion:New(majorOrObject, minor, patch, changeset)
    local isCopyConstructor = (type(majorOrObject) == "table")
    local o = isCopyConstructor and majorOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.m = majorOrObject
    o.i = minor
    o.p = patch
    o.c = changeset

    return o
end

function VersioningCommAnnounceVersion:Version()
    return {
        major = o.m,
        minor = o.i,
        patch = o.p,
        changeset = o.c
    }
end

local VersioningCommStructure = {}
function VersioningCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION then
            o.d = VersioningCommAnnounceVersion:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function VersioningCommStructure:Type()
    return self.t or 0
end

function VersioningCommStructure:Data()
    return self.d
end

MODELS.VersioningCommStructure = VersioningCommStructure
MODELS.VersioningCommAnnounceVersion = VersioningCommAnnounceVersion