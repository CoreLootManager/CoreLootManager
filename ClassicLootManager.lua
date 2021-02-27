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

-- Local API
local CORE = CLM.CORE

function CORE:_DelayedInitialize()
    local Interconnect = CLM.Interconnect
    -- Core
    if type(CLM_Logs) ~= "table" then
        CLM_Logs = {}
    end
    CLM.LOG:Debug("My message DEBUG")
    CLM.LOG:Info("My message INFO")
    CLM.LOG:Warning("My message WARNING")
    CLM.LOG:Error("My message ERROR")
    CLM.LOG:Fatal("My message FATAL")
    -- Backend
    Interconnect.Database.Initialize()
    Interconnect.ConfigManager.Initialize()
    Interconnect.Logger.Initialize()
    Interconnect.LedgerManager.Initialize()
    Interconnect.StateManager.Initialize()
    Interconnect.Comms.Initialize()
    Interconnect.ACL.Initialize()
    --  Features
    Interconnect.EventHandler.Initialize()
    Interconnect.RaidManager.Initialize()
    Interconnect.RosterManager.Initialize()
    Interconnect.ProfileManager.Initialize()
    Interconnect.PointManager.Initialize()
    Interconnect.LootManager.Initialize()
    -- Frontend GUI
end

function CORE:OnInitialize()
    C_Timer.After(2, function() CORE:_DelayedInitialize() end)
end

function CORE:OnEnable()
      -- Called when the addon is enabled
end

function CORE:OnDisable()
      -- Called when the addon is disabled
end