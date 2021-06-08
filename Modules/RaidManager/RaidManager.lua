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
local ProfileManager = MODULES.ProfileManager
-- local Comms = MODULES.Comms

-- local LEDGER_DKP = MODELS.LEDGER.DKP
local LEDGER_RAID = CLM.MODELS.LEDGER.RAID
-- local Profile = MODELS.Profile
local Raid = MODELS.Raid
local Roster = MODELS.Roster
local RosterConfiguration = MODELS.RosterConfiguration
-- local PointHistory = MODELS.PointHistory

local whoami = UTILS.whoami
local whoamiGUID = UTILS.whoamiGUID
local RemoveServer = UTILS.RemoveServer
local typeof = UTILS.typeof
local getGuidFromInteger = UTILS.getGuidFromInteger

local RaidManager = {}
function RaidManager:Initialize()
    LOG:Trace("RaidManager:Initialize()")

    self:WipeAll()
    self.lastRosterUpdateTime = 0

    self.RaidLeader = ""
    self.MasterLooter = ""
    self.IsMasterLootSystem = false

    -- Register mutators
    LedgerManager:RegisterEntryType(
        LEDGER_RAID.Create,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidCreate)")
            local raidUid = entry:uuid()
            local name = entry:name()
            local config = RosterConfiguration:New()
            config:inflate(entry:config())
            local rosterUid = entry:rosterUid()

            local roster = RosterManager:GetRosterByUid(rosterUid)
            if not roster then
                LOG:Debug("RaidManager mutator(): Unknown roster uid %s", rosterUid)
                return
            end
            -- Handle existing raid gracefully
            local creator = getGuidFromInteger(entry:creator())
            local raid = Raid:New(raidUid, name, roster, config, creator, entry)
            LOG:Debug("RaidManager mutator(): New raid %s(%s) from %s", name, raidUid, creator)
            self.cache.raids[raidUid] = raid
            self:UpdateProfileCurentRaid(creator, raidUid)
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
                    self:UpdateProfileCurentRaid(GUID, raidUid)
                    raid:AddPlayer(GUID)
                end
            end
            -- Remove leavers
            for iGUID in ipairs(leavers) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    self:UpdateProfileCurentRaid(GUID, nil)
                    raid:RemovePlayer(GUID)
                end
            end
        end)
    )

    LedgerManager:RegisterEntryType(
        LEDGER_RAID.Start,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidStart)")
            local raidUid = entry:raid()
            local players = entry:players()
            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            -- Add players
            for _,iGUID in ipairs(players) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    self:UpdateProfileCurentRaid(GUID, raidUid)
                    raid:AddPlayer(GUID)
                else
                    LOG:Debug("RaidManager mutator(): Missing profile for: %s", GUID)
                end
            end
            raid:Start(entry:time())
            -- Handle ontime bonus and other point stuff
        end)
    )

    LedgerManager:RegisterEntryType(
        LEDGER_RAID.End,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidEnd)")
            local raidUid = entry:raid()

            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            raid:End(entry:time())
        end)
    )

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:ParseStatus()
    end)

    LedgerManager:RegisterOnRestart(function()
        self:WipeAll()
    end)

    self:RegisterEventHandling()
    self:RegisterSlash()
    MODULES.ConfigManager:RegisterUniversalExecutor("raidm", "RaidManager", self)
end

function RaidManager:ParseStatus()
    if not self._initialized then
        -- Mark raids as stale
        local GUID = whoamiGUID()
        for raid in ipairs(self.cache.raids) do
            if raid:IsActive() then
                local referenceTime = raid:StartTime()
                if referenceTime == 0 then
                    referenceTime = raid:CreatedAt()
                end
                if (GetServerTime() - referenceTime) > 86400 then
                    raid:SetStale()
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

function RaidManager:IsInRaid()
    return self.cache.profileRaidInfo[whoamiGUID()] and true or false
end

function RaidManager:IsInActiveRaid()
    return self:IsInRaid() and self:GetRaid():IsActive() or false
end

function RaidManager:IsInCreatedRaid()
    return self:IsInRaid() and (CONSTANTS.RAID_STATUS.CREATED == self:GetRaid():Status())
end

function RaidManager:IsInProgressingRaid()
    return self:IsInRaid() and (CONSTANTS.RAID_STATUS.IN_PROGRESS == self:GetRaid():Status())
end

-- handles connection of user with newest ledger raid entity
function RaidManager:UpdateProfileCurentRaid(GUID, raidUid)
    LOG:Debug("RaidManager:UpdateProfileCurentRaid(%s, %s)", GUID, raidUid)
    if ProfileManager:GetProfileByGUID(GUID) then
        local old = self.cache.profileRaidInfo[GUID]
        self.cache.profileRaidInfo[GUID] = self.cache.raids[raidUid]
        if old and old:IsActive() then
            old:RemovePlayer(GUID)
        end
    end
end

function RaidManager:GetProfileRaid(GUID)
    return self.cache.profileRaidInfo[GUID]
end

function RaidManager:CreateRaid(roster, name, config)
    LOG:Trace("RaidManager:CreateRaid()")
    if not typeof(roster, Roster) then
        LOG:Error("RaidManager:CreateRaid(): Missing valid roster")
        return
    end

    if not typeof(config, RosterConfiguration) then
        LOG:Error("RaidManager:CreateRaid(): Missing valid configuration")
        return
    end

    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message("You are not allowed to create raids.")
        return
    end

    if self:IsInActiveRaid() then
        LOG:Message("You are already in an active raid. Leave or finish it before creating new one.")
        return
    end

    LedgerManager:Submit(LEDGER_RAID.Create:new(roster:UID(), name, config))
end

function RaidManager:StartRaid(raid)
    LOG:Trace("RaidManager:StartRaid()")
    if not typeof(raid, Raid) then
        LOG:Message("Missing valid raid")
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message("You are not allowed to start raid.")
        return
    end
    if raid:Status() ~= CONSTANTS.RAID_STATUS.CREATED then
        LOG:Message("You can only start a freshly created raid.")
        return
    end
    -- if not self:IsInActiveRaid() or not IsInRaid() then
    --     LOG:Message("You are not in a raid.")
    --     return
    -- end
    
    -- Lazy fill raid roster
    RosterManager:AddFromRaidToRoster(raid:Roster())

    local players = {}
    for i=1,MAX_RAID_MEMBERS do
        local name = GetRaidRosterInfo(i)
        if name then
            local profile = ProfileManager:GetProfileByName(RemoveServer(name))
            if profile then
                table.insert(players, profile)
            end
        end
    end

    LedgerManager:Submit(LEDGER_RAID.Start:new(raid:UID(), players), true)

    SendChatMessage(string.format("Raid [%s] started", raid:Name()) , "RAID_WARNING")

end

function RaidManager:EndRaid(raid)
    LOG:Trace("RaidManager:EndRaid()")
    if not typeof(raid, Raid) then
        LOG:Message("Missing valid raid")
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message("You are not allowed to start raid.")
        return
    end
    if not raid:IsActive() then
        LOG:Message("You can only end an active raid.")
        return
    end
    -- if not self:IsInActiveRaid() then
    --     LOG:Message("You are not in an active raid.")
    --     return
    -- end
    LedgerManager:Submit(LEDGER_RAID.End:new(raid:UID()), true)

    if IsInRaid() then
        SendChatMessage(string.format("Raid [%s] ended", raid:Name()) , "RAID_WARNING")
    end
end

function RaidManager:JoinRaid(raid)
    LOG:Trace("RaidManager:JoinRaid()")
    if not typeof(raid, Raid) then
        LOG:Message("Missing valid raid")
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message("You are not allowed to join raid.")
        return
    end
    if not raid:IsActive() then
        LOG:Message("You can only join an active raid.")
        return
    end
    if raid == self:GetRaid() then
        LOG:Message("You can only join different raid than your current one.")
        return
    end

    LedgerManager:Submit(LEDGER_RAID.Update:new(raid:UID(), {ProfileManager:GetMyProfile()}, {}), true)
end

function RaidManager:RegisterEventHandling()
    if self.isEventHandlingRegistered then return end
    EventManager:RegisterEvent({"RAID_ROSTER_UPDATE", "GROUP_ROSTER_UPDATE"}, (function(...)
        self:HandleRosterUpdateEvent()
    end))
    self.isEventHandlingRegistered = true
end

function RaidManager:HandleRosterUpdateEvent()
    if not IsInRaid() then return end
    -- Update wow raid information
    local lootmethod, _, masterlooterRaidID = GetLootMethod()
    if lootmethod == "master" then
        self.IsMasterLootSystem = true
        self.MasterLooter = GetRaidRosterInfo(masterlooterRaidID)
    else
        self.IsMasterLootSystem = false
        for i=1,MAX_RAID_MEMBERS do
            local name, rank = GetRaidRosterInfo(i)
            if name then
                if rank == 2 then
                    self.RaidLeader = RemoveServer(name)
                    break
                end
            end
        end
    end
    -- Handle roster update
    if self:IsRaidOwner() and self:IsInProgressingRaid() then
        self:UpdateRaiderList()
    end
end

function RaidManager:UpdateRaiderList()
    local raid = self:GetRaid()
    if not raid then return end
    -- Dont execute this more often than every 1s
    if GetServerTime() - self.lastRosterUpdateTime < 1 then return end
    self.lastRosterUpdateTime = GetServerTime()
    local previous, joiners, leavers = {}, {}, {}
    -- Detect joiners; build previous set
    for i=1,MAX_RAID_MEMBERS do
        local name = GetRaidRosterInfo(i)
        if name then
            name = RemoveServer(name)
            previous[name] = true
            local profile = ProfileManager:GetProfileByName(name)
            if profile then
                if not raid:IsPlayerInRaid(profile:GUID()) then
                    table.insert(joiners,  profile)
                end
            end
        end
    end
    -- Detect leavers
    for _,profile in ipairs(raid:Profiles()) do
        if not previous[profile:Name()] then
            table.insert(leavers, profile)
        end
    end
    if #joiners > 0 or #leavers > 0 then
        LedgerManager:Submit(LEDGER_RAID.Update:new(raid:UID(), joiners, leavers))
    end
end

function RaidManager:IsRaidOwner(name)
    LOG:Trace("RaidManager:IsRaidOwner()")
    local allow
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
        allow = false
    else
        if self.IsMasterLootSystem then
            allow = (self.MasterLooter == name)
        else
            allow = (self.RaidLeader == name)
        end
    end
    if not allow then
        LOG:Debug("%s is not raid owner.", name)
    end
    return allow
end

function RaidManager:GetRaid()
    return self.cache.profileRaidInfo[whoamiGUID()]
end

function RaidManager:WipeAll()
    self.cache = {
        current = {
            raid = nil,
            isRaidManager = false,
            raidManager = "",
        },
        raids = {},
        profileRaidInfo = {}
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
