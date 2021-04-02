

local LedgerFactory, _ = LibStub:NewLibrary("EventSourcing/LedgerFactory", 1)
if not LedgerFactory then
    return
end

local ListSync = LibStub("EventSourcing/ListSync")
local LogEntry = LibStub("EventSourcing/LogEntry")
local StateManager = LibStub("EventSourcing/StateManager")

--[[
Params
  table: table -- Reference to the data, should be a saved variable
  send: function(tableData, distribution, target, progressCallback): void -- function the sync will use to send outgoing data
  sendLargeMessage: function(tableData, distribution, target, progressCallback): void -- function the sync will use to send large messages
  authorizationHandler: function(entry, sender): bool -- Authorization handler, called before sending outgoing entries and before
  committing incoming entries

  registerReceiveHandler: function(receiveCallback: function(message, distribution, sender)): void


Notes
  - Calling library must supply communication that takes care of serializing table typed data for sending across the network
  -




]]--
local function assertType(arg, name, expectedType, optional)
    if optional and arg == nil then
        return
    end

    if type(arg) ~=  expectedType then
        error(string.format("Expected argument %s to be of type %s, got %s insead", name, expectedType, type(arg)))
    end
end
local function assertFunction(arg, name, optional)
    return assertType(arg, name, 'function', optional)
end
local function assertTable(arg, name, optional)
    return assertType(arg, name, 'table', optional)
end

LedgerFactory.createLedger = function(table, send, registerReceiveHandler, authorizationHandler, sendLargeMessage,
    updateInterval, batchSize)
    assertTable(table, 'table')
    assertFunction(send, 'send')
    assertFunction(registerReceiveHandler, 'registerReceiveHandler')
    assertFunction(sendLargeMessage, 'sendLargeMessage', true)

    local sortedList = LogEntry.sortedList(table)
    local stateManager = StateManager:new(sortedList)
    local listSync = ListSync:new(stateManager, send, registerReceiveHandler, authorizationHandler, sendLargeMessage)

    stateManager:setUpdateInterval(updateInterval or 500)
    stateManager:setBatchSize(batchSize or 50)

    return {
        getSortedList = function()
            return sortedList
        end,
        getListSync = function()
            return listSync
        end,
        getStateManager = function()
            return stateManager
        end,
        registerMutator = function(metatable, mutatorFunc)
            stateManager:registerHandler(metatable, mutatorFunc)
        end,
        submitEntry = function(entry)
            if listSync:transmitViaGuild(entry) then
                -- only commit locally if we are authorized to send
                sortedList:uniqueInsert(entry)
            else
                error("Attempted to submit entries for which you are not authorized")
            end
        end,
        catchup = function(entry)
            stateManager:catchup()
        end,
        reset = function()
            stateManager:reset()
        end,
        addStateRestartListener = function(callback)
            stateManager:addStateRestartListener(callback)
        end,
        addStateChangedListener = function(callback)
            -- We hide the state manager from this callback
            --
            stateManager:addStateChangedListener(function(_)
                local lag, uncommitted = stateManager:lag()
                return callback(lag, uncommitted, stateManager:stateHash())
            end)
        end,
        enableSending = function ()
            listSync:enableSending()
        end,
        disableSending = function()
            listSync:disableSending()
        end



    }
end
