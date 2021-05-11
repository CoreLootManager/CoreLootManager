local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS

local ACL = MODULES.ACL
local LedgerManager = MODULES.LedgerManager

local LEDGER_ROSTER = MODELS.LEDGER.ROSTER
local LEDGER_PROFILE = MODELS.LEDGER.PROFILE
local LEDGER_DKP = MODELS.LEDGER.DKP
local LEDGER_LOOT = MODELS.LEDGER.LOOT

local Migration = {}
function Migration:Initialize()
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then return end
    self:RegisterSlash()
    self.migrationOngoing = false
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag == 0 and uncommitted == 0 then
            if self.migrationOngoing then
                LOG:Info("All migration entries were commited and executed. Congratulations!")
                self.migrationOngoing = false
            end
            return
        end
        if self.migrationOngoing then
            LOG:Info("Migration ongoing: %s(%s)", lag, uncommitted)
        end
    end)
end

local timestampCounter = {}
function Migration:Migrate()
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then return end
    LOG:Warning("Executing Addon Migration")
    self.timestamp = UTILS.GetCutoffTimestamp()
    self.playerCache = {}
    for i=1,GetNumGuildMembers() do
        local name, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        self.playerCache[UTILS.RemoveServer(name)] = GUID
    end
    self.migrationOngoing = true
    -- self:MigrateMonolithDKP()
    self:MigrateEssentialDKP()
    -- self:MigrateCommunityDKP()

end

function Migration:GetOldTimestampUnique()
    self.timestamp = self.timestamp + 1
    return self.timestamp
end

function Migration:MigrateMonolithDKP()
    LOG:Trace("Migration:MigrateMoolithDKP()")
    LOG:Warning("Migrating MonolithDKP")
    self:_MigrateMonolithEssential("MonolithDKP")
end

function Migration:MigrateEssentialDKP()
    LOG:Trace("Migration:MigrateEssentialDKP()")
    LOG:Warning("Migrating EssentalDKP")
    self:_MigrateMonolithEssential("EssentialDKP")
end

function Migration:MigrateCommunityDKP()
    LOG:Trace("Migration:MigrateCommunityDKP()")
    LOG:Warning("Migrating CommunityDKP - TBD")
end

local function NewRoster(name)
    local timestamp = Migration:GetOldTimestampUnique()
    local roster = LEDGER_ROSTER.Create:new(timestamp, name, CONSTANTS.POINT_TYPE.DKP)
    LOG:Info("New roster: [%s]", name)
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
    targets = { targets }

    local entry = LEDGER_DKP.Set:new(uid, targets, value, CONSTANTS.POINT_CHANGE_REASON.IMPORT)

    local t = entry:targets()
    if not t or (#t == 0) then
        LOG:Warning("UpdatePoints(): Empty targets list")
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

function Migration:_MigrateMonolithEssential(addonName)
	local _, _, _, _, reason = GetAddOnInfo(addonName)
	if reason == "MISSING" or reason == "DISABLED" then
		return -- Missing or globally disabled
	end

	local loaded, finished = IsAddOnLoaded(addonName)
	if not loaded then
		return -- Disabled for the current character
	end

	if not finished then
		CLM:Error(addonName .. " has not finished loading!")
		return -- Should not happen
	end
    if not MonDKP_DKPTable then return end
    if not MonDKP_Loot then return end
    -- Create Roster
    local rosterName, rosterUid = NewRoster(addonName)
    -- Import profiles
    LOG:Info("Importing %s entries from DKPTable", #MonDKP_DKPTable)
    self.playerDKP = {}
    self.playerList = {}
    for key, entry in pairs(MonDKP_DKPTable) do
        if tonumber(key) then -- skip seed
            local name = entry.player or ""
            local class = entry.class or ""
            -- local spec = entry.spec or ""
            local dkp = entry.dkp or 0
            if self.playerCache[name] then
                NewProfile(self.playerCache[name], name, class)
                table.insert(self.playerList, self.playerCache[name])
                self.playerDKP[name] = dkp
            end
        end
    end
    if #self.playerList == 0 then
        LOG:Error("Migration failure: Unable to create profiles")
        return
    end
    -- Add profiles to roster
    LOG:Info("Adding %s profiles to %s", #self.playerList, rosterName)
    AddProfilesToRoster(rosterUid, self.playerList)
    -- Import Loot History
    for _,entry in ipairs(MonDKP_Loot) do
        local name = entry.player or ""
        local itemLink = entry.loot or ""
        local itemId = UTILS.GetItemIdFromLink(itemLink)
        local value = math.abs(entry.cost or 0)
        local timestamp = entry.date
        if not (entry.deletedby and entry.deletes) then
            if self.playerCache[name] and itemId > 0 then
                AwardItem(rosterUid, self.playerCache[name], itemId, value, timestamp)
            end
        end
    end
    -- Set player DKP
    for name,dkp in pairs(self.playerDKP) do
        UpdatePoints(rosterUid, self.playerCache[name], dkp)
    end
    LOG:Warning("Import complete")
end

function Migration:RegisterSlash()
    local options = {
        migrate = {
            type = "execute",
            name = "Migrate",
            desc = "Execute migration from MonolithDKP, EssentialDKP or CommunityDKP",
            handler = self,
            func = "Migrate",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end


CLM.Migration = Migration