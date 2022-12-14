-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable = setmetatable

local AuctionitemUserResponse = CLM.MODELS.AuctionitemUserResponse

local assertTypeof = UTILS.assertTypeof

local AuctionItem = {} -- AuctionItem
AuctionItem.__index = AuctionItem

local emptyItem = CreateFromMixins(ItemMixin)


local scanTooltip = CreateFrame("GameTooltip", "CLMAuctionItemScanTooltip", UIParent, "GameTooltipTemplate")

local function CheckUsability(self)
    scanTooltip:SetScript('OnTooltipSetItem', (function(s)
        local tooltipName = s:GetName()
        for i = 1, s:NumLines() do
            local l = _G[tooltipName..'TextLeft'..i]
            local r = _G[tooltipName..'TextRight'..i]
            if UTILS.IsTooltipTextRed(l) or UTILS.IsTooltipTextRed(r) then
                self.canUse = false
                break
            end
        end
        s:Hide()
        s:SetScript('OnTooltipSetItem', (function(s) end))
    end))

    if not self.item:IsItemEmpty() then
        scanTooltip:SetHyperlink(self.item:GetItemLink())
    end
end

function AuctionItem:New(item)
    local o = {}
    setmetatable(o, self)

    o.item = item or emptyItem
    o.userResponses = {}
    o.values = {}
    o.awardEntryId = nil
    o.bid = nil
    o.canUse = true
    o.highestBid = -math.mininteger

    CheckUsability(o)

    return o
end

function AuctionItem:SetResponse(username, response)
    assertTypeof(response, AuctionitemUserResponse)
    self.userResponses[username] = response

    if response:Type() == CLM.CONSTANTS.BID_TYPE.MAIN_SPEC then
        if response:Value() > self.highestBid then
            self.highestBid = response:Value()
        end
    end
end

function AuctionItem:GetAllResponses()
    return self.userResponses
end

function AuctionItem:GetResponse(username)
    return self.userResponses[username]
end

function AuctionItem:ClearResponses()
    self.userResponses = {}
end

function AuctionItem:SetAwardId(entryId)
    self.awardEntryId = entryId
end

function AuctionItem:LoadValues(roster)
    self.values = UTILS.ShallowCopy(roster:GetItemValues(self.item:GetItemID()))
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

CLM.MODELS.AuctionItem = AuctionItem