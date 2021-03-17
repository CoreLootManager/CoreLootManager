local _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG
local Comms = MODULES.Comms
local CONSTANTS = CLM.CONSTANTS

local LedgerLib = LibStub("EventSourcing/LedgerFactory")
local LogEntry  = LibStub("EventSourcing/LogEntry")

local LedgerManager = {}
function LedgerManager:Initialize()
    local prefix = "Ledger"
    self.ledger = LedgerLib.createLedger(
        MODULES.Database:Ledger(),
        (function(data, distribution, target, callbackFn, callbackArg)
            return Comms:Send(prefix, data, distribution, target, "BULK")
        end),
        (function(callback)
            Comms:Register(prefix, callback, CONSTANTS.ACL.LEVEL.UNAUTHORISED)
        end)
    )
    self.ledger:getStateManager():setUpdateInterval(5000)
end

function LedgerManager:Enable()
    self.ledger.enableSending()
end

function LedgerManager:CreateEntryType(class)
    if self.entryExtensions[class] then
        LOG:Fatal("Class " .. tostring(class) .. " already exists in Ledger Entries.")
        return nil
    end
    self.entryExtensions[class] = true
    return LedgerLib:extend(class)
end

function LedgerManager:RegisterMutator(class, fn)
    if self.entryExtensions[class] then
        self.ledger.registerMutaor(class, fn)
    else
        LOG:Warning("Ignored registering mutator for non-existent class " .. tostring(class))
    end
end

function LedgerManager:RegisterOnRestart(callback)
    self.ledger.addStateRestartListener(callback)
end

function LedgerManager:RegisterOnUpdate(callback)
    self.ledger.addStateChangedListener(callback)
end

MODULES.LedgerManager =  LedgerManager