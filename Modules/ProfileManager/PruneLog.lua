local define = LibDependencyInjection.createContext(...)

define.module("ProfileManager/PruneLog", {"Models"}, function(resolve, Models)

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

Models.ProfilePruneLog = PruneLog
resolve(PruneLog)

end)