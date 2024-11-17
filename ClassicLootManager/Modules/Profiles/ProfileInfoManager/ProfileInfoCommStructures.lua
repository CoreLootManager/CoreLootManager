-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

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
        major = tonumber(self.m) or 0,
        minor = tonumber(self.i) or 0,
        patch = tonumber(self.p) or 0,
        changeset = (type(self.c) == "string") and self.c or ""
    }
end

local ProfileInfoCommStructure = {}
function ProfileInfoCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION then
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

CLM.MODELS.ProfileInfoCommStructure = ProfileInfoCommStructure
CLM.MODELS.ProfileInfoCommAnnounceVersion = ProfileInfoCommAnnounceVersion