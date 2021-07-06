local _, CLM = ...

local MODELS = CLM.MODELS
local CONSTANTS = CLM.CONSTANTS


local VersionCommAnnounceVersion = {}
function VersionCommAnnounceVersion:New(majorOrObject, minor, patch, changeset)
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

function VersionCommAnnounceVersion:Version()
    return {
        major = self.m,
        minor = self.i,
        patch = self.p,
        changeset = self.c
    }
end

local VersionCommStructure = {}
function VersionCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION then
            o.d = VersionCommAnnounceVersion:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function VersionCommStructure:Type()
    return self.t or 0
end

function VersionCommStructure:Data()
    return self.d
end

MODELS.VersionCommStructure = VersionCommStructure
MODELS.VersionCommAnnounceVersion = VersionCommAnnounceVersion