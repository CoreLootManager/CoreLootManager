local _, CLM = ...

local MODELS = CLM.MODELS
-- local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS


local VersioningCommAnnounceVersion = {}
function VersioningCommAnnounceVersion:New(valueOrObject)
    local isCopyConstructor = (type(valueOrObject) == "table")
    local o = isCopyConstructor and valueOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.d = valueOrObject

    return o
end

function VersioningCommAnnounceVersion:Bid()
    return self.d or 0
end

local VersioningCommStructure = {}
function VersioningCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.Versioning_COMM.TYPE.SUBMIT_BID then
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
MODELS.VersioningCommRequestVersion = VersioningCommRequestVersion
MODELS.VersioningCommAnnounceVersionWithRequest = VersioningCommAnnounceVersionWithRequest