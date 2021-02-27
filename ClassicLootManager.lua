local name, CLM = ...;

CLM.CORE = LibStub("AceAddon-3.0"):NewAddon(name);
CLM.GUI = LibStub("AceGUI-3.0")

--  AddOn contained constants
CLM.CONSTANTS = {}

-- TODO populate through CI
CLM.VERSION = {
    major = 0,
    minor = 0,
    patch = 0,
    notes = ""
}

function CLM.core:OnInitialize()
    -- Core
    
    -- Backend
    CLM.Interconnect.Database.Initialize()
    CLM.Interconnect.ConfigManager.Initialize()
    CLM.Interconnect.LedgerManager.Initialize()
    CLM.Interconnect.StateManager.Initialize()
    CLM.Interconnect.Comms.Initialize()
    CLM.Interconnect.ACL.Initialize()
    --  Features
    CLM.Interconnect.EventHandler.Initialize()
    CLM.Interconnect.RaidManager.Initialize()
    CLM.Interconnect.RosterManager.Initialize()
    CLM.Interconnect.ProfileManager.Initialize()
    CLM.Interconnect.PointManager.Initialize()
    CLM.Interconnect.LootManager.Initialize()

end

function CLM.core:OnEnable()
      -- Called when the addon is enabled
end

function CLM.core:OnDisable()
      -- Called when the addon is disabled
end