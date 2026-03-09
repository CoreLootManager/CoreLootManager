-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
local UTILS     = ILM.UTILS
-- ------------------------------- --

local function stringifyVersion(version)
    return string.format("v%s.%s.%s", version.major or 0, version.minor or 0, version.patch or 0)
end

local Version = {}
function Version:Initialize()
        -- Parse autoversion
        local new = UTILS.ParseVersionString(ILM.AUTOVERSION)
        -- set new version
        ILM2_DB.global.version = new
        self.version = new
        -- update string
        local changeset = new.changeset
        if changeset and changeset ~= "" then
            changeset = "-" .. changeset
        else
            changeset = ""
        end
        self.versionString = string.format(
            "v%s.%s.%s%s",
            new.major or 0,
            new.minor or 0,
            new.patch or 0,
            changeset)
        self._lastDisplayedMessage = 0
        self._lastDisplayedMessageD = 0
end

function Version:Get()
    return self.version
end

function Version:GetString()
    return self.versionString or ""
end

function Version:Check(receivedVersion)
    local currentVersion = self.version
    -- Check if we have older version
    if currentVersion.major < receivedVersion.major then
        self:OutOfDate(true)
    elseif (currentVersion.major == receivedVersion.major) then -- equal majors
        if currentVersion.minor < receivedVersion.minor then
            -- older minor
            self:OutOfDate(false)
        elseif (currentVersion.minor == receivedVersion.minor) and (currentVersion.patch < receivedVersion.patch) then
            if receivedVersion.changeset == "" then -- changeset = unofficial or beta. We don't care about that
                self:OutOfDate(false)
            else
                LOG:Debug("Received version %s-%s", stringifyVersion(receivedVersion), receivedVersion.changeset)
            end
        end
    end
end

function Version:OutOfDate(disable)
    LOG:Trace("Version:OutOfDate()")
    local currentTime = GetServerTime()
    if disable then
        if currentTime - self._lastDisplayedMessageD > 300 then
            LOG:Message(ILM.L["|cffcc0000Your Inept Loot Manager is significantly out of date.|r AddOn communication has been disabled. Please update as soon as possible."])
            self._lastDisplayedMessageD = currentTime
        end
        ILM.MODULES.LedgerManager:Cutoff()
        ILM.MODULES.Comms:Disable()
    else
        if currentTime - self._lastDisplayedMessage > 300 then
            LOG:Message(ILM.L["New version of Inept Loot Manager is available. For best experience please update the AddOn."])
            self._lastDisplayedMessage = currentTime
        end
    end
end

ILM.MODULES.Version = Version