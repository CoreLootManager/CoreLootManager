-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local type, setmetatable = type, setmetatable
local tonumber = tonumber

local AuctionCommStartAuction = {}
AuctionCommStartAuction.__index = AuctionCommStartAuction

-- Empty or Copy constructor
function AuctionCommStartAuction:New(object)
    local o = (type(object) == "table") and object or {}
    setmetatable(o, self)

    return o
end

local function SerializeItems(items)
    local serialized = {}
    for id, auctionItem in pairs(items) do
        serialized[id] = {
            values = auctionItem:GetValues(),
            note = auctionItem:GetNote()
        }
    end
    return serialized
end

function AuctionCommStartAuction:NewFromAuctionInfo(auction)
    local o = {}
    setmetatable(o, self)

    -- Auction General settings
    o.t = auction:GetType()
    o.m = auction:GetMode()
    o.d = auction:GetUseOS()
    o.n = auction:GetNamedButtonsMode()
    o.c = auction:GetIncrement()
    o.r = auction:GetRosterUID()
    o.e = auction:GetTime()
    o.d = auction:GetEndTime()
    o.s = auction:GetAntiSnipe()
    -- Items
    o.i = SerializeItems(auction:GetItems())

    return o
end

function AuctionCommStartAuction:Type()
    return self.t or 0
end

function AuctionCommStartAuction:Mode()
    return self.m or 0
end

function AuctionCommStartAuction:Values()
    return self.v or {}
end

function AuctionCommStartAuction:ItemLink()
    return self.l or ""
end

function AuctionCommStartAuction:Time()
    return tonumber(self.e) or 0
end

function AuctionCommStartAuction:EndTime()
    return tonumber(self.d) or 0
end

function AuctionCommStartAuction:AntiSnipe()
    return tonumber(self.s) or 0
end

function AuctionCommStartAuction:Increment()
    return tonumber(self.c) or 1
end

function AuctionCommStartAuction:UseOS()
    return self.b and true or false
end

function AuctionCommStartAuction:RosterUid()
    return self.r or 0
end

local AuctionCommDenyBid = {}
function AuctionCommDenyBid:New(valueOrObject)
    local isCopyConstructor = (type(valueOrObject) == "table")
    local o = isCopyConstructor and valueOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.d = valueOrObject

    return o
end

function AuctionCommDenyBid:Reason()
    return self.d or 0
end

local AuctionCommDistributeBid = {}
function AuctionCommDistributeBid:New(nameOrObject, value)
    local isCopyConstructor = (type(nameOrObject) == "table")

    local o = isCopyConstructor and nameOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.n = nameOrObject
    o.d = value

    return o
end

function AuctionCommDistributeBid:Name()
    return self.n
end

function AuctionCommDistributeBid:Value()
    return self.d
end

local AuctionCommStructure = {}
function AuctionCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.AUCTION_COMM.TYPE.START_AUCTION then
            o.d = AuctionCommStartAuction:New(o.d)
        elseif o.t == CONSTANTS.AUCTION_COMM.TYPE.DENY_BID then
            o.d = AuctionCommDenyBid:New(o.d)
        elseif o.t == CONSTANTS.AUCTION_COMM.TYPE.DISTRIBUTE_BID then
            o.d = AuctionCommDistributeBid:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function AuctionCommStructure:Type()
    return self.t or 0
end

function AuctionCommStructure:Data()
    return self.d
end

CLM.MODELS.AuctionCommStructure = AuctionCommStructure
CLM.MODELS.AuctionCommStartAuction = AuctionCommStartAuction
CLM.MODELS.AuctionCommDenyBid = AuctionCommDenyBid
CLM.MODELS.AuctionCommDistributeBid = AuctionCommDistributeBid