-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local tonumber, setmetatable, type = tonumber, setmetatable, type


local BiddingCommSubmitBid = {}
function BiddingCommSubmitBid:New(valueOrObject, bidType, items)
    local isCopyConstructor = (type(valueOrObject) == "table")
    local o = isCopyConstructor and valueOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.d = valueOrObject
    o.b = CONSTANTS.BID_TYPES[bidType] and bidType or CONSTANTS.BID_TYPE.MAIN_SPEC
    o.i = items

    return o
end

function BiddingCommSubmitBid:Bid()
    return self.d or 0
end

function BiddingCommSubmitBid:Type()
    return self.b or CONSTANTS.BID_TYPE.MAIN_SPEC
end

function BiddingCommSubmitBid:Items()
    return self.i or {}
end

local BiddingCommStructure = {}
function BiddingCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID then
            o.d = BiddingCommSubmitBid:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function BiddingCommStructure:Type()
    return self.t or 0
end

function BiddingCommStructure:Data()
    return self.d
end

CLM.MODELS.BiddingCommStructure = BiddingCommStructure
CLM.MODELS.BiddingCommSubmitBid = BiddingCommSubmitBid