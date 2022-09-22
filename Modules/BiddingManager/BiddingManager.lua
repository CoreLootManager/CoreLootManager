-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local BIDDING_COMM_PREFIX = "Bidding1"

local INVTYPE_to_INVSLOT_map = {
    ["INVTYPE_HEAD"]            = {INVSLOT_HEAD},
    ["INVTYPE_NECK"]            = {INVSLOT_NECK},
    ["INVTYPE_SHOULDER"]        = {INVSLOT_SHOULDER},
    ["INVTYPE_BODY"]            = {INVSLOT_BODY},
    ["INVTYPE_CHEST"]           = {INVSLOT_CHEST},
    ["INVTYPE_WAIST"]           = {INVSLOT_WAIST},
    ["INVTYPE_LEGS"]            = {INVSLOT_LEGS},
    ["INVTYPE_FEET"]            = {INVSLOT_FEET},
    ["INVTYPE_WRIST"]           = {INVSLOT_WRIST},
    ["INVTYPE_HAND"]            = {INVSLOT_HAND},
    ["INVTYPE_FINGER"]          = {INVSLOT_FINGER1, INVSLOT_FINGER2},
    ["INVTYPE_TRINKET"]         = {INVSLOT_TRINKET1, INVSLOT_TRINKET2},
    ["INVTYPE_WEAPON"]          = {INVSLOT_MAINHAND, INVSLOT_OFFHAND},
    ["INVTYPE_SHIELD"]          = {INVSLOT_MAINHAND, INVSLOT_OFFHAND},
    ["INVTYPE_RANGED"]          = {INVSLOT_RANGED},
    ["INVTYPE_CLOAK"]           = {INVSLOT_BACK},
    ["INVTYPE_2HWEAPON"]        = {INVSLOT_MAINHAND, INVSLOT_OFFHAND},
    ["INVTYPE_TABARD"]          = {INVSLOT_TABARD},
    ["INVTYPE_ROBE"]            = {INVSLOT_CHEST},
    ["INVTYPE_WEAPONMAINHAND"]  = {INVSLOT_MAINHAND, INVSLOT_OFFHAND},
    ["INVTYPE_WEAPONOFFHAND"]   = {INVSLOT_MAINHAND, INVSLOT_OFFHAND},
    ["INVTYPE_HOLDABLE"]        = {INVSLOT_MAINHAND, INVSLOT_OFFHAND},
    ["INVTYPE_THROWN"]          = {INVSLOT_RANGED},
    ["INVTYPE_RANGEDRIGHT"]     = {INVSLOT_RANGED},
    ["INVTYPE_RELIC"]           = {INVSLOT_RANGED},
}

local function GetUpgradedItems(itemId)
    local _, _, _, itemEquipLoc = GetItemInfoInstant(itemId)
    local invslots = INVTYPE_to_INVSLOT_map[itemEquipLoc] or {}
    local items =  {}
    for _, invslot in ipairs(invslots) do
        local inventoryItemId = GetInventoryItemID("player", invslot)
        if inventoryItemId and inventoryItemId > 0 then
            items[#items+1] = inventoryItemId
        end
    end
    return items
end

local BiddingManager = {}
function BiddingManager:Initialize()
    LOG:Trace("BiddingManager:Initialize()")

    self.bids = {}
    self.lastBid = 0
    self.guiBid = false -- hiding responses for bidding through chat command (which shouldnt be used anyway)
    self.auctionInProgress = false

    CLM.MODULES.Comms:Register(BIDDING_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = CLM.MODELS.BiddingCommStructure:New(rawMessage)
        if CONSTANTS.BIDDING_COMM.TYPES[message:Type()] == nil then return end
        -- Bidding Manager is owner of the channel
        -- pass handling to Auction Manager
        CLM.MODULES.AuctionManager:HandleIncomingMessage(message, distribution, sender)
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

    self.db = CLM.MODULES.Database:Personal('bidding', {
        autoOpen = true,
        autoUpdateBidValue = false
    })

    local options = {
        bidding_header = {
            type = "header",
            name = CLM.L["Bidding"],
            order = 70
        },
        bidding_auto_open = {
            name = CLM.L["Toggle Bidding auto-open"],
            desc = CLM.L["Toggle auto open and auto close on auction start and stop"],
            type = "toggle",
            set = function(i, v) self:SetAutoOpen(v) end,
            get = function(i) return self:GetAutoOpen() end,
            width = "full",
            order = 71
          },
          bidding_auto_update = {
            name = CLM.L["Enable auto-update bid values"],
            desc = CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."],
            type = "toggle",
            set = function(i, v) self:SetAutoUpdateBidValue(v) end,
            get = function(i) return self:GetAutoUpdateBidValue() end,
            width = "full",
            order = 72
          }
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)


    self._initialized = true
end

function BiddingManager:SetAutoOpen(value)
    self.db.autoOpen = value and true or false
end

function BiddingManager:GetAutoOpen()
    return self.db.autoOpen
end

function BiddingManager:SetAutoUpdateBidValue(value)
    self.db.autoUpdateBidValue = value and true or false
end

function BiddingManager:GetAutoUpdateBidValue()
    return self.db.autoUpdateBidValue
end

function BiddingManager:GetLastBidValue()
    return self.lastBid
end

function BiddingManager:Bid(value, type)
    LOG:Trace("BiddingManager:Bid()")
    if not self.auctionInProgress then
        LOG:Debug("BiddingManager:Bid(): No auction in progress")
        return
    end
    value = tonumber(value) or 0
    self.lastBid = value
    self.guiBid = true
    local itemId = UTILS.GetItemIdFromLink(self.auctionInfo:ItemLink())
    local message = CLM.MODELS.BiddingCommStructure:New(
        CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID,
        CLM.MODELS.BiddingCommSubmitBid:New(value, type, GetUpgradedItems(itemId))
    )
    CLM.MODULES.Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:CancelBid()
    LOG:Trace("BiddingManager:CancelBid()")
    if not self.auctionInProgress then return end
    self.lastBid = nil
    self.guiBid = true
    local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.CANCEL_BID, {})
    CLM.MODULES.Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:NotifyPass()
    LOG:Trace("BiddingManager:NotifyPass()")
    if not self.auctionInProgress then return end
    self.lastBid = CLM.L["PASS"]
    self.guiBid = true
    local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_PASS, {})
    CLM.MODULES.Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:NotifyCantUse()
    LOG:Trace("BiddingManager:NotifyCantUse()")
    if not self.auctionInProgress then return end
    local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_CANTUSE, {})
    CLM.MODULES.Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:NotifyHide()
    LOG:Trace("BiddingManager:NotifyHide()")
    if not self.auctionInProgress then return end
    local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_HIDE, {})
    CLM.MODULES.Comms:Send(BIDDING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:ClearAuctionInfo()
    self.auctionInfo = nil
    self.auctioneer = nil
    self.lastBid = nil
    self.guiBid = false
end

function BiddingManager:HandleIncomingMessage(message, _, sender)
    LOG:Trace("BiddingManager:HandleIncomingMessage()")
    if not CLM.MODULES.AuctionManager:IsAuctioneer(sender, true) then
        LOG:Error("Received unauthorised auction command from %s", sender)
        return
    end
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self[self.handlers[mtype]](self, message:Data(), sender)
    end
end


local PlayStartSound, PlayEndSound
PlayStartSound = function()
    if not CLM.GlobalConfigs:GetSounds() then return end
    PlaySound(12889)
end
PlayEndSound = function()
    if not CLM.GlobalConfigs:GetSounds() then return end
    PlaySound(12867)
end

function BiddingManager:HandleStartAuction(data, sender)
    LOG:Trace("BiddingManager:HandleStartAuction()")
    if self.auctionInProgress then
        LOG:Debug("Received new auction from %s while auction is in progress", sender)
        return
    end
    self.auctionInfo = data
    self.auctioneer = sender
    self.auctionInProgress = true
    PlayStartSound()
    CLM.GUI.BiddingManager:StartAuction(self:GetAutoOpen(), self.auctionInfo)
    LOG:Message(CLM.L["Auction of "] .. self.auctionInfo:ItemLink())
end

function BiddingManager:HandleStopAuction(_, sender)
    LOG:Trace("BiddingManager:HandleStopAuction()")
    if not self.auctionInProgress then
        LOG:Debug("Received auction stop from %s while no auctions are in progress", sender)
        return
    end
    self.auctionInProgress = false
    self:ClearAuctionInfo()
    PlayEndSound()
    CLM.GUI.BiddingManager:EndAuction()
    LOG:Message(CLM.L["Auction finished"])
end

function BiddingManager:HandleAntiSnipe(_, sender)
    LOG:Trace("BiddingManager:HandleAntiSnipe()")
    if not self.auctionInProgress then
        LOG:Debug("Received antisnipe from %s while no auctions are in progress", sender)
        return
    end
    CLM.GUI.BiddingManager:AntiSnipe()
end

function BiddingManager:HandleAcceptBid(_, sender)
    LOG:Trace("BiddingManager:HandleAcceptBid()")
    if not self.auctionInProgress then
        LOG:Debug("Received accept bid from %s while no auctions are in progress", sender)
        return
    end
    if self.guiBid then
        local value =  self.lastBid or CLM.L["cancel"]
        CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_BID_ACCEPTED, { value = value })
        LOG:Message(CLM.L["Your bid (%s) was |cff00cc00accepted|r"], value)
        self.guiBid = false
    end
end

function BiddingManager:HandleDenyBid(data, sender)
    LOG:Trace("BiddingManager:HandleDenyBid()")
    if not self.auctionInProgress then
        LOG:Debug("Received deny bid from %s while no auctions are in progress", sender)
        return
    end
    if self.guiBid then
        local value = self.lastBid or CLM.L["cancel"]
        CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_BID_DENIED, { value = value, reason = CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or CLM.L["Unknown"] })
        LOG:Message(CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"], value, CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or CLM.L["Unknown"])
        self.guiBid = false
    end
end

function BiddingManager:HandleDistributeBid(data, sender)
    LOG:Trace("BiddingManager:HandleDistributeBid()")
    if not self.auctionInProgress then
        LOG:Debug("Received distribute bid from %s while no auctions are in progress", sender)
        return
    end
    if self:GetAutoUpdateBidValue() then
        local value = (tonumber(data:Value()) or 0) + self.auctionInfo:Increment()
        CLM.GUI.BiddingManager:UpdateCurrentBidValue(value)
    end
end

CONSTANTS.BIDDING_COMM = {
    TYPE = {
        SUBMIT_BID  = 1,
        CANCEL_BID  = 2,
        NOTIFY_PASS = 3,
        NOTIFY_HIDE = 4,
        NOTIFY_CANTUSE = 5
    },
    TYPES = UTILS.Set({
        1, -- SUBMIT BID
        2, -- CANCEL BID
        3, -- NOTIFY_PASS
        4, -- NOTIFY_HIDE
        5  -- NOTIFY_CANTUSE
    })
}

CONSTANTS.BID_TYPE = {
    MAIN_SPEC = 1,
    OFF_SPEC = 2,
    -- PASS = 3,
    -- CANCEL = 4,
    [CONSTANTS.SLOT_VALUE_TIER.BASE]    = CONSTANTS.SLOT_VALUE_TIER.BASE,
    [CONSTANTS.SLOT_VALUE_TIER.SMALL]   = CONSTANTS.SLOT_VALUE_TIER.SMALL,
    [CONSTANTS.SLOT_VALUE_TIER.MEDIUM]  = CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
    [CONSTANTS.SLOT_VALUE_TIER.LARGE]   = CONSTANTS.SLOT_VALUE_TIER.LARGE,
    [CONSTANTS.SLOT_VALUE_TIER.MAX]     = CONSTANTS.SLOT_VALUE_TIER.MAX
}

CONSTANTS.BID_TYPES = UTILS.Set(CONSTANTS.BID_TYPE)

CLM.MODULES.BiddingManager = BiddingManager
