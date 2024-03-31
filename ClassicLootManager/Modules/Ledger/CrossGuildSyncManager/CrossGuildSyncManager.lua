-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local XGUILD = CLM.L["Cross-Guild sync"]

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

local function AddSourcesAsTrusted(self)
    for _, source in ipairs(self.sources) do
        CLM.MODULES.TrustInfoProvider:AddExternalTrusted(source)
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
    for i=1,3 do
        options["xguild_player_name" .. tostring(i)] = {
            name = CLM.L["Player"],
            type = "input",
            width = "double",
            set = function() end,
            get = function() end,
            order = 2 + 2*(i-1)
        }
        options["xguild_sync_type" .. tostring(i)] = {
            name = CLM.L["Type"],
            type = "select",
            style = "radio",
            width = 1,
            set = function() end,
            get = function() end,
            order = 3 + 2*(i-1),
            values = XSYNC_TYPE_GUI
        }
    end
    CLM.MODULES.ConfigManager:Register(XGUILD, options)
end

local CrossGuildSyncManager = { _initialized = false }
function CrossGuildSyncManager:Initialize()
    self.targets = InitializeDB('targets')
    self.sources = InitializeDB('sources')

    -- Incoming sync -> trust that sources are trusted (one-time)
    AddSourcesAsTrusted(self)
    -- Tell library to announce to targets
    -- AddTargetsToLedgerP2P(self)
    -- Outgoing syncs -> filter out error messages (message filter)
    FilterOutWhisperErrorMessages(self)

    -- Register Configuration tables
    RegisterConfigurationOptions(self)

    self._initialized = true
end

CLM.MODULES.ConfigManager:AddGroup(XGUILD, true)

CLM.MODULES.CrossGuildSyncManager = CrossGuildSyncManager