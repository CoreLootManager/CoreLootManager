-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local function GetProfileDb(self, name)
    if not self.db[name] then
        self.db[name] = {
            version = {
                major = 0,
                minor = 0,
                patch = 0,
                changeset = ""
            },
            spec = {
                one = 0,
                two = 0,
                three = 0
            },
            role = "NONE"
        }
    end
    return self.db[name]
end

--[[
    --- VERSION ---
]]
local function AnnounceVersion()
    LOG:Trace("ProfileInfoManager:AnnounceVersion()")
    local version = CLM.MODULES.Version:Get()
    local message = CLM.MODELS.ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION,
        CLM.MODELS.ProfileInfoCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset))
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function SetProfileVersion(name, version)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
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

    CLM.MODULES.Version:Check(receivedVersion)
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
    --- ROLE ---
]]
local function AnnounceRole()
    LOG:Trace("ProfileInfoManager:AnnounceRole()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_ROLE,
        CLM.MODELS.ProfileInfoCommAnnounceRole:New(UTILS.GetMyRole()))
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function SetProfileRole(name, role)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
    if profile then
        profile:SetRole(role)
    end
end

local function StoreProfileRole(self, name, role)
    GetProfileDb(self, name).role = role
end

local function RestoreRoles(self)
    for name, info in pairs(self.db) do
        SetProfileRole(name, info.role)
    end
end

local function HandleAnnounceRole(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleAnnounceRole()")
    local receivedRole = data:Role()
    SetProfileRole(sender, receivedRole)
    StoreProfileRole(self, sender, receivedRole)
end

local function HandleRequestRole(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleRequestRole()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse.role) > 5  then
        AnnounceRole()
        self._lastRequestResponse.role = currentTime
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

    self._lastRequestResponse = { version = 0, spec = 0 , role = 0}

    self.db = CLM.MODULES.Database:Personal('profileInfo', (function(table)
        -- Migration from version to playerInfo if it is empty
        if rawequal(next(table), nil) then
            for player, version in pairs(CLM.MODULES.Database:Personal('version')) do
                table[player] = {
                    version = version,
                    spec = { one = 0, two = 0, three = 0},
                    role = "NONE"
                }
            end
        end
    end))

    self.handlers = {
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION]  = HandleAnnounceVersion,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION]   = HandleRequestVersion,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_ROLE]     = HandleAnnounceRole,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_ROLE]      = HandleRequestRole
    }

    CLM.MODULES.Comms:Register(CLM.COMM_CHANNEL.GLOBAL, (function(rawMessage, distribution, sender)
        local message = CLM.MODELS.ProfileInfoCommStructure:New(rawMessage)
        if CONSTANTS.PROFILE_INFO_COMM.TYPES[message:Type()] == nil then return end
        HandleIncomingMessage(self, message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            LOG:Message(CLM.L["Core Loot Manager %s initialization complete. %s"], UTILS.ColorCodeText(CLM.MODULES.Version:GetString(), "00cc00"), "Created by |cffe6cc80Lantis|r Annalina-Mirage Raceway")
            if CLM.AF then LOG:Message("Happy |cff44ee44April Fools'|r raid week!") end
            C_Timer.After(1, function()
                RestoreVersions(self)
                RestoreRoles(self)
            end)
            C_Timer.After(math.random(2, 5), function()
                AnnounceVersion()
                AnnounceRole()
            end)
            self._initialized = true
        end
    end)

    CLM.MODULES.EventManager:RegisterWoWEvent("READY_CHECK", (function(...)
        AnnounceVersion()
        AnnounceRole()
    end))


end

function ProfileInfoManager:RequestVersion()
    LOG:Trace("ProfileInfoManager:RequestVersion()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION, {})
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function ProfileInfoManager:RequestSpec()
    LOG:Trace("ProfileInfoManager:RequestSpec()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_SPEC, {})
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function ProfileInfoManager:RequestRole()
    LOG:Trace("ProfileInfoManager:RequestRole()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_ROLE, {})
    CLM.MODULES.Comms:Send(CLM.COMM_CHANNEL.GLOBAL, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

CONSTANTS.PROFILE_INFO_COMM = {
    TYPE = {
        ANNOUNCE_VERSION    = 1,
        REQUEST_VERSION     = 2,
        ANNOUNCE_SPEC       = 3,
        REQUEST_SPEC        = 4,
        ANNOUNCE_ROLE       = 5,
        REQUEST_ROLE        = 6,
    },
    TYPES = UTILS.Set({ 1, 2, 3, 4, 5, 6 })
}

CLM.MODULES.ProfileInfoManager = ProfileInfoManager