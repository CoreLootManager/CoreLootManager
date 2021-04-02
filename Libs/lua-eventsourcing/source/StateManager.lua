--[[

State manager manages (re)playing the event log to calculate state

To work it requires a reference to a SortedList

]]--
local StateManager, _ = LibStub:NewLibrary("EventSourcing/StateManager", 1)
if not StateManager then
    return
end

local Util = LibStub("EventSourcing/Util")
local LogEntry = LibStub("EventSourcing/LogEntry")
-- PRIVATE FUNCTIONS
local EVENT = {
    STATE_CHANGED = 'state',
    RESTART = 'restart',
}

local function hydrateEntryFromList(entry, data)
    for i, key in ipairs(entry:fields()) do
        entry[key] = data[i]
    end
end

local function entryToList(entry)
    local result = {}
    for _, key in ipairs(entry:fields()) do
        table.insert(result, entry[key])
    end
    return result
end

local function applyEntry(stateManager, entry, index)
    if type(stateManager.handlers[entry:class()]) ~= 'function' then
        error("Callback for class " .. entry:class() .. "is not a function")
    end
    local result, hash

    stateManager.handlers[entry:class()](entry)
    stateManager.lastAppliedIndex = index
    stateManager.lastAppliedEntry = entry

    result, hash = coroutine.resume(stateManager.checksumCoroutine, LogEntry.time(entry))
    if not result then
        error("Error updating state hash: " .. hash)
    end
    result, hash = coroutine.resume(stateManager.checksumCoroutine, LogEntry.creator(entry))
    if not result then
        error("Error updating state hash: " .. hash)
    end
    stateManager.stateCheckSum = hash
end


--[[
  This function plays new entries, it is called repeatedly on a timer.
  The goal of each call is to remain under the frame render time
  Current solution: apply just 1 entry
]]--
local function updateState(stateManager)
    local entries = stateManager.list:entries()
    local applied = 0
    if stateManager.lastAppliedIndex > #entries
            or (stateManager.lastAppliedEntry ~= nil and entries[stateManager.lastAppliedIndex] ~= stateManager.lastAppliedEntry)
    then
        print("Detected list change, restarting state calc")
        stateManager:restart()
    end
    while applied < stateManager.batchSize and stateManager.lastAppliedIndex < #entries do
        local entry = entries[stateManager.lastAppliedIndex + 1]
        stateManager:castLogEntry(entry)
        -- This will throw an error if update fails, this is good since we don't want to update our tracking in that case.
        applyEntry(stateManager, entry, stateManager.lastAppliedIndex + 1)
        applied = applied + 1
    end
    if applied > 0 then
        stateManager:trigger(EVENT.STATE_CHANGED)
    end
end
-- END PRIVATE

function StateManager:new(list)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.list  = list
    o.uncommittedEntries = {}
    o.handlers = {}
    o.batchSize = 1
    o.metatables = {}
    o.errorCount = 0
    o.listeners = {}
    o.lastTick = 0
    o.measuredInterval = 0

    o:restart()
    return o
end

function StateManager:castLogEntry(table)
    if type(table) ~= 'table' then
        error(string.format("Argument 1 must be of type table, %s given", type(table)))
    end
    -- Find which meta table we should use
    if self.metatables[table.cls] == nil then
        error("Unknown class: " .. table.cls)
    end
    setmetatable(table, self.metatables[table.cls])
end

function StateManager:queueRemoteEvent(entry)
    table.insert(self.uncommittedEntries, entry)
end

function StateManager:createLogEntryFromList(list)
    if list.cls ~= nil then
        -- this is not really a list
        self:castLogEntry(list)
        return list
    end
    local class = table.remove(list)
    local entry = self:createLogEntryFromClass(class)
    hydrateEntryFromList(entry, list)
    return entry
end

function StateManager:createListFromEntry(entry)
    self:castLogEntry(entry)
    local result = entryToList(entry)
    table.insert(result, entry:class())
    return result
end

function StateManager:createLogEntryFromClass(cls)
    local table = {}
    if self.metatables[cls] == nil then
        error("Unknown class: " .. cls)
    end
    setmetatable(table, self.metatables[cls])
    table.cls = cls
    return table
end


function StateManager:registerHandler(eventType, handler)
    if eventType == nil or type(eventType) ~= "table" or eventType._cls == nil then
        --print(eventType)
        --Util.DumpTable(eventType)
        error("Event does not seem to have been created using LogEntry:extend()")
    end
    self.handlers[eventType._cls] = handler
    self.metatables[eventType._cls] = eventType
end

-- Applies all pending entries
function StateManager:catchup()
    self:commitUncommittedEntries()
    local entries = self.list:entries()
    if self.lastAppliedIndex == #entries then
        return
    end

    for i = self.lastAppliedIndex + 1, #entries do
        local entry = entries[i]
        self:castLogEntry(entry)
        applyEntry(self, entry, self.lastAppliedIndex + 1)
    end
    self.errorCount = 0
    self:trigger(EVENT.STATE_CHANGED)
end

function StateManager:setBatchSize(size)
    if type(size) ~= 'number' then
        error("Batch size must be a number")
    end
    self.batchSize = math.floor(size)
end

function StateManager:getBatchSize()
    return self.batchSize
end

function StateManager:commitUncommittedEntries()
    for _, v in ipairs(self.uncommittedEntries) do
        self.list:uniqueInsert(v)
    end
    self.uncommittedEntries = {}
end
--[[
  Higher means less noticeable lag
  @param float the interval in milliseconds to use for updating state
]]--
function StateManager:setUpdateInterval(interval)
    if self.ticker then
        self.ticker:Cancel()
    end
    if (interval == 0) then
        -- stop the timer
        return
    end
    self.ticker = C_Timer.NewTicker(interval / 1000, function()
        local t = GetTimePreciseSec()
        self.measuredInterval = t - self.lastTick
        self.lastTick = t

        self:commitUncommittedEntries()

        -- Skip state updates if we are in combat
        if (UnitAffectingCombat("player")) then
            return
        end

        local success, message = pcall(updateState, self)
        if (not success) then
            error(message)
            print(message)
            self.errorCount = self.errorCount + 1
        else
            self.errorCount = 0
        end

        if self.errorCount >= 10 then
            -- not strictly needed since the error() call below will also cancel the ticker
            self.ticker:Cancel()
            error("State manager auto update stopped, got 10 consecutive errors")
        end
    end)
end

function StateManager:getUpdateInterval()
    return math.floor(self.measuredInterval * 1000)
end

function StateManager:restart()
    self.lastAppliedIndex = 0
    self.lastAppliedEntry = nil
    self.stateCheckSum = 0
    self.checksumCoroutine = Util.IntegerChecksumCoroutine()
    self:trigger(EVENT.RESTART)
end


--[[
  @return int the number of entries the state is lagging behind the log
  @return int the number of entries that have not been committed to the log
]]--
function StateManager:lag()
    return #self.list:entries() - self.lastAppliedIndex, #self.uncommittedEntries
end

function StateManager:logSize()
    return #self.list:entries()
end

function StateManager:reset()
    self.list:wipe()
end

function StateManager:stateHash()
    return self.stateCheckSum
end
function StateManager:trigger(event)
    for _, callback in ipairs(self.listeners[event] or {}) do
        -- trigger callback, pass state manager
        callback(self)
    end
end

function StateManager:addStateChangedListener(callback)
    if self.listeners[EVENT.STATE_CHANGED] == nil then
        self.listeners[EVENT.STATE_CHANGED] = {}
    end
    table.insert(self.listeners[EVENT.STATE_CHANGED], callback)
end

function StateManager:addStateRestartListener(callback)
    if self.listeners[EVENT.RESTART] == nil then
        self.listeners[EVENT.RESTART] = {}
    end
    table.insert(self.listeners[EVENT.RESTART], callback)
end

function StateManager:getSortedList()
    return self.list
end
