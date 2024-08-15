-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --
local assertType = UTILS.assertType

local UserResponse = {} -- UserResponse
UserResponse.__index = UserResponse

function UserResponse:New(valueOrObject, responseType, upgradedItems)

    local isCopyConstructor = (type(valueOrObject) == "table")

    local o = isCopyConstructor and valueOrObject or {}

    setmetatable(o, self)
    self.__index = self
    if isCopyConstructor then return o end

    o.value = tonumber(valueOrObject) or 0
    o.type = CONSTANTS.BID_TYPES[responseType] and responseType or CONSTANTS.BID_TYPE.MAIN_SPEC
    o.roll = 0
    o.upgradedItems = {}
    o:SetUpgradedItems(upgradedItems or {})

    return o
end

function UserResponse:SetUpgradedItems(upgradedItems)
    assertType(upgradedItems, "table")
    self.upgradedItems = {}
    for _, item in ipairs(upgradedItems) do
        item.id = tonumber(item.id) or 0
        item.ex = item.ex or ""
        if UTILS.GetItemInfoInstant(item.id) then
            local itemLink = "item:" .. tostring(item.id) .. item.ex
            self.upgradedItems[#self.upgradedItems+1] = itemLink
            UTILS.GetItemInfo(itemLink) -- force cache
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

function UserResponse:MarkInvalid(reason)
    self.invalid = reason
end

function UserResponse:IsInvalid()
    return (self.invalid ~= nil)
end

function UserResponse:GetInvalidReason()
    return self.invalid
end

CLM.MODELS.UserResponse = UserResponse