local _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG
local Comms = MODULES.Comms
local CONSTANTS = CLM.CONSTANTS

local LedgerLib = LibStub("EventSourcing/LedgerFactory")

local LedgerManager = {}
function LedgerManager:Initialize()
    local prefixSync = "SLedger"
    local prefixData = "DLedger"
    self.ledger = LedgerLib.createLedger(
        MODULES.Database:Ledger(),
        (function(data, distribution, target, callbackFn, callbackArg)
            return Comms:Send(prefixSync, data, distribution, target, "BULK")
        end), -- send
        (function(callback)
            Comms:Register(prefixSync, callback, CONSTANTS.ACL.LEVEL.UNAUTHORISED)
            Comms:Register(prefixData, callback, CONSTANTS.ACL.LEVEL.MANAGER)
        end), -- registerReceiveHandler
        (function(entry, sender)
            return self.authorizationHandlers[entry:class()](sender) -- TODO: Change to direct ACL call?
        end), -- authorizationHandler
        (function(data, distribution, target, progressCallback)
            return Comms:Send(prefixData, data, distribution, target, "BULK")
        end), -- sendLargeMessage
        5000, 50
    )

    self.authorizationHandlers = {}
end

function LedgerManager:Enable()
    self.ledger.enableSending()
end

function LedgerManager:RegisterEntryType(class, mutatorFn, authorizationFn)
    if self.entryExtensions[class] then
        LOG:Fatal("Class " .. tostring(class) .. " already exists in Ledger Entries.")
        return nil
    end
    self.entryExtensions[class] = true

    self.ledger.registerMutator(class, mutatorFn)
    self.authorizationHandlers[class] = authorizationFn
end

function LedgerManager:RegisterOnRestart(callback)
    self.ledger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    self.ledger.addStateChangedListener(callback)
end

MODULES.LedgerManager = LedgerManager