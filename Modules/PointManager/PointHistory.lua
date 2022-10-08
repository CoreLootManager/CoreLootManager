-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local tinsert, tsort = table.insert, table.sort

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local PointHistory = {}
local FakePointHistory = {}

function PointHistory:New(entry, targets, timestamp, value, reason, creator, note, spent)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.targets = targets or entry:targets()
    o.timestamp = tonumber(timestamp) or entry:time()
    o.value = tonumber(value) or entry:value()
    o.reason = tonumber(reason) or entry:reason()
    o.creator = creator or entry:creator()
    o.note = note or entry:note()
    if entry.spent then -- Not All entries have spent field
        o.spent = spent or entry:spent()
    else
        o.spent = spent or false
    end

    return o
end

function PointHistory:Profiles()
    -- lazy loaded cache
    if self.profiles == nil then
        self.profiles = {}
        local targets = self.targets
        for _,target in ipairs(targets) do
            -- The code below breaks Model-View-Controller rule as it accessess Managers
            -- Maybe the caching should be done in GUI module?
            -- TODO: resolve this
            local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(target))
            if not profile then
                profile = CLM.MODULES.ProfileManager:GetProfileByGUID(target)
            end
            if profile then
                tinsert(self.profiles, profile)
            end
        end
        tsort(self.profiles, (function(first, second)
            return first:Name() < second:Name()
        end))
    end
    return self.profiles
end

function PointHistory:Timestamp()
    return self.timestamp
end

function PointHistory:Value()
    return self.value
end

function PointHistory:Reason()
    return self.reason
end

function PointHistory:Creator()
    return self.creator
end

function PointHistory:Note()
    return self.note
end

function PointHistory:Entry()
    return self.entry
end

function PointHistory:Spent()
    return self.spent
end

function FakePointHistory:New(targets, timestamp, value, reason, creator, note, spent)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.targets = targets
    o.time = timestamp
    o.value = value
    o.reason = reason
    o.creator = creator or ""
    o.note = note or ""
    o.spent = spent or false

    return o
end

function FakePointHistory:Profiles()
    -- lazy loaded cache
    if self.profiles == nil then
        self.profiles = {}
        for _,target in ipairs(self.targets) do
            -- The code below breaks Model-View-Controller rule as it accessess Managers
            -- Maybe the caching should be done in GUI module?
            -- TODO: resolve this
            local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(target))
            if not profile then
                profile = CLM.MODULES.ProfileManager:GetProfileByGUID(target)
            end
            if profile then
                tinsert(self.profiles, profile)
            end
        end
        tsort(self.profiles, (function(first, second)
            return first:Name() < second:Name()
        end))
    end
    return self.profiles
end

function FakePointHistory:Timestamp()
    return self.time
end

function FakePointHistory:Value()
    return self.value
end

function FakePointHistory:Reason()
    return self.reason
end

function FakePointHistory:Creator()
    return self.creator
end

function FakePointHistory:Note()
    return self.note
end

function FakePointHistory:Entry()
    return nil
end

function FakePointHistory:Spent()
    return self.spent
end

CLM.MODELS.PointHistory = PointHistory
CLM.MODELS.FakePointHistory = FakePointHistory