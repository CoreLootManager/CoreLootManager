local _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG
local Comms = MODULES.Comms
local CONSTANTS = CLM.CONSTANTS
local ACL = MODULES.ACL
-- local UTILS = CLM.UTILS

local STATUS_SYNCED = "synced"
local STATUS_OUT_OF_SYNC = "out_of_sync"
-- local STATUS_UNKNOWN = "unknown"

-- local getGuidFromInteger = UTILS.getGuidFromInteger

local LedgerLib = LibStub("EventSourcing/LedgerFactory")

local LedgerManager = { _initialized = false}

local function authorize(entry, sender)
    return ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, sender)
end

function LedgerManager:Initialize()
    local prefixSync = "SLedger"
    local prefixData = "DLedger"
    self.ledger = LedgerLib.createLedger(
        MODULES.Database:Ledger(),
        (function(data, distribution, target, callbackFn, callbackArg)
            return Comms:Send(prefixSync, data, distribution, target, "BULK")
        end), -- send
        (function(callback)
            Comms:Register(prefixSync, callback, CONSTANTS.ACL.LEVEL.PLEBS)
            Comms:Register(prefixData, callback, CONSTANTS.ACL.LEVEL.ASSISTANT)
        end), -- registerReceiveHandler
        authorize, -- authorizationHandler
        (function(data, distribution, target, progressCallback)
            return Comms:Send(prefixData, data, distribution, target, "BULK")
        end), -- sendLargeMessage
        0, 50, LOG
    )
    self.ledger.addSyncStateChangedListener(function(_, status)
        self:UpdateSyncState(status) -- there is still something fishy about the Icon (securehook) and I don't know what
    end)
    self.entryExtensions = {}
    self._initialized = true

    MODULES.ConfigManager:RegisterUniversalExecutor("ledger", "LedgerManager", self)
end

function LedgerManager:IsInitialized()
    return self._initialized
end

function LedgerManager:Enable()
    self.ledger.getStateManager():setUpdateInterval(100)
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        self.ledger.enableSending()
    end
end

function LedgerManager:DisableAdvertising()
    self.ledger.disableSending()
end

function LedgerManager:RegisterEntryType(class, mutatorFn)
    if self.entryExtensions[class] then
        LOG:Error("Class %s already exists in Ledger Entries.", class)
        return
    end
    self.entryExtensions[class] = true

    self.ledger.registerMutator(class, mutatorFn)
end

function LedgerManager:RegisterOnRestart(callback)
    self.ledger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    self.ledger.addStateChangedListener(callback)
end

function LedgerManager:GetPeerStatus()
    return self.ledger.getPeerStatus()
end

function LedgerManager:RequestPeerStatusFromGuild()
    self.ledger.requestPeerStatusFromGuild()
end

function LedgerManager:UpdateSyncState(status)
    if self._initialized then
        if status == STATUS_SYNCED then
            self.inSync = true
            self.syncOngoing = false
        elseif status == STATUS_OUT_OF_SYNC then
            self.inSync = false
            self.syncOngoing = true
        else
            self.inSync = false
            self.syncOngoing = false
        end
    else
        self.inSync = false
        self.syncOngoing = false
    end
    -- CLM.MinimapDBI:UpdateState(self.inSync, self.syncOngoing)
end

function LedgerManager:IsInSync()
    return self.inSync
end

function LedgerManager:IsSyncOngoing()
    return self.syncOngoing
end

function LedgerManager:Lag()
    return self.ledger.getStateManager():lag()
end

function LedgerManager:Hash()
    return self.ledger.getStateManager():stateHash()
end
function LedgerManager:Length()
    return self.ledger.getSortedList():length()
end

function LedgerManager:RequestPeerStatusFromRaid()
    self.ledger.requestPeerStatusFromRaid()
end

function LedgerManager:Submit(entry, catchup)
    LOG:Trace("LedgerManager:Submit()")
    self.lastEntry = entry
    self.ledger.submitEntry(entry)
    if catchup then
        self.ledger.catchup()
    end
end

function LedgerManager:Remove(entry, catchup)
    LOG:Trace("LedgerManager:Remove()")
    self.ledger.ignoreEntry(entry)
    if catchup then
        self.ledger.catchup()
    end
end

function LedgerManager:CancelLastEntry()
    if not self._initialized then return end
    if self.lastEntry then
        self:Remove(self.lastEntry)
        self.lastEntry = nil
    end
end

MODULES.LedgerManager = LedgerManager
