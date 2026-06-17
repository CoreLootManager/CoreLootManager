-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

-------------------------------
--- AuctionCommStartAuction ---
-------------------------------
---@class AuctionCommStartAuction
---@field e number auction time
---@field d number end time
---@field s number anti-snipe
---@field v number version
---@field c table config
---@field i table items
local AuctionCommStartAuction = {}
AuctionCommStartAuction.__index = AuctionCommStartAuction

-- Empty or Copy constructor
---@param object? table
---@return AuctionCommStartAuction
function AuctionCommStartAuction:New(object)
    local o = (type(object) == "table") and object or {}
    setmetatable(o, self)

    return o
end

local function getExtraPayload(auctionItem)
    return auctionItem:GetExtraPayload()
end

local function SerializeItems(items)
    local serialized = {}
    for UID, auctionItem in pairs(items) do
        serialized[UID] = {
            id = auctionItem:GetItemID(),
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

---@param auction AuctionInfo
---@return AuctionCommStartAuction
function AuctionCommStartAuction:NewFromAuctionInfo(auction)
    local o = {}
    setmetatable(o, self)

    o.e = auction:GetTime()
    o.d = auction:GetEndTime()
    o.s = auction:GetAntiSnipe()
    o.v = CONSTANTS.AUCTION_COMM.CURRENT_VERSION
    o.c = GetConfig(auction)

    o.i = SerializeItems(auction:GetItems())

    return o
end

---@return number
function AuctionCommStartAuction:Time()
    return tonumber(self.e) or 0
end

---@return number
function AuctionCommStartAuction:EndTime()
    return tonumber(self.d) or 0
end

---@return number
function AuctionCommStartAuction:AntiSnipe()
    return tonumber(self.s) or 0
end

---@return table
function AuctionCommStartAuction:Items()
    return self.i or {}
end

---@return number
function AuctionCommStartAuction:GetRosterUID()
    return self.c.r or 0
end

---@return number
function AuctionCommStartAuction:GetType()
    return self.c.t or CONSTANTS.AUCTION_TYPE.SEALED
end

---@return number
function AuctionCommStartAuction:GetMode()
    return self.c.m or CONSTANTS.ITEM_VALUE_MODE.ASCENDING
end

---@return boolean
function AuctionCommStartAuction:GetUseOS()
    return self.c.o or true
end

---@return boolean
function AuctionCommStartAuction:GetNamedButtonsMode()
    return self.c.n or false
end

---@return number
function AuctionCommStartAuction:GetIncrement()
    return self.c.i or 1
end

---@return table
function AuctionCommStartAuction:GetFieldNames()
    return self.c.f or {}
end

---@return number
function AuctionCommStartAuction:Version()
    return self.v or ((self.c ~= nil) and 2 or 1)
end

--------------------------
--- AuctionCommDenyBid ---
--------------------------
---@class AuctionCommDenyBid
---@field i number uid
---@field r number reason
local AuctionCommDenyBid = {}
---@param uidOrObject number|table
---@param reason? number
---@return AuctionCommDenyBid
function AuctionCommDenyBid:New(uidOrObject, reason)
    local isCopyConstructor = (type(uidOrObject) == "table")
    local o = isCopyConstructor and uidOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.i = uidOrObject
    o.r = reason

    return o
end

---@return number
function AuctionCommDenyBid:UID()
    return self.i or 0
end

---@return number
function AuctionCommDenyBid:Reason()
    return self.r or 0
end

--------------------------------
--- AuctionCommDistributeBid ---
--------------------------------
---@class AuctionCommDistributeBid
---@field d table bid data
local AuctionCommDistributeBid = {}
---@param object table|nil
---@return AuctionCommDistributeBid
function AuctionCommDistributeBid:New(object)
    local isCopyConstructor = (type(object) == "table")

    local o = isCopyConstructor and object or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.d = object

    return o
end

---@param data table
---@return AuctionCommDistributeBid
function AuctionCommDistributeBid:NewFromAggregatedData(data)
    local o = {}
    setmetatable(o, self)

    o.d = data

    return o
end

---@return table
function AuctionCommDistributeBid:Data()
    return self.d or {}
end

---@class AuctionCommStructure
---@field t number type
---@field d table|AuctionCommStartAuction|AuctionCommDenyBid|AuctionCommDistributeBid data
local AuctionCommStructure = {}
---@param typeOrObject number|table
---@param data? any
---@return AuctionCommStructure
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

---@return number
function AuctionCommStructure:Type()
    return self.t or 0
end

---@return any
function AuctionCommStructure:Data()
    return self.d
end

CLM.MODELS.AuctionCommStructure = AuctionCommStructure
CLM.MODELS.AuctionCommStartAuction = AuctionCommStartAuction
CLM.MODELS.AuctionCommDenyBid = AuctionCommDenyBid
CLM.MODELS.AuctionCommDistributeBid = AuctionCommDistributeBid