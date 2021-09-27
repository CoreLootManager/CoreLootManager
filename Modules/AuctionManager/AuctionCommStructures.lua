-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local _, CLM = ...

local MODELS = CLM.MODELS
-- local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS

local AuctionCommStartAuction = {}
function AuctionCommStartAuction:New(typeOrObject, itemValueMode, base, max, itemLink, time, endtime, antiSnipe, note, rosterUid)
    local isCopyConstructor = (type(typeOrObject) == "table")

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
    o.d = endtime
    o.s = antiSnipe
    o.n = note
    o.r = rosterUid

    return o
end

function AuctionCommStartAuction:Type()
    return self.t or 0
end

function AuctionCommStartAuction:Mode()
    return self.i or 0
end

function AuctionCommStartAuction:Base()
    return self.b or 0
end

function AuctionCommStartAuction:Max()
    return self.m or 0
end

function AuctionCommStartAuction:ItemLink()
    return self.l or ""
end

function AuctionCommStartAuction:Time()
    return self.e or 0
end

function AuctionCommStartAuction:EndTime()
    return self.d or 0
end

function AuctionCommStartAuction:AntiSnipe()
    return self.s or 0
end

function AuctionCommStartAuction:Note()
    return self.n or ""
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

MODELS.AuctionCommStructure = AuctionCommStructure
MODELS.AuctionCommStartAuction = AuctionCommStartAuction
MODELS.AuctionCommDenyBid = AuctionCommDenyBid
MODELS.AuctionCommDistributeBid = AuctionCommDistributeBid