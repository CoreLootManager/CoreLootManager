--[[

State manager manages (re)playing the event log to calculate state

To work it requires a reference to a SortedList

]]--
local StateManager, _ = LibStub:NewLibrary("EventSourcing/StateManager", 3)
if not StateManager then
    return
end

local Util = LibStub("EventSourcing/Util")
local LogEntry = LibStub("EventSourcing/LogEntry")
local IgnoreEntry = LibStub("EventSourcing/IgnoreEntry")
-- PRIVATE FUNCTIONS
local EVENT = {
    STATE_CHANGED = 'state',
    RESTART = 'restart',
    MUTATOR_FAILED = 'mutator_failed'
}

local function hydrateEntryFromList(entry, data)
    for i, key in ipairs(entry:fields()) do
        entry[key] = data[i]
    end
end

local function trigger(stateManager, event, ...)
    for _, callback in ipairs(stateManager.listeners[event] or {}) do
        -- trigger callback, pass state manager
        local success, result = pcall(callback, stateManager, ...)
        if not success then
            stateManager.logger:Warning("Event handler for event %s failed with error %s", event, result);
        end

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

    --[[ Check ignored entries ]]--
    local uuid = entry:uuid();
    local numbersForHash = LogEntry.numbersForHash(entry);

    if (stateManager.ignoredEntries[uuid] ~= nil) then
        stateManager.ignoredEntries[uuid] = nil
    else
        stateManager.handlers[entry:class()](entry)
    end

    --[[
    Ignored entries don't have their handlers called, everything else stays the same.
    They still are applied and have an effect on the state hash

    ]]--


    stateManager.lastAppliedIndex = index
    stateManager.lastAppliedEntry = entry

    stateManager.updatingState = false

    for _, v in ipairs(numbersForHash) do
        result, hash = coroutine.resume(stateManager.checksumCoroutine, v)
        if not result then
            error("Error updating state hash: " .. hash)
        end
    end
    stateManager.stateCheckSum = hash
end

--[[
    Restart the state manager, if a restart is required.
    Will throttle (automated) restarts.
    @return true if a restart is no longer required, false if a restart is required but was not executed due to throttling.
]]
local function restartIfRequired(stateManager, ignoreThrottle)
    local entries = stateManager.list:entries()
    if stateManager.lastAppliedIndex > #entries
            or (stateManager.lastAppliedEntry ~= nil and entries[stateManager.lastAppliedIndex] ~= stateManager.lastAppliedEntry)
    then
        stateManager.logger:Info("Detected non-chronological list change")
        if (ignoreThrottle ~= true and GetTime() - stateManager.lastRestartTime < 5) then
            stateManager.logger:Debug("Restart throttled")
            return false
        end
        stateManager:restart()
    end
    return true
end
--[[
  This function plays new entries, it is called repeatedly on a timer.
  The goal of each call is to remain under the frame render time
]]--
local function updateState(stateManager, batchSize)
    local entries = stateManager.list:entries()
    local applied = 0
    while applied < batchSize and stateManager.lastAppliedIndex < #entries do
        local entry = entries[stateManager.lastAppliedIndex + 1]
        stateManager:castLogEntry(entry)
        if (stateManager.timeTraveling ~= nil and entry:time() > stateManager.timeTraveling) then
            if applied > 0 then
                print(string.format("Stopping state updates due to time travel restriction, applied %d events", applied))
            end
            break
        end
        -- This will throw an error if update fails, this is good since we don't want to update our tracking in that case.
        applyEntry(stateManager, entry, stateManager.lastAppliedIndex + 1)
        applied = applied + 1
    end
    if applied > 0 then
        trigger(stateManager, EVENT.STATE_CHANGED)
    end
end

local function safeUpdateState(stateManager, limit)
    if (stateManager.updatingState) then
        error("Recursive state update detected")
    end

    stateManager.updatingState = true
    local success, message = pcall(updateState, stateManager, limit or #stateManager.list:entries())
    stateManager.updatingState = false
    return success, message
end

-- END PRIVATE

function StateManager:new(list, logger)
    Util.assertTable(list, 'list')
    Util.assertLogger(logger)

    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.list  = list
    o.logger = logger
    o.uncommittedEntries = {}
    o.handlers = {}
    o.batchSize = 1
    o.metatables = {}
    o.ignoredEntries = {}
    o.listeners = {}
    o.lastTick = 0
    o.measuredInterval = 0
    o.timeTraveling = nil

    o.handleIgnoreEntry = function(entry)
        o.ignoredEntries[entry.ref] = true;
    end
    o:registerHandler(IgnoreEntry.class(), o.handleIgnoreEntry)
    o:restart()
    return o
end

function StateManager:travelToTime(timestamp)

    if self.timeTraveling == nil or self.timeTraveling > timestamp then
        self.timeTraveling = timestamp
        self:restart()
    else
        self.timeTraveling = timestamp
    end
end
function StateManager:stopTimeTravel()
    self.timeTraveling = nil
end

function StateManager:isTimeTraveling()
    return self.timeTraveling ~= nil
end

function StateManager:castLogEntry(table)
    -- Find which meta table we should use
    local class = LogEntry.class(table)
    if self.metatables[class] == nil then
        error("Unknown class: " .. class)
    end
    setmetatable(table, self.metatables[class])
end

function StateManager:queueRemoteEvent(entry)
    table.insert(self.uncommittedEntries, entry)
end


function StateManager:addEvent(entry)
    if self.timeTraveling ~= nil and Util.time() - entry:time() < 5  then
        -- force catchup since we need it for the counter
        self:catchup()
        -- We're time traveling and the newly created entry was created in the last 5 seconds.
        -- We assume it is meant to have the timeTraveled stamp.
        entry:setTime(self.timeTraveling)
        if self.lastAppliedEntry ~= nil then
            entry:setCounter(self.lastAppliedEntry:counter() + 1)
        end
    end

    self.list:uniqueInsert(entry)

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
    LogEntry.setClass(table, cls)
    return table
end


function StateManager:registerHandler(eventType, handler)
    local class = LogEntry.staticClassName(eventType)
    self.handlers[class] = handler
    self.metatables[class] = eventType
end

-- Applies all pending entries
function StateManager:catchup(limit)

    restartIfRequired(self, true)
    self:commitUncommittedEntries()
    -- reset the last restart time so it will always restart if required
    local success, message = safeUpdateState(self, limit)
    if (not success) then
        if self.ticker ~= nil then
            self.ticker:Cancel()
        end
        self.logger:Fatal("State update failed with error: %s", message)
        local nextEntry = self.list:entries()[self.lastAppliedIndex + 1]
        trigger(self, EVENT.MUTATOR_FAILED, nextEntry)
    end
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
        if LogEntry.class(v) == nil then
            self.logger:Warning("Ignoring entry without class")
        else
            self.list:uniqueInsert(v)
        end

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
        if restartIfRequired(self) == false then
            return
        end
        local success, message = safeUpdateState(self, self.batchSize)
        if (not success) then
            self.ticker:Cancel()
            self.logger:Fatal("State update failed with error: %s", message)
            local nexEntry = self.list:entries()[self.lastAppliedIndex + 1]
            trigger(self, EVENT.MUTATOR_FAILED, nexEntry)
        end

    end)
end

function StateManager:getUpdateInterval()
    return math.floor(self.measuredInterval * 1000)
end

function StateManager:restart()
    self.logger:Info("Restarting state manager")
    self.lastAppliedIndex = 0
    self.lastAppliedEntry = nil
    self.lastRestartTime = GetTime()
    self.stateCheckSum = 0
    self.checksumCoroutine = Util.IntegerChecksumCoroutine()
    trigger(self, EVENT.RESTART)
end


--[[
  @return int the number of entries the state is lagging behind the log
  @return int the number of entries that have not been committed to the log
]]--
function StateManager:lag()
    if self.timeTraveling ~= nil and #self.list:entries() > self.lastAppliedIndex  then
        local nextEntry = self.list:entries()[self.lastAppliedIndex + 1]
        self:castLogEntry(nextEntry)
        if (nextEntry:time() > self.timeTraveling) then
            return 0, 0
        else
            return 1, 0 -- this is a hack, during time travel lag will be binary
        end
    end
    if restartIfRequired(self) == false then
        -- A restart is needed but has not been done due to throttling.
        return #self.list:entries(), #self.uncommittedEntries
    end
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

local function addEventListener(stateManager, event, callback)
    if stateManager.listeners[event] == nil then
        stateManager.listeners[event] = {}
    end
    table.insert(stateManager.listeners[event], callback)
end

function StateManager:addStateChangedListener(callback)
    addEventListener(self, EVENT.STATE_CHANGED, callback);
end

function StateManager:addStateRestartListener(callback)
    addEventListener(self, EVENT.RESTART, callback);
end

function StateManager:addMutatorFailedListener(callback)
    addEventListener(self, EVENT.MUTATOR_FAILED, callback);
end

function StateManager:getSortedList()
    return self.list
end

function StateManager:createIgnoreEntry(entry, creator)
    local counter
    local index = self.list:searchGreaterThanOrEqual(entry)
    local entries = self.list:entries()
    if index == nil then
        error("Entry to ignore not found in the list1")
    end
    if entries[index]:uuid() ~= entry:uuid() then
        error("Entry to ignore not found in the list2")
    end

    while index > 0 and entries[index]:time() == entry:time() do
        counter = entries[index]:counter()
        index = index - 1
    end
    return IgnoreEntry.create(entry, creator, counter - 1)
end