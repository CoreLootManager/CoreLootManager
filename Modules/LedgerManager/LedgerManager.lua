local _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG
local Comms = MODULES.Comms
local CONSTANTS = CLM.CONSTANTS
local ACL = MODULES.ACL

local LedgerLib = LibStub("EventSourcing/LedgerFactory")

local LedgerManager = { _initialized = false}

local function authorize(entry, sender)
    return LedgerManager:Authorize(entry:class(), sender)
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
            Comms:Register(prefixData, callback, CONSTANTS.ACL.LEVEL.MANAGER)
        end), -- registerReceiveHandler
        authorize, -- authorizationHandler
        (function(data, distribution, target, progressCallback)
            return Comms:Send(prefixData, data, distribution, target, "BULK")
        end), -- sendLargeMessage
        0, 250, LOG
    )

    self.entryExtensions = {}
    self.authorizationLevel = {}
    self._initialized = true
end

function LedgerManager:Enable()
    self.ledger.getStateManager():setUpdateInterval(50)
    self.ledger.enableSending()
end

function LedgerManager:Authorize(class, sender)
    LOG:Trace("LedgerManager:Authorize()")
    if self.authorizationLevel[class] == nil then
        LOG:Warning("Unknown class [%s]", class)
        return false
    end
    return ACL:CheckLevel(self.authorizationLevel[class], sender)
end

function LedgerManager:RegisterEntryType(class, mutatorFn, authorizationLevel)
    if self.entryExtensions[class] then
        LOG:Error("Class %s already exists in Ledger Entries.", class)
        return
    end
    self.entryExtensions[class] = true

    self.ledger.registerMutator(class, mutatorFn)
    self.authorizationLevel[class:staticClassName()] = authorizationLevel
end

function LedgerManager:RegisterOnRestart(callback)
    self.ledger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    self.ledger.addStateChangedListener(callback)
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
