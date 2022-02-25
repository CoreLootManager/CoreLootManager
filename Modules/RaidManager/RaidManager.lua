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
local PointManager = MODULES.PointManager
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

local function IsPlayerInPvP()
	local bg = UnitInBattleground("player")
	local arena = IsActiveBattlefieldArena()
	return arena or (bg ~= nil)
end

local RaidManager = {}
function RaidManager:Initialize()
    LOG:Trace("RaidManager:Initialize()")

    self:WipeAll()
    -- self.lastRosterUpdateTime = 0

    self.RaidLeader = ""
    self.MasterLooter = ""
    self.IsMasterLootSystem = false
    self.RaidAssistants = {}

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
            self:UpdateProfileCurentRaid(creator, raid)
        end)
    )

    LedgerManager:RegisterEntryType(
        LEDGER_RAID.Update,
        (function(entry)
            LOG:TraceAndCount("mutator(RaidUpdate)")
            local raidUid = entry:raid()
            local joiners = entry:joiners()
            local leavers = entry:leavers()
            local standby = entry:standby()
            local removed = entry:removed()
            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            -- Add standby
            for _, iGUID in ipairs(standby) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    -- Do not do that if player is already in a raid
                    if not raid:IsPlayerInRaid(GUID) then
                        self:UpdateProfileCurentStandby(GUID, raid)
                        raid:Roster():UpdateAttendance(GUID, raidUid, entry:time())
                    end
                end
            end
            -- Add Joiners
            for _, iGUID in ipairs(joiners) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    self:UpdateProfileCurentRaid(GUID, raid)
                    raid:Roster():UpdateAttendance(GUID, raidUid, entry:time())
                end
            end
            -- Remove / bench leavers
            local benchLeavers = raid:Configuration():Get("autoBenchLeavers")
            for _, iGUID in ipairs(leavers) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    -- raid:RemovePlayer(GUID)
                    if benchLeavers then
                        -- Bench leavers
                        self:UpdateProfileCurentStandby(GUID, raid)
                    else
                        self:UpdateProfileCurentRaid(GUID, nil)
                    end
                end
            end
            -- Remove removed
            for _, iGUID in ipairs(removed) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    self:UpdateProfileCurentRaid(GUID, nil)
                    self:UpdateProfileCurentStandby(GUID, nil)
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
            local standby = entry:standby()
            local raid = self:GetRaidByUid(raidUid)
            if not raid then
                LOG:Debug("RaidManager mutator(): Unknown raid uid %s", raidUid)
                return
            end
            -- order here is important just in case someone adds to standby a player in raid
            -- Add standby
            for _, iGUID in ipairs(standby) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    self:UpdateProfileCurentStandby(GUID, raid)
                    raid:Roster():UpdateAttendance(GUID, raidUid, entry:time())
                end
            end
            -- Add players
            for _,iGUID in ipairs(players) do
                local GUID = getGuidFromInteger(iGUID)
                local profile = ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    self:UpdateProfileCurentRaid(GUID, raid)
                    raid:Roster():UpdateAttendance(GUID, raidUid, entry:time())
                else
                    LOG:Debug("RaidManager mutator(): Missing profile for: %s", GUID)
                end
            end
            raid:Start(entry:time())
            local config = raid:Configuration()
            local roster = raid:Roster()
            if roster then
                if not config then
                    config = roster.configuration
                end
                if config:Get("onTimeBonus") and config:Get("onTimeBonusValue") > 0 then
                    PointManager:AddFakePointHistory(roster, raid:Players(), config:Get("onTimeBonusValue"), CONSTANTS.POINT_CHANGE_REASON.ON_TIME_BONUS, entry:time(), entry:creator())
                    local _players
                    if config:Get("autoAwardIncludeBench") then
                        _players = raid:AllPlayers()
                        local playersOnStandby = raid:PlayersOnStandby()
                        if #playersOnStandby > 0 then
                            PointManager:AddFakePointHistory(roster, playersOnStandby, config:Get("onTimeBonusValue"), CONSTANTS.POINT_CHANGE_REASON.STANDBY_BONUS, entry:time(), entry:creator(), CONSTANTS.POINT_CHANGE_REASONS.ALL[CONSTANTS.POINT_CHANGE_REASON.ON_TIME_BONUS] or "")
                        end
                    else
                        _players = raid:Players()
                    end
                    PointManager:UpdatePointsDirectlyWithoutHistory(roster, _players, config:Get("onTimeBonusValue"), CONSTANTS.POINT_CHANGE_REASON.ON_TIME_BONUS, entry:time(), entry:creator())
                end
            end
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

            local config = raid:Configuration()
            local roster = raid:Roster()
            if roster then
                if not config then
                    config = roster.configuration
                end
                if config:Get("raidCompletionBonus") and config:Get("raidCompletionBonusValue") > 0 then
                    PointManager:AddFakePointHistory(roster, raid:Players(), config:Get("raidCompletionBonusValue"), CONSTANTS.POINT_CHANGE_REASON.RAID_COMPLETION_BONUS, entry:time(), entry:creator())
                    local players
                    if config:Get("autoAwardIncludeBench") then
                        players = raid:AllPlayers()
                        local playersOnStandby = raid:PlayersOnStandby()
                        if #playersOnStandby > 0 then
                            PointManager:AddFakePointHistory(roster, playersOnStandby, config:Get("raidCompletionBonusValue"), CONSTANTS.POINT_CHANGE_REASON.STANDBY_BONUS, entry:time(), entry:creator(), CONSTANTS.POINT_CHANGE_REASONS.ALL[CONSTANTS.POINT_CHANGE_REASON.RAID_COMPLETION_BONUS] or "")
                        end
                    else
                        players = raid:Players()
                    end
                    PointManager:UpdatePointsDirectlyWithoutHistory(roster, players, config:Get("raidCompletionBonusValue"), CONSTANTS.POINT_CHANGE_REASON.RAID_COMPLETION_BONUS, entry:time(), entry:creator())
                end
            end

            raid:End(entry:time())

            local players = raid:AllPlayers()
            for _,GUID in ipairs(players) do
                self:UpdateProfileCurentRaid(GUID, nil)
                self:UpdateProfileCurentStandby(GUID, nil)
            end
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
    C_Timer.After(20, function() self:ParseStatus() end) -- backup in case of 0 entries
    MODULES.ConfigManager:RegisterUniversalExecutor("raidm", "RaidManager", self)
end

function RaidManager:ParseStatus()
    if not self._initialized then
        -- Mark raids as stale
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

        self:HandleRosterUpdateEvent()

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

function RaidManager:IsOnStandby()
    return self.cache.profileStandbyInfo[whoamiGUID()] and true or false
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
function RaidManager:UpdateProfileCurentRaid(GUID, raid)
    LOG:Debug("RaidManager:UpdateProfileCurentRaid(%s)", GUID)
    if ProfileManager:GetProfileByGUID(GUID) then
        local current = self.cache.profileRaidInfo[GUID]
        if current and current:IsActive() then
            current:RemovePlayer(GUID)
        end
        if raid then
            self.cache.profileRaidInfo[GUID] = self.cache.raids[raid:UID()]
            raid:AddPlayer(GUID)
            self:UpdateProfileCurentStandby(GUID, nil)
        else
            self.cache.profileRaidInfo[GUID] = nil
        end
    end
end

function RaidManager:UpdateProfileCurentStandby(GUID, raid)
    LOG:Debug("RaidManager:UpdateProfileCurentStandby(%s)", GUID)
    if ProfileManager:GetProfileByGUID(GUID) then
        local current = self.cache.profileStandbyInfo[GUID]
        if current and current:IsActive() then
            current:RemoveFromStandbyPlayer(GUID)
        end
        if raid then
            self.cache.profileStandbyInfo[GUID] = self.cache.raids[raid:UID()]
            raid:StandbyPlayer(GUID)
            self:UpdateProfileCurentRaid(GUID, nil)
        else
            self.cache.profileStandbyInfo[GUID] = nil
        end
    end
end

function RaidManager:GetProfileRaid(GUID)
    return self.cache.profileRaidInfo[GUID]
end

function RaidManager:GetProfileStandby(GUID)
    return self.cache.profileStandbyInfo[GUID]
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
        LOG:Message(CLM.L["You are not allowed to create raids."])
        return
    end
    if self:IsInActiveRaid() then
        LOG:Message(CLM.L["You are already in an active raid. Leave or finish it before creating new one."])
        return
    end
    if LedgerManager:IsTimeTraveling() then
        LOG:Message(CLM.L["Raid management is disabled during time traveling."])
        return
    end

    LedgerManager:Submit(LEDGER_RAID.Create:new(roster:UID(), name, config))
end

function RaidManager:StartRaid(raid)
    LOG:Trace("RaidManager:StartRaid()")
    if not typeof(raid, Raid) then
        LOG:Message(CLM.L["Missing valid raid"])
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message(CLM.L["You are not allowed to start raid."])
        return
    end
    if raid:Status() ~= CONSTANTS.RAID_STATUS.CREATED then
        LOG:Message(CLM.L["You can only start a freshly created raid."])
        return
    end
    if LedgerManager:IsTimeTraveling() then
        LOG:Message(CLM.L["Raid management is disabled during time traveling."])
        return
    end
    --[===[@non-debug@
    if (self:GetRaid() ~= raid) or not IsInRaid() then
        LOG:Message(CLM.L["You are not in the raid."])
        return
    end
    --@end-non-debug@]===]

    -- Lazy fill raid roster
    RosterManager:AddFromRaidToRoster(raid:Roster())

    local players = {}
    local joining_players_guids = {}
    for i=1,MAX_RAID_MEMBERS do
        local name = GetRaidRosterInfo(i)
        if name then
            local profile = ProfileManager:GetProfileByName(RemoveServer(name))
            if profile then
                table.insert(players, profile)
                joining_players_guids[profile:GUID()] = true
            end
        end
    end

    -- Fill Standby
    -- local standby = keys(MODULES.StandbyStagingManager:GetStandby(raid:UID()))
    local standby = {}
    for GUID,_ in pairs(MODULES.StandbyStagingManager:GetStandby(raid:UID())) do
        if not joining_players_guids[GUID] then
            table.insert(standby, GUID)
        end
    end
    LedgerManager:Submit(LEDGER_RAID.Start:new(raid:UID(), players, standby), true)
    if CLM.GlobalConfigs:GetRaidWarning() then
        SendChatMessage(string.format(CLM.L["Raid [%s] started"], raid:Name()) , "RAID_WARNING")
    end
    self:HandleRosterUpdateEvent()
end

function RaidManager:EndRaid(raid)
    LOG:Trace("RaidManager:EndRaid()")
    if not typeof(raid, Raid) then
        LOG:Message(CLM.L["Missing valid raid"])
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message(CLM.L["You are not allowed to start raid."])
        return
    end
    if not raid:Status() then
        LOG:Message(CLM.L["You can only end an active raid."])
        return
    end
    if LedgerManager:IsTimeTraveling() then
        LOG:Message(CLM.L["Raid management is disabled during time traveling."])
        return
    end
    -- if not self:IsInActiveRaid() then
    --     LOG:Message(CLM.L["You are not in an active raid."])
    --     return
    -- end
    LedgerManager:Submit(LEDGER_RAID.End:new(raid:UID()), true)

    if CLM.GlobalConfigs:GetRaidWarning() and IsInRaid() then
        SendChatMessage(string.format(CLM.L["Raid [%s] ended"], raid:Name()) , "RAID_WARNING")
    end
end

function RaidManager:JoinRaid(raid)
    LOG:Trace("RaidManager:JoinRaid()")
    if not typeof(raid, Raid) then
        LOG:Message(CLM.L["Missing valid raid"])
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message(CLM.L["You are not allowed to join raid."])
        return
    end
    if not raid:IsActive() then
        LOG:Message(CLM.L["You can only join an active raid."])
        return
    end
    if raid == self:GetRaid() then
        LOG:Message(CLM.L["You can only join different raid than your current one."])
        return
    end
    if LedgerManager:IsTimeTraveling() then
        LOG:Message(CLM.L["Raid management is disabled during time traveling."])
        return
    end
    local myProfile = ProfileManager:GetMyProfile()
    if myProfile == nil then
        error("My profile is nil")
    end
    LedgerManager:Submit(LEDGER_RAID.Update:new(raid:UID(), {}, {ProfileManager:GetMyProfile()}), true)
end

function RaidManager:AddToStandby(raid, standby)
    LOG:Trace("RaidManager:AddToStandby()")
    if not typeof(raid, Raid) then
        LOG:Message(CLM.L["Missing valid raid"])
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message(CLM.L["You are not allowed to control raid."])
        return
    end
    if raid:Status() ~= CONSTANTS.RAID_STATUS.IN_PROGRESS then
        LOG:Message(CLM.L["You can only add players to standby of a progressing raid."])
        return
    end
    if LedgerManager:IsTimeTraveling() then
        LOG:Message(CLM.L["Raid management is disabled during time traveling."])
        return
    end
    -- Filter out players currently in standby or in raid
    local standby_filtered = {}
    for _,profile in ipairs(standby) do
        local GUID = profile:GUID()
        if not (raid.players[GUID] or raid.standby[GUID]) then
            table.insert(standby_filtered, GUID)
        end
    end
    if #standby_filtered == 0 then
        LOG:Warning("Empty standby list")
        return
    end
    local entry = LEDGER_RAID.Update:new(raid:UID(), {}, {}, standby_filtered, {})
    LedgerManager:Submit(entry, true)
end

function RaidManager:RemoveFromStandby(raid, removed)
    LOG:Trace("RaidManager:RemoveFromStandby()")
    if not typeof(raid, Raid) then
        LOG:Message(CLM.L["Missing valid raid"])
        return
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        LOG:Message(CLM.L["You are not allowed to control raid."])
        return
    end
    if raid:Status() ~= CONSTANTS.RAID_STATUS.IN_PROGRESS then
        LOG:Message(CLM.L["You can only add players to standby of a progressing raid."])
        return
    end
    if LedgerManager:IsTimeTraveling() then
        LOG:Message(CLM.L["Raid management is disabled during time traveling."])
        return
    end
    -- Filter out players currently not on standby
    local removed_filtered = {}
    for _,profile in ipairs(removed) do
        local GUID = profile:GUID()
        if raid.standby[GUID] then
            table.insert(removed_filtered, GUID)
        end
    end
    if #removed_filtered == 0 then
        LOG:Warning("Empty removed list")
        return
    end
    local entry = LEDGER_RAID.Update:new(raid:UID(), {}, {}, {}, removed_filtered)
    LedgerManager:Submit(entry, true)
end

function RaidManager:GetUniquePlayersListInRaid(raid)
    -- Returns number of unique players - Linked alt/mains are counted as one
    local mainsGuidsInRaid = {}
    local uniquePlayerDict = {}
    -- Loop through all players in raid. They always must be added
    for GUID,_ in pairs(raid.players) do
        local profile = ProfileManager:GetProfileByGUID(GUID)
        if profile then
            uniquePlayerDict[profile:GUID()] = true
            local main = ProfileManager:GetProfileByGUID(profile:Main())
            if profile:HasAlts() then
                -- I am main but have alts
                mainsGuidsInRaid[profile:GUID()] = true
            elseif main then
                -- I am an alt
                mainsGuidsInRaid[main:GUID()] = true
            end
        end
    end
    -- Loop through standby
    for GUID,_ in pairs(raid.standby) do
        local profile = ProfileManager:GetProfileByGUID(GUID)
        if profile then
            local main = ProfileManager:GetProfileByGUID(profile:Main())
            if profile:HasAlts() then
                -- I am main but have alts
                -- I am added only if there is no alt of mine already added
                if not mainsGuidsInRaid[profile:GUID()] then
                    uniquePlayerDict[profile:GUID()] = true
                end
            elseif main then
                -- I am an alt
                -- I am added only if my main isn't added
                if not mainsGuidsInRaid[main:GUID()] then
                    uniquePlayerDict[profile:GUID()] = true
                end
            else
                -- I am main with no alts. I am added always
                uniquePlayerDict[profile:GUID()] = true
            end
        end
    end

    return UTILS.keys(uniquePlayerDict)
end

function RaidManager:RegisterEventHandling()
    if self.isEventHandlingRegistered then return end
    EventManager:RegisterWoWEvent({"RAID_ROSTER_UPDATE", "GROUP_ROSTER_UPDATE", "READY_CHECK"}, (function(...)
        self:HandleRosterUpdateEvent()
    end))
    EventManager:RegisterWoWEvent({"PARTY_LOOT_METHOD_CHANGED","PLAYER_ROLES_ASSIGNED"}, (function(...)
        self:UpdateGameRaidInformation() -- we dont need to check others; im not even sure if we need to do this
    end))
    self.isEventHandlingRegistered = true
end

function RaidManager:HandleRosterUpdateEvent()
    LOG:Trace("RaidManager:HandleRosterUpdateEvent()")
    if not IsInRaid() then return end
    if LedgerManager:IsTimeTraveling() then return end
    -- Update wow raid information
    self:UpdateGameRaidInformation()
    -- Auto award handling removal in case of raid owner change
    self:DisableAutoAwarding()
    -- Handle roster update
    if self:IsRaidOwner() and self:IsInProgressingRaid() then
        self:UpdateRaiderList()
        self:EnableAutoAwarding()
    end
end

function RaidManager:EnableAutoAwarding()
    LOG:Trace("RaidManager:EnableAutoAwarding()")
    local config = self:GetRaid():Configuration()
    local bossKillBonus = config:Get("bossKillBonus")
    local intervalBonus = config:Get("intervalBonus")

    if bossKillBonus or intervalBonus then
        MODULES.AutoAwardManager:Enable()
    end

    if bossKillBonus then
        MODULES.AutoAwardManager:EnableBossKillBonusAwarding()
    end

    if intervalBonus then
        MODULES.AutoAwardManager:EnableIntervalBonusAwarding()
    end
end

function RaidManager:DisableAutoAwarding()
    LOG:Trace("RaidManager:DisableAutoAwarding()")
    MODULES.AutoAwardManager:DisableBossKillBonusAwarding()
    MODULES.AutoAwardManager:DisableIntervalBonusAwarding()
    MODULES.AutoAwardManager:Disable()
end

function RaidManager:UpdateGameRaidInformation()
    local lootmethod, _, masterlooterRaidID = GetLootMethod()
    LOG:Info("Loot method: %s (id: %s)", lootmethod, masterlooterRaidID)
    self.RaidAssistants = {}
    self.IsMasterLootSystem = false
    if lootmethod == "master" and masterlooterRaidID then
        local name = GetRaidRosterInfo(masterlooterRaidID)
        if name then
            name = RemoveServer(name)
            self.IsMasterLootSystem = true
            self.MasterLooter = name
            self.RaidAssistants[name] = true -- we add it in case ML is not an assistant
            LOG:Info("Master Looter: %s", name)
        end
    end

    for i=1,MAX_RAID_MEMBERS do
        local name, rank = GetRaidRosterInfo(i)
        if name then
            name = RemoveServer(name)
            if rank >= 1 then
                self.RaidAssistants[name] = true
            end
            if rank == 2 then
                self.RaidLeader = name
                LOG:Debug("Raid Leader: %s", self.RaidLeader)
            end
        end
    end
end

function RaidManager:UpdateRaiderList()
    LOG:Trace("RaidManager:UpdateRaiderList()")
    local raid = self:GetRaid()
    if not raid then
        LOG:Debug("Not in raid")
        return
    end
    -- Dont execute this more often than every 1s
    -- if GetServerTime() - self.lastRosterUpdateTime < 1 then return end
    -- self.lastRosterUpdateTime = GetServerTime()

    -- Fill missing profiles from roster as in this raid
    RosterManager:AddFromRaidToRoster(self:GetRaid():Roster())

    local current, joiners, leavers = {}, {}, {}
    -- Detect leavers; build current set
    for i=1,MAX_RAID_MEMBERS do
        local name = GetRaidRosterInfo(i)
        if name then
            name = RemoveServer(name)
            current[name] = true
            local profile = ProfileManager:GetProfileByName(name)
            if profile then
                if not raid:IsPlayerInRaid(profile:GUID()) then
                    table.insert(leavers,  profile)
                end
            end
        end
    end

    -- Detect joiners
    for _,profile in ipairs(raid:Profiles()) do
        if not current[profile:Name()] then
            table.insert(joiners, profile)
        end
    end

    LOG:Debug("RaidManager:UpdateRaiderList(): +%d -%d", #joiners, #leavers)
    if (#joiners > 0) or (#leavers > 0) then
        LedgerManager:Submit(LEDGER_RAID.Update:new(raid:UID(), joiners, leavers), true) -- force update
    end
end

function RaidManager:IsRaidOwner(name)
    LOG:Trace("RaidManager:IsRaidOwner()")
    name = name or whoami()
    local isOwner
    if IsPlayerInPvP() then
        LOG:Debug("Player in PvP")
        return false
    end
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
        isOwner = false
        LOG:Debug("Not Assistant")
    else
        if self.IsMasterLootSystem then
            isOwner = (self.MasterLooter == name)
            LOG:Debug("ML system %s/%s", self.MasterLooter, name)
        else
            isOwner = (self.RaidLeader == name)
            LOG:Debug("Not ML system %s/%s", self.RaidLeader, name)
        end
    end
    if not isOwner then
        LOG:Debug("%s is not raid owner.", name)
    end
    return isOwner
end

function RaidManager:IsAllowedToAuction(name, relaxed)
    LOG:Trace("RaidManager:IsAllowedToAuction()")
    name = name or whoami()

    if not relaxed then -- Relaxed requirements: doesn't need to be assitant (for out of guild checks)
        if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
            LOG:Debug("Not Assistant")
            return false
        end
    end

    local allow = self.RaidAssistants[name]
    if not allow then
        LOG:Debug("%s is not allowed to auction.", name)
    end
    return allow
end

function RaidManager:GetRaid()
    return self.cache.profileRaidInfo[whoamiGUID()]
end

function RaidManager:GetStandby()
    return self.cache.profileStandbyInfo[whoamiGUID()]
end

function RaidManager:WipeAll()
    self.cache = {
        current = {
            raid = nil,
            isRaidManager = false,
            raidManager = "",
        },
        raids = {},
        profileRaidInfo = {},
        profileStandbyInfo = {}
    }
end

CONSTANTS.RAID_STATUS =
{
    CREATED = 0,
    IN_PROGRESS = 1,
    FINISHED = 2,
    STALE = 3
}

CONSTANTS.RAID_STATUS_GUI = {
    [CONSTANTS.RAID_STATUS.CREATED]     = CLM.L["Created"],
    [CONSTANTS.RAID_STATUS.IN_PROGRESS] = CLM.L["In Progress"],
    [CONSTANTS.RAID_STATUS.FINISHED]    = CLM.L["Finished"],
    [CONSTANTS.RAID_STATUS.STALE]       = CLM.L["Stale"]
}

CONSTANTS.RAID_STATUS_ACTIVE = UTILS.Set({ 0, 1 })

CONSTANTS.RAID_STATUSES = UTILS.Set({ 0, 1, 2, 3 })

MODULES.RaidManager = RaidManager
