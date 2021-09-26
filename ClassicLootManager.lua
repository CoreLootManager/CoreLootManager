local name, CLM = ...

CLM.CORE = LibStub("AceAddon-3.0"):NewAddon(name, "AceEvent-3.0", "AceBucket-3.0")

CLM.MODULES = {}
CLM.MODELS = { LEDGER = {} }
CLM.CONSTANTS = {}
CLM.GUI = {}
CLM.OPTIONS = {}

CLM.AUTOVERSION = "@project-version@"

CLM.LOG = LibStub("LibLogger"):New()

local CORE = CLM.CORE
local LOG = CLM.LOG
local MODULES = CLM.MODULES

local function Initialize_SavedVariables()
    if type(CLM_DB) ~= "table" then
        CLM_DB = {
            global = {
                version = {
                    major = 0,
                    minor = 0,
                    patch = 0,
                    changeset = ""
                },
                logger = {
                    severity = CLM.LOG.SEVERITY.ERROR,
                    verbosity = false
                }
            }
        }
    end

    if type(CLM_Logs) ~= "table" then
        CLM_Logs = {}
    end
end

local function Initialize_Logger()
    LOG:SetSeverity(CLM_DB.global.logger.severity)
    LOG:SetVerbosity(CLM_DB.global.logger.verbosity)
    LOG:SetPrefix("CLM")
    LOG:SetDatabase(CLM_Logs)
end

local function Initialize_Versioning()
    -- Parse autoversion
    local major, minor, patch, changeset = string.match(CLM.AUTOVERSION, "^v(%d+).(%d+).(%d+)-?(.*)")
    local old = CLM_DB.global.version
    local new = {
        major = tonumber(major) or 0,
        minor = tonumber(minor) or 0,
        patch = tonumber(patch) or 0,
        changeset = changeset or ""
    }
    -- set new version
    CLM_DB.global.version = new
    -- update string
    changeset = new.changeset
    if changeset and changeset ~= "" then
        changeset = "-" .. changeset
    else
        changeset = ""
    end
    CORE.versionString = string.format(
        "v%s.%s.%s%s",
        new.major or 0,
        new.minor or 0,
        new.patch or 0,
        changeset)
    -- return both for update purposes
    return old, new
end

function CORE:GetVersion()
    return CLM_DB.global.version
end

function CORE:GetVersionString()
    return self.versionString or ""
end

function CORE:_InitializeCore()
    LOG:Trace("CORE:_InitializeCore()")

    MODULES.Database:Initialize()
    MODULES.ConfigManager:Initialize()
    MODULES.ACL:Initialize()
end

function CORE:_InitializeBackend()
    LOG:Trace("CORE:_InitializeBackend()")
    MODULES.Logger:Initialize()
    MODULES.Comms:Initialize()
    MODULES.EventManager:Initialize()
    MODULES.GuildInfoListener:Initialize()
    MODULES.LedgerManager:Initialize()
    if type(self.Debug) == "function" then
        self.Debug()
    end
end

function CORE:_InitializeFeatures()
    LOG:Trace("CORE:_InitializeFeatures()")
    -- We keep the order
    MODULES.ProfileManager:Initialize()
    MODULES.RosterManager:Initialize()
    MODULES.PointManager:Initialize()
    MODULES.LootManager:Initialize()
    MODULES.RaidManager:Initialize()
    MODULES.AuctionManager:Initialize()
    MODULES.BiddingManager:Initialize()
    MODULES.ProfileInfoManager:Initialize()
    -- Initialize Migration
    CLM.Migration:Initialize()
    -- Initialize global configs
    CLM.GlobalConfigs:Initialize()
    -- Initialize global slash handlers
    CLM.GlobalSlashCommands:Initialize()
end

function CORE:_InitializeFrontend()
    LOG:Trace("CORE:_InitializeFrontend()")
    -- No GUI / OPTIONS should be dependent on each other ever, only on the managers
    for _, module in pairs(CLM.OPTIONS) do
        module:Initialize()
    end
    for _, module in pairs(CLM.GUI) do
        module:Initialize()
    end
    -- Initialize Minmap
    MODULES.Minimap:Initialize()
    -- Hook Minimap Icon
    hooksecurefunc(MODULES.LedgerManager, "UpdateSyncState", function()
        if MODULES.LedgerManager:IsInSync() then
            CLM.MinimapDBI.icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-ok-32.tga"
        elseif MODULES.LedgerManager:IsSyncOngoing() then
            CLM.MinimapDBI.icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-nok-32.tga"
        else -- Unknown state
            CLM.MinimapDBI.icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-sync-32.tga"
        end
    end)
end

function CORE:_Enable()
    LOG:Trace("CORE:_Enable()")
    MODULES.Comms:Enable()
    MODULES.LedgerManager:Enable()
end

function CORE:_SequentialInitialize(stage)
    LOG:Trace("CORE:_SequentialInitialize()")
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
        LOG:Info("Boot complete")
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
    LOG:Trace("CORE:_Initialize()")
    if not self._initialize_fired then
        CORE:_ExecuteInitialize()
        self:UnregisterEvent("GUILD_ROSTER_UPDATE")
    end
end

function CORE:OnInitialize()
    -- Initialize SavedVariables
    Initialize_SavedVariables()
    --  Early Initialize logger
    Initialize_Logger()
    -- Initialize Versioning
    Initialize_Versioning()
    -- Initialize AddOn
    LOG:Trace("OnInitialize")
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
    LOG:Trace("GUILD_ROSTER_UPDATE")
    local inGuild = IsInGuild()
    local numTotal = GetNumGuildMembers()
    if inGuild and numTotal ~= 0 then
        self:_Initialize()
    end
end

-- Globals: Keybinds

BINDING_HEADER_CLM = "Classic Loot Manager"
BINDING_NAME_CLM_UNDO = "Undo action"
BINDING_NAME_CLM_REDO = "Redo action"

function CLM_Undo()
    -- LOG:Message("Executing Undo. Skiping confirmation prompt. Please wait.")
    -- MODULES.LedgerManager:CancelLastEntry()
    LOG:Warning("Undo not implemented.")
end

function CLM_Redo()
    LOG:Warning("Redo not implemented.")
end
--@do-not-package@
function CORE.Debug()
    CLM.Debug:Initialize()
    CLM.Debug:RegisterSlash()
end
--@end-do-not-package@