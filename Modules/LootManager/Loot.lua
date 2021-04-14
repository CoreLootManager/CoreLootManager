local _, CLM = ...

local Loot = {}

function Loot:New(entry)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference

    return o
end

function Loot:Id()
    return self.entry:item()
end

function Loot:Value()
    return self.entry:value()
end

function Loot:Entry()
    return self.entry
end

CLM.MODELS.Loot = Loot