local _, CLM = ...

local CONSTANTS = CLM.CONSTANTS

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local PointHistory = {}
local FakePointHistory = {}

function PointHistory:New(entry, targets)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.targets = targets or entry:targets()

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
                table.insert(self.profiles, profile)
            end
        end
        table.sort(self.profiles, (function(first, second)
            return first:Name() < second:Name()
        end))
    end
    return self.profiles
end

function PointHistory:Timestamp()
    return self.entry:time()
end

function PointHistory:Value()
    return self.entry:value()
end

function PointHistory:Reason()
    return self.entry:reason()
end

function PointHistory:Creator()
    return self.entry:creator()
end

function PointHistory:Entry()
    return self.entry
end

function PointHistory:Type()
    return CONSTANTS.POINT_HISTORY_SOURCE.DIRECT
end

function PointHistory:Extra()
    return nil
end

function FakePointHistory:New(targets, timestamp, value, reason, creator, type, extra)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.targets = targets
    o.time = timestamp
    o.value = value
    o.reason = reason
    o.creator = creator
    o.type = type
    o.extra = extra

    return o
end

function FakePointHistory:Profiles()
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
                table.insert(self.profiles, profile)
            end
        end
        table.sort(self.profiles, (function(first, second)
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

function FakePointHistory:Entry()
    return nil
end

function PointHistory:Type()
    return self.type
end

function PointHistory:Extra()
    return self.extra
end

CLM.MODELS.PointHistory = PointHistory
CLM.MODELS.FakePointHistory = FakePointHistory