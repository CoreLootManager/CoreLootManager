local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS

local AuctionCommStartAuction = {}
function AuctionCommStartAuction:New(typeOrObject, itemValueMode, base, max, itemLink, time, antiSnipe)
    local isCopyConstructor = not itemValueMode
    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.t = typeOrObject
    o.i = itemValueMode
    o.b = base
    o.m = max
    o.l = itemLink
    o.e = time
    o.s = antiSnipe

    return o
end

function AuctionCommStartAuction:Type()
    return self.t
end

function AuctionCommStartAuction:Mode()
    return self.i
end

function AuctionCommStartAuction:Base()
    return self.b
end

function AuctionCommStartAuction:Max()
    return self.m
end

function AuctionCommStartAuction:ItemLink()
    return self.l
end

function AuctionCommStartAuction:Time()
    return self.e
end

function AuctionCommStartAuction:AntiSnipe()
    return self.s
end

local AuctionCommDistributeBid = {}
function AuctionCommDistributeBid:New(nameOrObject, value)
    local isCopyConstructor = not value
    local o = isCopyConstructor and nameOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then return o end

    o.n = nameOrObject
    o.value = value
end

function AuctionCommDistributeBid:Name()
    return self.n
end

function AuctionCommDistributeBid:Value()
    return self.v
end


local AuctionCommStructure = {}
function AuctionCommStructure:New(typeOrObject, data)
    local isCopyConstructor = not data

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == CONSTANTS.AUCTION_COMM.START_AUCTION then
            o.d = AuctionCommStartAuction:New(o.d)
        elseif o.t == CONSTANTS.AUCTION_COMM.DISTRIBUTE_BID then
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

CONSTANTS.AUCTION_COMM = {
    TYPE = {
        START_AUCTION = 1,
        STOP_AUCTION = 2,
        ANTISNIPE = 3,
        ACCEPT_BID = 4,
        DENY_BID = 5,
        DISTRIBUTE_BID = 6
    },
    TYPES = UTILS.Set({
        1, -- START AUCTION
        2, -- STOP ACUTION
        3, -- ANTISNIPE
        4, -- ACCEPT BID
        5, -- DENY BID
        6, -- DISTRIBUTE BID
    })
}

MODELS.AuctionCommStructure = AuctionCommStructure
MODELS.AuctionCommStartAuction = AuctionCommStartAuction