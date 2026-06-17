-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

---@class StandbyStagingCommSubscribe
---@field r any raidUid
local StandbyStagingCommSubscribe = {}
---@param raidUidOrObject any
---@return StandbyStagingCommSubscribe
function StandbyStagingCommSubscribe:New(raidUidOrObject)
    local isCopyConstructor = (type(raidUidOrObject) == "table")
    local o = isCopyConstructor and raidUidOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = raidUidOrObject

    return o
end

---@return any
function StandbyStagingCommSubscribe:RaidUid()
    return self.r
end

---@class StandbyStagingCommRevoke
---@field r any raidUid
local StandbyStagingCommRevoke = {}
---@param raidUidOrObject any
---@return StandbyStagingCommRevoke
function StandbyStagingCommRevoke:New(raidUidOrObject)
    local isCopyConstructor = (type(raidUidOrObject) == "table")
    local o = isCopyConstructor and raidUidOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = raidUidOrObject

    return o
end

---@return any
function StandbyStagingCommRevoke:RaidUid()
    return self.r
end

---@class StandbyStagingCommResponse
---@field r boolean response
local StandbyStagingCommResponse = {}
---@param boolOrObject boolean|table
---@return StandbyStagingCommResponse
function StandbyStagingCommResponse:New(boolOrObject)
    local isCopyConstructor = (type(boolOrObject) == "table")
    local o = isCopyConstructor and boolOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.r = boolOrObject and true or false

    return o
end

---@return boolean
function StandbyStagingCommResponse:Response()
    return self.r
end

---@class StandbyStagingCommStructure
---@field t number type
---@field d table|StandbyStagingCommSubscribe|StandbyStagingCommRevoke|StandbyStagingCommResponse data
local StandbyStagingCommStructure = {}
---@param typeOrObject number|table
---@param data? any
---@return StandbyStagingCommStructure
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

---@return number
function StandbyStagingCommStructure:Type()
    return self.t or 0
end

---@return any
function StandbyStagingCommStructure:Data()
    return self.d
end

CLM.MODELS.StandbyStagingCommStructure = StandbyStagingCommStructure
CLM.MODELS.StandbyStagingCommSubscribe = StandbyStagingCommSubscribe
CLM.MODELS.StandbyStagingCommRevoke = StandbyStagingCommRevoke
CLM.MODELS.StandbyStagingCommResponse = StandbyStagingCommResponse