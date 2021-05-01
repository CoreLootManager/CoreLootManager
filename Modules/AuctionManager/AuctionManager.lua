local  _, CLM = ...

local LOG = CLM.LOG

local  MODULES = CLM.MODULES

-- local RosterManager = MODULES.RosterManager

-- local typeof = UTILS.typeof

local AuctionManager = {}

function AuctionManager:Initialize()
    LOG:Trace("AuctionManager:Initialize()")

    self._initialized = true
end



MODULES.AuctionManager = AuctionManager