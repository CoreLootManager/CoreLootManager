-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable, type = setmetatable, type

local StandbyStagingCommSubscribe = {}
function StandbyStagingCommSubscribe:New(raidUidOrObject)
    local isCopyConstructor = (type(raidUidOrObject) == "table")
    local o = isCopyConstructor and raidUidOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = raidUidOrObject

    return o
end

function StandbyStagingCommSubscribe:RaidUid()
    return self.r
end

local StandbyStagingCommRevoke = {}
function StandbyStagingCommRevoke:New(raidUidOrObject)
    local isCopyConstructor = (type(raidUidOrObject) == "table")
    local o = isCopyConstructor and raidUidOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = raidUidOrObject

    return o
end

function StandbyStagingCommRevoke:RaidUid()
    return self.r
end

local StandbyStagingCommResponse = {}
function StandbyStagingCommResponse:New(boolOrObject)
    local isCopyConstructor = (type(boolOrObject) == "table")
    local o = isCopyConstructor and boolOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = boolOrObject and true or false

    return o
end

function StandbyStagingCommResponse:Response()
    return self.r
end

local StandbyStagingCommStructure = {}
function StandbyStagingCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.STANDBY_STAGING_COMM.TYPE.SUBSCRIBE then
            o.d = StandbyStagingCommSubscribe:New(o.d)
        elseif o.t == CONSTANTS.STANDBY_STAGING_COMM.TYPE.REVOKE then
            o.d = StandbyStagingCommRevoke:New(o.d)
        elseif o.t == CONSTANTS.STANDBY_STAGING_COMM.TYPE.RESPONSE then
            o.d = StandbyStagingCommResponse:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function StandbyStagingCommStructure:Type()
    return self.t or 0
end

function StandbyStagingCommStructure:Data()
    return self.d
end

CLM.MODELS.StandbyStagingCommStructure = StandbyStagingCommStructure
CLM.MODELS.StandbyStagingCommSubscribe = StandbyStagingCommSubscribe
CLM.MODELS.StandbyStagingCommRevoke = StandbyStagingCommRevoke
CLM.MODELS.StandbyStagingCommResponse = StandbyStagingCommResponse