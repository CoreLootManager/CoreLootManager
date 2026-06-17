-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger
local ValidateIntegerGUID = CLM.UTILS.ValidateIntegerGUID

---@class PointHistory
---@field entry table
---@field targets table
---@field timestamp number
---@field value number
---@field reason number
---@field creator string
---@field note string
---@field type number
---@field profiles Profile[]
local PointHistory = {}

---@class FakePointHistory
---@field targets table
---@field time number
---@field value number
---@field reason number
---@field creator string
---@field note string
---@field type number
---@field profiles Profile[]
local FakePointHistory = {}

---@param entry table
---@param targets table?
---@param timestamp number?
---@param value number?
---@param reason number?
---@param creator string?
---@param note string?
---@param type number?
---@return PointHistory
function PointHistory:New(entry, targets, timestamp, value, reason, creator, note, type)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.targets = targets or entry:targets()
    o.timestamp = tonumber(timestamp) or entry:time()
    o.value = tonumber(value) or entry:value()
    o.reason = tonumber(reason) or entry:reason()
    o.creator = creator or entry:creatorFull()
    o.note = note or entry:note()
    o.type = type or entry:type()
    return o
end

---@return Profile[]
function PointHistory:Profiles()
    -- lazy loaded cache
    if self.profiles == nil then
        self.profiles = {}
        local targets = self.targets
        for _,target in ipairs(targets) do
            -- The code below breaks Model-View-Controller rule as it accessess Managers
            -- Maybe the caching should be done in GUI module?
            -- TODO: resolve this
            local profile
            if ValidateIntegerGUID(target) then
                profile = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(target))
            else
                profile = CLM.MODULES.ProfileManager:GetProfileByGUID(target)
            end
            if profile then
                tinsert(self.profiles, profile)
            end
        end
        table.sort(self.profiles, (function(first, second)
            return first:Name() < second:Name()
        end))
    end
    return self.profiles
end

---@return number
function PointHistory:Timestamp()
    return self.timestamp
end

---@return number
function PointHistory:Value()
    return self.value
end

---@return number
function PointHistory:Reason()
    return self.reason
end

---@return string
function PointHistory:Creator()
    return self.creator
end

---@return string
function PointHistory:Note()
    return self.note
end

---@return table
function PointHistory:Entry()
    return self.entry
end

---@return number
function PointHistory:Type()
    return self.type
end

---@param targets table
---@param timestamp number
---@param value number
---@param reason number
---@param creator string?
---@param note string?
---@param type number?
---@return FakePointHistory
function FakePointHistory:New(targets, timestamp, value, reason, creator, note, type)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.targets = targets
    o.time = timestamp
    o.value = value
    o.reason = reason
    o.creator = creator or ""
    o.note = note or ""
    o.type = type or CLM.CONSTANTS.POINT_CHANGE_TYPE.POINTS

    return o
end

---@return Profile[]
function FakePointHistory:Profiles()
    -- lazy loaded cache
    if self.profiles == nil then
        self.profiles = {}
        for _,target in ipairs(self.targets) do
            -- The code below breaks Model-View-Controller rule as it accessess Managers
            -- Maybe the caching should be done in GUI module?
            -- TODO: resolve this
            -- local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(target))
            -- if not profile then
            --     profile = CLM.MODULES.ProfileManager:GetProfileByGUID(target)
            -- end
            local profile
            if ValidateIntegerGUID(target) then
                profile = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(target))
            else
                profile = CLM.MODULES.ProfileManager:GetProfileByGUID(target)
            end
            if profile then
                tinsert(self.profiles, profile)
            end
        end
        table.sort(self.profiles, (function(first, second)
            return first:Name() < second:Name()
        end))
    end
    return self.profiles
end

---@return number
function FakePointHistory:Timestamp()
    return self.time
end

---@return number
function FakePointHistory:Value()
    return self.value
end

---@return number
function FakePointHistory:Reason()
    return self.reason
end

---@return string
function FakePointHistory:Creator()
    return self.creator
end

---@return string
function FakePointHistory:Note()
    return self.note
end

---@return nil
function FakePointHistory:Entry()
    return nil
end

---@return number
function FakePointHistory:Type()
    return self.type
end

CLM.MODELS.PointHistory = PointHistory
CLM.MODELS.FakePointHistory = FakePointHistory