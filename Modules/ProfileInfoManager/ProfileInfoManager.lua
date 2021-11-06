local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local Comms = MODULES.Comms
local LedgerManager = MODULES.LedgerManager
local ProfileManager = MODULES.ProfileManager
local EventManager = MODULES.EventManager

local ColorCodeText = UTILS.ColorCodeText
local GetMyTalents = UTILS.GetMyTalents
local ProfileInfoCommStructure = MODELS.ProfileInfoCommStructure
local ProfileInfoCommAnnounceVersion = MODELS.ProfileInfoCommAnnounceVersion
local ProfileInfoCommAnnounceSpec = MODELS.ProfileInfoCommAnnounceSpec

local PROFILEINFO_COMM_PREFIX = "Version001" -- Keep it for version sync with older ones

local function stringifyVersion(version)
    return string.format("v%s.%s.%s", version.major or 0, version.minor or 0, version.patch or 0)
end

local function GetProfileDb(self, name)
    if not self.db[name] then
        self.db[name] = {
            version = {
                major = 0,
                minor = 0,
                patch = 0,
                changeset = ""
            },
            spec = {
                one = 0,
                two = 0,
                three = 0
            }
        }
    end
    return self.db[name]
end

--[[
    --- VERSION ---
]]
local function AnnounceVersion()
    LOG:Trace("ProfileInfoManager:AnnounceVersion()")
    local version = CLM.CORE:GetVersion()
    local message = ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION,
        ProfileInfoCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset))
    Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function OutOfDate(self, version, disable)
    LOG:Trace("ProfileInfoManager:OutOfDate()")
    local currentTime = GetServerTime()
    if disable then
        if currentTime - self._lastDisplayedMessageD > 300 then
            LOG:Message("|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible.", ColorCodeText(stringifyVersion(version), "00cc00"))
            self._lastDisplayedMessageD = currentTime
        end
        LedgerManager:Cutoff()
        Comms:Disable()
    else
        if currentTime - self._lastDisplayedMessage > 300 then
            LOG:Message("New version %s of Classic Loot Manager is available. For best experience please update the AddOn.", ColorCodeText(stringifyVersion(version), "00cc00"))
            self._lastDisplayedMessage = currentTime
        end
    end
end

local function SetProfileVersion(name, version)
    local profile = ProfileManager:GetProfileByName(name)
    if profile then
        profile:SetVersion(version.major, version.minor, version.patch, version.changeset)
    end
end

local function StoreProfileVersion(self, name, version)
    GetProfileDb(self, name).version = version
end

local function RestoreVersions(self)
    for name, info in pairs(self.db) do
        SetProfileVersion(name, info.version)
    end
end

local function HandleAnnounceVersion(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleAnnounceVersion()")
    local currentVersion = CLM.CORE:GetVersion()
    local receivedVersion = data:Version()

    -- Check if we have older version
    if currentVersion.major < receivedVersion.major then
        OutOfDate(self, receivedVersion, true)
    else -- equal majors
        if currentVersion.minor < receivedVersion.minor then
            -- older minor
            OutOfDate(self, receivedVersion, false)
        elseif (currentVersion.minor == receivedVersion.minor) and (currentVersion.patch < receivedVersion.patch) then
            if receivedVersion.changeset == "" then -- changeset = unofficial or beta. We don't care about that
                OutOfDate(self, receivedVersion, false)
            else
                LOG:Debug("Received version %s-%s", stringifyVersion(receivedVersion), receivedVersion.changeset)
            end
        end
    end

    SetProfileVersion(sender, receivedVersion)
    StoreProfileVersion(self, sender, receivedVersion)
end

local function HandleRequestVersion(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleRequestVersion()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse.version) > 30  then
        AnnounceVersion(self)
        self._lastRequestResponse.version = currentTime
    end
end

--[[
    --- SPEC ---
]]
local function AnnounceSpec()
    LOG:Trace("ProfileInfoManager:AnnounceSpec()")
    local one, two, three = GetMyTalents()
    local message = ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_SPEC,
        ProfileInfoCommAnnounceSpec:New(one, two, three))
    Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function SetProfileSpec(name, spec)
    local profile = ProfileManager:GetProfileByName(name)
    if profile then
        profile:SetSpec(spec.one, spec.two, spec.three)
    end
end

local function StoreProfileSpec(self, name, spec)
    GetProfileDb(self, name).spec = spec
    -- self.db[name].spec = spec
end

local function RestoreSpecs(self)
    for name, info in pairs(self.db) do
        SetProfileSpec(name, info.spec)
    end
end

local function HandleAnnounceSpec(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleAnnounceSpec()")
    local receivedSpec = data:Spec()
    SetProfileSpec(sender, receivedSpec)
    StoreProfileSpec(self, sender, receivedSpec)
end

local function HandleRequestSpec(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleRequestSpec()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse.spec) > 30  then
        AnnounceSpec(self)
        self._lastRequestResponse.spec = currentTime
    end
end

--[[
    --- General ---
]]

local function HandleIncomingMessage(self, message, distribution, sender)
    LOG:Trace("ProfileInfoManager:HandleIncomingMessage()")
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self.handlers[mtype](self, message:Data(), sender)
    end
end

--[[
    --- PUBLIC ---
]]

local ProfileInfoManager = {}
function ProfileInfoManager:Initialize()
    LOG:Trace("ProfileInfoManager:Initialize()")
    self._initialized = false

    self._lastRequestResponse = { version = 0, spec = 0 }
    self._lastDisplayedMessage = 0
    self._lastDisplayedMessageD = 0

    local db = MODULES.Database:Personal()
    if not db.profileInfo then
        db.profileInfo = {}
        -- migration
        if db.version then
            for player, version in pairs(db.version) do
                db.profileInfo[player] = { version = version, spec = { one = 0, two = 0, three = 0} }
            end
        end
    end
    self.db = db.profileInfo

    self.handlers = {
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION]  = HandleAnnounceVersion,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION]   = HandleRequestVersion,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_SPEC]     = HandleAnnounceSpec,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_SPEC]     = HandleRequestSpec
    }

    Comms:Register(PROFILEINFO_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = ProfileInfoCommStructure:New(rawMessage)
        if CONSTANTS.PROFILE_INFO_COMM.TYPES[message:Type()] == nil then return end
        HandleIncomingMessage(self, message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            LOG:Message("Classic Loot Manager %s initialization complete.", ColorCodeText(CLM.CORE:GetVersionString(), "00cc00"))
            C_Timer.After(1, function()
                RestoreVersions(self)
                RestoreSpecs(self)
            end)
            C_Timer.After(math.random(2, 5), function()
                AnnounceVersion(self)
                AnnounceSpec(self)
            end)
            self._initialized = true
        end
    end)

    EventManager:RegisterWoWEvent("READY_CHECK", (function(...) AnnounceVersion(self) end))

    MODULES.ConfigManager:RegisterUniversalExecutor("ver", "Version", self)
end

function ProfileInfoManager:RequestVersion()
    LOG:Trace("ProfileInfoManager:RequestVersion()")
    local message = ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION, {})
    Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function ProfileInfoManager:RequestSpec()
    LOG:Trace("ProfileInfoManager:RequestSpec()")
    local message = ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_SPEC, {})
    Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

CONSTANTS.PROFILE_INFO_COMM = {
    TYPE = {
        ANNOUNCE_VERSION    = 1,
        REQUEST_VERSION     = 2,
        ANNOUNCE_SPEC       = 3,
        REQUEST_SPEC        = 4
    },
    TYPES = UTILS.Set({ 1, 2, 3, 4 })
}

MODULES.ProfileInfoManager = ProfileInfoManager