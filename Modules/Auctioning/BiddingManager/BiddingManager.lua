-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local sformat = string.format

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
    local invslots = INVTYPE_to_INVSLOT_map[CLM.IndirectMap.slot[itemId] or itemEquipLoc] or {}
    local items =  {}
    for _, invslot in ipairs(invslots) do
        local inventoryItemId = GetInventoryItemID("player", invslot)
        if inventoryItemId and inventoryItemId > 0 then
            items[#items+1] = inventoryItemId
        end
    end
    return items
end

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:Personal('bidding', {
        autoOpen = true,
        autoUpdateBidValue = false
    })
end

local function SetAutoOpen(self, value)
    self.db.autoOpen = value and true or false
end

local function GetAutoOpen(self)
    return self.db.autoOpen
end

local function SetAutoUpdateBidValue(self, value)
    self.db.autoUpdateBidValue = value and true or false
end

local function GetAutoUpdateBidValue(self)
    return self.db.autoUpdateBidValue
end

local function CreateOptions(self)
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
            set = function(i, v) SetAutoOpen(self, v) end,
            get = function(i) return GetAutoOpen(self) end,
            width = "full",
            order = 71
          },
          bidding_auto_update = {
            name = CLM.L["Enable auto-update bid values"],
            desc = CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."],
            type = "toggle",
            set = function(i, v) SetAutoUpdateBidValue(self, v) end,
            get = function(i) return GetAutoUpdateBidValue(self) end,
            width = "full",
            order = 72
          }
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

local BiddingManager = {}
function BiddingManager:Initialize()
    LOG:Trace("BiddingManager:Initialize()")

    InitializeDB(self)

    CreateOptions(self)

    CLM.MODULES.Comms:Register(CLM.COMM_CHANNEL.AUCTION,
    (function(rawMessage, distribution, sender)
        local message = CLM.MODELS.AuctionCommStructure:New(rawMessage)
        if CLM.CONSTANTS.AUCTION_COMM.TYPES[message:Type()] == nil then return end
        self:HandleIncomingMessage(message, distribution, sender)
    end),
    (function(name)
        return CLM.MODULES.AuctionManager:IsAuctioneer(name, true) -- relaxed for cross-guild bidding
    end),
    true)

    self.handlers = {
        [CONSTANTS.AUCTION_COMM.TYPE.START_AUCTION]     = "HandleStartAuction",
        [CONSTANTS.AUCTION_COMM.TYPE.STOP_AUCTION]      = "HandleStopAuction",
        [CONSTANTS.AUCTION_COMM.TYPE.ANTISNIPE]         = "HandleAntiSnipe",
        [CONSTANTS.AUCTION_COMM.TYPE.ACCEPT_BID]        = "HandleAcceptBid",
        [CONSTANTS.AUCTION_COMM.TYPE.DENY_BID]          = "HandleDenyBid",
        [CONSTANTS.AUCTION_COMM.TYPE.DISTRIBUTE_BID]    = "HandleDistributeBid"
    }
end

function BiddingManager:GetLastBidValue()
    return self.lastBid
end

function BiddingManager:Bid(itemId, value, type)
    LOG:Trace("BiddingManager:Bid()")
    if not self:IsAuctionInProgress() then
        LOG:Debug("BiddingManager:Bid(): No auction in progress")
        return
    end

    value = tonumber(value) or 0
    type = CONSTANTS.BID_TYPES[type] and type or CONSTANTS.BID_TYPE.MAIN_SPEC

    local item = self.auction:GetItem(itemId)
    
    if not item then
        LOG:Debug("BiddingManager:Bid(): Invalid item")
        return
    end

    item:SetBid(CLM.MODELS.UserResponse:New(value, type, {}))

    self.guiBid = true

    local message = CLM.MODELS.BiddingCommStructure:New(
        CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID,
        CLM.MODELS.BiddingCommSubmitBid:New(value, type, itemId, GetUpgradedItems(itemId))
    )
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:CancelBid(itemId)
    LOG:Trace("BiddingManager:CancelBid()")
    -- if not self.auctionInProgress then return end
    -- self.lastBid = nil
    -- self.guiBid = true
    -- local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.CANCEL_BID, {})
    -- CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
    self:Bid(itemId, 0, CONSTANTS.BID_TYPE.CANCEL)
end

function BiddingManager:Pass(itemId)
    LOG:Trace("BiddingManager:NotifyPass()")
    -- if not self.auctionInProgress then return end
    -- self.lastBid = CLM.L["PASS"]
    -- self.guiBid = true
    -- local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_PASS, {})
    -- CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
    self:Bid(itemId, 0, CONSTANTS.BID_TYPE.PASS)
end

function BiddingManager:NotifyCantUse()
    LOG:Trace("BiddingManager:NotifyCantUse()")
    if not self:IsAuctionInProgress() then return end
    local message = CLM.MODELS.BiddingCommStructure:New(CONSTANTS.BIDDING_COMM.TYPE.NOTIFY_CANTUSE, {})
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

-- function BiddingManager:ClearAuctionInfo()
--     self.auctionInfo = nil
--     self.auctioneer = nil
--     self.lastBid = nil
--     self.guiBid = false
-- end

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

local function DefaultCallback(_)
    -- AuctionManager:RefreshGUI()
end

local function AddItemInternal(auctionInfo, item, note, values, callbackFn)
    callbackFn = callbackFn or DefaultCallback

    local auctionItem = auctionInfo:AddItem(item)
    if auctionItem then
        auctionItem:SetNote(note)
        auctionItem:SetValues(values)
    end
    callbackFn(auctionItem)
end

local function AddItemToAuction(auctionInfo, item, note, values, callbackFn)
    if not item:IsItemEmpty() then
        if item:IsItemDataCached() then
            AddItemInternal(auctionInfo, item, note, values, callbackFn)
        else
            item:ContinueOnItemLoad(function() AddItemInternal(auctionInfo, item, note, values, callbackFn) end)
        end
    end
end

local function StartAuction(self, data)
    local auction = CLM.MODELS.AuctionInfo:New()
    auction:UpdateRaid(CLM.MODULES.RaidManager:GetRaid())

    for id, info in pairs(data:Items()) do
        AddItemToAuction(auction, Item:CreateFromItemID(id), info.note, info.values)
    end

    auction:SetTime(data:Time())
    auction:SetAntiSnipe(data:AntiSnipe())
    auction:Start(data:EndTime())

    self.auction = auction
end

local function EndAuction(self)
    self.auction:End()
end

function BiddingManager:IsAuctionInProgress()
    return self.auction and self.auction:IsInProgress()
end

function BiddingManager:HandleStartAuction(data, sender)
    LOG:Trace("BiddingManager:HandleStartAuction()")
    if self:IsAuctionInProgress() then
        LOG:Debug("Received new auction from %s while auction is in progress", sender)
        return
    end
    self.auctioneer = sender
    if not CLM.MODULES.RaidManager:IsInRaid() then
        LOG:Message("Received new auction while not in raid.")
        return
    end
    StartAuction(self, CLM.MODELS.AuctionCommStartAuction:New(data))
    PlayStartSound()

    local _, item = next(self.auction:GetItems())
    CLM.GUI.BiddingManager:SetVisibleAuctionItem(item)
    if GetAutoOpen(self) then
        CLM.GUI.BiddingManager:Show()
    end
    local numItems = self.auction:GetItemCount()
    local auctionMessage
    if numItems > 1 then
        auctionMessage = sformat(CLM.L["Auction of %s items."], numItems)
    else
        auctionMessage = sformat(CLM.L["Auction of %s"], item:GetItemLink())
    end
    LOG:Message(auctionMessage)
end

function BiddingManager:HandleStopAuction(_, sender)
    LOG:Trace("BiddingManager:HandleStopAuction()")
    if not self:IsAuctionInProgress() then
        LOG:Debug("Received auction stop from %s while no auctions are in progress", sender)
        return
    end
    EndAuction(self)
    PlayEndSound()
    -- TODO Auction Finish
    -- CLM.GUI.BiddingManager:EndAuction()
    -- LOG:Message(CLM.L["Auction finished"])
end

function BiddingManager:HandleAntiSnipe(_, sender)
    LOG:Trace("BiddingManager:HandleAntiSnipe()")
    -- if not self.auctionInProgress then
    --     LOG:Debug("Received antisnipe from %s while no auctions are in progress", sender)
    --     return
    -- end
    -- CLM.GUI.BiddingManager:AntiSnipe()
end

function BiddingManager:HandleAcceptBid(itemId, sender)
    LOG:Trace("BiddingManager:HandleAcceptBid()")
    if not self:IsAuctionInProgress() then
        LOG:Debug("Received accept bid from %s while no auctions are in progress", sender)
        return
    end
    local item = self.auction:GetItem(itemId)
    if not item then return end
    local bid = item:GetBid()
    if not bid then return end
    item:SetBidStatus(true)
    CLM.GUI.BiddingManager:Refresh()
    LOG:Message(CLM.L["Your bid (%s) was |cff00cc00accepted|r"], bid:Value()) -- TODO
    -- if self.guiBid then
    --     local value =  self.lastBid or CLM.L["cancel"]
    --     CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_BID_ACCEPTED, { value = value })
    --     LOG:Message(CLM.L["Your bid (%s) was |cff00cc00accepted|r"], value)
    --     self.guiBid = false
    -- end
end

function BiddingManager:HandleDenyBid(data, sender)
    LOG:Trace("BiddingManager:HandleDenyBid()")
    if not self:IsAuctionInProgress() then
        LOG:Debug("Received deny bid from %s while no auctions are in progress", sender)
        return
    end
    local item = self.auction:GetItem(data:ItemId())
    if not item then return end
    local bid = item:GetBid()
    if not bid then return end
    item:SetBidStatus(false)
    CLM.GUI.BiddingManager:Refresh()
    LOG:Message(CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"], bid:Value(), CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or CLM.L["Unknown"]) -- TODO
    -- if self.guiBid then
    --     local value = self.lastBid or CLM.L["cancel"]
    --     CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_BID_DENIED, { value = value, reason = CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or CLM.L["Unknown"] })
    --     LOG:Message(CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"], value, CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or CLM.L["Unknown"])
    --     self.guiBid = false
    -- end
end

function BiddingManager:HandleDistributeBid(data, sender)
    LOG:Trace("BiddingManager:HandleDistributeBid()")
    -- if not self.auctionInProgress then
    --     LOG:Debug("Received distribute bid from %s while no auctions are in progress", sender)
    --     return
    -- end
    -- local bid = data:Value()
    -- if type(bid) == "table" then
    --     bid = CLM.MODELS.BiddingCommSubmitBid:New(bid)
    -- else -- old comms
    --     bid = CLM.MODELS.BiddingCommSubmitBid:New(tonumber(bid) or 0, CONSTANTS.BID_TYPE.PASS, {})
    -- end

    -- self.bids[data:Name()] = bid
    -- -- print("<<<RB[", data:Name(), bid:Value(), bid:Type(), "]")
    -- if self:GetAutoUpdateBidValue() and (bid:Type() == (CONSTANTS.BID_TYPE.MAIN_SPEC)) then
    --     CLM.GUI.BiddingManager:UpdateCurrentBidValue((tonumber(bid:Value()) or 0) + self.auctionInfo:Increment())
    -- else
    --     CLM.GUI.BiddingManager:RefreshBidList()
    -- end
end

function BiddingManager:GetAuctionInfo()
    return self.auction
end

CONSTANTS.BIDDING_COMM = {
    TYPE = {
        SUBMIT_BID  = 1,
        NOTIFY_CANTUSE = 2
    },
    TYPES = UTILS.Set({
        1, -- SUBMIT BID
        2  -- NOTIFY_CANTUSE
    })
}

CONSTANTS.BID_TYPE = {
    MAIN_SPEC = 1,
    OFF_SPEC = 2,
    PASS = 3,
    CANCEL = 4,
    [CONSTANTS.SLOT_VALUE_TIER.BASE]    = CONSTANTS.SLOT_VALUE_TIER.BASE,
    [CONSTANTS.SLOT_VALUE_TIER.SMALL]   = CONSTANTS.SLOT_VALUE_TIER.SMALL,
    [CONSTANTS.SLOT_VALUE_TIER.MEDIUM]  = CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
    [CONSTANTS.SLOT_VALUE_TIER.LARGE]   = CONSTANTS.SLOT_VALUE_TIER.LARGE,
    [CONSTANTS.SLOT_VALUE_TIER.MAX]     = CONSTANTS.SLOT_VALUE_TIER.MAX
}

CONSTANTS.BID_TYPE_HIDDEN = UTILS.Set({
    CONSTANTS.BID_TYPE.PASS,
    CONSTANTS.BID_TYPE.CANCEL
})

CONSTANTS.BID_TYPE_ORDER_DSC = {
    [CONSTANTS.SLOT_VALUE_TIER.MAX]     = 104,
    [CONSTANTS.SLOT_VALUE_TIER.LARGE]   = 103,
    [CONSTANTS.SLOT_VALUE_TIER.MEDIUM]  = 102,
    [CONSTANTS.SLOT_VALUE_TIER.SMALL]   = 101,
    [CONSTANTS.SLOT_VALUE_TIER.BASE]    = 100,
    MAIN_SPEC                           = 4,
    OFF_SPEC                            = 3,
    PASS                                = 2,
    CANCEL                              = 1,
}

CONSTANTS.BID_TYPES = UTILS.Set(CONSTANTS.BID_TYPE)

CLM.MODULES.BiddingManager = BiddingManager
