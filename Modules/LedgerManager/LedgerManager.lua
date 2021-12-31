local _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG
local Comms = MODULES.Comms
local CONSTANTS = CLM.CONSTANTS
local ACL = MODULES.ACL
local UTILS = CLM.UTILS

local STATUS_SYNCED = "synced"
local STATUS_OUT_OF_SYNC = "out_of_sync"
-- local STATUS_UNKNOWN = "unknown"

local DeepCopy = UTILS.DeepCopy

local LedgerLib = LibStub("EventSourcing/LedgerFactory")

local LedgerManager = { _initialized = false}

local function authorize(entry, sender)
    return ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, sender)
end

local LEDGER_SYNC_COMM_PREFIX = "LedgerS1"
local LEDGER_DATA_COMM_PREFIX = "LedgerD1"

local previousCallback = nil
local function registerReceiveCallback(callback)
    if not previousCallback then
        previousCallback = callback
    end

    Comms:Register(LEDGER_SYNC_COMM_PREFIX, callback, function(name, length)
        return length < 5000 or ACL:CheckLevel(CONSTANTS.ACL.LEVEL.PLEBS, name)
    end)
    Comms:Register(LEDGER_DATA_COMM_PREFIX, callback, CONSTANTS.ACL.LEVEL.ASSISTANT)
end

local function restoreReceiveCallback()
    if previousCallback then
        registerReceiveCallback(previousCallback)
        previousCallback = nil
    end
end

local function createLedger(self, database)
    local ledger = LedgerLib.createLedger(
        database,
        (function(data, distribution, target, callbackFn, callbackArg)
            return Comms:Send(LEDGER_SYNC_COMM_PREFIX, data, distribution, target, "BULK")
        end), -- send
        registerReceiveCallback, -- registerReceiveHandler
        authorize, -- authorizationHandler
        (function(data, distribution, target, progressCallback)
            return Comms:Send(LEDGER_DATA_COMM_PREFIX, data, distribution, target, "BULK")
        end), -- sendLargeMessage
        0, 100, LOG)

        ledger.addSyncStateChangedListener(function(_, status)
            self:UpdateSyncState(status)
        end)

        return ledger
end

local function createLedgerAndRegisterCallbacks(self, database)
    local ledger = createLedger(self, database)

    -- Mutators
    for class, mutatorFn in pairs(self.mutatorCallbacks) do
        ledger.registerMutator(class, mutatorFn)
    end

    -- Update Handlers
    for _, callback in ipairs(self.onUpdateCallbacks) do
        ledger.addStateChangedListener(callback)
    end

    -- Restart Handlers
    for _,callback in ipairs(self.onRestartCallbacks) do
        ledger.addStateRestartListener(callback)
    end

    return ledger
end

function LedgerManager:Initialize()
    self.activeDatabase = MODULES.Database:Ledger()
    self.activeLedger = createLedger(self, self.activeDatabase)
    self.mutatorCallbacks = {}
    self.onUpdateCallbacks = {}
    self.onRestartCallbacks = {}
    self._initialized = true

    MODULES.ConfigManager:RegisterUniversalExecutor("ledger", "LedgerManager", self)
end

function LedgerManager:IsInitialized()
    return self._initialized
end

function LedgerManager:Enable()
    self.activeLedger.getStateManager():setUpdateInterval(50)
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        self.activeLedger.enableSending()
    end
end

-- This is not reversable until reload
function LedgerManager:Cutoff()
    self.activeLedger.disableSending()
    Comms:Suspend(LEDGER_SYNC_COMM_PREFIX)
    Comms:Suspend(LEDGER_DATA_COMM_PREFIX)
end

function LedgerManager:DisableAdvertising()
    self.activeLedger.disableSending()
end

function LedgerManager:TimeTravel(timestamp)
    self.timeTravelTarget = timestamp
    self.activeLedger.getStateManager():travelToTime(timestamp)
    self:UpdateSyncState()
end

function LedgerManager:EndTimeTravel()
    self.activeLedger.getStateManager():stopTimeTravel()
    self:UpdateSyncState()
end

function LedgerManager:IsTimeTraveling()
    if not self._initialized then return false end
    return self.activeLedger.getStateManager():isTimeTraveling()
end

function LedgerManager:GetTimeTravelTarget()
    return self.timeTravelTarget
end

function LedgerManager:EnterSandbox()
    LOG:Trace("LedgerManager:EnterSandbox()")
    -- Finalize everything on current ledger
    if self:IsTimeTraveling() then
        self:EndTimeTravel()
    end
    self.activeLedger.catchup()
    -- Backup database reference
    self._originalDatabase = self.activeDatabase
    -- Copy ledger database
    self.activeDatabase = DeepCopy(self._originalDatabase)
    -- Backup ledger
    self._originalLedger = self.activeLedger
    -- Create new ledger and substitute
    self.activeLedger = createLedgerAndRegisterCallbacks(self, self.activeDatabase)
    -- Mark as sandbox mode
    self.isSandbox = true
    -- Restarts
    for _,callback in ipairs(self.onRestartCallbacks) do
        callback()
    end
    -- Enable
    self:Enable()
    -- Update status
    self:UpdateSyncState()
end

function LedgerManager:ExitSandbox(apply)
    LOG:Trace("LedgerManager:ExitSandbox()")
    if apply then
        -- If we apply we simply keep the new ledger and discard old one
        -- We only update the database storage
        MODULES.Database:UpdateLedger(self.activeDatabase)
        self._originalDatabase = nil
        self._originalLedger = nil
    else
        -- Return the active from original ones
        self.activeDatabase = self._originalDatabase
        self.activeLedger = self._originalLedger
        -- Restore comm callbacks to the original
        restoreReceiveCallback()
    end
    -- Mark as active mode
    self.isSandbox = false
    -- Update status
    self:UpdateSyncState()
    -- restart
    self.activeLedger.getStateManager():restart()
end

function LedgerManager:RegisterEntryType(class, mutatorFn)
    if self.mutatorCallbacks[class] then
        LOG:Error("Class %s already exists in Ledger Entries.", class)
        return
    end
    self.mutatorCallbacks[class] = mutatorFn

    self.activeLedger.registerMutator(class, mutatorFn)
end

function LedgerManager:RegisterOnRestart(callback)
    table.insert(self.onRestartCallbacks, callback)
    self.activeLedger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    table.insert(self.onUpdateCallbacks, callback)
    self.activeLedger.addStateChangedListener(callback)
end

function LedgerManager:GetPeerStatus()
    return self.activeLedger.getPeerStatus()
end

function LedgerManager:RequestPeerStatusFromGuild()
    self.activeLedger.requestPeerStatusFromGuild()
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
end

function LedgerManager:IsInSync()
    return self.inSync
end

function LedgerManager:IsSyncOngoing()
    return self.syncOngoing
end

function LedgerManager:Lag()
    return self.activeLedger.getStateManager():lag()
end

function LedgerManager:Hash()
    return self.activeLedger.getStateManager():stateHash()
end

function LedgerManager:Length()
    return self.activeLedger.getSortedList():length()
end

function LedgerManager:GetData()
    return self.activeLedger.getSortedList():entries()
end

function LedgerManager:RequestPeerStatusFromRaid()
    self.activeLedger.requestPeerStatusFromRaid()
end

function LedgerManager:Submit(entry, catchup)
    LOG:Trace("LedgerManager:Submit()")
    if not entry then return end
    self.lastEntry = entry
    self.activeLedger.submitEntry(entry)
    if catchup then
        self.activeLedger.catchup()
    end
end

function LedgerManager:Remove(entry, catchup)
    LOG:Trace("LedgerManager:Remove()")
    if not entry then return end
    self.activeLedger.ignoreEntry(entry)
    if catchup then
        self.activeLedger.catchup()
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
    self.activeLedger.reset()
end
--@end-do-not-package@

MODULES.LedgerManager = LedgerManager
