local define = LibDependencyInjection.createContext(...)

define.module("LedgerManager", {
    "Utils", "Log",
    "Constants",  "LibStub:EventSourcing/LedgerFactory", "Comms", "Acl", "Database", "Modules", "GlobalConfigs", "Constants/AclLevel"
}, function(resolve, UTILS, LOG, CONSTANTS, LedgerLib, Comms, Acl, Database, Modules, GlobalConfigs, AclLevel)
local pairs, ipairs = pairs, ipairs
local wipe, collectgarbage, tinsert = wipe, collectgarbage, table.insert

local STATUS_SYNCED = "synced"
local STATUS_OUT_OF_SYNC = "out_of_sync"
-- local STATUS_UNKNOWN = "unknown"
local STATUS_UNKNOWN_TYPE = "unknown_type"


local LEDGER_SYNC_COMM_PREFIX = "LedgerS2"
local LEDGER_DATA_COMM_PREFIX = "LedgerD2"

local previousCallback = nil
local function registerReceiveCallback(callback)
    if not previousCallback then
        previousCallback = callback
    end

    -- Comms:Register(LEDGER_SYNC_COMM_PREFIX, callback, function(name, length)
    --     return length < 4096
    -- end)
    Comms:Register(LEDGER_SYNC_COMM_PREFIX, callback, AclLevel.PLEBS)
    Comms:Register(LEDGER_DATA_COMM_PREFIX, callback, AclLevel.ASSISTANT)
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
        (function(entry, sender)
            return Acl:CheckLevel(AclLevel.ASSISTANT, sender)
        end), -- authorizationHandler
        (function(data, distribution, target, progressCallback)
            return Comms:Send(LEDGER_DATA_COMM_PREFIX, data, distribution, target, "BULK")
        end), -- sendLargeMessage
        0, 100, LOG)

        ledger.addSyncStateChangedListener(function(_, status)
            self:UpdateSyncState(status)
        end)

        -- ledger.setDefaultHandler(function()
        --     self:UpdateSyncState(STATUS_UNKNOWN_TYPE)
        --     LOG:Warning("LegerManager: Entering incoherent state.")
        -- end)

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

local LedgerManager = {
    activeDatabase = Database:Ledger(),
    mutatorCallbacks = {},
    onUpdateCallbacks = {},
    onRestartCallbacks = {}
}
LedgerManager.activeLedger = createLedger(LedgerManager, LedgerManager.activeDatabase)

function LedgerManager:IsInitialized()
    return true
end

function LedgerManager:Enable()
    self.activeLedger.getStateManager():setUpdateInterval(50)
    if GlobalConfigs:GetDisableSync() then
        LedgerManager:Cutoff()
        LOG:Message("Ledger synchronisation was disabled. Use this at your own risk.")
    else
        if Acl:CheckLevel(AclLevel.ASSISTANT) then
            self.activeLedger.enableSending()
        end
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
    return self.activeLedger.getStateManager():isTimeTraveling()
end

function LedgerManager:TimeTravelProgress()
    local firstEntry = self:GetData()[1]
    if not firstEntry then return 1 end

    local sm = self.activeLedger.getStateManager()
    local currentEntry = sm.list:entries()[sm.lastAppliedIndex]
    if not currentEntry then return 1 end

    local startTime = firstEntry:time()
    local currentTime = currentEntry:time() - startTime
    local endTime = self.timeTravelTarget - startTime

    return UTILS.round(currentTime/endTime, 2)
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
    self.activeDatabase = UTILS.DeepCopy(self._originalDatabase)
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
        Database:UpdateLedger(self.activeDatabase)
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
    tinsert(self.onRestartCallbacks, callback)
    self.activeLedger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    tinsert(self.onUpdateCallbacks, callback)
    self.activeLedger.addStateChangedListener(callback)
end

function LedgerManager:GetPeerStatus()
    return self.activeLedger.getPeerStatus()
end

function LedgerManager:RequestPeerStatusFromGuild()
    self.activeLedger.requestPeerStatusFromGuild()
end

function LedgerManager:UpdateSyncState(status)
    self.incoherentState = false
    self.inSync = false
    self.syncOngoing = false
    if status == STATUS_UNKNOWN_TYPE then
        self.incoherentState = true
    elseif status == STATUS_SYNCED then
        self.inSync = true
    elseif status == STATUS_OUT_OF_SYNC then
        self.syncOngoing = true
    end
end

function LedgerManager:IsInIncoherentState()
    return self.incoherentState
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
    if self.lastEntry then
        self:Remove(self.lastEntry)
        self.lastEntry = nil
    end
end

function LedgerManager:Wipe()
    self:DisableAdvertising()
    local db = Database:Ledger()
    wipe(db)
    collectgarbage()
    self:Enable()
end

--@do-not-package@
function LedgerManager:Reset()
    self.activeLedger.reset()
end
--@end-do-not-package@

Modules.LedgerManager = LedgerManager
resolve(LedgerManager)
end)
