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

function AuctionItem:New(item)
    local o = {}
    setmetatable(o, self)

    o.item = item or emptyItem
    o.userResponses = {}
    o.values = {}
    o.awardEntryId = nil
    o.bid = nil

    return o
end

function AuctionItem:SetResponse(username, response)
    assertTypeof(response, AuctionitemUserResponse)
    self.userResponses[username] = response
end

function AuctionItem:GetAllResponses()
    return self.userResponses
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

function AuctionItem:SetBid(bid)
    self.bid = bid
end

function AuctionItem:GetBid()
    return self.bid
end

function AuctionItem:GetItemID()
    return self.item:GetItemID()
end

function AuctionItem:GetItemLink()
    return self.item:GetItemLink()
end

CLM.MODELS.AuctionItem = AuctionItem