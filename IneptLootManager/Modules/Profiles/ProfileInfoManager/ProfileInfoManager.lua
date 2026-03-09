-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
local CONSTANTS = ILM.CONSTANTS
local UTILS     = ILM.UTILS
-- ------------------------------- --

local function GetProfileDb(self, name)
    if not self.db[name] then
        self.db[name] = {
            version = {
                major = 0,
                minor = 0,
                patch = 0,
                changeset = ""
            }
        }
    end
    return self.db[name]
end

--[[
    --- VERSION ---
]]
local function AnnounceVersion()
    LOG:Trace("ProfileInfoManager:AnnounceVersion()")
    local version = ILM.MODULES.Version:Get()
    local message = ILM.MODELS.ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION,
        ILM.MODELS.ProfileInfoCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset))
    ILM.MODULES.Comms:Send(ILM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function SetProfileVersion(name, version)
    local profile = ILM.MODULES.ProfileManager:GetProfileByName(name)
    if profile then
        profile:SetVersion(version.major, version.minor, version.patch, version.changeset)
    end
end

local function StoreProfileVersion(self, name, version)
    GetProfileDb(self, name).version = version
end

local function RestoreVersions(self)
    for name, info in pairs(self.db) do
        SetProfileVersion(name, info.version)
    end
end

local function HandleAnnounceVersion(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleAnnounceVersion()")
    local receivedVersion = data:Version()

    ILM.MODULES.Version:Check(receivedVersion)
    SetProfileVersion(sender, receivedVersion)
    StoreProfileVersion(self, sender, receivedVersion)
end

local function HandleRequestVersion(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleRequestVersion()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse.version) > 5  then
        AnnounceVersion()
        self._lastRequestResponse.version = currentTime
    end
end


--[[
    --- General ---
]]

local function HandleIncomingMessage(self, message, distribution, sender)
    LOG:Trace("ProfileInfoManager:HandleIncomingMessage()")
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self.handlers[mtype](self, message:Data(), sender)
    end
end

--[[
    --- PUBLIC ---
]]

local ProfileInfoManager = {}
function ProfileInfoManager:Initialize()
    LOG:Trace("ProfileInfoManager:Initialize()")
    self._initialized = false

    self._lastRequestResponse = { version = 0 }

    self.db = ILM.MODULES.Database:Personal('profileInfo', (function(table)
        -- Migration from version to playerInfo if it is empty
        if rawequal(next(table), nil) then
            for player, version in pairs(ILM.MODULES.Database:Personal('version')) do
                table[player] = {
                    version = version
                }
            end
        end
    end))

    self.handlers = {
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION]  = HandleAnnounceVersion,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION]   = HandleRequestVersion,
    }

    ILM.MODULES.Comms:Register(ILM.COMM_CHANNEL.GLOBAL, (function(rawMessage, distribution, sender)
        local message = ILM.MODELS.ProfileInfoCommStructure:New(rawMessage)
        if CONSTANTS.PROFILE_INFO_COMM.TYPES[message:Type()] == nil then return end
        HandleIncomingMessage(self, message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    ILM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            LOG:Message(ILM.L["Inept Loot Manager %s initialization complete. %s"], UTILS.ColorCodeText(ILM.MODULES.Version:GetString(), "00cc00"), "Created by |cffe6cc80Lantis|r Annalina-Mirage Raceway")
            if ILM.AF then LOG:Message("Happy |cff44ee44April Fools'|r raid week!") end
            C_Timer.After(1, function()
                RestoreVersions(self)
            end)
            C_Timer.After(math.random(2, 5), function()
                AnnounceVersion()
                if ILM.MODULES.ACL:IsTrusted() then
                    ILM.MODULES.ProfileInfoManager:RequestVersion()
                end
            end)
            self._initialized = true
        end
    end)

    ILM.MODULES.EventManager:RegisterWoWEvent("READY_CHECK", (function(...)
        AnnounceVersion()
    end))


end

function ProfileInfoManager:RequestVersion()
    LOG:Trace("ProfileInfoManager:RequestVersion()")
    local message = ILM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION, {})
    ILM.MODULES.Comms:Send(ILM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end


CONSTANTS.PROFILE_INFO_COMM = {
    TYPE = {
        ANNOUNCE_VERSION    = 1,
        REQUEST_VERSION     = 2
    },
    TYPES = UTILS.Set({ 1, 2 })
}

ILM.MODULES.ProfileInfoManager = ProfileInfoManager