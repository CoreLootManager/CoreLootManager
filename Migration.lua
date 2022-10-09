local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS

local ACL = MODULES.ACL
local LedgerManager = MODULES.LedgerManager
local Comms = MODULES.Comms

local ColorCodeText = UTILS.ColorCodeText

local LEDGER_ROSTER = MODELS.LEDGER.ROSTER
local LEDGER_PROFILE = MODELS.LEDGER.PROFILE
local LEDGER_DKP = MODELS.LEDGER.POINTS
local LEDGER_LOOT = MODELS.LEDGER.LOOT

local Migration = {}
function Migration:Initialize()
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then return end
    self:RegisterSlash()
    self.migrationOngoing = false
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag == 0 and uncommitted == 0 then
            if self.migrationOngoing then
                LOG:Message(CLM.L["All migration entries were commited and executed. Congratulations!"])
                self.migrationOngoing = false
            end
            return
        end
        if self.migrationOngoing then
            LOG:Message(CLM.L["Migration ongoing: %s(%s)"], lag, uncommitted)
        end
    end)
end

local function GetPlayerGuid(self, name)
    return self.playerCache[name]
end

local timestampCounter = {}
function Migration:Migrate()
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then return end
    if LedgerManager:Length() > 0 then
        LOG:Message(CLM.L["Unable to execute migration. Entries already exist."])
        return
    end
    Comms:Disable()
    LOG:Message(CLM.L["Executing Addon Migration with comms disabled."])
    -- self.timestamp = UTILS.GetCutoffTimestamp()
    self.playerCache = {}
    for i=1,GetNumGuildMembers() do
        local name, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        self.playerCache[UTILS.RemoveServer(name)] = GUID
    end
    self.migrationOngoing = true

    self:MigrateMonolithDKP()
    self:MigrateEssentialDKP()
    self:MigrateCommunityDKP()
    LOG:Message(CLM.L["Migration complete. %s to apply and sync with others or go to %s to discard."],
        ColorCodeText("/reload", "00cc00"),
        ColorCodeText(CLM.L["Minimap Icon -> Configuration -> Wipe events"], "6699ff"))
end

function Migration:GetOldTimestampUnique()
    self.timestamp = self.timestamp + 1
    return self.timestamp
end

function Migration:MigrateMonolithDKP()
    LOG:Trace("Migration:MigrateMoolithDKP()")
    self:_MigrateMonolithEssential("MonolithDKP")
end

function Migration:MigrateEssentialDKP()
    LOG:Trace("Migration:MigrateEssentialDKP()")
    self:_MigrateMonolithEssential("EssentialDKP")
end

function Migration:MigrateCommunityDKP()
    LOG:Trace("Migration:MigrateCommunityDKP()")
    self:_MigrateCommunity()
end

local function NewRoster(name)
    local timestamp = Migration:GetOldTimestampUnique()
    local roster = LEDGER_ROSTER.Create:new(timestamp, name, CONSTANTS.POINT_TYPE.DKP)
    LOG:Message(CLM.L["New roster: [%s]"], name)
    roster:setTime(timestamp)
    LedgerManager:Submit(roster)
    return name, timestamp
end

local function NewProfile(GUID, name, class)
    local timestamp = Migration:GetOldTimestampUnique()
    local profile = LEDGER_PROFILE.Update:new(GUID, name, class)
    profile:setTime(timestamp)
    LedgerManager:Submit(profile)
end

local function AddProfilesToRoster(uid, profiles)
    local timestamp = Migration:GetOldTimestampUnique()
    local profilesUpdate = LEDGER_ROSTER.UpdateProfiles:new(uid, profiles, false)
    profilesUpdate:setTime(timestamp)
    LedgerManager:Submit(profilesUpdate)
end

local function UpdatePoints(uid, targets, value)
    -- points need to be set with newest time so they will overwrite the loot cost
    local timestamp = GetServerTime()
    if not timestampCounter[timestamp] then
        timestampCounter[timestamp] = 0
    else
        timestampCounter[timestamp] = timestampCounter[timestamp] + 1
    end

    local entry = LEDGER_DKP.Set:new(uid, { targets }, value, CONSTANTS.POINT_CHANGE_REASON.IMPORT)

    local t = entry:targets()
    if not t or (#t == 0) then
        LOG:Message(CLM.L["UpdatePoints(): Empty targets list"])
        return
    end

    entry:setTime(timestamp)
    entry:setCounter(timestampCounter[timestamp])
    LedgerManager:Submit(entry)
end

local function AwardItem(uid, GUID, itemId, value, timestamp)
    local loot = LEDGER_LOOT.Award:new(uid, GUID, itemId, value)
    loot:setTime(timestamp)
    LedgerManager:Submit(loot)
end

local function ValidateAddon(addonName)
	local _, _, _, enabled, reason = GetAddOnInfo(addonName)
	if reason == "MISSING" or reason == "DISABLED" or not enabled then
		return false -- Missing or globally disabled
	end

	local loaded, finished = IsAddOnLoaded(addonName)
	if not loaded then
		return false -- Disabled for the current character
	end

	if not finished then
		CLM:Error("%s has not finished loading!", addonName)
		return false -- Should not happen
	end
    return true
end

function Migration:_MigrateMonolithEssential(addonName)
	if not ValidateAddon(addonName) then
        LOG:Message(CLM.L["Skipping %s"], addonName)
        return
    end
    if not MonDKP_DKPTable then return end
    if not MonDKP_Loot then return end
    LOG:Message(CLM.L["Migrating %s"], addonName)
    -- Detect oldest timestamp
    local oldestTimestamp = GetServerTime()
    for _,entry in ipairs(MonDKP_Loot) do
        local timestamp = tonumber(entry.date)
        if timestamp then
            if timestamp < oldestTimestamp then
                oldestTimestamp = timestamp
            end
        end
    end
    self.timestamp = oldestTimestamp - 86400 -- Since we increment it later on then we want to have a buffer
    -- Import profiles
    LOG:Message(CLM.L["Importing %s entries from DKPTable"], #MonDKP_DKPTable)
    self.playerDKP = {}
    self.playerList = {}
    local rosterCreated = false
    local rosterName, rosterUid
    for key, entry in pairs(MonDKP_DKPTable) do
        if tonumber(key) then -- skip seed
            local name = entry.player or ""
            local class = entry.class or ""
            -- local spec = entry.spec or ""
            local dkp = entry.dkp or 0
            if GetPlayerGuid(self, name) then
                -- Lazy create roster if at least one profile exists
                -- Create Roster
                if not rosterCreated then
                    rosterName, rosterUid = NewRoster(addonName)
                    rosterCreated = true
                end
                -- Create Profile
                NewProfile(GetPlayerGuid(self, name), name, class)
                table.insert(self.playerList, GetPlayerGuid(self, name))
                self.playerDKP[name] = dkp
            end
        end
    end
    if #self.playerList == 0 then
        LOG:Error(CLM.L["Migration failure: Unable to create profiles"])
        return
    end
    -- Add profiles to roster
    LOG:Message(CLM.L["Adding %s profiles to %s"], #self.playerList, rosterName)
    AddProfilesToRoster(rosterUid, self.playerList)
    -- Import Loot History
    for _,entry in ipairs(MonDKP_Loot) do
        local name = entry.player or ""
        local itemLink = entry.loot or ""
        local itemId = UTILS.GetItemIdFromLink(itemLink)
        local value = math.abs(entry.cost or 0)
        local timestamp = entry.date
        if not (entry.deletedby or entry.deletes) then
            if GetPlayerGuid(self, name) and itemId > 0 then
                AwardItem(rosterUid, GetPlayerGuid(self, name), itemId, value, timestamp)
            end
        end
    end
    -- Set player DKP
    for name,dkp in pairs(self.playerDKP) do
        UpdatePoints(rosterUid, GetPlayerGuid(self, name), dkp)
    end
    LOG:Message(CLM.L["Import complete"])
end

local function CommDKP_GetRealmName()
	return GetRealmName() .."-"..UnitFactionGroup(UnitName("player"))
end

function Migration:_MigrateCommunity()
    if not ValidateAddon("CommunityDKP") then
        LOG:Message(CLM.L["Skipping CommunityDKP"])
        return
    end
    if not CommDKP_DB then return end
    if not CommDKP_DKPTable then return end
    if not CommDKP_Loot then return end

    LOG:Message(CLM.L["Migrating %s"], "CommunityDKP")

    local realmFaction = CommDKP_GetRealmName()
    local guild = GetGuildInfo("player") or ""

    -- Verify existence of all needed variables and prepare
    if not CommDKP_DB[realmFaction] then return end
    if not CommDKP_DB[realmFaction][guild] then return end
    local DB = CommDKP_DB[realmFaction][guild]

    if not CommDKP_DKPTable[realmFaction] then return end
    if not CommDKP_DKPTable[realmFaction][guild] then return end
    local DKPTable = CommDKP_DKPTable[realmFaction][guild]

    if not CommDKP_Loot[realmFaction] then return end
    if not CommDKP_Loot[realmFaction][guild] then return end
    local Loot = CommDKP_Loot[realmFaction][guild]
    -- Get Existing teams
    local teams = {}
    for id, teamInfo in pairs(DB.teams) do
        table.insert(teams, {id = id, name = teamInfo.name})
    end
    if #teams == 0 then
        LOG:Error(CLM.L["Migration failure: Detected 0 teams"])
        return
    end
    -- Detect oldest timestamp
    local oldestTimestamp = GetServerTime()
    for _, team in ipairs(teams) do
        if Loot[team.id] then
            for _,entry in ipairs(Loot[team.id]) do
                local timestamp = tonumber(entry.date)
                if timestamp then
                    if timestamp < oldestTimestamp then
                        oldestTimestamp = timestamp
                    end
                end
            end
        end
    end
    self.timestamp = oldestTimestamp - 86400 -- Since we increment it later on then we want to have a buffer
    -- Import profiles
    local playerDKP = {}
    local playerProfiles = {}
    local teamProfiles = {}
    local teamRoster = {}
    LOG:Message(CLM.L["Importing profiles from DKPTable"])
    for _, team in ipairs(teams) do
        local rosterCreated = false
        local rosterName, rosterUid
        if DKPTable[team.id] then
            teamProfiles[team.name] = {}
            playerDKP[team.name] = {}
            for key, entry in pairs(DKPTable[team.id]) do
                if tonumber(key) then -- skip seed
                    local name = entry.player or ""
                    local class = entry.class or ""
                    local dkp = entry.dkp or 0
                    if GetPlayerGuid(self, name) then -- import only existing guild members
                        if not rosterCreated then -- lazy create roster if at least one profile exists
                            rosterName, rosterUid = NewRoster(team.name)
                            teamRoster[rosterName] = rosterUid
                            rosterCreated = true
                        end
                        -- Create Profile if not existing
                        if not playerProfiles[name] then
                            NewProfile(GetPlayerGuid(self, name), name, class)
                            playerProfiles[name] = true
                        end
                        playerDKP[team.name][name] = dkp
                        table.insert(teamProfiles[team.name], GetPlayerGuid(self, name))
                    end
                end
            end
        end
    end
    if rawequal(next(playerProfiles), nil) then
        LOG:Error(CLM.L["Migration failure: Unable to create profiles"])
        return
    end
    -- Add profiles to rosters
    for _, team in ipairs(teams) do
        if DKPTable[team.id] then
            if #teamProfiles[team.name] > 0 then
                LOG:Message(CLM.L["Adding %s profiles to %s"], #teamProfiles[team.name], team.name)
                AddProfilesToRoster(teamRoster[team.name], teamProfiles[team.name])
            end
        end
    end
    -- Import Loot History
    for _, team in ipairs(teams) do
        if Loot[team.id] then
            local lootCount = 0
            for _,entry in ipairs(Loot[team.id]) do
                local name = entry.player or ""
                local itemLink = entry.loot or ""
                local itemId = UTILS.GetItemIdFromLink(itemLink)
                local value = math.abs(entry.cost or 0)
                local timestamp = entry.date
                if not (entry.deletedby or entry.deletes) then
                    lootCount = lootCount + 1
                    if GetPlayerGuid(self, name) and itemId > 0 then
                        AwardItem(teamRoster[team.name], GetPlayerGuid(self, name), itemId, value, timestamp)
                    end
                end
            end
            LOG:Message(CLM.L["Adding %s loot entries for team to %s"], lootCount, team.name)
        end
    end
    -- Set player DKP
    for teamName, data in pairs(playerDKP) do
        local dkpSet = 0
        for name,dkp in pairs(data) do
            UpdatePoints(teamRoster[teamName], GetPlayerGuid(self, name), dkp)
            dkpSet = dkpSet + 1
        end
        LOG:Message(CLM.L["Set points for %s players for team to %s"], dkpSet, teamName)
    end
    LOG:Message(CLM.L["Import complete"])
end

function Migration:RegisterSlash()
    local options = {
        migrate = {
            type = "execute",
            name = "Migrate",
            desc = CLM.L["Execute migration from MonolithDKP, EssentialDKP or CommunityDKP"],
            handler = self,
            func = "Migrate",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end


CLM.Migration = Migration