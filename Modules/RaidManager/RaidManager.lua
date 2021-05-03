local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
-- local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS = CLM.MODELS

-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

-- local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
-- local ProfileManager = MODULES.ProfileManager

-- local LEDGER_DKP = MODELS.LEDGER.DKP
-- local Profile = MODELS.Profile
local Roster = MODELS.Roster
-- local PointHistory = MODELS.PointHistory

local typeof = UTILS.typeof
-- local getGuidFromInteger = UTILS.getGuidFromInteger


local RaidManager = {}

function RaidManager:Initialize()
    LOG:Trace("RaidManager:Initialize()")
    self.status = MODULES.Database:Raid()
    if not self:IsRaidInProgress() then
        -- We dont have any inProgress information stored or it's false (raid is not in progress)
        self:ClearRaidInfo()
    else
        -- Raid in progress -> we had a /reload or disconnect and user was ML
        -- Check if user logged back when raid was still in progress
        -- if IsInRaid() then
        -- if false then
        --     -- We need to handle the stored info
        --     self:RestoreRaidInfo()
        -- else
            -- Clear status
            self:ClearRaidInfo()
        -- end
    end

    self._initialized = true
end

function RaidManager:IsRaidInProgress()
    return self.status and self.status.inProgress
end

function RaidManager:InitializeRaid(roster)
    LOG:Trace("RaidManager:InitializeRaid()")
    if not typeof(roster, Roster) then
        LOG:Error("RaidManager:InitializeRaid(): Missing valid roster")
        return
    end
    if self:IsRaidInProgress() then LOG:Warning("Raid already in progress.") end
    -- is RL / ML -> check the loot system
    self.status.time.raidStart = GetServerTime()
    self.status.roster = roster:UID()
    self.roster = roster

    self.status.inProgress = true
    -- Handle ontime bonus
end

function RaidManager:EndRaid()
    LOG:Trace("RaidManager:EndRaid()")
    if self:IsRaidInProgress() then
        -- Handle raid completion bonus

        self:ClearRaidInfo()
    end
end

function RaidManager:RestoreRaidInfo()
    LOG:Trace("RaidManager:RestoreRaidInfo()")
    -- restore roster
    self.roster = RosterManager:GetRosterByUid(self.status.roster)
    -- check if we have some pending auto awards to do
end

function RaidManager:ClearRaidInfo()
    LOG:Trace("RaidManager:ClearRaidInfo()")
    -- Do not do self.status = {} as we are referencing here directly to DB and that would break the reference
    self.status.inProgress = false
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

MODULES.RaidManager = RaidManager