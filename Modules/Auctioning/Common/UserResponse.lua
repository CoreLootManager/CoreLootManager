-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable, ipairs = setmetatable, ipairs

local assertType = UTILS.assertType

local UserResponse = {} -- UserResponse
UserResponse.__index = UserResponse

function UserResponse:New(value, type, upgradedItems)
    local o = {}
    setmetatable(o, self)

    o.value = tonumber(value) or 0
    o.type = CONSTANTS.BID_TYPES[type] and type or CONSTANTS.BID_TYPE.MAIN_SPEC
    o.roll = 0
    o.upgradedItems = {}
    o:SetUpgradedItems(upgradedItems)

    return o
end

function UserResponse:SetUpgradedItems(upgradedItems)
    assertType(upgradedItems, "table")
    self.upgradedItems = {}
    for _,id in ipairs(upgradedItems) do
        id = tonumber(id) or 0
        if GetItemInfoInstant(id) then
            self.upgradedItems[#self.upgradedItems+1] = id
            GetItemInfo(id) -- cache force
        end
    end
end

function UserResponse:SetRoll(value)
    self.roll = tonumber(value) or 0
end

function UserResponse:Value()
    return self.value
end

function UserResponse:Type()
    return self.type
end

function UserResponse:Roll()
    return self.roll
end

function UserResponse:Items()
    return self.upgradedItems
end

function UserResponse:MarkInvalid()
    self.invalid = true
end

function UserResponse:IsInvalid()
    return self.invalid
end

CLM.MODELS.UserResponse = UserResponse