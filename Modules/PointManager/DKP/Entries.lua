local _, CLM = ...

local MODELS = CLM.MODELS

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- Point DKP X
local Modify = LogEntry:extend("PDM")
local Set = LogEntry:extend("PDS")
local Decay = LogEntry:extend("PDD")

function Modify:new(playerGuidList, value)
    local o = LogEntry.new(self, UnitGUID("player"));
    o.playerGuidList = playerGuidList
    o.value = value
    return o
end


MODELS.DKPLogEntries = {
    Modify = Modify,
    Set = Set,
    Decay = Decay
}
