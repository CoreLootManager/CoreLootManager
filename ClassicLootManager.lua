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

function CORE:_InitializeCore()
    CLM.LOG:Info("CORE:_InitializeCore()")

    --CLM.Interconnect.Database.Initialize()
    CLM.Interconnect.ConfigManager:Initialize()
    CLM.Interconnect.Logger:Initialize()
    --CLM.Interconnect.StateManager.Initialize()
    CLM.Interconnect.Comms:Initialize()
    --CLM.Interconnect.ACL.Initialize()
end

function CORE:_InitializeBackend()
    CLM.LOG:Info("CORE:_InitializeBackend()")
    --CLM.Interconnect.LedgerManager.Initialize()
end

function CORE:_InitializeFeatures()
    CLM.LOG:Info("CORE:_InitializeFeatures()")
    --CLM.Interconnect.EventHandler.Initialize()
    --CLM.Interconnect.RaidManager.Initialize()
    --CLM.Interconnect.RosterManager.Initialize()
    --CLM.Interconnect.ProfileManager.Initialize()
    --CLM.Interconnect.PointManager.Initialize()
    --CLM.Interconnect.LootManager.Initialize()
end

function CORE:_InitializeFrontend()
    CLM.LOG:Info("CORE:_InitializeFrontend()")
end

function CORE:_Enable()
    CLM.LOG:Info("CORE:_Enable()")
    CLM.Interconnect.Comms:Enable()
end

function CORE:_BIST()
    CLM.Interconnect.BIST:Run()
    C_Timer.After(2, function() CLM.Interconnect.BIST:Report() end)
end

function CORE:_SequentialInitialize(stage)
    CLM.LOG:Info("CORE:_SequentialInitialize()")
    if stage == 0 then
        self:_InitializeCore()
    elseif stage == 1 then
        self:_InitializeBackend()
    elseif stage == 2 then
        self:_InitializeFeatures()
    elseif stage == 3 then
        self:_InitializeFrontend()
    elseif stage >= 4 then
        self:_Enable()
        CLM.LOG:Info("Initialization complete")
        C_Timer.After(0.5, function() CORE:_BIST() end)
        return
    end
    C_Timer.After(0.5, function() CORE:_SequentialInitialize(stage + 1) end)
end

function CORE:OnInitialize()
    if type(CLM_Logs) ~= "table" then
        CLM_Logs = {}
    end

    if type(CLM_DB) ~= "table" then
        CLM_DB = {}
    end

    C_Timer.After(1, function() CORE:_SequentialInitialize(0) end)
end

function CORE:OnEnable()
      -- Called when the addon is enabled
end

function CORE:OnDisable()
      -- Called when the addon is disabled
end