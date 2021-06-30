local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS
local ACL = CLM.ACL
local UTILS = CLM.UTILS

local Comms = MODULES.Comms
local LedgerManager = MODULES.LedgerManager

local ColorCodeText = UTILS.ColorCodeText

local VersioningCommStructure = MODELS.VersioningCommStructure
local VersioningCommAnnounceVersion = MODELS.VersioningCommAnnounceVersion
local VersioningCommRequestVersion = MODELS.VersioningCommRequestVersion
local VersioningCommAnnounceVersionWithRequest = MODELS.VersioningCommAnnounceVersionWithRequest

local VERSION_COMM_PREFIX = "Version"

local function stringifyVersion(version)
    return string.format("v%s.%s.%s", version.major or 0, version.minor or 0, version.patch or 0)
end

local VersioningManager = {}
function VersioningManager:Initialize()
    self._initialized = false

    self._lastDisplayedMessage = 0

    self.handlers = {
        [CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION]              = "HandleAnnounceVersion",
        [CONSTANTS.VERSIONNING_COMM.TYPE.REQUEST_VERSION]               = "HandleRequestVersion",
        [CONSTANTS.VERSIONNING_COMM.TYPE.ANNOUNCE_VERSION_WITH_REQUEST] = "HandleAnnounceVersion"
    }

    Comms:Register(VERSION_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = VersioningCommStructure:New(rawMessage)
        if CONSTANTS.VERSIONNING_COMM.TYPES[message:Type()] == nil then return end
        self:HandleIncomingMessage(message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS)

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            self:AnnounceVersion()
            self._initialized = true
        end
    end)
end

function VersioningManager:AnnounceVersion(skipRequest)
    local message
    local version = CLM:GetVersion()
    if ACL:IsTrusted() then
        message = VersioningCommAnnounceVersionWithRequest:New(version.major, version.minor, version.patch, version.changeset)
    else
        message = VersioningCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset)
    end
    Comms:Send(VERSION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function VersioningManager:HandleIncomingMessage(message, distribution, sender)
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self[self.handlers[mtype]](self, message:Data(), sender)
    end
end

function VersioningManager:OutOfDate(version, disable)
    local currentTime = GetServerTime()
    if disable then
    else
        if currentTime - self._lastDisplayedMessage > 300 then
            CLM:Message("New version of Classic Loot Manager (%s) is available. For best experience please update the AddOn.", ColorCodeText(stringifyVersion(version), "00cc00"))
            self._lastDisplayedMessage = currentTime
        end
    end
end

function VersioningManager:HandleAnnounceVersion(data, sender)

    local current_version = CLM:GetVersion()
    local received_version = data:Version()

    -- Check if we have a major difference
    if current_version.major > received_version.major then
        -- if ACL:IsTrusted() then
        --     message = VersioningCommAnnounceVersion:New(current_version.major, current_version.minor, current_version.patch, current_version.changeset)
        --     Comms:Send(VERSION_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.WHISPER, sender)
        -- end
    elseif current_version.major < received_version.major then
        self:OutOfDate(received_version, true)
    else -- equal majors
        if current_version.minor < received_version.minor then
            -- older minor
            self:OutOfDate(received_version, false)
        elseif current_version.patch < received_version.patch then
            if received_version.changeset == "" then -- changeset = unofficial or beta. We don't care about that
                self:OutOfDate(received_version, false)
            end
        end
    end


    if data:IsRequest() then
        self:HandleRequestVersion(data, sender)
    end
end

function VersioningManager:HandleRequestVersion(data, sender)

end

CONSTANTS.VERSIONNING_COMM = {
    TYPE = {
        ANNOUNCE_VERSION                = 1,
        REQUEST_VERSION                 = 2,
        ANNOUNCE_VERSION_WITH_REQUEST   = 3
    },
    TYPES = UTILS.Set({ 1, 2, 3 })
}

MODULES.VersioningManager = VersioningManager