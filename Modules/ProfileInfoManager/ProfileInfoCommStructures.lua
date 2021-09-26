local _, CLM = ...

local MODELS = CLM.MODELS
local CONSTANTS = CLM.CONSTANTS


local ProfileInfoCommAnnounceVersion = {}
function ProfileInfoCommAnnounceVersion:New(majorOrObject, minor, patch, changeset)
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

function ProfileInfoCommAnnounceVersion:Version()
    return {
        major = self.m,
        minor = self.i,
        patch = self.p,
        changeset = self.c
    }
end

local ProfileInfoCommStructure = {}
function ProfileInfoCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION then
            o.d = ProfileInfoCommAnnounceVersion:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function ProfileInfoCommStructure:Type()
    return self.t or 0
end

function ProfileInfoCommStructure:Data()
    return self.d
end

MODELS.ProfileInfoCommStructure = ProfileInfoCommStructure
MODELS.ProfileInfoCommAnnounceVersion = ProfileInfoCommAnnounceVersion