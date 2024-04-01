-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local XGUILD = CLM.L["Cross-Guild sync"]
local MAX_ENTRIES = 4
local XSYNC_TYPE = {
    SOURCE = 1,
    TARGET = 2,
    PEER_TO_PEER = 3
}


local XSYNC_TYPE_GUI = {
    CLM.L["Source"],
    CLM.L["Target"],
    CLM.L["Peer to Peer"]
}

local TARGETS = {XSYNC_TYPE.TARGET, XSYNC_TYPE.PEER_TO_PEER}
local SOURCES = {XSYNC_TYPE.SOURCE, XSYNC_TYPE.PEER_TO_PEER}

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
        nameCache[name] = Ambiguate(name, "none")
    end
    return nameCache[name]
end


local function Update(self)
    for i=1,MAX_ENTRIES do
        local id = tostring(i)

    end
end


local function IsTargetInMessage(target, message)
    return ERR_CHAT_PLAYER_NOT_FOUND_S:format(LazyAmbiguate(target)) == message
end


local function FilterOutWhisperErrorMessages(self)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", (function(_, _, message, ...)
        for id, target in pairs(self.types) do
            if TARGETS[target] then
                if IsTargetInMessage(self.players[id], message) then
                    return true
                end
            end
        end
        return false
    end))
end


local function UpdateTarget(self, id, target)
    if target == "" then
        self.players[id] = nil
    else
        self.players[id] = target
    end
    Update(self)
end

local function GetTarget(self, id)
    return self.players[id]
end

local function SanitizeType(type)
    local n = tonumber(type)
    if n >= 0 and n <= #XSYNC_TYPE_GUI then
        return n
    else
        return 0
    end
end

local function UpdateType(self, id, type)
    if type == "" then
        self.types[id] = nil
    else
        self.types[id] = SanitizeType(type)
    end
    Update(self)
end

local function GetType(self, id)
    return self.types[id]
end

local function RegisterConfigurationOptions(self)
    local options = {
        xguild_desc = {
            name = CLM.L["Cross-guild synchronisation allows connecting two guild data through proxy mechanism called tunneling. Three types of connection are available: Source, Target and Peer to Peer. Use this functionality only if you are absolutely sure you know what you are doing."],
            type = "description",
            width = "full",
            fontSize = "medium",
            order = 1
        }
    }
    for i=1,MAX_ENTRIES do
        local id = tostring(i)
        options["xguild_player_name" .. id] = {
            name = CLM.L["Player"],
            type = "input",
            width = "double",
            set = function(_, v) UpdateTarget(self, id, v) end,
            get = function() return GetTarget(self, id) end,
            order = 2 + 2*(i-1)
        }
        options["xguild_sync_type" .. id] = {
            name = CLM.L["Type"],
            type = "select",
            style = "radio",
            width = 1,
            set = function(_, v) UpdateType(self, id, v) end,
            get = function() return GetType(self, id) end,
            order = 3 + 2*(i-1),
            values = XSYNC_TYPE_GUI
        }
    end
    CLM.MODULES.ConfigManager:Register(XGUILD, options)
end

local function Initialize(self)
    for i=1,MAX_ENTRIES do
        local id = tostring(i)
        if not self.players[id] then
            self.players[id] = ""
        end
        if not self.types[id] then
            self.types[id] = 0
        end
    end
end

local CrossGuildSyncManager = { _initialized = false }
function CrossGuildSyncManager:Initialize()
    self.players = InitializeDB('players')
    self.types   = InitializeDB('types')

    -- Initialize Entries
    Initialize(self)
    -- Register Configuration tables
    RegisterConfigurationOptions(self)
    -- Outgoing syncs -> filter out error messages (message filter)
    FilterOutWhisperErrorMessages(self)
    -- Incoming sync -> trust that sources are trusted (one-time)
    -- Tell library to announce to targets
    Update(self)
    self._initialized = true
end

CLM.MODULES.ConfigManager:AddGroup(XGUILD, true)

CLM.MODULES.CrossGuildSyncManager = CrossGuildSyncManager