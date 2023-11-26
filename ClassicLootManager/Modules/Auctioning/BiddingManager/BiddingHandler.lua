
-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local BiddingHandler = {    
    retryLimit = 10
    handlers = {}
}

local function SendBid(auctioneer, message)
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingHandler:StartAuction(auctioneer)
    self.auctioneer = auctioneer
end

local function createCallback(data)
    return (function(self)
        if self:IsCancelled() then return end
        if data.counter <= 0 then
            self:Cancel()
            return
        end
        data.counter = data.counter - 1
        SendBid(BiddingHandler.auctioneer, data.message)
    end)
end

function BiddingHandler:Bid(item, value, type, upgraded)
    if self:IsPending(item:GetItemID()) then return end

    local message = CLM.MODELS.BiddingCommStructure:New(
        CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID,
        CLM.MODELS.BiddingCommSubmitBid:New(value, type, itemId, upgraded)
    )

    self.handlers[item:GetItemID()] = {
        message = message,
        counter = self.retryLimit
    }
    -- Avarege round-trip time is 250ms - 500ms. Tick bit slower.
    ticker = C_Timer.NewTicker(0.75, createCallback(self.handlers[item:GetItemID()]), 10)
    self.handlers[item:GetItemID()].ticker = ticker

     -- TODO on bid accept?
    item:SetBid(CLM.MODELS.UserResponse:New(value, type, {}))

    SendBid(self.auctioneer, message)
end

local function ClearHandler(self, itemId)
    if self.handlers[itemId] then
        if not self.handlers[itemId].ticker:IsCancelled() then
            self.handlers[itemId].ticker:Cancel()
        end
        self.handlers[itemId] = nil
    end
end

function BiddingHandler:SetBidReceived(itemId)
    ClearHandler(itemId)
end

function BiddingHandler:EndAuction()
    for itemId, _ in pairs(self.handlers) do
        ClearHandler(self, itemId)
    end
end

function BiddingHandler:IsPending(itemId)
    return (self.handlers[itemId] ~= nil)
end

CLM.MODULES.BiddingHandler = BiddingHandler