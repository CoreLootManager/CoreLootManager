local define = LibDependencyInjection.createContext(...)

define.module("StandbyStagingManager", {
    "Log", "Utils", "Acl",
    "RaidManager", "L", "ProfileRegistry", "Comms", "UnifiedGUI_Standings", "Constants/RaidStatus", "Constants/StandbyStagingComm", "Constants/Comms/Distribution", "StandbyManager"
}, function(resolve, LOG, UTILS, Acl, RaidManager, L, ProfileRegistry, Comms, UnifiedGUI_Standings, RaidStatus, StandbyStagingComm, Distribution, StandbyManager)

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
    if not Acl:IsTrusted() then return end
    local raidUid = data:RaidUid()
    local raid = RaidManager:GetRaidByUid(raidUid)
    if not raid then
        LOG:Debug("Non existent raid: %s", raidUid)
        return
    end
    if raid:Status() ~= RaidStatus.CREATED then
        LOG:Debug("Raid %s is not in freshly created", raidUid)
        return
    end
    if not raid:Configuration():Get("selfBenchSubscribe") then
        LOG:Debug("Self-subscribe is disabled")
        return
    end
    local profile = ProfileRegistry.GetByName(sender)
    if profile then
        local updated = StandbyManager:AddToStandby(raidUid, profile:GUID())
        if updated then
            LOG:Message(L["%s has %s standby"],
                        UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex),
                        UTILS.ColorCodeText(L["requested"], "44cc44"))
        end
    else
        LOG:Warning("Missing profile for player %s", sender)
    end
    UnifiedGUI_Standings:Refresh(true)
end

local function HandleRevoke(self, data, sender)
    LOG:Trace("StandbyStagingManager:HandleRevoke()")
    if not Acl:IsTrusted() then return end
    local raidUid = data:RaidUid()
    local raid = RaidManager:GetRaidByUid(raidUid)
    if not raid then
        LOG:Debug("Non existent raid: %s", raidUid)
        return
    end
    if raid:Status() ~= RaidStatus.CREATED then
        return
    end
    if not raid:Configuration():Get("selfBenchSubscribe") then
        LOG:Debug("Self-subscribe is disabled")
        return
    end
    local profile = ProfileRegistry.GetByName(sender)
    if profile then
        local updated = StandbyManager:RemoveFromStandby(raidUid, profile:GUID())
        if updated then
            LOG:Message(L["%s has %s standby"],
                        UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex),
                        UTILS.ColorCodeText(L["revoked"], "cc4444"))
        end
    else
        LOG:Warning("Missing profile for player %s", sender)
    end
    UnifiedGUI_Standings:Refresh(true)
end

-- local function HandleResponse(self, data, sender)
--     LOG:Trace("StandbyStagingManager:HandleResponse()")
-- end

local StandbyStagingManager = {}
function StandbyStagingManager:Initialize()
    LOG:Trace("StandbyStagingManager:Initialize()")
    self:Clear()

    self.handlers = {
        [StandbyStagingComm.TYPE.SUBSCRIBE] = HandleSubscribe,
        [StandbyStagingComm.TYPE.REVOKE]    = HandleRevoke,
    }

    Comms:Register(STANDBY_STAGING_COMM_PREFIX, (function(rawMessage, distribution, sender)
        local message = CLM.MODELS.StandbyStagingCommStructure:New(rawMessage)
        if StandbyStagingComm.TYPES[message:Type()] == nil then return end
        HandleIncomingMessage(self, message, distribution, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS, true)

end
-- Local API

-- Comms API
function StandbyStagingManager:SignupToStandby(raidUid)
    LOG:Trace("StandbyStagingManager:SignupToStandby()")
    local message = CLM.MODELS.StandbyStagingCommStructure:New(
        StandbyStagingComm.TYPE.SUBSCRIBE,
        CLM.MODELS.StandbyStagingCommSubscribe:New(raidUid))
    Comms:Send(STANDBY_STAGING_COMM_PREFIX, message, Distribution.GUILD)
    LOG:Message(L["Standby %s has been sent"],
                UTILS.ColorCodeText(L["request"], "44cc44"))
end

function StandbyStagingManager:RevokeStandby(raidUid)
    LOG:Trace("StandbyStagingManager:RevokeStandby()")
    local message = CLM.MODELS.StandbyStagingCommStructure:New(
        StandbyStagingComm.TYPE.REVOKE,
        CLM.MODELS.StandbyStagingCommRevoke:New(raidUid))
    Comms:Send(STANDBY_STAGING_COMM_PREFIX, message, Distribution.GUILD)
    LOG:Message(L["Standby %s has been sent"],
    UTILS.ColorCodeText(L["revoke"], "cc4444"))
end



resolve(StandbyStagingManager)
end)

define.module("Constants/StandbyStagingComm", {"Utils"}, function(resolve, UTILS)
    resolve({
        TYPE = {
            SUBSCRIBE   = 1,
            REVOKE      = 2,
        },
        TYPES = UTILS.Set({ 1, 2 })
    })

end)

-- define separate storage for the standby area
define.module("StandbyManager", {"Log"}, function(resolve, LOG)
    local standby = {}
    local StandbyManager = {
        Clear = function()
            LOG:Trace("StandbyStagingManager:Clear()")
            standby = {}
        end,
        IsPlayerOnStandby = function(raidUid, GUID)
            LOG:Trace("StandbyStagingManager:IsPlayerOnStandby()")
            if not standby[raidUid] then return false end
            return standby[raidUid][GUID] and true or false
        end,
        AddToStandby = function(raidUid, GUID)
            LOG:Trace("StandbyStagingManager:AddToStandby()")
            LOG:Debug("AddToStandby %s: %s", raidUid, GUID)
            if not standby[raidUid] then standby[raidUid] = {} end
            local previous = standby[raidUid][GUID]
            standby[raidUid][GUID] = true
            return (previous ~= standby[raidUid][GUID])
        end,
        RemoveFromStandby = function(raidUid, GUID)
            LOG:Trace("StandbyStagingManager:RemoveFromStandby()")
            LOG:Debug("RemoveFromStandby %s: %s", raidUid, GUID)
            if not standby[raidUid] then return false end
            local previous = standby[raidUid][GUID]
            standby[raidUid][GUID] = nil
            return (previous ~= standby[raidUid][GUID])
        end,
        GetStandby = function(raidUid)
            LOG:Trace("StandbyStagingManager:GetStandby()")
            return standby[raidUid] or {}
        end
    }
    resolve(StandbyManager)
end)