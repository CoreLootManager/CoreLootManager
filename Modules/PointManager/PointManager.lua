local  _, CLM = ...

local MODULES =  CLM.MODULES
local LedgerManager = MODULES.LedgerManager

local function round(value, decimals)
    return tonumber((("%%.%df"):format(decimals)):format(value))
end

PointManager = {}
function PointManager:Initialize()
    self.roundingFormatter = "%%.2f"
end

function PointManager:Round(value)
    return tonumber(self.roundingFormatter:format(value))
end

MODULES.PointManager = PointManager