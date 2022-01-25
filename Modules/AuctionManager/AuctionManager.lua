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
local RaidManager = MODULES.RaidManager
local EventManager = MODULES.EventManager

local Comms = MODULES.Comms

-- local Roster = MODELS.Roster
local Raid = MODELS.Raid
local RosterConfiguration =  MODELS.RosterConfiguration

local typeof = UTILS.typeof

local AuctionCommStructure = MODELS.AuctionCommStructure
local AuctionCommStartAuction = MODELS.AuctionCommStartAuction
local AuctionCommDenyBid = MODELS.AuctionCommDenyBid
local AuctionCommDistributeBid = MODELS.AuctionCommDistributeBid

local AUCTION_COMM_PREFIX = "Auction1"

local EVENT_START_AUCTION = "CLM_AUCTION_START"

local AuctionManager = {}

local function InitializeDB(self)
    self.db = MODULES.Database:Personal('auction', {
        autoAward = true,
        autoTrade = true
    })
end

function AuctionManager:Initialize()
    LOG:Trace("AuctionManager:Initialize()")

    InitializeDB(self)

    self:ClearBids()
    self.auctionInProgress = false

    Comms:Register(AUCTION_COMM_PREFIX,
    (function(rawMessage, distribution, sender)
        local message = AuctionCommStructure:New(rawMessage)
        if CONSTANTS.AUCTION_COMM.TYPES[message:Type()] == nil then return end
        -- Auction Manager is owner of the channel
        -- pass handling to BidManager
        MODULES.BiddingManager:HandleIncomingMessage(message, distribution, sender)
    end),
    (function(name)
        return self:IsAuctioneer(name, true) -- relaxed for cross-guild bidding
    end),
    true)

    self.handlers = {
        [CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID]        = "HandleSubmitBid",
        [CONSTANTS.BIDDING_COMM.TYPE.CANCEL_BID]        = "HandleCancelBid",
        [CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_PASS]       = "HandleNotifyPass",
        [CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_HIDE]       = "HandleNotifyHide",
        [CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_CANTUSE]    = "HandleNotifyCantUse",
    }

    local options = {
        auctioning_header = {
            type = "header",
            name = CLM.L["Auctioning"],
            order = 30
        },
        auctioning_guild_award_announcement = {
            name = CLM.L["Announce award to Guild"],
            desc = CLM.L["Toggles loot award announcement to guild"],
            type = "toggle",
            set = function(i, v) CLM.GlobalConfigs:SetAnnounceAwardToGuild(v) end,
            get = function(i) return CLM.GlobalConfigs:GetAnnounceAwardToGuild() end,
            width = "double",
            order = 31
        },
        auctioning_chat_commands = {
            name = CLM.L["Enable chat commands"],
            desc = CLM.L["Enble !dkp and !bid through whisper / raid. Change requires /reload."],
            type = "toggle",
            set = function(i, v) CLM.GlobalConfigs:SetAllowChatCommands(v) end,
            get = function(i) return CLM.GlobalConfigs:GetAllowChatCommands() end,
            -- width = "double",
            order = 32
        },
        auctioning_enable_auto_award_from_corpse = {
            name = CLM.L["Auto-award from corpse"],
            desc = CLM.L["Enable loot auto-award (Master Looter UI) from corpse when item is awarded"],
            type = "toggle",
            set = function(i, v) self:SetAutoAward(v) end,
            get = function(i) return self:GetAutoAward() end,
            width = "double",
            order = 33
        },
        auctioning_enable_auto_trade = {
            name = CLM.L["Auto-trade after award"],
            desc = CLM.L["Enables auto-trade awarded loot after auctioning from bag"],
            type = "toggle",
            set = function(i, v) self:SetAutoTrade(v) end,
            get = function(i) return self:GetAutoTrade() end,
            -- width = "double",
            order = 34
        }
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)

    MODULES.ConfigManager:RegisterUniversalExecutor("aum", "AuctionManager", self)

    self._initialized = true
end

function AuctionManager:SetAutoAward(value)
    self.db.autoAward = value and true or false
end

function AuctionManager:GetAutoAward()
    return self.db.autoAward
end

function AuctionManager:SetAutoTrade(value)
    self.db.autoTrade = value and true or false
end

function AuctionManager:GetAutoTrade()
    return self.db.autoTrade
end

-- We pass configuration separately as it can be overriden on per-auction basis
function AuctionManager:StartAuction(itemId, itemLink, itemSlot, baseValue, maxValue, note, raid, configuration)
    LOG:Trace("AuctionManager:StartAuction()")
    if self.auctionInProgress then
        LOG:Warning("AuctionManager:StartAuction(): Auction in progress")
        return
    end
    if not self:IsAuctioneer() then
        LOG:Message(CLM.L["You are not allowed to auction items"])
        return
    end
    -- Auction parameters sanity checks
    note = note or ""
    if not typeof(raid, Raid) then
        LOG:Warning("AuctionManager:StartAuction(): Invalid raid object")
        return false
    end
    self.raid = raid
    itemId = tonumber(itemId)
    if not itemId then
        LOG:Warning("AuctionManager:StartAuction(): invalid item id")
        return false
    end
    if not itemLink then
        LOG:Warning("AuctionManager:StartAuction(): invalid item link")
        return false
    end
    self.itemLink = itemLink
    if not (tonumber(baseValue) and tonumber(maxValue)) then
        LOG:Warning("AuctionManager:StartAuction(): invalid values [%s] [%s]", tostring(baseValue), tostring(maxValue))
        return false
    end
    if not typeof(configuration, RosterConfiguration) then
        LOG:Warning("AuctionManager:StartAuction(): Invalid roster configuration object")
        return false
    end
    -- Auction Settings sanity checks
    local auctionTime = configuration:Get("auctionTime")
    if auctionTime <= 0 then
        LOG:Warning("AuctionManager:StartAuction(): 0s auction time")
        return false
    end
    if auctionTime < 10 then
        LOG:Warning("AuctionManager:StartAuction(): Very short (below 10s) auction time")
    end
    self.auctionTime = auctionTime
    self.itemValueMode = configuration:Get("itemValueMode")
    if self.itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING then
        if maxValue > 0 and baseValue > maxValue then
            LOG:Warning("AuctionManager:StartAuction(): base value must be smaller or equal to max values")
            return false
        end
    end
    self.baseValue = baseValue or 0
    self.maxValue = maxValue or 0
    if self.auctionTime <= 0 then
        LOG:Warning("AuctionManager:StartAuction(): Auction time must be greater than 0 seconds")
        return false
    end
    self.allowNegativeBidders = configuration:Get("allowNegativeBidders")
    self.allowNegativeStandings = configuration:Get("allowNegativeStandings")
    -- Auctioning
    -- Start Auction Messages
    self.note = note
    self.antiSnipe = configuration:Get("antiSnipe")
    if CLM.GlobalConfigs:GetAuctionWarning() then
        local auctionMessage = string.format(CLM.L["Auction of %s"], itemLink)
        if note:len() > 0 then
            auctionMessage = auctionMessage .. " (" .. tostring(note) .. ")"
        end
        -- Max 2 raid warnings are displayed at the same time
        SendChatMessage(auctionMessage , "RAID_WARNING")
        auctionMessage = ""
        if baseValue > 0 then
            auctionMessage = auctionMessage .. string.format(CLM.L["Minimum bid: %s."], tostring(baseValue))
        end
        if maxValue > 0 then
            auctionMessage = auctionMessage .. string.format(CLM.L["Maximum bid: %s."], tostring(maxValue))
        end
        auctionMessage = auctionMessage .. string.format(CLM.L["Auction time: %s."], tostring(auctionTime))
        if self.antiSnipe > 0 then
            auctionMessage = auctionMessage .. string.format(CLM.L["Anti-snipe time: %s."], tostring(self.antiSnipe))
        end
        SendChatMessage(auctionMessage , "RAID_WARNING")
        if CLM.GlobalConfigs:GetCommandsWarning() and CLM.GlobalConfigs:GetAllowChatCommands() then
            SendChatMessage("Whisper me '!bid <amount>' to bid. Whisper '!dkp' to check your dkp.", "RAID_WARNING")
        end
    end
    -- Get Auction Type info
    self.auctionType = configuration:Get("auctionType")
    -- AntiSnipe settings
    self.antiSnipeLimit = (self.antiSnipe > 0) and (CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and 100 or 3) or 0
    -- if baseValue / maxValue are different than current (or default if no override) item value we will need to update the config
    local current = self.raid:Roster():GetItemValue(itemId)
    if current.base ~= baseValue or current.max ~= maxValue then
        RosterManager:SetRosterItemValue(self.raid:Roster(), itemId, baseValue, maxValue)
    end
    -- clear bids
    self:ClearBids()
    -- calculate server end time
    self.auctionEndTime = GetServerTime() + self.auctionTime
    self.auctionTimeLeft = self.auctionEndTime
    -- minimal increment
    self.minimalIncrement = self.raid:Roster():GetConfiguration("minimalIncrement")
    -- workaround for open bid to allow 0 bid
    if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
        self.highestBid = self.baseValue - self.minimalIncrement
    end
    -- Send auction information
    self:SendAuctionStart(self.raid:Roster():UID())
    -- Start Auction Ticker
    self.lastCountdownValue = 5
    self.ticker = C_Timer.NewTicker(0.1, (function()
        self.auctionTimeLeft = self.auctionEndTime - GetServerTime()
        if CLM.GlobalConfigs:GetCountdownWarning() and self.lastCountdownValue > 0 and self.auctionTimeLeft <= self.lastCountdownValue and self.auctionTimeLeft <= 5 then
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
    -- Event
    EventManager:DispatchEvent(EVENT_START_AUCTION, { itemId = itemId })
    return true
end

function AuctionManager:StopAuctionTimed()
    LOG:Trace("AuctionManager:StopAuctionTimed()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    if CLM.GlobalConfigs:GetAuctionWarning() then
        SendChatMessage(CLM.L["Auction complete"], "RAID_WARNING")
    end
    self:SendAuctionEnd()
    GUI.AuctionManager:UpdateBids()
end

function AuctionManager:StopAuctionManual()
    LOG:Trace("AuctionManager:StopAuctionManual()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    if CLM.GlobalConfigs:GetAuctionWarning() then
        SendChatMessage(CLM.L["Auction stopped by Master Looter"], "RAID_WARNING")
    end
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
            -- Cheeky update the warning countdown, but only if above 3/5s
            if self.antiSnipe >= 5 then
                self.lastCountdownValue = 5
            elseif self.antiSnipe >= 3 then
                self.lastCountdownValue = 3
            end
        end
    end
end

function AuctionManager:SendAuctionStart(rosterUid)
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
            self.note,
            self.minimalIncrement,
            rosterUid
        )
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
    local message = AuctionCommStructure:New(
        CONSTANTS.AUCTION_COMM.TYPE.DISTRIBUTE_BID,
        AuctionCommDistributeBid:New(name, bid)
    )
    Comms:Send(AUCTION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
end

function AuctionManager:AnnounceHighestBidder(newHighBid, name, bid)
    if not CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then return end
    if self.itemValueMode ~= CONSTANTS.ITEM_VALUE_MODE.ASCENDING then return end
    if not bid then return end
    if bid == CONSTANTS.AUCTION_COMM.BID_PASS then return end
    if not newHighBid then return end

    local message
    local nameModdified
    if self.auctionType == CONSTANTS.AUCTION_TYPE.ANONYMOUS_OPEN then
        nameModdified = ""
        self:SendBidInfo("", bid)
    else
        nameModdified = "(" .. name .. ")"
        self:SendBidInfo(name, bid)
    end

    if not CLM.GlobalConfigs:GetBidsWarning() then return end
    message = string.format(CLM.L["New highest bid: %d DKP %s"], bid, nameModdified)
    SendChatMessage(message, "RAID_WARNING")
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

function AuctionManager:HandleNotifyPass(data, sender)
    LOG:Trace("AuctionManager:HandleNotifyPass()")
    if not self.IsAuctionInProgress then
        LOG:Debug("Received pass from %s while no auctions are in progress", sender)
        return
    end
    -- Pass (unlike other notifciations) needs to go through update bid since it overwrites bid value
    self:UpdateBid(sender, CONSTANTS.AUCTION_COMM.BID_PASS)
end

function AuctionManager:HandleNotifyHide(data, sender)
    LOG:Trace("AuctionManager:HandleNotifyHide()")
    if not self.IsAuctionInProgress then
        LOG:Debug("Received hide from %s while no auctions are in progress", sender)
        return
    end
    self.userResponses.hidden[sender] = true
end

function AuctionManager:HandleNotifyCantUse(data, sender)
    LOG:Trace("AuctionManager:HandleNotifyCantUse()")
    if not self.IsAuctionInProgress then
        LOG:Debug("Received can't use from %s while no auctions are in progress", sender)
        return
    end
    self.userResponses.cantUse[sender] = true
end

function AuctionManager:ValidateBid(name, bid)
    -- bid cancelling
    if bid == nil then
        if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
            return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.CANCELLING_NOT_ALLOWED
        else
            return true
        end
    end
    -- bid passing
    if bid == CONSTANTS.AUCTION_COMM.BID_PASS then
        -- only allow passing if no bids have been placed in open auctions
        if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and self.userResponses.bids[name] then
            return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.PASSING_NOT_ALLOWED
        else
            return true
        end
    end
    if bid == CONSTANTS.AUCTION_COMM.BID_PASS then return true end
    -- sanity check
    local profile = ProfileManager:GetProfileByName(name)
    if not profile then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NOT_IN_ROSTER end
    local GUID = profile:GUID()
    if not self.raid:Roster():IsProfileInRoster(GUID) then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NOT_IN_ROSTER end
    -- allow negative bidders
    local current = self.raid:Roster():Standings(GUID)
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
        -- open bid ascending
        if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
            -- always allow bidding min in ascending mode if haven't bid yet
            if bid == self.baseValue and self.userResponses.bids[name] == nil then
                return true
            end
            if bid <= self.highestBid then
                return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.BID_VALUE_TOO_LOW
            end
            if (bid - self.highestBid) < self.minimalIncrement then
                return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.BID_INCREMENT_TOO_LOW
            end
        end
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
    if not self:IsAuctionInProgress() then return false, CONSTANTS.AUCTION_COMM.DENY_BID_REASON.NO_AUCTION_IN_PROGRESS end
    local accept, reason = self:ValidateBid(name, bid)
    if accept then
        local newHighBid = self:UpdateBidsInternal(name, bid)
        self:SendBidAccepted(name)
        self:AnnounceHighestBidder(newHighBid, name, bid)
    else
        self:SendBidDenied(name, reason)
    end

    GUI.AuctionManager:UpdateBids()

    return accept, reason
end

function AuctionManager:UpdateBidsInternal(name, bid)
    if bid == CONSTANTS.AUCTION_COMM.BID_PASS then
        -- We remove from the bids list but add to pass list
        self.userResponses.bids[name] = nil
        self.userResponses.passes[name] = true
        return false
    end
    self.userResponses.bids[name] = bid
    self.userResponses.passes[name] = nil

    local newHighBid = false
    if bid then
        if bid > self.highestBid then
            self.highestBid = bid
            newHighBid = true
        end
        self:AntiSnipe()
    end
    return newHighBid
end

function AuctionManager:Bids()
    return self.userResponses.bids
end

function AuctionManager:Passes()
    return self.userResponses.passes
end

function AuctionManager:CantUse()
    return self.userResponses.cantUse
end

function AuctionManager:Hidden()
    return self.userResponses.hidden
end

function AuctionManager:ClearBids()
    self.userResponses = {
        bids    = {},
        passes  = {},
        cantUse = {},
        hidden  = {}
    }
    self.highestBid = 0
end

function AuctionManager:Award(itemLink, itemId, price, name)
    LOG:Trace("AuctionManager:Award()")
    return LootManager:AwardItem(self.raid, name, itemLink, itemId, price)
end

function AuctionManager:IsAuctioneer(name, relaxed)
    LOG:Trace("AuctionManager:IsAuctioneer()")
    name = name or UTILS.whoami()
    return RaidManager:IsAllowedToAuction(name, relaxed)
end

function AuctionManager:IsAuctionInProgress()
    return self.auctionInProgress
end

CONSTANTS.AUCTION_COMM = {
    BID_PASS  = CLM.L["PASS"],
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
        BID_INCREMENT_TOO_LOW = 7,
        NO_AUCTION_IN_PROGRESS = 8,
        CANCELLING_NOT_ALLOWED = 9,
        PASSING_NOT_ALLOWED = 10,
    },
    DENY_BID_REASONS = UTILS.Set({
        1, -- NOT_IN_ROSTER
        2, -- NEGATIVE_BIDDER
        3, -- NEGATIVE_STANDING_AFTER
        4, -- BID_VALUE_TOO_LOW
        5, -- BID_VALUE_TOO_HIGH
        6, -- BID_VALUE_INVALID
        7, -- BID_INCREMENT_TOO_LOW
        8, -- NO_AUCTION_IN_PROGRESS
        9, -- CANCELLING_NOT_ALLOWED
        10 -- PASSING_NOT_ALLOWED
    }),
    DENY_BID_REASONS_STRING = {
        [1] = CLM.L["Not in a roster"],
        [2] = CLM.L["Negative bidders not allowed"],
        [3] = CLM.L["Bidding over current standings not allowed"],
        [4] = CLM.L["Bid too low"],
        [5] = CLM.L["Bid too high"],
        [6] = CLM.L["Invalid bid value"],
        [7] = CLM.L["Bid increment too low"],
        [8] = CLM.L["No auction in progress"],
        [9] = CLM.L["Bid cancelling not allowed"],
        [10] = CLM.L["Passing after bidding not allowed"]
    }
}

MODULES.AuctionManager = AuctionManager
--@do-not-package@
function AuctionManager:FakeBids()
    if CLM.MODULES.RaidManager:IsInRaid() and self:IsAuctionInProgress() then
        local roster = CLM.MODULES.RaidManager:GetRaid():Roster()
        local profiles = roster:Profiles()
        local numBids = math.random(1, #profiles)
        for _=1,numBids do
            local bidder = ProfileManager:GetProfileByGUID(profiles[math.random(1, #profiles)]):Name()
            local bidType = math.random(1,6)
            if     bidType == 1 then -- none
            elseif bidType == 2 then -- value
                local min, max = self.baseValue, 10
                if self.maxValue > 0 then
                    max = self.maxValue
                end
                self:HandleSubmitBid(CLM.MODELS.BiddingCommSubmitBid:New(math.random(min, max)), bidder)
            elseif bidType == 3 then -- pass
                self:HandleNotifyPass(nil, bidder)
            elseif bidType == 4 then -- cancel
                self:HandleCancelBid(nil, bidder)
            elseif bidType == 5 then -- hide
                self:HandleNotifyHide(nil, bidder)
            elseif bidType == 6 then -- cant use
                self:HandleNotifyCantUse(nil, bidder)
            end
        end
    end
end
--@end-do-not-package@