-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable, ipairs = setmetatable, ipairs

local assertType = UTILS.assertType

local AuctionItemUserResponse = {} -- AuctionItemUserResponse
AuctionItemUserResponse.__index = AuctionItemUserResponse

function AuctionItemUserResponse:New(value, type, upgradedItems)
    local o = {}
    setmetatable(o, self)

    o.value = tonumber(value) or 0
    o.type = CONSTANTS.BID_TYPES[type] and type or CONSTANTS.BID_TYPE.MAIN_SPEC
    o.upgradedItems = {}

    return o
end

function AuctionItemUserResponse:SetUpgradedItems(upgradedItems)
    assertType(upgradedItems, "table")
    for _,id in ipairs(upgradedItems) do
        id = tonumber(id) or 0
        if GetItemInfoInstant(id) then
            self.upgradedItems[#self.upgradedItems+1] = id
        end
    end
end

function AuctionItemUserResponse:Get()
    return self.value, self.type, self.upgradedItems
end

CLM.MODELS.AuctionItemUserResponse = AuctionItemUserResponse