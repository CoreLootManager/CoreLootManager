-- ------------------------------- --
local CLM = select(2, ...) ---@class CLM
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local assertType = UTILS.assertType

---@class BidInfoSender
local BidInfoSender =  {} -- BidInfoSender
BidInfoSender.__index = BidInfoSender

function BidInfoSender:New(interval, commsCallback)
    assertType(interval, 'number')
    assertType(commsCallback, 'function')

    local o = {}
    setmetatable(o, self)

    o.interval = interval
    o.commsCallback = commsCallback

    o.data = {}

    o.current = o.interval

    return o
end

function BidInfoSender:Tick(value)
    value = tonumber(value) or 0
    self.current = self.current - value
    if self.current <= 0 then
        self:Flush()
    end
end

local function BuildCommData(data)
    return CLM.MODELS.AuctionCommDistributeBid:NewFromAggregatedData(data)
end

function BidInfoSender:Flush()
    local _, hasData = next(self.data)
    if hasData then
        self.commsCallback(BuildCommData(self.data))
    end
    self.data = {}
    self.current = self.interval
end

function BidInfoSender:Send(itemId, name, userResponse)
    if not self.data[itemId] then
        self.data[itemId] = {}
    end
    self.data[itemId][name] = userResponse
end

CLM.MODELS.BidInfoSender = BidInfoSender