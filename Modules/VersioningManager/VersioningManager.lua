local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS

local Comms = MODULES.Comms
local LedgerManager = MODULES.LedgerManager

local VersioningCommStructure = MODELS.VersioningCommStructure

local VERSION_COMM_PREFIX = "Version"

local VersioningManager = {}

function VersioningManager:Initialize()
    self._initialized = false

    Comms:Register(VERSION_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = BiddingCommStructure:New(rawMessage)
        if CONSTANTS.VERSIONNING_COMM.TYPES[message:Type()] == nil then return end
        .self:HandleIncomingMessage(message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            self:AnnounceVersion()
            self._initialized = true
        end
    end)
end

function VersioningManager:AnnounceVersion()
    
end

function VersioningManager:HandleIncomingMessage(message, distribution, sender)

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