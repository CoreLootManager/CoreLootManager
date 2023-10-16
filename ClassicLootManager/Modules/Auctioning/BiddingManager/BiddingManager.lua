-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

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
    ["INVTYPE_NON_EQUIP"]       = {INVSLOT_HEAD, INVSLOT_SHOULDER, INVSLOT_CHEST, INVSLOT_HAND, INVSLOT_LEGS, },
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

-- local function InitializeDB(self)
--     self.db = CLM.MODULES.Database:Personal('bidding', {

--     })
-- end


-- local function CreateOptions(self)
--     local options = {}
--     CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
-- end

local BiddingManager = {}
function BiddingManager:Initialize()
    LOG:Trace("BiddingManager:Initialize()")

    -- InitializeDB(self)

    -- CreateOptions(self)

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

    local message = CLM.MODELS.BiddingCommStructure:New(
        CONSTANTS.BIDDING_COMM.TYPE.SUBMIT_BID,
        CLM.MODELS.BiddingCommSubmitBid:New(value, type, itemId, GetUpgradedItems(itemId))
    )
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.BIDDING, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, self.auctioneer, CONSTANTS.COMMS.PRIORITY.ALERT)
end

function BiddingManager:CancelBid(itemId)
    LOG:Trace("BiddingManager:CancelBid()")
    self:Bid(itemId, 0, CONSTANTS.BID_TYPE.CANCEL)
end

function BiddingManager:Pass(itemId)
    LOG:Trace("BiddingManager:NotifyPass()")
    self:Bid(itemId, 0, CONSTANTS.BID_TYPE.PASS)
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
    if CLM.AF then
        PlaySoundFile("Interface\\AddOns\\ClassicLootManager\\Media\\Audio\\lifestock_auction.ogg", "MASTER")
    else
        if not CLM.GlobalConfigs:GetSounds() then return end
        PlaySound(12889)
    end
end
PlayEndSound = function()
    if CLM.AF then
        PlaySoundFile("Interface\\AddOns\\ClassicLootManager\\Media\\Audio\\lifestock_auction_sold.ogg", "MASTER")
    else
        if not CLM.GlobalConfigs:GetSounds() then return end
        PlaySound(12867)
    end
end

local function DefaultCallback(_)
    -- Update Bid Order for auto-move
    CLM.GUI.BiddingManager:BuildBidOrder()
    -- Refresh view
    CLM.GUI.BiddingManager:RefreshItemList()
end

local function AddItemInternal(auctionInfo, item, note, values, extra, total, callbackFn)
    callbackFn = callbackFn or DefaultCallback

    local auctionItem = auctionInfo:AddItem(item)
    if auctionItem then
        auctionItem:SetNote(note)
        auctionItem:SetValues(values)
        auctionItem:SetTotal(total)
        auctionItem:SpoofLinkPayload(extra)
    end
    callbackFn(auctionItem)
end

local function AddItemToAuction(auctionInfo, item, note, values, extra, total, callbackFn)
    if not item:IsItemEmpty() then
        if item:IsItemDataCached() then
            AddItemInternal(auctionInfo, item, note, values, extra, total, callbackFn)
        else
            item:ContinueOnItemLoad(function() AddItemInternal(auctionInfo, item, note, values, extra, total, callbackFn) end)
        end
    end
end

local function StartAuction(self, data)
    local auction
    local raid = CLM.MODULES.RaidManager:GetRaid()
    if raid then -- If we have raid in our cache that we are in, use it
        auction = CLM.MODELS.AuctionInfo:New()
        auction:UpdateRaid(raid)
    else -- Check if we have extended configuration available
        if data:Version() == 2 then
            -- Extended configuration came from channel
            auction = CLM.MODELS.AuctionInfo:NewShim(
                data:GetType(),
                data:GetMode(),
                data:GetUseOS(),
                data:GetNamedButtonsMode(),
                data:GetIncrement(),
                data:GetFieldNames()
            )
        else
            LOG:Message("Out of guild bidding requires newer version of CLM from Master Looter.")
            return false
        end
    end

    for id, info in pairs(data:Items()) do
        AddItemToAuction(auction, Item:CreateFromItemID(id), info.note, info.values, info.extra, info.total)
    end

    auction:SetPassiveMode()
    auction:SetTime(data:Time())
    auction:SetAntiSnipe(data:AntiSnipe())
    auction:Start(data:EndTime())

    self.auction = auction

    return true
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
    local success = StartAuction(self, CLM.MODELS.AuctionCommStartAuction:New(data))
    if not success then return end
    PlayStartSound()

    CLM.GUI.BiddingManager:StartAuction()
    local numItems = self.auction:GetItemCount()
    local auctionMessage
    if numItems > 1 then
        auctionMessage = string.format(CLM.L["Auction of %s items."], numItems)
    else
        local _, item = next(self.auction:GetItems())
        if item then
            auctionMessage = string.format(CLM.L["Auction of %s"], item:GetItemLink())
        end
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
    CLM.GUI.BiddingManager:EndAuction()
    CLM.GUI.BiddingManager:Hide()
    LOG:Message(CLM.L["Auction finished"])
end

function BiddingManager:HandleAntiSnipe(_, sender)
    LOG:Trace("BiddingManager:HandleAntiSnipe()")
    if not self:IsAuctionInProgress() then
        LOG:Debug("Received antisnipe from %s while no auctions are in progress", sender)
        return
    end
    CLM.GUI.BiddingManager:AntiSnipe()
end

local function stringifyBidInfo(auction, item, response)
    local responseTypeName = CONSTANTS.BID_TYPE_NAMES[response:Type()]
    if auction:GetNamedButtonsMode() then
        responseTypeName = responseTypeName or auction:GetFieldName(response:Type())
    else
        -- If its not named button mode but tier comes, display as MS
        responseTypeName = responseTypeName or CONSTANTS.BID_TYPE_NAMES[CONSTANTS.BID_TYPE.MAIN_SPEC]
    end
    local spacer, value, points = "", "", ""
    local short
    if CONSTANTS.BID_TYPE_HIDDEN[response:Type()] then
        short = response:Type() == CONSTANTS.BID_TYPE.CANCEL and CLM.L["Cancel"] or CLM.L["Pass"]
    else
        local roster = auction:GetRoster()
        points = (roster and roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP) and CLM.L["GP"] or CLM.L["DKP"]
        value = response:Value()
        spacer = " "

        short = value
    end

    return string.format("%s %s%s%s%s%s", item:GetItemLink(), responseTypeName, spacer, value, spacer, points), short
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
    local text, short = stringifyBidInfo(self.auction, item, bid)
    LOG:Message(CLM.L["Your bid (%s) was |cff00cc00accepted|r"], text)
    CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_BID_ACCEPTED, { value = short })
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
    local text, short = stringifyBidInfo(self.auction, item, bid)
    local reason = CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[data:Reason()] or CLM.L["Unknown"]
    LOG:Message(CLM.L["Your bid (%s) was denied: |cffcc0000%s|r"], text, reason)
    CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_BID_DENIED, { value = short, reason = reason })
end

function BiddingManager:HandleDistributeBid(data, sender)
    LOG:Trace("BiddingManager:HandleDistributeBid()")
    if not self:IsAuctionInProgress() then
        LOG:Debug("Received distribute bid from %s while no auctions are in progress", sender)
        return
    end
    local bids = data:Data()
    for itemId, playerData in pairs(bids) do
        local item = self.auction:GetItem(itemId)
        if item then
            for playerName, response in pairs(playerData) do
                local userResponse = CLM.MODELS.UserResponse:New(response)
                item:SetResponse(playerName, userResponse, true) -- to block rolling internally
            end
        end
    end
    CLM.GUI.BiddingManager:Refresh()
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

CONSTANTS.BID_TYPE_REMOVING_BIDS = UTILS.Set({
    CONSTANTS.BID_TYPE.PASS,
    CONSTANTS.BID_TYPE.CANCEL
})

CONSTANTS.BID_TYPE_NOT_AFFECTING_HIGHEST_BID = UTILS.Set({
    CONSTANTS.BID_TYPE.OFF_SPEC,
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

CONSTANTS.BID_TYPE_NAMES = {
    [CONSTANTS.BID_TYPE.MAIN_SPEC]    = CLM.L["MS"],
    [CONSTANTS.BID_TYPE.OFF_SPEC]     = CLM.L["OS"],
    [CONSTANTS.BID_TYPE.PASS]         = CLM.L["Pass"],
    [CONSTANTS.BID_TYPE.CANCEL]       = CLM.L["Cancel"]
}

CLM.MODULES.BiddingManager = BiddingManager
--@do-not-package@

local ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 -_=[];:<>,.?"
local isFakeAuctionInProgress
function BiddingManager:FakeAuction()
    if  isFakeAuctionInProgress then
        BiddingManager:HandleStopAuction()
        isFakeAuctionInProgress = false
        return
    end
    -- Store original send
    local _Send = CLM.MODULES.Comms.Send
    -- Fake send
    CLM.MODULES.Comms.Send = function(_, _, message, _, target, _)
        C_Timer.After(0, function()
            BiddingManager:HandleIncomingMessage(CLM.MODELS.AuctionCommStructure:New(message), _, target)
        end)
    end
    -- Build Message
    local fakeAuctionStart = CLM.MODELS.AuctionCommStartAuction:New()

    fakeAuctionStart.c = {
        r = 0,
        t = CONSTANTS.AUCTION_TYPE.SEALED,
        m = CONSTANTS.ITEM_VALUE_MODE.ASCENDING,
        o = (math.random(4,5) == 4) and true or false,
        n = (math.random(1,2) == 2) and true or false,
        i = 1,
        f = {

        }
    }
    for _, tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
        local fname = ""
        local fnameLen = math.random(1,16)
        for _=1,fnameLen do
            local char = math.random(1,75)
            fname = fname .. string.sub( ALPHABET, char, char)
        end
        fakeAuctionStart.c.f[tier] = fname
    end

    fakeAuctionStart.e = 300
    fakeAuctionStart.d = GetServerTime() + 300
    fakeAuctionStart.s = 30

    local nItems
    fakeAuctionStart.i, nItems = (function()
        local numItems = math.random(3, 7)
        local items = {}
        for _=1,numItems do
            local id
            local doBreak = false
            repeat
                id = math.random(10000,58000)
                if items[id] == nil and GetItemInfoInstant(id) then
                    doBreak = true
                    items[id] = {
                        values = {
                            [CONSTANTS.SLOT_VALUE_TIER.BASE] = math.random(0, 20),
                            [CONSTANTS.SLOT_VALUE_TIER.MAX] = math.random(0, 10000)
                        },
                        note = "item note for id " .. tostring(id)
                    }
                end
            until (doBreak)
        end
        return items, numItems
    end)()
    LOG:Message("Auction of " .. tostring(nItems) .. " items [FAKE]")
    local message = CLM.MODELS.AuctionCommStructure:New(
        CONSTANTS.AUCTION_COMM.TYPE.START_AUCTION,
        fakeAuctionStart
    )
    -- Send Message
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.AUCTION, message, CONSTANTS.COMMS.DISTRIBUTION.RAID)
    -- Restore
    CLM.MODULES.Comms.Send = _Send

    isFakeAuctionInProgress = true
end
--@end-do-not-package@