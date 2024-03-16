local CLM = select(2, ...) ---@class CLM


---@class ProfileInfoCommAnnounceVersion
---@field m integer
---@field i integer
---@field p integer
---@field c string
local ProfileInfoCommAnnounceVersion =  {}
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

---@class ProfileInfoCommAnnounceRole
local ProfileInfoCommAnnounceRole =  {}
function ProfileInfoCommAnnounceRole:New(roleOrObject)
    local isCopyConstructor = (type(roleOrObject) == "table")
    local o = isCopyConstructor and roleOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = roleOrObject

    return o
end

function ProfileInfoCommAnnounceRole:Role()
    return self.r
end

---@class ProfileInfoCommStructure
local ProfileInfoCommStructure =  {}
function ProfileInfoCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CLM.CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION then
            o.d = ProfileInfoCommAnnounceVersion:New(o.d)
        elseif o.t == CLM.CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_ROLE then
            o.d = ProfileInfoCommAnnounceRole:New(o.d)
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
CLM.MODELS.ProfileInfoCommAnnounceRole = ProfileInfoCommAnnounceRole