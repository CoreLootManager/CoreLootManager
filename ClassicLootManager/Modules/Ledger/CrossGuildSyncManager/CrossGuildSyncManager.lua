-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --


local TargetCommsInfo = {}
function TargetCommsInfo:New(i)
    local o = i or {}

    setmetatable(o, self)
    self.__index = self

    if i then return o end

    o.isOnline = true
    o.lastSyncTry = 0
    o.offlineSince = math.huge

    return o
end

function TargetCommsInfo:ShouldSync()
    local now = GetServerTime()
    return self.isOnline                    -- is Online
        or (now - self.offlineSince < 300)  -- went online within last 5 minutes
        or (now - self.lastSyncTry < 300)   -- we havent checked in 5 minutes
end

function TargetCommsInfo:SyncStart()
    self.lastSyncTry = GetServerTime()
    self.timer = C_Timer.NewTimer(1, function(timer)
        self.isOnline = true
        self.offlineSince = math.huge
    end)
end

    -- return self.isOnline or (GetServerTime() - self.lastOnline < 300)
function TargetCommsInfo:SyncError()
    -- If player was online, we need to store when he went offline
    if self.isOnline then
        self.offlineSince = GetServerTime()
    end
    -- Mark player as offline
    self.isOnline = false
    -- Cancel auto-timer after the comms sending
    if self.timer then
        if not self.timer:IsCancelled() then
            self.timer:Cancel()
        end
    end
end


local function InitializeDB(key)
    local db = CLM.MODULES.Database:Server()
    if not db.xguildsync then
        db.xguildsync = {}
    end
    if not db.xguildsync[key] then
        db.xguildsync[key] = { }
    end
    return db.xguildsync[key]
end

local nameCache = {}
local function LazyAmbiguate(name)
    if not nameCache[name] then
        nameCache[name] = Ambiguate(name, "short")
    end
    return nameCache[name]
end

local function AddSourcesAsTrusted(self)
    for _, source in ipairs(self.sources) do
        CLM.MODULES.TrustInfoProvider:AddExternalTrusted(source)
    end
end

local function PrepareTargetCommsInfoCache(self)
    self.targetCommsInfoCache = {}
    for _, target in ipairs(self.targets) do
        self.targetCommsInfoCache[target] = TargetCommsInfo:New()
    end
end

local function IsTargetInMessage(target, message)
    return ERR_CHAT_PLAYER_NOT_FOUND_S:format(LazyAmbiguate(target)) == message
end

local function FilterOutWhisperErrorMessages(self)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", (function(_, _, message, ...)
        for target, _ in pairs(self.targetCommsInfoCache) do
            if IsTargetInMessage(target, message) then
                return true
            end
        end
        return false
    end))
end

local CrossGuildSyncManager = { _initialized = false }
function CrossGuildSyncManager:Initialize()
    self.targets = InitializeDB('targets')
    self.sources = InitializeDB('sources')

    -- Incoming sync -> trust that sources are trusted (one-time)
    AddSourcesAsTrusted(self)
    -- Outgoing syncs -> build online cache (one-time)
    PrepareTargetCommsInfoCache(self)
    -- Outgoing syncs -> filter out error messages (message filter)
    FilterOutWhisperErrorMessages(self)
    -- Outgoing syncs -> handle target availability (event callback)
    CLM.MODULES.EventManager:RegisterWoWEvent({"CHAT_MSG_SYSTEM"}, (function(_, _, message, ...)
        for target, targetInfo in pairs(self.targetCommsInfoCache) do
            if IsTargetInMessage(target, message) then
                targetInfo:SyncError() -- Player is offline
            end
        end
    end))

    self._initialized = true
end

function CrossGuildSyncManager:Handle(message, channel)
    for target, targetInfo in pairs(self.targetCommsInfoCache) do
        if targetInfo:ShouldSync() then
            local status = CLM.MODULES.Comms:Send(
                channel, message,
                CONSTANTS.COMMS.DISTRIBUTION.WHISPER, target,
                CONSTANTS.COMMS.PRIORITY.NORMAL)
            if status then
                targetInfo:SyncStart()
            end
        end
    end
end


CLM.MODULES.CrossGuildSyncManager = CrossGuildSyncManager