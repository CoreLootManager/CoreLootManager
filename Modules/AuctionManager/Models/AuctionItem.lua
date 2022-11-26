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

    return o
end

function AuctionItem:SetResponse(username, response)
    assertTypeof(response, AuctionitemUserResponse)
    self.userResponses[username] = response
end

function AuctionItem:GetAllResponses()
    return self.userResponses
end

function AuctionItem:SetAwardId(entryId)
    self.awardEntryId = entryId
end

function AuctionItem:LoadValues(roster)
    self.values = UTILS.ShallowCopy(roster:GetItemValues(self.item:GetItemID()))
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

CLM.MODELS.AuctionItem = AuctionItem