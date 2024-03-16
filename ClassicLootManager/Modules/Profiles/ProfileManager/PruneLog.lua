-- ------------------------------- --
local CLM = select(2, ...) ---@class CLM
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

---@class PruneLog
---@field type any
---@field timestamp number
---@field log any[]
---@field nop boolean
local PruneLog =  {}

---@param type any
---@param nop boolean
---@return table
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