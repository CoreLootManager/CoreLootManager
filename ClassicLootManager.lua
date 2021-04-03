local name, CLM = ...;

CLM.CORE = LibStub("AceAddon-3.0"):NewAddon(name, "AceEvent-3.0");

-- TODO populate through CI
CLM.VERSION = {
    major = 0,
    minor = 0,
    patch = 0,
    notes = ""
}

CLM.MODULES = {}
CLM.MODELS = { LEDGER = {} }
CLM.CONSTANTS = {
    RESULTS = { -- Universal return codes
        ERROR = 0,           -- Request failed
        IGNORE = 1,          -- Request was ignored
        SUCCESS = 2,         -- Request success
        SUCCESS_EXTENDED = 3 -- Request success + can be followed by message in a tuple response
    }
}
CLM.GUI = {}
CLM.OPTIONS = {}
CLM.LOG = { verbose = true }

-- Local upvalues
local CORE = CLM.CORE
local LOG = CLM.LOG
local MODULES = CLM.MODULES

function CORE:_InitializeCore()
    LOG:Info("CORE:_InitializeCore()")

    MODULES.Database:Initialize()
    MODULES.ConfigManager:Initialize()
    MODULES.Logger:Initialize()
    MODULES.ACL:Initialize()
end

function CORE:_InitializeBackend()
    LOG:Info("CORE:_InitializeBackend()")
    --MODULES.EventHandler.Initialize()
    MODULES.Comms:Initialize()
    MODULES.LedgerManager:Initialize()
end

function CORE:_InitializeFeatures()
    LOG:Info("CORE:_InitializeFeatures()")
    MODULES.ProfileManager:Initialize()
    MODULES.RosterManager:Initialize()
    MODULES.PointManager:Initialize()
    --MODULES.LootManager.Initialize()
    --MODULES.RaidManager.Initialize()
end

function CORE:_InitializeFrontend()
    LOG:Info("CORE:_InitializeFrontend()")
    -- No GUI / OPTIONS should be dependent on each other ever, only on the managers
    for _, module in pairs(CLM.OPTIONS) do
        module:Initialize()
    end
    for _, module in pairs(CLM.GUI) do
        module:Initialize()
    end
end

function CORE:_Enable()
    LOG:Info("CORE:_Enable()")
    MODULES.Comms:Enable()
    MODULES.LedgerManager:Enable()
end

function CORE:_SequentialInitialize(stage)
    LOG:Info("CORE:_SequentialInitialize()")
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
        LOG:Info("Initialization complete")
        return
    end
    C_Timer.After(0.1, function() CORE:_SequentialInitialize(stage + 1) end)
end

function CORE:_ExecuteInitialize()
    if self._initialize_fired then return end
    self._initialize_fired = true
    C_Timer.After(1, function() CORE:_SequentialInitialize(0) end)
end

function CORE:_Initialize()
    LOG:Info("CORE:_Initialize()")
    if not self._initialize_fired then
        CORE:_ExecuteInitialize()
        self:UnregisterEvent("GUILD_ROSTER_UPDATE")
    end
end

function CORE:OnInitialize()
    if type(CLM_Logs) ~= "table" then
        CLM_Logs = {}
    end

    if type(CLM_DB) ~= "table" then
        CLM_DB = {}
    end

    self._initialize_fired = false
    CORE:RegisterEvent("GUILD_ROSTER_UPDATE")
    SetGuildRosterShowOffline(true)
    GuildRoster()
    -- We schedule this in case GUILD_ROSTER_UPDATE won't come early enough
    C_Timer.After(20, function()
        CORE:_ExecuteInitialize()
    end)
end

function CORE:OnEnable()
      -- Called when the addon is enabled
end

function CORE:OnDisable()
      -- Called when the addon is disabled
end

function CORE:GUILD_ROSTER_UPDATE(...)
    LOG:Info("GUILD_ROSTER_UPDATE")
    local inGuild = IsInGuild()
    local numTotal = GetNumGuildMembers();
    if inGuild and numTotal ~= 0 then
        self:_Initialize()
    end
end