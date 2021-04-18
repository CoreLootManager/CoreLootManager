local _, CLM = ...

-- local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local PointHistory = {}

function PointHistory:New(entry)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference

    return o
end

function PointHistory:ProfileIGUIDList()
    return self.entry:targets()
end

function PointHistory:Value()
    return self.entry:value()
end

function PointHistory:Entry()
    return self.entry
end

CLM.MODELS.PointHistory = PointHistory