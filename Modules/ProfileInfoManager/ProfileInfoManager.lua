-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local sformat = string.format

local PROFILEINFO_COMM_PREFIX = "Version001" -- Keep it for version sync with older ones

local function stringifyVersion(version)
    return sformat("v%s.%s.%s", version.major or 0, version.minor or 0, version.patch or 0)
end

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
    local version = CLM.CORE:GetVersion()
    local message = CLM.MODELS.ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_VERSION,
        CLM.MODELS.ProfileInfoCommAnnounceVersion:New(version.major, version.minor, version.patch, version.changeset))
    CLM.MODULES.Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function OutOfDate(self, version, disable)
    LOG:Trace("ProfileInfoManager:OutOfDate()")
    local currentTime = GetServerTime()
    if disable then
        if currentTime - self._lastDisplayedMessageD > 300 then
            LOG:Message(CLM.L["|cffcc0000Your Classic Loot Manager is significantly out of date.|r AddOn communication has been disabled. Version %s is available. Please update as soon as possible."], UTILS.ColorCodeText(stringifyVersion(version), "00cc00"))
            self._lastDisplayedMessageD = currentTime
        end
        CLM.MODULES.LedgerManager:Cutoff()
        CLM.MODULES.Comms:Disable()
    else
        if currentTime - self._lastDisplayedMessage > 300 then
            LOG:Message(CLM.L["New version %s of Classic Loot Manager is available. For best experience please update the AddOn."], UTILS.ColorCodeText(stringifyVersion(version), "00cc00"))
            self._lastDisplayedMessage = currentTime
        end
    end
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
    local currentVersion = CLM.CORE:GetVersion()
    local receivedVersion = data:Version()

    -- Check if we have older version
    if currentVersion.major < receivedVersion.major then
        OutOfDate(self, receivedVersion, true)
    elseif (currentVersion.major == receivedVersion.major) then -- equal majors
        if currentVersion.minor < receivedVersion.minor then
            -- older minor
            OutOfDate(self, receivedVersion, false)
        elseif (currentVersion.minor == receivedVersion.minor) and (currentVersion.patch < receivedVersion.patch) then
            if receivedVersion.changeset == "" then -- changeset = unofficial or beta. We don't care about that
                OutOfDate(self, receivedVersion, false)
            else
                LOG:Debug("Received version %s-%s", stringifyVersion(receivedVersion), receivedVersion.changeset)
            end
        end
    end

    SetProfileVersion(sender, receivedVersion)
    StoreProfileVersion(self, sender, receivedVersion)
end

local function HandleRequestVersion(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleRequestVersion()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse.version) > 30  then
        AnnounceVersion()
        self._lastRequestResponse.version = currentTime
    end
end

--[[
    --- SPEC ---
]]
local function AnnounceSpec()
    LOG:Trace("ProfileInfoManager:AnnounceSpec()")
    local one, two, three = UTILS.GetMyTalents()
    local message = CLM.MODELS.ProfileInfoCommStructure:New(
        CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_SPEC,
        CLM.MODELS.ProfileInfoCommAnnounceSpec:New(one, two, three))
    CLM.MODULES.Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

local function SetProfileSpec(name, spec)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
    if profile then
        profile:SetSpec(spec.one, spec.two, spec.three)
    end
end

local function StoreProfileSpec(self, name, spec)
    GetProfileDb(self, name).spec = spec
end

local function RestoreSpecs(self)
    for name, info in pairs(self.db) do
        SetProfileSpec(name, info.spec)
    end
end

local function HandleAnnounceSpec(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleAnnounceSpec()")
    local receivedSpec = data:Spec()
    SetProfileSpec(sender, receivedSpec)
    StoreProfileSpec(self, sender, receivedSpec)
end

local function HandleRequestSpec(self, data, sender)
    LOG:Trace("ProfileInfoManager:HandleRequestSpec()")
    local currentTime = GetServerTime()
    if (currentTime - self._lastRequestResponse.spec) > 30  then
        AnnounceSpec()
        self._lastRequestResponse.spec = currentTime
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
    CLM.MODULES.Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
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
    if (currentTime - self._lastRequestResponse.role) > 30  then
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
    self._lastDisplayedMessage = 0
    self._lastDisplayedMessageD = 0

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
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_SPEC]     = HandleAnnounceSpec,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_SPEC]      = HandleRequestSpec,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.ANNOUNCE_ROLE]     = HandleAnnounceRole,
        [CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_ROLE]      = HandleRequestRole
    }

    CLM.MODULES.Comms:Register(PROFILEINFO_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = CLM.MODELS.ProfileInfoCommStructure:New(rawMessage)
        if CONSTANTS.PROFILE_INFO_COMM.TYPES[message:Type()] == nil then return end
        HandleIncomingMessage(self, message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        if not self._initialized then
            LOG:Message(CLM.L["Classic Loot Manager %s initialization complete."], UTILS.ColorCodeText(CLM.CORE:GetVersionString(), "00cc00"))
            C_Timer.After(1, function()
                RestoreVersions(self)
                RestoreSpecs(self)
                RestoreRoles(self)
            end)
            C_Timer.After(math.random(2, 5), function()
                AnnounceVersion()
                AnnounceSpec()
                AnnounceRole()
            end)
            self._initialized = true
        end
    end)

    CLM.MODULES.EventManager:RegisterWoWEvent("READY_CHECK", (function(...)
        AnnounceVersion()
        AnnounceSpec()
        AnnounceRole()
    end))


end

function ProfileInfoManager:RequestVersion()
    LOG:Trace("ProfileInfoManager:RequestVersion()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_VERSION, {})
    CLM.MODULES.Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function ProfileInfoManager:RequestSpec()
    LOG:Trace("ProfileInfoManager:RequestSpec()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_SPEC, {})
    CLM.MODULES.Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
end

function ProfileInfoManager:RequestRole()
    LOG:Trace("ProfileInfoManager:RequestRole()")
    local message = CLM.MODELS.ProfileInfoCommStructure:New(CONSTANTS.PROFILE_INFO_COMM.TYPE.REQUEST_ROLE, {})
    CLM.MODULES.Comms:Send(PROFILEINFO_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
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