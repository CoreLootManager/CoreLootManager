local  _, CLM = ...

local LOG = CLM.LOG

local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local GUI = CLM.GUI
local CONSTANTS = CLM.CONSTANTS

local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local LootManager = MODULES.LootManager

local Comms = MODULES.Comms

local Roster = MODELS.Roster
local RosterConfiguration =  MODELS.RosterConfiguration

local typeof = UTILS.typeof

local AuctionCommStructure = MODELS.AuctionCommStructure
local AuctionCommStartAuction = MODELS.AuctionCommStartAuction
local AuctionCommDenyBid = MODELS.AuctionCommDenyBid
local AuctionCommDistributeBid = MODELS.AuctionCommDistributeBid

local AUCTION_COMM_PREFIX = "Auction"

local AuctionManager = {}
function AuctionManager:Initialize()
    LOG:Trace("AuctionManager:Initialize()")

    self.bids = {}
    self.auctionInProgress = false

    Comms:Register(AUCTION_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = AuctionCommStructure:New(rawMessage)
        if CONSTANTS.AUCTION_COMM.TYPES[message:Type()] == nil then return end
        -- Auction Manager is owner of the channel
        -- pass handling to BidManager
        MODULES.BiddingManager:HandleIncomingMessage(message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.MANAGER, true)

    self.handlers = {
        [CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID]    = "HandleSubmitBid",
        [CONSTANTS.BIDDING_COMM.TYPE.CANCEL_BID]    = "HandleCancelBid"
    }

    self._initialized = true
end

-- We pass configuration separately as it can be overriden on per-auction basis
function AuctionManager:StartAuction(itemId, itemLink, itemSlot, baseValue, maxValue, note, roster, configuration)
    LOG:Trace("AuctionManager:StartAuction()")
    if self.auctionInProgress then
        LOG:Warning("AuctionManager:StartAuction(): Auction in progress")
    end
    -- Auction parameters sanity checks
    note = note or ""
    if not typeof(roster, Roster) then
        LOG:Warning("RosterManager:StartAuction(): Invalid roster object")
        return false
    end
    self.roster = roster
    if not tonumber(itemId) then
        LOG:Warning("RosterManager:StartAuction(): invalid item id")
        return false
    end
    if not itemLink then
        LOG:Warning("RosterManager:StartAuction(): invalid item link")
        return false
    end
    self.itemLink = itemLink
    if not (tonumber(baseValue) and tonumber(maxValue)) then
        LOG:Warning("RosterManager:StartAuction(): invalid values [%s] [%s]", tostring(baseValue), tostring(maxValue))
        return false
    end
    if not typeof(configuration, RosterConfiguration) then
        LOG:Warning("RosterManager:StartAuction(): Invalid roster object")
        return false
    end
    -- Auction Settings sanity checks
    local auctionTime = configuration:Get("auctionTime")
    if auctionTime <= 0 then
        LOG:Warning("RosterManager:StartAuction(): 0s auction time")
        return false
    end
    if auctionTime < 10 then
        LOG:Warning("RosterManager:StartAuction(): Very short (below 10s) auction time")
    end
    self.auctionTime = auctionTime
    self.itemValueMode = configuration:Get("itemValueMode")
    if self.itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING then
        if maxValue > 0 and baseValue > maxValue then
            LOG:Warning("RosterManager:StartAuction(): base value must be smaller or equal to max values")
            return false
        end
    end
    self.baseValue = baseValue or 0
    self.maxValue = maxValue or 0
    if self.auctionTime <= 0 then
        LOG:Warning("RosterManager:StartAuction(): Auction time must be greater than 0 seconds")
        return false
    end
    self.allowNegativeBidders = configuration:Get("allowNegativeBidders")
    self.allowNegativeStandings = configuration:Get("allowNegativeStandings")
    -- Auctioning
    if self:CanUserAuctionItems() then
        -- Start Auction Messages
        local auctionMessage = "Auction of " .. itemLink
        if note:len() > 0 then
            auctionMessage = auctionMessage .. " (" .. tostring(note) .. ")"
        end
        self.note = note
        -- Max 2 raid warnings are displayed at the same time
        SendChatMessage(auctionMessage , "RAID_WARNING")
        auctionMessage = ""
        if baseValue > 0 then
            auctionMessage = auctionMessage .. "Minimum bid: " .. tostring(baseValue) .. ". "
        end
        if maxValue > 0 then
            auctionMessage = auctionMessage .. "Maximum bid: " .. tostring(maxValue) .. ". "
        end
        auctionMessage = auctionMessage .. "Auction time: " .. tostring(auctionTime) .. ". "
        self.antiSnipe = configuration:Get("antiSnipe")
        if self.antiSnipe > 0 then
            auctionMessage = auctionMessage .. "Anti-snipe time: " .. tostring(self.antiSnipe) .. ". "
        end
        SendChatMessage(auctionMessage , "RAID_WARNING")
        -- AntiSnipe settings
        self.antiSnipeLimit = (self.antiSnipe > 0) and 3 or 0
        -- Get Auction Type info
        self.auctionType = configuration:Get("auctionType")
        -- if baseValue / maxValue are different than default item value we will need to update the config
        local default = roster:GetDefaultSlotValue(itemSlot)
        if default.base ~= baseValue then -- TODO: This should be override not default but not yet implemented!
            RosterManager:SetRosterDefaultSlotValue(self.roster, itemSlot, self.baseValue, true)
        end
        if default.max ~= maxValue then
            RosterManager:SetRosterDefaultSlotValue(self.roster, itemSlot, self.maxValue, false)
        end
        -- clear bids
        self.bids = {}
        -- calculate server end time
        self.auctionEndTime = GetServerTime() + self.auctionTime
        self.auctionTimeLeft = self.auctionEndTime
        -- Send auction information
        self:SendAuctionStart()
        -- Start Auction Ticker
        self.lastCountdownValue = 5
        self.ticker = C_Timer.NewTicker(0.1, (function()
            self.auctionTimeLeft = self.auctionEndTime - GetServerTime()
            if self.lastCountdownValue > 0 and self.auctionTimeLeft <= self.lastCountdownValue and self.auctionTimeLeft <= 5  then
                SendChatMessage(tostring(math.ceil(self.auctionTimeLeft)), "RAID_WARNING")
                self.lastCountdownValue = self.lastCountdownValue - 1
            end
            if self.auctionTimeLeft < 0.1 then
                self:StopAuctionTimed()
                return
            end
        end))
        -- Set auction in progress
        self.auctionInProgress = true
        -- UI
        GUI.AuctionManager:UpdateBids()
    else
        LOG:Warning("RosterManager:StartAuction(): Missing auctioning permissions")
        return false
    end
    return true
end

function AuctionManager:StopAuctionTimed()
    LOG:Trace("AuctionManager:StopAuctionTimed()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    SendChatMessage("Auction complete", "RAID_WARNING")
    self:SendAuctionEnd()
    GUI.AuctionManager:UpdateBids()
end

function AuctionManager:StopAuctionManual()
    LOG:Trace("AuctionManager:StopAuctionManual()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    SendChatMessage("Auction stopped by Master Looter", "RAID_WARNING")
    self:SendAuctionEnd()
    GUI.AuctionManager:UpdateBids()
end

function AuctionManager:AntiSnipe()
    LOG:Trace("AuctionManager:AntiSnipe()")
    if self.antiSnipeLimit > 0 then
        if self.auctionTimeLeft < self.antiSnipe then
            self.auctionEndTime = self.auctionEndTime + self.antiSnipe
            self.antiSnipeLimit = self.antiSnipeLimit - 1
            self:SendAntiSnipe()
        end
    end
end

function AuctionManager:SendAuctionStart()
    local message = AuctionCommStructure:New(
        CONSTANTS.AUCTION_COMM.TYPE.START_AUCTION,
        AuctionCommStartAuction:New(
            self.auctionType,
            self.itemValueMode,
            self.baseValue,
            self.maxValue,
            self.itemLink,
            self.auctionTime,
            self.auctionEndTime,
            self.antiSnipe,
            self.note)
    )
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
end

function AuctionManager:SendAuctionEnd()
    local message = AuctionCommStructure:New(CONSTANTS.AUCTION_COMM.TYPE.STOP_AUCTION, {})
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
end

function AuctionManager:SendAntiSnipe()
    local message = AuctionCommStructure:New(CONSTANTS.AUCTION_COMM.TYPE.ANTISNIPE, {})
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
end

function AuctionManager:SendBidAccepted(name)
    local message = AuctionCommStructure:New(CONSTANTS.AUCTION_COMM.TYPE.ACCEPT_BID, {})
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, name, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function AuctionManager:SendBidDenied(name, reason)
    local message = AuctionCommStructure:New(
        CONSTANTS.AUCTION_COMM.TYPE.DENY_BID,
        AuctionCommDenyBid:New(reason)
    )
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, name, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function AuctionManager:SendBidInfo(name, bid)
    if self.auctionType ~= CONSTANTS.AUCTION_TYPE.OPEN then return end
    local message = AuctionCommStructure:New(
        CONSTANTS.AUCTION_COMM.TYPE.ACCEPT_BID,
        AuctionCommDistributeBid:New(name, bid)
    )
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
end

function AuctionManager:HandleIncomingMessage(message, distribution, sender)
    LOG:Trace("AuctionManager:HandleIncomingMessage()")
    local mtype = message:Type() or 0
    -- UTILS.DumpTable(message)
    if self.handlers[mtype] then
        self[self.handlers[mtype]](self, message:Data(), sender)
    end
end

function AuctionManager:HandleSubmitBid(data, sender)
    LOG:Trace("AuctionManager:HandleSubmitBid()")
    if not self.IsAuctionInProgress then
        LOG:Debug("Received submit bid from %s while no auctions are in progress", sender)
        return
    end
    self:UpdateBid(sender, data:Bid())
end

function AuctionManager:HandleCancelBid(data, sender)
    LOG:Trace("AuctionManager:HandleCancelBid()")
    if not self.IsAuctionInProgress then
        LOG:Debug("Received cancel bid from %s while no auctions are in progress", sender)
        return
    end
    self:UpdateBid(sender, nil)
end

function AuctionManager:ValidateBid(name, bid)
    -- allow bid cancelling
    if bid == nil then return true end
    -- sanity check
    local profile = ProfileManager:GetProfileByName(name)
    if not profile then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NOT_IN_ROSTER end
    local GUID = profile:GUID()
    if not self.roster:IsProfileInRoster(GUID) then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NOT_IN_ROSTER end
    -- allow negative bidders
    local current = self.roster:Standings(GUID)
    if current < 0 and not self.allowNegativeBidders then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NEGATIVE_BIDDER end
    -- allow negative standings after bid
    local new = current - bid
    if new < 0 and not self.allowNegativeStandings then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NEGATIVE_STANDING_AFTER end
    -- bid value
    if self.itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING then
        -- ascending
        -- min
        if self.baseValue > 0 and bid < self.baseValue then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.BID_VALUE_TOO_LOW end
        -- max
        if self.maxValue > 0 and bid > self.maxValue then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.BID_VALUE_TOO_HIGH end
    else
        -- single-priced
        if self.baseValue ~= bid then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.BID_VALUE_INVALID end
    end
    -- accept otherwise
    return true
end

function AuctionManager:UpdateBid(name, bid)
    LOG:Trace("AuctionManager:UpdateBid()")
    LOG:Debug("Bid from %s: %s", name, bid)
    if not self:IsAuctionInProgress() then return end
    local accept, reason = self:ValidateBid(name, bid)
    if accept then
        self.bids[name] = bid
        if bid then
            self:AntiSnipe()
        end
        self:SendBidAccepted(name)
        self:SendBidInfo(name, bid)
    else
        self:SendBidDenied(name, reason)
    end
    GUI.AuctionManager:UpdateBids()
end

function AuctionManager:Bids()
    return self.bids
end

function AuctionManager:ClearBids()
    self.bids = {}
end

function AuctionManager:Award(itemId, price, name)
    LootManager:AwardItem(self.roster, name, self.itemLink, itemId, price)
end

function AuctionManager:CanUserAuctionItems(name) -- todo
    -- name = name or UTILS.whoami()
    return true
end

function AuctionManager:IsAuctionInProgress()
    return self.auctionInProgress
end

function AuctionManager:Debug()
    C_Timer.After(1, (function()
        local profiles = self.roster:Profiles()
        local actions = math.random(1,30)
        for _=1,actions do
            local delay = math.random(1,30)*0.9
            C_Timer.After(delay, (function()
                local value
                if math.random(1, 20) == 1 then
                    value = nil
                else
                    value = math.random(self.baseValue, self.maxValue)
                end
                local GUID = profiles[math.random(1, #profiles)]
                local profile = ProfileManager:GetProfileByGUID(GUID)
                self:UpdateBid(profile:Name(), value)
            end))
        end
    end))
end

CONSTANTS.AUCTION_COMM = {
    TYPE = {
        START_AUCTION = 1,
        STOP_AUCTION = 2,
        ANTISNIPE = 3,
        ACCEPT_BID = 4,
        DENY_BID = 5,
        DISTRIBUTE_BID = 6
    },
    TYPES = UTILS.Set({
        1, -- START AUCTION
        2, -- STOP ACUTION
        3, -- ANTISNIPE
        4, -- ACCEPT BID
        5, -- DENY BID
        6, -- DISTRIBUTE BID
    }),
    DENY_BID_REASON = {
        NOT_IN_ROSTER = 1,
        NEGATIVE_BIDDER = 2,
        NEGATIVE_STANDING_AFTER = 3,
        BID_VALUE_TOO_LOW = 4,
        BID_VALUE_TOO_HIGH = 5,
        BID_VALUE_INVALID = 6,
    },
    DENY_BID_REASONS = UTILS.Set({
        1, -- NOT_IN_ROSTER
        2, -- NEGATIVE_BIDDER
        3, -- NEGATIVE_STANDING_AFTER
        4, -- BID_VALUE_TOO_LOW
        5, -- BID_VALUE_TOO_HIGH
        6  -- BID_VALUE_INVALID
    }),
    DENY_BID_REASONS_STRING = {
        [1] = "Not in a roster",
        [2] = "Negative bidders not allowed",
        [3] = "Bidding over current standings not allowed",
        [4] = "Bid too low",
        [5] = "Bid too high",
        [6] = "Invalid bid value"
    }

}

MODULES.AuctionManager = AuctionManager