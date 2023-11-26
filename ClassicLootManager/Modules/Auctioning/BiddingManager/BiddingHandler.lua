
-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local BiddingHandler = {    
    retryLimit = 10,
    handlers = {}
}

local function SendBid(auctioneer, message)
    print("Send")
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingHandler:StartAuction(auctioneer)
    print("START")
    self.auctioneer = auctioneer
end

local function ClearHandler(self, itemId)
    print("CLEAR", itemId)
    if self.handlers[itemId] then
        if not self.handlers[itemId].ticker:IsCancelled() then
            self.handlers[itemId].ticker:Cancel()
        end
        self.handlers[itemId] = nil
    end
end

local function createCallback(data, itemId)
    return (function(self)
        print("CB 1", data.counter)
        if self:IsCancelled() then return end
        print("CB 2")
        if data.counter <= 1 then
            print("CB 3")
            ClearHandler(BiddingHandler, itemId)
            return
        end
        print("CB 4")
        data.counter = data.counter - 1
        SendBid(BiddingHandler.auctioneer, data.message)
    end)
end

function BiddingHandler:Bid(item, value, type, upgraded)
    print("BID 1", item:GetItemID())
    if self:IsPending(item:GetItemID()) then return end

    local message = CLM.MODELS.BiddingCommStructure:New(
        CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID,
        CLM.MODELS.BiddingCommSubmitBid:New(value, type, item:GetItemID(), upgraded)
    )

    self.handlers[item:GetItemID()] = {
        message = message,
        counter = self.retryLimit
    }
    print("BID 2")
    -- Avarege round-trip time is 250ms - 500ms. Tick bit slower.
    ticker = C_Timer.NewTicker(0.75, createCallback(self.handlers[item:GetItemID()], item:GetItemID()), 10)
    self.handlers[item:GetItemID()].ticker = ticker

     -- TODO on bid accept?
    item:SetBid(CLM.MODELS.UserResponse:New(value, type, {}))
    print("BID 3", self:IsPending(item:GetItemID()))
    SendBid(self.auctioneer, message)
end

function BiddingHandler:SetBidReceived(itemId)
    print("BID RECEIVED")
    ClearHandler(self, itemId)
end

function BiddingHandler:EndAuction()
    print("END")
    for itemId, _ in pairs(self.handlers) do
        ClearHandler(self, itemId)
    end
end

function BiddingHandler:IsPending(itemId)
    print("Pending", itemId, (self.handlers[itemId] ~= nil))
    return (self.handlers[itemId] ~= nil)
end

CLM.MODULES.BiddingHandler = BiddingHandler