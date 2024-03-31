local name, CLM = ...

local GuildRoster = GuildRoster or C_GuildInfo.GuildRoster

local LIB_CLM, _ = LibStub:NewLibrary("ClassicLootManager", 1)
if LIB_CLM then
    LIB_CLM.CLM = CLM
end

CLM.WoW10  = select(4, GetBuildInfo()) >= 100000
CLM.WoWSeasonal = select(4, GetBuildInfo()) < 30000
CLM.WoWCata = select(4, GetBuildInfo()) > 40000
if CLM.WoWSeasonal then
    CLM.WoWSoD = C_Seasons.GetActiveSeason() == Enum.SeasonID.Placeholder
end

CLM.CORE = LibStub("AceAddon-3.0"):NewAddon(name, "AceEvent-3.0", "AceBucket-3.0")

CLM.MODULES = {}
CLM.MODELS = { LEDGER = {} }
CLM.CONSTANTS = {}
CLM.COMM_CHANNEL = {
    AUCTION = "Auction3",
    BIDDING = "Bidding3",
    LEDGER = {
        SYNC = "LedgerS3",
        DATA = "LedgerD3"
    },
    STANDBY = "Standby2",
    GLOBAL = "Version2"
}
CLM.UTILS = {}
CLM.GUI = {}
CLM.OPTIONS = {}
CLM.ALERTS = {}
CLM.EXTERNAL = {}

CLM.AUTOVERSION = "@project-version@"

CLM.LOG = LibStub("LibLogger"):New()

local CORE = CLM.CORE
local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

function UTILS.ParseVersionString(versionString)
    local major, minor, patch, changeset = string.match(versionString, "^v(%d+).(%d+).(%d+)-?(.*)")
    return {
        major = tonumber(major) or 5,
        minor = tonumber(minor) or 0,
        patch = tonumber(patch) or 0,
        changeset = changeset or ""
    }
end

local function Initialize_SavedVariables()
    if type(CLM2_DB) ~= "table" then
        CLM2_DB = {
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

    if type(CLM2_Logs) ~= "table" then
        CLM2_Logs = {}
    end
    CLM.AF = ((GetServerTime() >= 1711886400) and (GetServerTime() <= 1712577600)) and not CLM2_DB.DisableFun2024

    StaticPopupDialogs["CLMNoFunAllowedReload"] = {
        text = "Are you sure? Will reload UI.",
        button1 = "No fun allowed :(",
        button2 = "I still want fun!",
        OnAccept = function()
            CLM2_DB.DisableFun2024 = true
            ReloadUI()
        end,
        timeout = 0,
        whileDead = 1
    }
end

local function Initialize_Logger()
    LOG:SetSeverity(CLM2_DB.global.logger.severity)
    LOG:SetVerbosity(CLM2_DB.global.logger.verbosity)
    LOG:SetPrefix("CLM")
    LOG:SetDatabase(CLM2_Logs)
end


local function RegisterUniversal(object, moduleName, entryPoint)
    if type(moduleName) ~= "string" then
        error("Registrar name must be a string.")
    end
    if object[moduleName] then
        error(string.format("Registrar %s already registered.", moduleName))
    end
    if type(entryPoint) ~= "table" then
        error(string.format("Registrar %s entry point is not a table."))
    end
    if type(entryPoint.Initialize) ~= "function" then
        error(string.format("Registrar %s entry point is missing Initialize method.", moduleName))
    end

    object[moduleName] = entryPoint
end

function CLM.RegisterModule(moduleName, entryPoint)
    RegisterUniversal(CLM.MODULE, moduleName, entryPoint)
end

function CLM.RegisterExternal(moduleName, entryPoint)
    RegisterUniversal(CLM.EXTERNAL, moduleName, entryPoint)
end

function CORE:_InitializeDatabase()
    LOG:Trace("CORE:_InitializeDatabase()")
    return MODULES.Database:Initialize()
end

function CORE:_InitializeCore()
    LOG:Trace("CORE:_InitializeCore()")
    MODULES.ConfigManager:Initialize()
    MODULES.ACL:Initialize()
    MODULES.Hooks:Initialize()

    return true
end

function CORE:_InitializeBackend()
    LOG:Trace("CORE:_InitializeBackend()")
    MODULES.Logger:Initialize()
    MODULES.Comms:Initialize()
    MODULES.EventManager:Initialize()
    MODULES.GuildInfoListener:Initialize()
    MODULES.LedgerManager:Initialize()

    return true
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
    MODULES.AutoAssign:Initialize()
    MODULES.BiddingManager:Initialize()
    MODULES.ProfileInfoManager:Initialize()
    MODULES.AutoAwardManager:Initialize()
    MODULES.AuctionHistoryManager:Initialize()
    MODULES.SandboxManager:Initialize()
    -- Globals
    CLM.GlobalConfigs:Initialize() -- Initialize global configs
    CLM.GlobalSlashCommands:Initialize() -- Initialize global slash handlers
    CLM.GlboalChatMessageHandlers:Initialize() -- Initialize global chat message handlers
    CLM.GlobalUIHandlers:Initialize() -- Initialize various global misc UI handlers
    CLM.GlobalGuildChangeHandler:Initialize() -- Initialize guild change handler

    return true
end

function CORE:_InitializeExternal()
    LOG:Trace("CORE:_InitializeExternal()")
    for _,external in pairs(CLM.EXTERNAL) do
        external:Initialize()
    end

    return true
end

function CORE:_InitializeMinimap()
    LOG:Trace("CORE:_InitializeMinimap()")
    -- Initialize Minmap
    MODULES.Minimap:Initialize()

    return true
end

function CORE:_InitializeOptions()
    LOG:Trace("CORE:_InitializeOptions()")
    -- No GUI / OPTIONS should be dependent on each other ever, only on the managers
    for _, module in pairs(CLM.OPTIONS) do
        module:Initialize()
    end

    return true
end

function CORE:_InitializeGUI()
    LOG:Trace("CORE:_InitializeGUI()")
    for _, module in pairs(CLM.GUI) do
        module:Initialize()
    end

    return true
end

function CORE:_Enable()
    LOG:Trace("CORE:_Enable()")
    MODULES.Comms:Enable()
    MODULES.LedgerManager:Enable()

    return true
end

local stages = {
    { name = "_InitializeDatabase", retry = true },
    { name = "_InitializeCore",     retry = false},
    { name = "_InitializeBackend",  retry = false},
    { name = "_InitializeMinimap",  retry = false},
    { name = "_InitializeFeatures", retry = false},
    { name = "_InitializeOptions",  retry = false},
    { name = "_InitializeGUI",      retry = false},
    { name = "_InitializeExternal", retry = false},
}
local finalStage = { name = "_Enable", retry = false }

local function getStage(stage)
    return (stages[stage] or finalStage).name, (stages[stage] or finalStage).retry
end

function CORE:_SequentialInitialize(stageNum)
    LOG:Trace("CORE:_SequentialInitialize()")
    local stage, retry = getStage(stageNum)
    LOG:Info("Initialization stage [%s]", stage)
    local success = self[stage]()

    if success then
        if stage == finalStage.name then
            LOG:Info(CLM.L["Boot complete"])
            return
        end
        stageNum = stageNum + 1
    else
        if not retry then
            error(string.format("Error Loading CLM on stage [%s]", stage))
        end
    end
    C_Timer.After(0.1, function() CORE:_SequentialInitialize(stageNum) end)
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
    -- Initialize SavedVariables
    Initialize_SavedVariables()
    --  Early Initialize logger
    Initialize_Logger()
    -- Initialize Versioning
    CLM.MODULES.Version:Initialize()
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

--@do-not-package@
if DevTool then
    DevTool_AddData(CLM, "CLM")
end
--@end-do-not-package@