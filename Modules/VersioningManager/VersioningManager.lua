local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS
local ACL = MODULES.ACL
local UTILS = CLM.UTILS

local Comms = MODULES.Comms
local LedgerManager = MODULES.LedgerManager
local ProfileManager = MODULES.ProfileManager

local ColorCodeText = UTILS.ColorCodeText

local VersioningCommStructure = MODELS.VersioningCommStructure
local VersioningCommAnnounceVersion = MODELS.VersioningCommAnnounceVersion

local VERSION_COMM_PREFIX = "Version"

local function stringifyVersion(version)
    return string.format("v%s.%s.%s", version.major or 0, version.minor or 0, version.patch or 0)
end

local VersioningManager = {}
function VersioningManager:Initialize()
    LOG:Trace("VersioningManager:Initialize()")
    self._initialized = false

    self._lastRequestResponse = 0
    self._lastDisplayedMessage = 0
    self._lastDisplayedMessageD = 0

    self.handlers = {
        [CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION]  = "HandleAnnounceVersion",
        [CONSTANTS.VERSIONNING_COMM.TYPE.REQUEST_VERSION]   = "HandleRequestVersion",
    }

    Comms:Register(VERSION_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = VersioningCommStructure:New(rawMessage)
        if CONSTANTS.VERSIONNING_COMM.TYPES[message:Type()] == nil then return end
        self:HandleIncomingMessage(message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            LOG:Message("Classic Loot Manager %s initialization complete.", ColorCodeText(CLM.CORE:GetVersionString(), "00cc00"))
            C_Timer.After(math.random(1, 5), function()
                self:AnnounceVersion()
            end)
            self._initialized = true
        end
    end)

    MODULES.ConfigManager:RegisterUniversalExecutor("ver", "Versioning", self)
end

function VersioningManager:AnnounceVersion()
    LOG:Trace("VersioningManager:AnnounceVersion()")
    local version = CLM.CORE:GetVersion()
    local message = VersioningCommStructure:New(
        CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION,
        VersioningCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset))
    Comms:Send(VERSION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function VersioningManager:RequestVersion()
    LOG:Trace("VersioningManager:RequestVersion()")
    local message = VersioningCommStructure:New(CONSTANTS.VERSIONNING_COMM.TYPE.REQUEST_VERSION, {})
    Comms:Send(VERSION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function VersioningManager:DirectSendVersion(target)
    LOG:Trace("VersioningManager:AnnounceVersion()")
    local version = CLM.CORE:GetVersion()
    local message = VersioningCommStructure:New(
        CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION,
        VersioningCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset))
    Comms:Send(VERSION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, target)
end

function VersioningManager:HandleIncomingMessage(message, distribution, sender)
    LOG:Trace("VersioningManager:HandleIncomingMessage()")
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self[self.handlers[mtype]](self, message:Data(), sender)
    end
end

function VersioningManager:OutOfDate(version, disable)
    LOG:Trace("VersioningManager:OutOfDate()")
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

function VersioningManager:HandleAnnounceVersion(data, sender)
    LOG:Trace("VersioningManager:HandleAnnounceVersion()")
    local currentVersion = CLM.CORE:GetVersion()
    local receivedVersion = data:Version()

    -- Check if we have older version
    if currentVersion.major < receivedVersion.major then
        self:OutOfDate(receivedVersion, true)
    else -- equal majors
        if currentVersion.minor < receivedVersion.minor then
            -- older minor
            self:OutOfDate(receivedVersion, false)
        elseif currentVersion.patch < receivedVersion.patch then
            if receivedVersion.changeset == "" then -- changeset = unofficial or beta. We don't care about that
                self:OutOfDate(receivedVersion, false)
            else
                LOG:Debug("Received version %s-%s", stringifyVersion(receivedVersion), receivedVersion.changeset)
            end
        end
    end
    -- Check if we have newer version
    if ACL:IsTrusted() then
        if  (currentVersion.major > receivedVersion.major) or
            (currentVersion.minor > receivedVersion.minor) or
            (currentVersion.patch > receivedVersion.patch) then

        end
    end
    -- Store received data
    local profile = ProfileManager:GetProfileByName(sender)
    if profile then
        profile:SetVersion(receivedVersion.major, receivedVersion.minor, receivedVersion.patch, receivedVersion.changeset)
    end
end

function VersioningManager:HandleRequestVersion(data, sender)
    LOG:Trace("VersioningManager:HandleRequestVersion()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse) > 30  then
        self:AnnounceVersion()
        self._lastRequestResponse = currentTime
    end
end

CONSTANTS.VERSIONNING_COMM = {
    TYPE = {
        ANNOUNCE_VERSION    = 1,
        REQUEST_VERSION     = 2
    },
    TYPES = UTILS.Set({ 1, 2 })
}

MODULES.VersioningManager = VersioningManager