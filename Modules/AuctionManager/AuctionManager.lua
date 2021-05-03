local  _, CLM = ...

local LOG = CLM.LOG

local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local GUI = CLM.GUI
local CONSTANTS = CLM.CONSTANTS

local ProfileManager = MODULES.ProfileManager

local Comms = MODULES.Comms

local Roster = MODELS.Roster
local RosterConfiguration =  MODELS.RosterConfiguration

local typeof = UTILS.typeof

local AuctionCommStructure = MODELS.AuctionCommStructure
local AuctionCommStartAuction = MODELS.AuctionCommStartAuction
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
        -- BidManager:HandleComms(message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.MANAGER, true)

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
    if configuration:Get("auctionTime") <= 0 then
        LOG:Warning("RosterManager:StartAuction(): Auction time must be greater than 0 seconds")
        return false
    end
    self.allowNegativeBidders = configuration:Get("allowNegativeBidders")
    self.allowNegativeStandings = configuration:Get("allowNegativeStandings")
    -- Auctioning
    if self:UserCanAuctionItems() then
        -- Send users information about auction start
        -- Start auction timer
    else
        LOG:Warning("RosterManager:StartAuction(): Missing auctioning permissions")
        return false
    end
    -- Start Auction Messages
    local auctionMessage = "Auction of " .. itemLink
    if note:len() > 0 then
        auctionMessage = auctionMessage .. " (" .. tostring(note) .. ")"
    end
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
        auctionMessage = auctionMessage .. "AntiSnipe time: " .. tostring(self.antiSnipe) .. ". "
    end
    SendChatMessage(auctionMessage , "RAID_WARNING")
    -- AntiSnipe settings
    self.antiSnipeLimit = 3 and (self.antiSnipe > 0) or 0
    -- Get Auction Type info
    self.auctionType = configuration:Get("auctionType")
    -- if baseValue / maxValue are different than default item value we will need to update the config
    -- TODO
    -- Send auction information
    self:SendAuctionStart()
    -- Start Auction Ticker
    self.auctionTimeLeft = auctionTime
    self.ticker = C_Timer.NewTicker(1, function()
        if self.auctionTimeLeft <= 0 then
            self:StopAuctionTimed()
            return
        end
        if self.auctionTimeLeft <= 5 then
            SendChatMessage(tostring(self.auctionTimeLeft), "RAID_WARNING")
        end
        self.auctionTimeLeft = self.auctionTimeLeft - 1
    end)
    -- Set auction in progress
    self.auctionInProgress = true
    -- UI
    GUI.AuctionManager:Refresh()
    return true
end

function AuctionManager:StopAuctionTimed()
    LOG:Trace("AuctionManager:StopAuctionTimed()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    SendChatMessage("Auction complete", "RAID_WARNING")
    self:SendAuctionEnd()
    GUI.AuctionManager:Refresh()
end

function AuctionManager:StopAuctionManual()
    LOG:Trace("AuctionManager:StopAuctionManual()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    SendChatMessage("Auction stopped by Master Looter", "RAID_WARNING")
    self:SendAuctionEnd()
    GUI.AuctionManager:Refresh()
end

function AuctionManager:AntiSnipe()
    LOG:Trace("AuctionManager:AntiSnipe()")
    if self.antiSnipeLimit > 0 then
        self.auctionTimeLeft = self.auctionTimeLeft + self.AntiSnipe
        self.antiSnipeLimit = self.antiSnipeLimit - 1
        self:SendAntiSnipe()
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
            self.antiSnipe)
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

function AuctionManager:SendBidDenied(name)
    local message = AuctionCommStructure:New(CONSTANTS.AUCTION_COMM.TYPE.DENY_BID, {})
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, name, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function AuctionManager:SendBidInfo(name, bid)
    if self.auctionType ~= CONSTANTS.AUCTION_TYPE.OPEN then return end
    local message = AuctionCommStructure:New(CONSTANTS.AUCTION_COMM.TYPE.ACCEPT_BID,
        AuctionCommDistributeBid:New(name, bid)
    )
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
end

function AuctionManager:ValidateBid(name, bid)
    -- allow bid cancelling
    if bid == nil then return true end
    -- sanity check
    local profile = ProfileManager:GetProfileByName(name)
    if not profile then return false end
    local GUID = profile:GUID()
    if not self.roster:IsProfileInRoster(GUID) then return false end
    -- allow negative bidders
    local current = self.roster:Standings(GUID)
    if current < 0 and not self.allowNegativeBidders then return false end
    -- allow negative standings after bid
    local new = current - bid
    if new < 0 and not self.allowNegativeStandings then return false end
    -- bid value
    if self.itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING then
        -- ascending
        -- min
        if self.baseValue > 0 and bid < self.baseValue then return false end
        -- max
        if self.maxValue > 0 and bid > self.maxValue then return false end
    else
        -- single-priced
        if self.baseValue ~= bid then return false end
    end
    -- accept otherwise
    return true
end

function AuctionManager:UpdateBid(name, bid)
    LOG:Trace("AuctionManager:UpdateBid()")
    if not self:IsAuctionInProgress() then return end
    if self:ValidateBid(name, bid) then
        self.bids[name] = bid
        self:AntiSnipe()
        self:SendBidAccepted(name)
        self:SendBidInfo(name, bid)
    else
        self:SendBidDenied(name)
    end
    GUI.AuctionManager:Refresh()
end

function AuctionManager:Bids()
    return self.bids
end

function AuctionManager:Award(itemId, price, name)
    -- award item to winner
    -- add to loot history
    -- deduce points
end

function AuctionManager:UserCanAuctionItems() -- todo
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
                local  GUID = profiles[math.random(1, #profiles)]
                local profile = ProfileManager:GetProfileByGUID(GUID)
                self:UpdateBid(profile:Name(), value)
            end))
        end
    end))
end

MODULES.AuctionManager = AuctionManager