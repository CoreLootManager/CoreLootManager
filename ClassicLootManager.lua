local name, _ = ...

local define = LibDependencyInjection.createContext(...)

-- Define our configuration database structure
define.module("Config", {"SavedVariable:CLM2_DB", "Log"}, function(resolve, CLM2_DB, Log)
    -- CLM2_DB will always be initialized to an empty table if not set. We check for key existence to decide whether to initialize
    if CLM2_DB.global == nil then
        CLM2_DB = {
            global = {
                version = {
                    major = 0,
                    minor = 0,
                    patch = 0,
                    changeset = ""
                },
                logger = {
                    severity = Log.SEVERITY.ERROR,
                    verbosity = false
                }
            }
        }
    end
    resolve(CLM2_DB)

end)

---- First define log module since many of our modules require it
define.module("Log", {"LibStub:LibLogger"}, function(resolve, LibLogger)
    local Log = LibLogger:New()
    Log:SetPrefix("CLM")
    resolve(Log)
end)

-- configure database
define.await({"Log", "SavedVariable:CLM2_Logs"}, function(Log, CLM2_LOGS)
    Log:SetDatabase(CLM2_LOGS)
end)

-- configure log settings
define.await({"Log", "Config"}, function(Log, Config)
    Log:SetSeverity(Config.global.logger.severity)
    Log:SetVerbosity(Config.global.logger.verbosity)
end)


-- Define constants as a module since it is some kind of global registry
define.module("Constants", {"Meta:ADDON_TABLE"},  function(resolve, CLM)
    local constants = {}
    CLM.CONSTANTS = constants
    resolve(constants)
end)

-- Define models as a module since it is some kind of global registry
define.module("Models", {"Meta:ADDON_TABLE"}, function(resolve, CLM)
    local models = {
        LEDGER = {}
    }
    CLM.MODELS = models
    resolve(models)
end)

-- Define GUI  as a module since it is some kind of global registry
define.module("Gui", {"Meta:ADDON_TABLE"}, function(resolve, CLM)
    local gui = {

    }
    CLM.GUI = gui
    resolve(gui)
end)

-- Define modules as a module since it is some kind of global registry
define.module("Modules", {"Meta:ADDON_TABLE"}, function(resolve, CLM)
    local modules = {}
    CLM.MODULES = modules
    resolve(modules)
end)

define.module("Core", {"LibStub:AceAddon-3.0", "Meta:ADDON_TABLE"}, function(resolve, AceAddon, CLM)
    local core = AceAddon:NewAddon(name, "AceEvent-3.0", "AceBucket-3.0")
    CLM.CORE = core
    resolve(core)
end)
-- Define L as a module so we don't depend on the full addon table everywhere
define.module("L", {"Locale:" .. GetLocale()}, function(resolve, CurrentLocale)
    resolve(CurrentLocale)
end)
define.module("Main", {
    "Core",
    "Log",
    "Meta:ADDON_TABLE",
    "Constants",
    "Modules",
    "Config",
    "Models",
    "Gui"
}, function(resolve, CORE, Log, CLM, Constants, Modules, Config, Models, Gui)
local LIB_CLM, _ = LibStub:NewLibrary("ClassicLootManager", 1)
if LIB_CLM then
    LIB_CLM.CLM = CLM
end

CLM.MODELS = Models
CLM.CONSTANTS = Constants
CLM.OPTIONS = {}
CLM.ALERTS = {}

CLM.AUTOVERSION = "@project-version@"

CLM.LOG = Log

local LOG = Log
local MODULES = Modules




local function Initialize_Versioning()
    -- Parse autoversion
    local major, minor, patch, changeset = string.match(CLM.AUTOVERSION, "^v(%d+).(%d+).(%d+)-?(.*)")
    local old = Config.global.version
    local new = {
        major = tonumber(major) or 2,
        minor = tonumber(minor) or 0,
        patch = tonumber(patch) or 0,
        changeset = changeset or ""
    }
    -- set new version
    Config.global.version = new
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
    return Config.global.version
end

function CORE:GetVersionString()
    return self.versionString or ""
end

function CORE:_InitializeCore()
    LOG:Trace("CORE:_InitializeCore()")
    MODULES.ConfigManager:Initialize()
    MODULES.ACL:Initialize()
end

function CORE:_InitializeBackend()
    LOG:Trace("CORE:_InitializeBackend()")
    MODULES.Comms:Initialize()
    MODULES.EventManager:Initialize()
    MODULES.GuildInfoListener:Initialize()
    MODULES.LedgerManager:Initialize()
    -- if type(self.Debug) == "function" then
    --     self.Debug()
    -- end
end

function CORE:_InitializeFeatures()
    LOG:Trace("CORE:_InitializeFeatures()")
    -- We keep the order
    MODULES.ProfileManager:Initialize()
    MODULES.RosterManager:Initialize()
    MODULES.PointManager:Initialize()
    MODULES.LootManager:Initialize()
    MODULES.RaidManager:Initialize()
    MODULES.StandbyStagingManager:Initialize()
    MODULES.AuctionManager:Initialize()
    MODULES.AutoAward:Initialize()
    MODULES.BiddingManager:Initialize()
    MODULES.ProfileInfoManager:Initialize()
    MODULES.AutoAwardManager:Initialize()
    MODULES.LootQueueManager:Initialize()
    MODULES.AuctionHistoryManager:Initialize()
    MODULES.SandboxManager:Initialize()
    -- Globals
    CLM.Migration:Initialize() -- Initialize Migration
    CLM.GlobalConfigs:Initialize() -- Initialize global configs
    CLM.GlobalSlashCommands:Initialize() -- Initialize global slash handlers
    CLM.GlboalChatMessageHandlers:Initialize() -- Initialize global chat message handlers
    CLM.Integration:Initialize() -- Initialize external (to wow) integrations
    CLM.DatabaseUpgradeImporter:Initialize() -- Initialize import for JSON data from CLM1
end

function CORE:_InitializeMinimap()
    LOG:Trace("CORE:_InitializeMinimap()")
    -- Initialize Minmap
    MODULES.Minimap:Initialize()
end

function CORE:_InitializeOptions()
    LOG:Trace("CORE:_InitializeOptions()")
    -- No GUI / OPTIONS should be dependent on each other ever, only on the managers
    for _, module in pairs(CLM.OPTIONS) do
        module:Initialize()
    end
end

function CORE:_InitializeGUI()
    LOG:Trace("CORE:_InitializeGUI()")
    for _, module in pairs(Gui) do
        module:Initialize()
    end
end

function CORE:_Enable()
    LOG:Trace("CORE:_Enable()")
    MODULES.Comms:Enable()
    MODULES.LedgerManager:Enable()
end

local stages = {
    "_InitializeCore",
    "_InitializeBackend",
    "_InitializeMinimap",
    "_InitializeFeatures",
    "_InitializeOptions",
    "_InitializeGUI"
}

local finalStage = "_Enable"

local function getStage(stage)
    return stages[stage] or finalStage
end

function CORE:_SequentialInitialize(stageNum)
    LOG:Trace("CORE:_SequentialInitialize()")
    local stage = getStage(stageNum)
    LOG:Info("Initialization stage [%s]", stage)
    self[stage]()

    if stage == finalStage then
        LOG:Info(CLM.L["Boot complete"])
        return
    end
    C_Timer.After(0.1, function() CORE:_SequentialInitialize(stageNum + 1) end)
end

function CORE:_ExecuteInitialize()
    if self._initialize_fired then return end
    self._initialize_fired = true
    C_Timer.After(1, function() CORE:_SequentialInitialize(1) end)
end

function CORE:_Initialize()
    LOG:Trace("CORE:_Initialize()")
    -- Block direct lib timetravel
    --[===[@non-debug@
    if SLASH_LibEventSourcing_TimeTravel1 then
        SLASH_LibEventSourcing_TimeTravel1 = nil
    end
    --@end-non-debug@]===]
    if not self._initialize_fired then
        CORE:_ExecuteInitialize()
        self:UnregisterEvent("GUILD_ROSTER_UPDATE")
    end
end

function CORE:OnInitialize()
    -- Fix ML UI issue - https://bit.ly/3tc8nvw
    hooksecurefunc(MasterLooterFrame, 'Hide', function(s) s:ClearAllPoints() end);
    -- Initialize Versioning
    Initialize_Versioning()
    -- Initialize AddOn
    LOG:Trace("OnInitialize")
    self._initialize_fired = false
    -- CORE:RegisterEvent("GUILD_ROSTER_UPDATE")
    -- SetGuildRosterShowOffline(true)
    -- GuildRoster()
    CORE:_ExecuteInitialize()
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

--@do-not-package@
function CORE.Debug()
    CLM.Debug:Initialize()
    CLM.Debug:RegisterSlash()
end
--@end-do-not-package@
end)