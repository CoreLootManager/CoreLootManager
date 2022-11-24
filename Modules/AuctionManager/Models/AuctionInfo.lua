-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable = setmetatable

local AuctionItem = CLM.MODELS.AuctionItem
local assertTypeOf = UTILS.assertTypeOf

local AuctionInfo = {} -- AuctionInfo
AuctionInfo.__index = AuctionInfo

local function assertIdle(self)
    if self.state ~= CONSTANTS.AUCTION_INFO.STATE.IDLE then
        error("Not allowed while auction is not IDLE.", 2)
    end
end

local function assertInProgress(self)
    if self.state ~= CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS then
        error("Not allowed while auction is not IN PROGRESS.", 2)
    end
end

function AuctionInfo:New(configuration)
    assertTypeOf(configuration, CLM.MODELS.RosterConfiguration)
    local o = {}
    setmetatable(o, self)

    o.configuration = configuration
    o.state = CONSTANTS.AUCTION_INFO.STATE.IDLE

    o.items = {}

    return o
end

local function AddItemInternal(self, id)
    if self.items[id] then
        LOG:Message("Item already in auction list.")
        return
    end
    self.items[id] = AuctionItem:New(id)
end

function AuctionInfo:AddItem(id)
    assertIdle(self)
    AddItemInternal(self, id)
end

function AuctionInfo:RemoveItem(id)
    assertIdle(self)
    self.items[id] = nil
end

function AuctionInfo:GetItem(id)
    return self.items[id] or AuctionItem:New()
end

function AuctionInfo:SetResponse(id, username, response)
    assertInProgress(self)
    local auctionItem = self.items[id]
    if not auctionItem then
        LOG:Warning("Received response to non existent item ")
    end
    auctionItem:SetResponse(username, response)
end

CONSTANTS.AUCTION_INFO = {
    STATE = {
        IDLE = 0,
        IN_PROGRESS = 1
    }
}

CLM.MODELS.AuctionInfo = AuctionInfo