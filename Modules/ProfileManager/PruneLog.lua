-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local GetServerTime, tinsert, setmetatable = GetServerTime, table.insert, setmetatable

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

CLM.MODELS.ProfilePruneLog = PruneLog