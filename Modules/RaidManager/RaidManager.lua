local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS = CLM.MODELS

-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local ACL = MODULES.ACL
local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local EventManager = MODULES.EventManager
-- local ProfileManager = MODULES.ProfileManager
local Comms = MODULES.Comms

-- local LEDGER_DKP = MODELS.LEDGER.DKP
-- local Profile = MODELS.Profile
local Roster = MODELS.Roster
-- local PointHistory = MODELS.PointHistory

local typeof = UTILS.typeof
-- local getGuidFromInteger = UTILS.getGuidFromInteger

local RAID_COMM_PREFIX = "raid"
local RAID_COMMS_INIT = "i"
local RAID_COMMS_END = "e"
local RAID_COMMS_REQUEST_REINIT = "r"

local RaidManager = {}

function RaidManager:Initialize()
    LOG:Trace("RaidManager:Initialize()")
    self.status = MODULES.Database:Raid()
    self.isEventHandlingRegistered = false
    if not self:IsRaidInProgress() then
        LOG:Debug("No raid in Progress")
        -- We dont have any inProgress information stored or it's false (raid is not in progress)
        self:ClearRaidInfo()
    else
        -- Raid in progress -> we had a /reload or disconnect and user was ML
        -- Check if user logged back when raid was still in progress
        if IsInRaid() then
            LOG:Debug("Raid in Progress")
            -- We need to handle the stored info
            self.restoreRaid = true
        else
            -- Clear status
            self:ClearRaidInfo()
        end
    end

    Comms:Register(RAID_COMM_PREFIX, (function(message, distribution, sender)
        if distribution ~= CONSTANTS.COMMS.DISTRIBUTION.RAID then return end
        self:HandleIncomingMessage(message, sender)
    end), CONSTANTS.ACL.LEVEL.PLEBS)

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag == 0 and uncommitted == 0 then
            if self.restoreRaid then
                self:RestoreRaidInfo()
                self.restoreRaid = false
            end
        end
    end)

    self:RegisterSlash()
    self._initialized = true
end

function RaidManager:IsRaidInProgress()
    return self.status and (self.status.inProgress or self.status.inProgressExternal)
end

function RaidManager:AmIRaidManager()
    return self.status and self.status.inProgress and not self.status.inProgressExternal
end

function RaidManager:InitializeRaid(roster)
    LOG:Trace("RaidManager:InitializeRaid()")
    if not typeof(roster, Roster) then
        LOG:Error("RaidManager:InitializeRaid(): Missing valid roster")
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message("You are not allowed to initialize a raid.")
        return
    end
    if not IsInRaid() then
        LOG:Message("You are not in raid.")
        return
    end
    if self:IsRaidInProgress() then
        LOG:Message("Raid is already in progress.")
        return
    end
    -- Lazy fill raid roster
    RosterManager:AddFromRaidToRoster(roster)
    -- is RL / ML -> check the loot system ? -- do we need it? maybe everyone can be?
    self.status.time.raidStart = GetServerTime()
    self.status.roster = roster:UID()
    self.roster = roster

    self.status.inProgress = true
    -- Handle ontime bonus and other point stuff
    -- Handle roster change event
    self:SetupRosterUpdateHandling()
    -- Send comms
    Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_INIT, CONSTANTS.COMMS.DISTRIBUTION.RAID)
    -- Handle internal
    SendChatMessage("Raid started" , "RAID_WARNING")
    self:MarkAsAuctioneer(UTILS.whoami())
end

function RaidManager:EndRaid()
    LOG:Trace("RaidManager:EndRaid()")
    if self:IsRaidInProgress() then -- implies being in raid in release version
        -- Handle raid completion bonus
        --
        -- Send comms
        Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_END, CONSTANTS.COMMS.DISTRIBUTION.RAID)
        -- Handle end of raid
        SendChatMessage("Raid ended" , "RAID_WARNING")
        self:ClearAuctioneer()
        self:ClearRaidInfo()
    end
end

function RaidManager:SetupRosterUpdateHandling()
    if self.isEventHandlingRegistered then return end
    EventManager:RegisterEvent({"RAID_ROSTER_UPDATE", "GROUP_ROSTER_UPDATE"}, (function(...)
        self:HandleRequestReinit()
    end))
    self.isEventHandlingRegistered = true
end

function RaidManager:MarkAsAuctioneer(name)
    LOG:Trace("RaidManager:MarkAsAuctioneer()")
    MODULES.AuctionManager:MarkAsAuctioneer(name)
end

function RaidManager:ClearAuctioneer()
    LOG:Trace("RaidManager:ClearAuctioneer()")
    MODULES.AuctionManager:ClearAuctioneer()
end

function RaidManager:RestoreRaidInfo()
    LOG:Trace("RaidManager:RestoreRaidInfo()")
    if IsInRaid() then
        if self.status.inProgressExternal then
            Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_REQUEST_REINIT, CONSTANTS.COMMS.DISTRIBUTION.RAID)
        else
            -- restore roster
            self.roster = RosterManager:GetRosterByUid(self.status.roster)
            LOG:Message("%s", tostring(self.roster))
            -- pass info to auction manager
            self:MarkAsAuctioneer(UTILS.whoami())
            -- restore event handling
            -- Handle roster change event
            self:SetupRosterUpdateHandling()
            -- check if we have some pending auto awards to do
        end
    end
end

function RaidManager:ClearRaidInfo()
    LOG:Trace("RaidManager:ClearRaidInfo()")
    -- Do not do self.status = {} as we are referencing here directly to DB and that would break the reference
    self.status.inProgress = false
    self.status.inProgressExternal = false
    self.status.roster = 0
    self.status.time = {
        raidStart = 0,
        awardInterval = 0,
        lastAwardTime = 0 -- for unfortunate reloads during award time
    }
    self.status.loot = {
        isPlayerMasterLooter = false,
        masterLooter = "",
        lootSystem = ""
    }
    self.status.points = {
        awardIntervalBonus = false,
        awardBossKillBonus = false
    }
end

function RaidManager:GetRoster()
    return self.roster
end

function RaidManager:GetRosterUid()
    return self.status.roster
end

function RaidManager:HandleRaidInitialization(auctioneer)
    LOG:Trace("RaidManager:HandleRaidInitialization()")
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, auctioneer) then
        LOG:Error("RaidManager:HandleRaidEnd(): Received unauthorized raid initialize from %s", auctioneer)
        return
    end
    if not self:IsRaidInProgress() then
        LOG:Message("Raid started by %s", UTILS.ColorCodeText(auctioneer, "FFD100"))
    end
    self.status.inProgressExternal = true
    -- We allow overwriting just in case
    self:MarkAsAuctioneer(auctioneer)
end

function RaidManager:HandleRaidEnd(auctioneer)
    LOG:Trace("RaidManager:HandleRaidEnd()")
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, auctioneer) then
        LOG:Error("RaidManager:HandleRaidEnd(): Received unauthorized raid end from %s", auctioneer)
        return
    end
    if self:IsRaidInProgress() then
        LOG:Message("Raid ended by %s", UTILS.ColorCodeText(auctioneer, "FFD100"))
    end
    self.status.inProgressExternal = false
    self:ClearAuctioneer()
    self:ClearRaidInfo()
end

function RaidManager:HandleRequestReinit()
    LOG:Trace("RaidManager:HandleRequestReinit()")
    -- I am the raid initiator as my status inprogress is not external
    if self:AmIRaidManager() then
        Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_INIT, CONSTANTS.COMMS.DISTRIBUTION.RAID)
    end
end

function RaidManager:HandleIncomingMessage(message, sender)
    LOG:Trace("RaidManager:HandleIncomingMessage()")
    if type(message) ~= "string" then
        LOG:Debug("RaidManager:HandleIncomingMessage(): Received unsupported message type")
        return
    end

    if message == RAID_COMMS_INIT then
        self:HandleRaidInitialization(sender)
    elseif message == RAID_COMMS_END then
        self:HandleRaidEnd(sender)
    elseif message == RAID_COMMS_REQUEST_REINIT then
        self:HandleRequestReinit()
    else
        LOG:Debug("RaidManager:HandleIncomingMessage(): Received unsupported message %s", tostring(message))
    end
end

function RaidManager:RegisterSlash()
    local options = {
        raidresync = {
            type = "execute",
            name = "Resync raid",
            desc = "Failsafe to resync raid after you were Initiator and did disconnect after which raid was restarted",
            func = (function()
                if IsInRaid() and self:AmIRaidManager() then
                    LOG:Message("Requesting resynchronisation")
                    self:ClearRaidInfo()
                    Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_REQUEST_REINIT, CONSTANTS.COMMS.DISTRIBUTION.RAID)
                end
            end)
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

MODULES.RaidManager = RaidManager