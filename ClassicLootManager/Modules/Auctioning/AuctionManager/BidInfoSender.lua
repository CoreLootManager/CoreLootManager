-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local assertType = UTILS.assertType

local BidInfoSender = {} -- BidInfoSender
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

local function BuildCommData(data)
    return CLM.MODELS.AuctionCommDistributeBid:NewFromAggregatedData(data)
end

local function Send(self)
    local _, hasData = next(self.data)
    if hasData then
        self.commsCallback(BuildCommData(self.data))
    end
    self.current = self.interval
end

function BidInfoSender:Tick(value)
    value = tonumber(value) or 0
    self.current = self.current - value
    if self.current <= 0 then
        self:Flush()
    end
end

function BidInfoSender:Flush()
    Send(self)
    self.data = {}
end

function BidInfoSender:Send(UID, name, userResponse)
    if not self.data[UID] then
        self.data[UID] = {}
    end
    self.data[UID][name] = userResponse
end

CLM.MODELS.BidInfoSender = BidInfoSender