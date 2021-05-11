local _, CLM = ...

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local Loot = {}

function Loot:New(entry, owner)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.owner = owner 

    return o
end

function Loot:Owner()
    return self.owner
end

function Loot:Id()
    return self.entry:item()
end

function Loot:Value()
    return self.entry:value()
end

function Loot:Timestamp()
    return self.entry:time()
end

function Loot:OwnerGUID()
    return getGuidFromInteger(self.entry:profile())
end

function Loot:Entry()
    return self.entry
end

CLM.MODELS.Loot = Loot