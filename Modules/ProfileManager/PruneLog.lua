local _, CLM = ...

local PruneLog = {}

function PruneLog:New(type, nop)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.type = type
    o.timestamp = GetServerTime()
    o.log = {}
    o.nop = nop and true or false

    return o
end

function PruneLog:Add(name)
    table.insert(self.log, name)
end

CLM.MODELS.ProfilePruneLog = PruneLog