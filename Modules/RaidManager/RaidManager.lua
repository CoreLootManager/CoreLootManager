local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS = CLM.MODELS

-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

-- local ACL = MODULES.ACL
local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local EventManager = MODULES.EventManager
local ProfileManager = MODULES.ProfileManager
-- local Comms = MODULES.Comms

-- local LEDGER_DKP = MODELS.LEDGER.DKP
local LEDGER_RAID = CLM.MODELS.LEDGER.RAID
-- local Profile = MODELS.Profile
local Raid = MODELS.Raid
-- local Roster = MODELS.Roster
-- local PointHistory = MODELS.PointHistory

local whoami = UTILS.whoami
local whoamiGUID = UTILS.whoamiGUID
-- local typeof = UTILS.typeof
local getGuidFromInteger = UTILS.getGuidFromInteger

local RaidManager = {}
function RaidManager:Initialize()
    LOG:Trace("RaidManager:Initialize()")

    self:WipeAll()

    -- Register mutators
    LedgerManager:RegisterEntryType(
        LEDGER_RAID.Create,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidCreate)")
            local raidUid = entry:uuid()
            local name = entry:name()
            local targets = entry:targets()
            local config = entry:config()
            local rosterUid = entry:rosterUid()

            local roster = RosterManager:GetRosterByUid(rosterUid)
            if not roster then
                LOG:Debug("RaidManager mutator(): Unknown roster uid %s", rosterUid)
                return
            end

            local players = {}
            for iGUID in ipairs(targets) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    players[GUID] = true
                end
            end
            -- Handle existing raid gracefully
            local raid = Raid:New(raidUid, name, roster, config)
            raid:SetPlayers(players)
            self.cache.raids[raidUid] = raid
        end)
    )

    LedgerManager:RegisterEntryType(
        LEDGER_RAID.Update,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidUpdate)")
            local raidUid = entry:uuid()
            local joiners = entry:joiners()
            local leavers = entry:leavers()

            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            -- Add joiners
            for iGUID in ipairs(joiners) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    raid:AddPlayer(GUID)
                end
            end
            -- Remove leavers
            for iGUID in ipairs(leavers) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    raid:RemovePlayer(GUID)
                end
            end
        end)
    )

    LedgerManager:RegisterEntryType(
        LEDGER_RAID.Start,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidStart)")
            local raidUid = entry:raidUid()
            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            raid:SetStatus(CONSTANTS.RAID_STATUS.IN_PROGRESS)
        end)
    )

    LedgerManager:RegisterEntryType(
        LEDGER_RAID.End,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidEnd)")
            local raidUid = entry:raidUid()

            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            raid:SetStatus(CONSTANTS.RAID_STATUS.FINISHED)
        end)
    )

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:InitializeLocalStatus()
        -- TODO mark as stale ?
    end)

    LedgerManager:RegisterOnRestart(function()
        self:WipeAll()
    end)

    self:RegisterSlash()
    MODULES.ConfigManager:RegisterUniversalExecutor("raidm", "RaidManager", self)
end

function RaidManager:InitializeLocalStatus()
    if not self._initialized then
        -- Scan for active raids
        local GUID = whoamiGUID()
        for raid in ipairs(self.cache.raids) do
            if CONSTANTS.RAID_STATUS_ACTIVE[raid:Status()] then
                if raid:IsPlayerInRaid(GUID) then
                    self.cache.current.raid = raid
                end
            end
        end

        self._initialized = true
    end
end

function RaidManager:ListRaids()
    return self.cache.raids
end

function RaidManager:GetRaidByUid(raidUid)
    return self.cache.raids[raidUid]
end

function RaidManager:InRaid()
    return self.cache.current.raid and true or false
end

function RaidManager:IsRaidManager()
    return (IsInRaid() and (self.cache.current.raidManager == whoami()))
end

function RaidManager:InitializeRaid(roster)
    LOG:Trace("RaidManager:InitializeRaid()")
    -- if not typeof(roster, Roster) then
    --     LOG:Error("RaidManager:InitializeRaid(): Missing valid roster")
    --     return
    -- end
    -- if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
    --     LOG:Message("You are not allowed to initialize a raid.")
    --     return
    -- end

    -- if self:IsRaidInProgress() then
    --     LOG:Message("Raid is already in progress.")
    --     return
    -- end
    -- -- Lazy fill raid roster
    -- RosterManager:AddFromRaidToRoster(roster)

    -- -- todo populate this list
    -- local players = {}
    -- local entry = LEDGER_RAID.Begin:new(roster:UID(), players, "New raid name", {});
    -- LedgerManager:Submit(entry, true)
    -- -- Now we expect to have a new raid.
    -- if (self.raids[entry:uuid()] == nil) then
    --     LOG:Warning("Failed to create raid")
    -- end

    -- -- Handle ontime bonus and other point stuff
    -- -- Handle roster change event
    -- self:SetupRosterUpdateHandling()
    -- -- Handle internal
    -- SendChatMessage("Raid started" , "RAID_WARNING")

end

function RaidManager:EndRaid()
    LOG:Trace("RaidManager:EndRaid()")
    -- if self:IsRaidInProgress() then -- implies being in raid in release version
    --     -- Handle raid completion bonus
    --     --
    --     -- Send comms
    --     Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_END, CONSTANTS.COMMS.DISTRIBUTION.RAID)
    --     -- Handle end of raid
    --     SendChatMessage("Raid ended" , "RAID_WARNING")
    --     self:ClearAuctioneer()
    --     self:ClearRaidInfo()
    -- end
end

function RaidManager:SetupRosterUpdateHandling()
    if self.isEventHandlingRegistered then return end
    EventManager:RegisterEvent({"RAID_ROSTER_UPDATE", "GROUP_ROSTER_UPDATE"}, (function(...)
        -- todo implement raid member change update
        self:UpdateRaidManager()
    end))
    self.isEventHandlingRegistered = true
end

function RaidManager:UpdateRaidManager()
    -- local RL = nil
    -- local RM = nil
    -- for i=1,MAX_RAID_MEMBERS do
    --     local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML, combatRole = GetRaidRosterInfo(i)
    -- end

end

function RaidManager:ClearRaidInfo()
    LOG:Trace("RaidManager:ClearRaidInfo()")
    -- Do not do self.status = {} as we are referencing here directly to DB and that would break the reference
    -- self.status.inProgress = false
    -- self.status.inProgressExternal = false
    -- self.status.roster = 0
    -- self.status.time = {
    --     raidStart = 0,
    --     awardInterval = 0,
    --     lastAwardTime = 0 -- for unfortunate reloads during award time
    -- }
    -- self.status.loot = {
    --     isPlayerMasterLooter = false,
    --     masterLooter = "",
    --     lootSystem = ""
    -- }
    -- self.status.points = {
    --     awardIntervalBonus = false,
    --     awardBossKillBonus = false
    -- }
end

function RaidManager:GetRoster()
    return self.roster
end

function RaidManager:GetRosterUid()
    return self.status.roster
end

function RaidManager:WipeAll()
    self.cache = {
        current = {
            raid = nil,
            isRaidManager = false,
            raidManager = "",
        },
        raids = {}
    }
end

function RaidManager:RegisterSlash()
    -- local options = {
    --     raidresync = {
    --         type = "execute",
    --         name = "Resync raid",
    --         desc = "Failsafe to resync raid after you were Initiator and did disconnect after which raid was restarted",
    --         func = (function()
    --             if IsInRaid() and self:AmIRaidManager() then
    --                 LOG:Message("Requesting resynchronisation")
    --                 self:ClearRaidInfo()
    --                 Comms:Send(RAID_COMM_PREFIX, RAID_COMMS_REQUEST_REINIT, CONSTANTS.COMMS.DISTRIBUTION.RAID)
    --             end
    --         end)
    --     }
    -- }
    -- MODULES.ConfigManager:RegisterSlash(options)
end

CONSTANTS.RAID_STATUS =
{
    CREATED = 0,
    IN_PROGRESS = 1,
    FINISHED = 2,
    STALE = 3
}

CONSTANTS.RAID_STATUS_GUI = {
    [CONSTANTS.RAID_STATUS.CREATED] = 'Created',
    [CONSTANTS.RAID_STATUS.IN_PROGRESS] = 'In Progress',
    [CONSTANTS.RAID_STATUS.FINISHED] = 'Finished',
    [CONSTANTS.RAID_STATUS.STALE] = 'Stale'
}

CONSTANTS.RAID_STATUS_ACTIVE = UTILS.Set({ 0, 1 })

CONSTANTS.RAID_STATUSES = UTILS.Set({ 0, 1, 2, 3 })

MODULES.RaidManager = RaidManager
