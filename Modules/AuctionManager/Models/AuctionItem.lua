-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable = setmetatable

local AuctionitemUserResponse = CLM.MODELS.AuctionitemUserResponse

local assertTypeOf = UTILS.assertTypeOf

local AuctionItem = {} -- AuctionItem
AuctionItem.__index = AuctionItem

function AuctionItem:New(id)
    local o = {}
    setmetatable(o, self)

    o.id = id
    o.userResponses = {}
    o.awardEntryId = nil

    return o
end

function AuctionItem:SetResponse(username, response)
    assertTypeOf(response, AuctionitemUserResponse)
    self.userResponses[username] = response
end

function AuctionItem:GetAllResponses()
    return self.userResponses
end

function AuctionItem:SetAwardId(entryId)
    self.awardEntryId = entryId
end




CLM.MODELS.AuctionItem = AuctionItem