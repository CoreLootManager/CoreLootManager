-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
-- local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --

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
    tinsert(self.log, name)
end

ILM.MODELS.ProfilePruneLog = PruneLog