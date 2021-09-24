local  _, CLM = ...

local LOG = CLM.LOG

local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local GUI = CLM.GUI
local CONSTANTS = CLM.CONSTANTS

-- local ProfileManager = MODULES.ProfileManager

local Comms = MODULES.Comms

-- local Roster = MODELS.Roster
-- local RosterConfiguration =  MODELS.RosterConfiguration

-- local typeof = UTILS.typeof

local BiddingCommStructure = MODELS.BiddingCommStructure
local BiddingCommSubmitBid = MODELS.BiddingCommSubmitBid

local BIDDING_COMM_PREFIX = "Bidding001"

local BiddingManager = {}
function BiddingManager:Initialize()
    LOG:Trace("BiddingManager:Initialize()")

    self.bids = {}
    self.lastBid = 0
    self.auctionInProgress = false

    Comms:Register(BIDDING_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = BiddingCommStructure:New(rawMessage)
        if CONSTANTS.BIDDING_COMM.TYPES[message:Type()] == nil then return end
        -- Bidding Manager is owner of the channel
        -- pass handling to Auction Manager
        MODULES.AuctionManager:HandleIncomingMessage(message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    self:ClearAuctionInfo()

    self.handlers = {
        [CONSTANTS.AUCTION_COMM.TYPE.START_AUCTION]     = "HandleStartAuction",
        [CONSTANTS.AUCTION_COMM.TYPE.STOP_AUCTION]      = "HandleStopAuction",
        [CONSTANTS.AUCTION_COMM.TYPE.ANTISNIPE]         = "HandleAntiSnipe",
        [CONSTANTS.AUCTION_COMM.TYPE.ACCEPT_BID]        = "HandleAcceptBid",
        [CONSTANTS.AUCTION_COMM.TYPE.DENY_BID]          = "HandleDenyBid",
        [CONSTANTS.AUCTION_COMM.TYPE.DISTRIBUTE_BID]    = "HandleDistributeBid"
    }

    local db = MODULES.Database:Personal()
    if not db.bidding then
        db.bidding = { autoOpen = true }
    end
    self.db = db.bidding

    local options = {
        bidding_auto_open = {
            name = "Toggle Bidding auto-open",
            desc = "Toggle auto open and auto close on auction start and stop",
            type = "toggle",
            set = function(i, v) self:SetAutoOpen(v) end,
            get = function(i) return self:GetAutoOpen() end,
            width = "double",
            order = 9
          }
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)

    MODULES.ConfigManager:RegisterUniversalExecutor("bidding", "BiddingManager", self)
    self._initialized = true
end

function BiddingManager:SetAutoOpen(value)
    self.db.autoOpen = value and true or false
end

function BiddingManager:GetAutoOpen()
    return self.db.autoOpen
end

function BiddingManager:Bid(value)
    LOG:Trace("BiddingManager:Bid()")
    if not self.auctionInProgress then
        LOG:Debug("BiddingManager:Bid(): No auction in progress")
        return
    end
    value = tonumber(value) or 0
    self.lastBid = value
    local message = BiddingCommStructure:New(
        CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID,
        BiddingCommSubmitBid:New(value)
    )
    Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:CancelBid()
    LOG:Trace("BiddingManager:CancelBid()")
    if not self.auctionInProgress then return end
    self.lastBid = nil
    local message = BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.CANCEL_BID, {})
    Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:NotifyPass()
    LOG:Trace("BiddingManager:NotifyPass()")
    if not self.auctionInProgress then return end
    self.lastBid = "Pass"
    local message = BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_PASS, {})
    Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:ClearAuctionInfo()
    self.auctionInfo = nil
    self.auctioneer = nil
    self.lastBid = 0
end

function BiddingManager:HandleIncomingMessage(message, distribution, sender)
    LOG:Trace("BiddingManager:HandleIncomingMessage()")
    if not MODULES.AuctionManager:IsAuctioneer(sender) then
        LOG:Error("Received unauthorised auction command from %s", sender)
        return
    end
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self[self.handlers[mtype]](self, message:Data(), sender)
    end
end

function BiddingManager:HandleStartAuction(data, sender)
    LOG:Trace("BiddingManager:HandleStartAuction()")
    if self.auctionInProgress then
        LOG:Debug("Received new auction from %s while auction is in progress", sender)
        return
    end
    self.auctionInfo = data
    self.auctioneer = sender
    PlaySound(12889)
    GUI.BiddingManager:StartAuction(self:GetAutoOpen(), self.auctionInfo)
    LOG:Message("Auction of " .. self.auctionInfo:ItemLink())
    self.auctionInProgress = true
end

function BiddingManager:HandleStopAuction(data, sender)
    LOG:Trace("BiddingManager:HandleStopAuction()")
    if not self.auctionInProgress then
        LOG:Debug("Received auction stop from %s while no auctions are in progress", sender)
        return
    end
    self.auctionInProgress = false
    self:ClearAuctionInfo()
    PlaySound(12867)
    GUI.BiddingManager:EndAuction()
    LOG:Message("Auction finished")
end

function BiddingManager:HandleAntiSnipe(data, sender)
    LOG:Trace("BiddingManager:HandleAntiSnipe()")
    if not self.auctionInProgress then
        LOG:Debug("Received antisnipe from %s while no auctions are in progress", sender)
        return
    end
    GUI.BiddingManager:AntiSnipe()
end

function BiddingManager:HandleAcceptBid(data, sender)
    LOG:Trace("BiddingManager:HandleAcceptBid()")
    if not self.auctionInProgress then
        LOG:Debug("Received accept bid from %s while no auctions are in progress", sender)
        return
    end
    LOG:Message("Your bid (%s) was |cff00cc00accepted|r", self.lastBid or "cancel")
end

function BiddingManager:HandleDenyBid(data, sender)
    LOG:Trace("BiddingManager:HandleDenyBid()")
    if not self.auctionInProgress then
        LOG:Debug("Received deny bid from %s while no auctions are in progress", sender)
        return
    end
    LOG:Message("Your bid (%s) was denied: |cffcc0000%s|r", self.lastBid, CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or "Unknown")
end

function BiddingManager:HandleDistributeBid(data, sender)
    LOG:Trace("BiddingManager:HandleDistributeBid()")
    if not self.auctionInProgress then
        LOG:Debug("Received distribute bid from %s while no auctions are in progress", sender)
        return
    end
    GUI.BiddingManager:UpdateCurrentBidValue((tonumber(data) or 0) + 1)
end

CONSTANTS.BIDDING_COMM = {
    TYPE = {
        SUBMIT_BID  = 1,
        CANCEL_BID  = 2,
        NOTIFY_PASS = 3
    },
    TYPES = UTILS.Set({
        1, -- SUBMIT BID
        2, -- CANCEL BID
        3, -- NOTIFY_PASS
    })
}

MODULES.BiddingManager = BiddingManager
