-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local assertTypeof = UTILS.assertTypeof

local AuctionItem = {} -- AuctionItem
AuctionItem.__index = AuctionItem

local emptyItem = CreateFromMixins(ItemMixin)

local scanTooltip = CreateFrame("GameTooltip", "CLMAuctionItemScanTooltip", UIParent, "GameTooltipTemplate")
local scanItem

local function usabilityScanner(tooltip)
    if tooltip ~= scanTooltip then return end
    if not scanItem then return end
    local tooltipName = tooltip:GetName()
    for i = 1, tooltip:NumLines() do
        local l = _G[tooltipName..'TextLeft'..i]
        local r = _G[tooltipName..'TextRight'..i]
        if UTILS.IsTooltipTextRed(l) or UTILS.IsTooltipTextRed(r) then
            scanItem.canUse = false
            break
        end
    end
    tooltip:Hide()
    scanItem = nil
end

if CLM.WoW10 then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, usabilityScanner)
else
    scanTooltip:SetScript('OnTooltipSetItem', usabilityScanner)
end

local function CheckUsability(self)
    if not self.item:IsItemEmpty() then
        scanItem = self
        scanTooltip:SetHyperlink(self.item:GetItemLink())
    end
end

function AuctionItem:New(item)
    local o = {}
    setmetatable(o, self)

    o.item = item or emptyItem
    o.canUse = true
    o.values = {}
    o.total = 1
    o:Clear()

    CheckUsability(o)

    return o
end

function AuctionItem:SetResponse(username, response, doNotRoll)
    assertTypeof(response, CLM.MODELS.UserResponse)
    self.userResponses[username] = response

    self.hasValidBids = nil -- invalidate valid bid cache

    local newHighestBid = false
    if CLM.CONSTANTS.BID_TYPE_REMOVING_BIDS[response:Type()] then
        -- Force rescan for highest bid
        self.highestBid = -math.huge
        for _,subResponse in pairs(self.userResponses) do
            if not CLM.CONSTANTS.BID_TYPE_NOT_AFFECTING_HIGHEST_BID[subResponse:Type()] then
                if subResponse:Value() > self.highestBid then
                    self.highestBid = subResponse:Value()
                end
            end
        end
    elseif not CLM.CONSTANTS.BID_TYPE_NOT_AFFECTING_HIGHEST_BID[response:Type()] then
        if response:Value() > self.highestBid then
            self.highestBid = response:Value()
            newHighestBid = true
        end
    end
    if doNotRoll then
        self.userRolls[username] = response:Roll() -- store current roll just in case
    else
        if not self.userRolls[username] then
            local roll
            repeat
                roll = math.random(1,100)
            until (self.rollValues[roll] == nil)
            self.userRolls[username] = roll
            self.rollValues[roll] = true
        end
        response:SetRoll(self.userRolls[username])
    end
    return newHighestBid
end

function AuctionItem:GetTopBids(cutoff, type)
    cutoff = cutoff or math.huge
    type = CLM.CONSTANTS.BID_TYPES[type] and type or nil
    local max = {name = "", bid = 0}
    for name,response in pairs(self.userResponses) do
        if (response:Type() == type) or (type == nil) then
            local bid = response:Value()
            if bid > max.bid and bid <= cutoff then
                max.bid = bid
                max.name = name
            end
        end
    end
    local second = {name = "", bid = 0}
    for name,response in pairs(self.userResponses) do
        local bid = response:Value()
        if (bid > second.bid) and (bid <= max.bid) and (name ~= max.name) and ((type == nil) or (response:Type() == type)) then
            second.bid = bid
            second.name = name
        end
    end
    return max, second
end

function AuctionItem:HasValidBids()
    if self.hasValidBids == nil then
        self.hasValidBids = false
        for _, response in pairs(self.userResponses) do
            if not CLM.CONSTANTS.BID_TYPE_REMOVING_BIDS[response:Type()] then
                self.hasValidBids = true
                break
            end
        end
    end

    return self.hasValidBids
end

function AuctionItem:GetAllResponses()
    return self.userResponses
end

function AuctionItem:GetResponse(username)
    return self.userResponses[username]
end

function AuctionItem:Clear()
    self.userResponses = {}
    self.userRolls = {}
    self.rollValues = {}
    self.bid = nil
    -- self.canUse = true
    self.highestBid = -math.huge
end

function AuctionItem:LoadValues(roster)
    self.values = UTILS.ShallowCopy(roster:GetItemValuesFromItemLink(self.item:GetItemLink()))
end

function AuctionItem:SetValues(values)
    if type(values) ~= 'table' then return end
    for key,_ in pairs(CLM.CONSTANTS.SLOT_VALUE_TIERS) do
        local value = tonumber(values[key])
        if value then
            self.values[key] = value
        end
    end
end

function AuctionItem:SpoofLinkPayload(extra)
    if not (CLM.WoW10 or CLM.WoWCata) then return end
    if type(extra) ~= 'string' then return end
    local link = self.item:GetItemLink()
    if type(link) ~= 'string' then
        LOG:Warning("ItemLink for %s not found while updating payload.", self.item:GetItemID())
        return
    end
    local original = link
    self.item.itemLink = UTILS.SpoofLink(link, extra)
    LOG:Debug("Spoofed %s into %s", original, self.item.itemLink)
end

function AuctionItem:SetTotal(total)
    total = tonumber(total) or 1
    self.total = total
end

function AuctionItem:GetValues()
    return self.values
end

function AuctionItem:SetNote(note)
    self.note = note
end

function AuctionItem:GetNote()
    return self.note or ""
end

function AuctionItem:GetItemID()
    return self.item:GetItemID()
end

function AuctionItem:GetItemLink()
    return self.item:GetItemLink()
end

function AuctionItem:GetExtraPayload()
    if not self.extraPayload then
        _, self.extraPayload = UTILS.GetItemIdFromLink(self.item:GetItemLink())
    end
    return self.extraPayload
end

function AuctionItem:GetCanUse()
    return self.canUse
end

function AuctionItem:GetHighestBid()
    return self.highestBid
end

function AuctionItem:IsValueAccepted(value)
    if not self.acceptedValues then
        self.acceptedValues = UTILS.Set(self.values)
    end
    return self.acceptedValues[value]
end

function AuctionItem:SetBid(bid)
    self.bid = bid
end

function AuctionItem:GetBid()
    return self.bid
end

function AuctionItem:SetBidStatus(status)
    self.bidStatus = status
end

function AuctionItem:BidAccepted()
    return (self.bidStatus == true)
end

function AuctionItem:BidDenied()
    return (self.bidStatus == false)
end

function AuctionItem:IncrementTotal()
    self.total = self.total + 1
end

function AuctionItem:DecrementTotal()
    self.total = self.total - 1
    if self.total < 0 then
        self.total = 0
    end
end

function AuctionItem:GetTotal()
    return self.total
end

CLM.MODELS.AuctionItem = AuctionItem