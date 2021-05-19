local _, CLM = ...

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local PointHistory = {}

function PointHistory:New(entry)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference

    return o
end

function PointHistory:Profiles()
    -- lazy loaded cache
    if self.profiles == nil then
        self.profiles = {}
        local targets = self.entry:targets()
        for _,target in ipairs(targets) do
            -- The code below breaks Model-View-Controller rule as it accessess Managers
            -- Maybe the caching should be done in GUI module?
            -- TODO: resolve this
            local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(target))
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

function PointHistory:Entry()
    return self.entry
end

CLM.MODELS.PointHistory = PointHistory