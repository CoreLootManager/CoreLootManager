-- ------------------------------- --
local CLM = select(2, ...) ---@class CLM
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

---@class BiddingCommSubmitBid
local BiddingCommSubmitBid =  {}
function BiddingCommSubmitBid:New(valueOrObject, bidType, itemId, items)
    local isCopyConstructor = (type(valueOrObject) == "table")
    local o = isCopyConstructor and valueOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.d = valueOrObject
    o.b = CONSTANTS.BID_TYPES[bidType] and bidType or CONSTANTS.BID_TYPE.MAIN_SPEC
    o.i = itemId
    o.t = items

    return o
end

function BiddingCommSubmitBid:Value()
    return self.d or 0
end

function BiddingCommSubmitBid:Type()
    return self.b or CONSTANTS.BID_TYPE.MAIN_SPEC
end

function BiddingCommSubmitBid:ItemId()
    return self.i or 0
end

function BiddingCommSubmitBid:Items()
    return self.t or {}
end

---@class BiddingCommStructure
local BiddingCommStructure =  {}
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