local name, CLM = ...;


CLM.core = LibStub("AceAddon-3.0"):NewAddon(
    name,
    "AceComm-3.0", -- Comms using ChatLibThrottle
    "AceConsole-3.0", -- Slash Commands
    "AceEvent-3.0", -- WoW Event handlers
    "AceTimer-3.0" -- Timers
);
CLM.GUI = LibStub("AceGUI-3.0")

-- TODO: Should the modules be created in respective files? How does WoW Resolve that?
CLM.core:NewModule("Config", {}, "AceConfig-3.0")
CLM.core:NewModule("Database", {}, "AceDB-3.0")
CLM.core:NewModule("Comms", {}, "AceSerialize-3.0")

-- TODO populate through CI
CLM.version = {
    major = 0,
    minor = 0,
    patch = 0,
    notes = ""
}

function CLM.core:OnInitialize()

    CLM.Interconnec.Database.Initialize()
    CLM.Interconnect.Config.Initialize()
    CLM.Interconnect.Comms.Initialize()
    CLM.Interconnect.Raid.Initialize()
    CLM.Interconnect.StandingsManager.Initialize()
    CLM.Interconnect.LootManager.Initialize()
    CLM.Interconnect.ACL()

end

function CLM.core:OnEnable()
      -- Called when the addon is enabled
end

function CLM.core:OnDisable()
      -- Called when the addon is disabled
end