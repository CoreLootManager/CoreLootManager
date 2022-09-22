-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local STANDBY_STAGING_COMM_PREFIX = "Standby001"

local function HandleIncomingMessage(self, message, distribution, sender)
    LOG:Trace("StandbyStagingManager:HandleIncomingMessage()")
    local mtype = message:Type() or 0
    if self.handlers[mtype] then
        self.handlers[mtype](self, message:Data(), sender)
    end
end

local function HandleSubscribe(self, data, sender)
    LOG:Trace("StandbyStagingManager:HandleSubscribe()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    local raidUid = data:RaidUid()
    local raid = CLM.MODULES.RaidManager:GetRaidByUid(raidUid)
    if not raid then
        LOG:Debug("Non existent raid: %s", raidUid)
        return
    end
    if raid:Status() ~= CONSTANTS.RAID_STATUS.CREATED then
        LOG:Debug("Raid %s is not in freshly created", raidUid)
        return
    end
    if not raid:Configuration():Get("selfBenchSubscribe") then
        LOG:Debug("Self-subscribe is disabled")
        return
    end
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(sender)
    if profile then
        local updated = self:AddToStandby(raidUid, profile:GUID())
        if updated then
            LOG:Message(CLM.L["%s has %s standby"],
                        UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex),
                        UTILS.ColorCodeText(CLM.L["requested"], "44cc44"))
        end
    else
        LOG:Warning("Missing profile for player %s", sender)
    end
    CLM.GUI.Unified:Refresh(true)
end

local function HandleRevoke(self, data, sender)
    LOG:Trace("StandbyStagingManager:HandleRevoke()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    local raidUid = data:RaidUid()
    local raid = CLM.MODULES.RaidManager:GetRaidByUid(raidUid)
    if not raid then
        LOG:Debug("Non existent raid: %s", raidUid)
        return
    end
    if raid:Status() ~= CONSTANTS.RAID_STATUS.CREATED then
        return
    end
    if not raid:Configuration():Get("selfBenchSubscribe") then
        LOG:Debug("Self-subscribe is disabled")
        return
    end
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(sender)
    if profile then
        local updated = self:RemoveFromStandby(raidUid, profile:GUID())
        if updated then
            LOG:Message(CLM.L["%s has %s standby"],
                        UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex),
                        UTILS.ColorCodeText(CLM.L["revoked"], "cc4444"))
        end
    else
        LOG:Warning("Missing profile for player %s", sender)
    end
    CLM.GUI.Unified:Refresh(true)
end

local StandbyStagingManager = {}
function StandbyStagingManager:Initialize()
    LOG:Trace("StandbyStagingManager:Initialize()")
    self:Clear()

    self.handlers = {
        [CONSTANTS.STANDBY_STAGING_COMM.TYPE.SUBSCRIBE] = HandleSubscribe,
        [CONSTANTS.STANDBY_STAGING_COMM.TYPE.REVOKE]    = HandleRevoke,
    }

    CLM.MODULES.Comms:Register(STANDBY_STAGING_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = CLM.MODELS.StandbyStagingCommStructure:New(rawMessage)
        if CONSTANTS.STANDBY_STAGING_COMM.TYPES[message:Type()] == nil then return end
        HandleIncomingMessage(self, message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

end
-- Local API
function StandbyStagingManager:Clear()
    LOG:Trace("StandbyStagingManager:Clear()")
    self.standby = {}
end

function StandbyStagingManager:IsPlayerOnStandby(raidUid, GUID)
    LOG:Trace("StandbyStagingManager:IsPlayerOnStandby()")
    if not self.standby[raidUid] then return false end
    return self.standby[raidUid][GUID] and true or false
end

function StandbyStagingManager:AddToStandby(raidUid, GUID)
    LOG:Trace("StandbyStagingManager:AddToStandby()")
    LOG:Debug("AddToStandby %s: %s", raidUid, GUID)
    if not self.standby[raidUid] then self.standby[raidUid] = {} end
    local previous = self.standby[raidUid][GUID]
    self.standby[raidUid][GUID] = true
    return (previous ~= self.standby[raidUid][GUID])
end

function StandbyStagingManager:RemoveFromStandby(raidUid, GUID)
    LOG:Trace("StandbyStagingManager:RemoveFromStandby()")
    LOG:Debug("RemoveFromStandby %s: %s", raidUid, GUID)
    if not self.standby[raidUid] then return false end
    local previous = self.standby[raidUid][GUID]
    self.standby[raidUid][GUID] = nil
    return (previous ~= self.standby[raidUid][GUID])
end

function StandbyStagingManager:GetStandby(raidUid)
    LOG:Trace("StandbyStagingManager:GetStandby()")
    return self.standby[raidUid] or {}
end
-- Comms API
function StandbyStagingManager:SignupToStandby(raidUid)
    LOG:Trace("StandbyStagingManager:SignupToStandby()")
    local message = CLM.MODELS.StandbyStagingCommStructure:New(
        CONSTANTS.STANDBY_STAGING_COMM.TYPE.SUBSCRIBE,
        CLM.MODELS.StandbyStagingCommSubscribe:New(raidUid))
    CLM.MODULES.Comms:Send(STANDBY_STAGING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
    LOG:Message(CLM.L["Standby %s has been sent"],
                UTILS.ColorCodeText(CLM.L["request"], "44cc44"))
end

function StandbyStagingManager:RevokeStandby(raidUid)
    LOG:Trace("StandbyStagingManager:RevokeStandby()")
    local message = CLM.MODELS.StandbyStagingCommStructure:New(
        CONSTANTS.STANDBY_STAGING_COMM.TYPE.REVOKE,
        CLM.MODELS.StandbyStagingCommRevoke:New(raidUid))
    CLM.MODULES.Comms:Send(STANDBY_STAGING_COMM_PREFIX, message, CONSTANTS.COMMS.DISTRIBUTION.GUILD)
    LOG:Message(CLM.L["Standby %s has been sent"],
    UTILS.ColorCodeText(CLM.L["revoke"], "cc4444"))
end

CONSTANTS.STANDBY_STAGING_COMM = {
    TYPE = {
        SUBSCRIBE   = 1,
        REVOKE      = 2,
    },
    TYPES = UTILS.Set({ 1, 2 })
}

CLM.MODULES.StandbyStagingManager = StandbyStagingManager