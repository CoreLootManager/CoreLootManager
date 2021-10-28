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

local LEDGER_SYNC_COMM_PREFIX = "LedgerS001"
local LEDGER_DATA_COMM_PREFIX = "LedgerD001"

function LedgerManager:Initialize()
    self.currentLedger = LedgerLib.createLedger(
        MODULES.Database:Ledger(),
        (function(data, distribution, target, callbackFn, callbackArg)
            return Comms:Send(LEDGER_SYNC_COMM_PREFIX, data, distribution, target, "BULK")
        end), -- send
        (function(callback)
            Comms:Register(LEDGER_SYNC_COMM_PREFIX, callback, CONSTANTS.ACL.LEVEL.PLEBS)
            Comms:Register(LEDGER_DATA_COMM_PREFIX, callback, CONSTANTS.ACL.LEVEL.ASSISTANT)
        end), -- registerReceiveHandler
        authorize, -- authorizationHandler
        (function(data, distribution, target, progressCallback)
            return Comms:Send(LEDGER_DATA_COMM_PREFIX, data, distribution, target, "BULK")
        end), -- sendLargeMessage
        0, 100, LOG
    )
    self.currentLedger.addSyncStateChangedListener(function(_, status)
        self:UpdateSyncState(status)
    end)
    self.entryExtensions = {}
    self._initialized = true

    MODULES.ConfigManager:RegisterUniversalExecutor("ledger", "LedgerManager", self)
end

function LedgerManager:IsInitialized()
    return self._initialized
end

function LedgerManager:Enable()
    self.currentLedger.getStateManager():setUpdateInterval(50)
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        self.currentLedger.enableSending()
    end
end

-- This is not reversable until reload
function LedgerManager:Cutoff()
    self.currentLedger.disableSending()
    Comms:Suspend(LEDGER_SYNC_COMM_PREFIX)
    Comms:Suspend(LEDGER_DATA_COMM_PREFIX)
end

function LedgerManager:DisableAdvertising()
    self.currentLedger.disableSending()
end

function LedgerManager:TimeTravel(timestamp)
    self.timeTravelTarget = timestamp
    self.currentLedger.getStateManager():travelToTime(timestamp)
    self:UpdateSyncState()
end

function LedgerManager:EndTimeTravel()
    self.currentLedger.getStateManager():stopTimeTravel()
    self.currentLedger.getStateManager():restart() -- Not done in this version in lib
    self:UpdateSyncState()
end

function LedgerManager:IsTimeTraveling()
    return self.currentLedger.getStateManager():isTimeTraveling()
end

function LedgerManager:GetTimeTravelTarget()
    return self.timeTravelTarget
end

function LedgerManager:EnterSandbox()
    self.currentLedger.catchup()

    self:UpdateSyncState()
end

function LedgerManager:ExitSandbox()
    self:UpdateSyncState()
end

function LedgerManager:RegisterEntryType(class, mutatorFn)
    if self.entryExtensions[class] then
        LOG:Error("Class %s already exists in Ledger Entries.", class)
        return
    end
    self.entryExtensions[class] = true

    self.currentLedger.registerMutator(class, mutatorFn)
end

function LedgerManager:RegisterOnRestart(callback)
    self.currentLedger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    self.currentLedger.addStateChangedListener(callback)
end

function LedgerManager:GetPeerStatus()
    return self.currentLedger.getPeerStatus()
end

function LedgerManager:RequestPeerStatusFromGuild()
    self.currentLedger.requestPeerStatusFromGuild()
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
    return self.currentLedger.getStateManager():lag()
end

function LedgerManager:Hash()
    return self.currentLedger.getStateManager():stateHash()
end
function LedgerManager:Length()
    return self.currentLedger.getSortedList():length()
end

function LedgerManager:RequestPeerStatusFromRaid()
    self.currentLedger.requestPeerStatusFromRaid()
end

function LedgerManager:Submit(entry, catchup)
    LOG:Trace("LedgerManager:Submit()")
    if not entry then return end
    self.lastEntry = entry
    self.currentLedger.submitEntry(entry)
    if catchup then
        self.currentLedger.catchup()
    end
end

function LedgerManager:Remove(entry, catchup)
    LOG:Trace("LedgerManager:Remove()")
    if not entry then return end
    self.currentLedger.ignoreEntry(entry)
    if catchup then
        self.currentLedger.catchup()
    end
end

function LedgerManager:CancelLastEntry()
    if not self._initialized then return end
    if self.lastEntry then
        self:Remove(self.lastEntry)
        self.lastEntry = nil
    end
end

function LedgerManager:Wipe()
    if not self._initialized then return end
    self:DisableAdvertising()
    local db = MODULES.Database:Ledger()
    wipe(db)
    collectgarbage()
    self:Enable()
end

--@do-not-package@
function LedgerManager:Reset()
    self.currentLedger.reset()
end
--@end-do-not-package@

MODULES.LedgerManager = LedgerManager
