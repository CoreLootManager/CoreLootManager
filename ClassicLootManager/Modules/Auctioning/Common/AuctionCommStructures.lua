-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

-------------------------------
--- AuctionCommStartAuction ---
-------------------------------
local AuctionCommStartAuction = {}
AuctionCommStartAuction.__index = AuctionCommStartAuction

-- Empty or Copy constructor
function AuctionCommStartAuction:New(object)
    local o = (type(object) == "table") and object or {}
    setmetatable(o, self)

    return o
end

local getExtraPayload
if CLM.WoW10 then
    getExtraPayload = function(auctionItem) return auctionItem:GetExtraPayload() end
else
    getExtraPayload = function() return nil end
end

local function SerializeItems(items)
    local serialized = {}
    for id, auctionItem in pairs(items) do
        serialized[id] = {
            values = auctionItem:GetValues(),
            note = auctionItem:GetNote(),
            extra = getExtraPayload(auctionItem),
            total = auctionItem:GetTotal()
        }
    end
    return serialized
end

local function GetConfig(auction)
    local c = {
        r = auction:GetRoster():UID(),
        t = auction:GetType(),
        m = auction:GetMode(),
        o = auction:GetUseOS(),
        n = auction:GetNamedButtonsMode(),
        i = auction:GetIncrement(),
        f = {}
    }

    for _,tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
        c.f[tier] = auction:GetFieldName(tier)
    end

    return c
end

function AuctionCommStartAuction:NewFromAuctionInfo(auction)
    local o = {}
    setmetatable(o, self)

    o.e = auction:GetTime()
    o.d = auction:GetEndTime()
    o.s = auction:GetAntiSnipe()
    o.c = GetConfig(auction)

    o.i = SerializeItems(auction:GetItems())

    return o
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

function AuctionCommStartAuction:Items()
    return self.i or {}
end

function AuctionCommStartAuction:GetRosterUID()
    return self.c.r or 0
end

function AuctionCommStartAuction:GetType()
    return self.c.t or CONSTANTS.AUCTION_TYPE.SEALED
end

function AuctionCommStartAuction:GetMode()
    return self.c.m or CONSTANTS.ITEM_VALUE_MODE.ASCENDING
end

function AuctionCommStartAuction:GetUseOS()
    return self.c.o or true
end

function AuctionCommStartAuction:GetNamedButtonsMode()
    return self.c.n or false
end

function AuctionCommStartAuction:GetIncrement()
    return self.c.i or 1
end

function AuctionCommStartAuction:GetFieldNames()
    return self.c.f or {}
end

function AuctionCommStartAuction:Version()
    return (self.c ~= nil) and 2 or 1
end

--------------------------
--- AuctionCommDenyBid ---
--------------------------
local AuctionCommDenyBid = {}
function AuctionCommDenyBid:New(itemIdOrObject, reason)
    local isCopyConstructor = (type(itemIdOrObject) == "table")
    local o = isCopyConstructor and itemIdOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.i = itemIdOrObject
    o.r = reason

    return o
end

function AuctionCommDenyBid:ItemId()
    return self.i or 0
end

function AuctionCommDenyBid:Reason()
    return self.r or 0
end

--------------------------------
--- AuctionCommDistributeBid ---
--------------------------------
local AuctionCommDistributeBid = {}
function AuctionCommDistributeBid:New(object)
    local isCopyConstructor = (type(object) == "table")

    local o = isCopyConstructor and object or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.d = object

    return o
end

function AuctionCommDistributeBid:NewFromAggregatedData(data)
    local o = {}
    setmetatable(o, self)

    o.d = data

    return o
end

function AuctionCommDistributeBid:Data()
    return self.d or {}
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