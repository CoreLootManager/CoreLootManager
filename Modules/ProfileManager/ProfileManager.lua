local _, CLM = ...
-- Upvalues
local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS
-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local keys = UTILS.keys
local typeof = UTILS.typeof
local empty = UTILS.empty
local capitalize = UTILS.capitalize
local getGuidFromInteger = UTILS.getGuidFromInteger
local NumberToClass = UTILS.NumberToClass
local whoamiGUID = UTILS.whoamiGUID

local Profile = CLM.MODELS.Profile
local PruneLog = CLM.MODELS.ProfilePruneLog

local LedgerManager = MODULES.LedgerManager

local LEDGER_PROFILE = CLM.MODELS.LEDGER.PROFILE

local ProfileManager = { }

function ProfileManager:Initialize()
    LOG:Trace("ProfileManager:Initialize()")

    self.cache = {
        profilesGuidMap = {},
        profiles = {}
    }

    self.db = MODULES.Database:Personal('profileManager', {
        pruneLog = {}
    })

    -- Register mutators
    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Update,
        (function(entry)
            LOG:TraceAndCount("mutator(ProfileUpdate)")
            local iGUID = entry:GUID()
            if type(iGUID) ~= "number" then return end
            local GUID = getGuidFromInteger(iGUID)
            local name = entry:name()
            if empty(name) then return end

            local class = capitalize(NumberToClass(entry:ingameClass()))
            local main = entry:main()
            main =  (type(main) == "number" and main ~= 0) and getGuidFromInteger(main) or ""
            -- Check if it's an update
            local profileInternal = self.cache.profiles[GUID]
            if profileInternal then
                if empty(class) then
                    class = profileInternal:Class()
                end
                if empty(main) then
                    main = profileInternal:Main()
                end
                profileInternal.class = class
                profileInternal.main = main
            else
                local profile = Profile:New(entry, name, class, main)
                profile:SetGUID(GUID)
                self.cache.profiles[GUID] = profile
                self.cache.profilesGuidMap[strlower(name)] = GUID
                -- Check for conditional restore
                local rosters = MODULES.RosterManager:GetRosters()
                for _, roster in pairs(rosters) do
                    if roster:IsConditinallyRemoved(GUID) then
                        roster:RestoreConditionallyRemoved(GUID)
                    end
                end
            end
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Remove,
        (function(entry)
            LOG:TraceAndCount("mutator(ProfileRemove)")
            local GUID = entry:GUID()
            if type(GUID) ~= "number" then return end
            GUID = getGuidFromInteger(GUID)
            local profile = self.cache.profiles[GUID]
            if profile then
                -- Check alt-main linking before removing
                if profile:HasAlts() then
                    for altGUID in pairs(profile:Alts()) do
                        local altProfile = self:GetProfileByGUID(altGUID)
                        if altProfile then
                            altProfile:SetMain("")
                        end
                    end
                elseif (profile:Main() ~= "") then
                    local mainProfile = self:GetProfileByGUID(profile:Main())
                    if mainProfile then
                        mainProfile:RemoveAlt(GUID)
                    end
                end
                -- Remove
                self.cache.profiles[GUID] = nil
                -- Conditonally remove for backwards compatibility
                local rosters = MODULES.RosterManager:GetRosters()
                for _, roster in pairs(rosters) do
                    if roster:IsProfileInRoster(GUID) then
                        roster:MarkAsConditionallyRemoved(GUID)
                    end
                end
            end
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Link,
        (function(entry)
            LOG:TraceAndCount("mutator(ProfileLink)")
            local altGUID = entry:GUID()
            if type(altGUID) ~= "number" then return end
            altGUID = getGuidFromInteger(altGUID)
            local mainGUID = entry:main()
            if type(mainGUID) ~= "number" then return end
            if altGUID == mainGUID then return end
            mainGUID = getGuidFromInteger(mainGUID)
            local altProfile = self:GetProfileByGUID(altGUID)
            if not typeof(altProfile, Profile) then return end
            local mainProfile = self:GetProfileByGUID(mainGUID)
            if not typeof(mainProfile, Profile) then -- Unlink
                -- Check if our main exists
                local currentMainProfile = self:GetProfileByGUID(altProfile:Main())
                if not typeof(currentMainProfile, Profile) then return end
                -- Remove main from this alt
                altProfile:ClearMain()
                -- Remove alt count from main
                currentMainProfile:RemoveAlt(altGUID)
            else -- Link
                -- Sanity check if not setting existing one
                if altProfile:Main() == mainProfile:GUID() then return end
                -- Do not allow alt chaining if main is alt
                if typeof(self:GetProfileByGUID(mainProfile:Main()), Profile) then return end
                -- Do not allow alt chaining if alt has alts
                if altProfile:HasAlts() then return end
                -- Set new main of this alt
                altProfile:SetMain(mainGUID)
                -- Add alt to our main
                mainProfile:AddAlt(altGUID)
                -- Handle consequences of linking:
                -- For each roster this alt is present in:
                local rosters = MODULES.RosterManager:GetRosters()
                for _,roster in pairs(rosters) do
                    if roster:IsProfileInRoster(altGUID) then
                        -- 1) Add main if not present in roster
                        roster:AddProfileByGUID(mainGUID)
                        -- 2) Sum points of the pool and new alt
                        local pointSum = roster:Standings(mainGUID) + roster:Standings(altGUID)
                        -- 3) Set new Main standings
                        roster:SetStandings(mainGUID, pointSum)
                        -- 4) Mirror standings from main to alts
                        roster:MirrorStandings(mainGUID, mainProfile:Alts(), true)
                        -- 5) Mirror weekly gains from main to alts
                        roster:MirrorWeeklyGains(mainGUID, mainProfile:Alts(), true)
                        -- 6) History entry
                        local targets = keys(mainProfile:Alts())
                        table.insert(targets, 1, mainGUID)
                        MODULES.PointManager:AddFakePointHistory(roster, targets, pointSum, CONSTANTS.POINT_CHANGE_REASON.LINKING_OVERRIDE, entry:time(), entry:creator())
                    end
                end
            end
        end))

    LedgerManager:RegisterOnRestart(function()
        self:WipeAll()
    end)

    MODULES.ConfigManager:RegisterUniversalExecutor("pm", "ProfileManager", self)
end

function ProfileManager:NewProfile(GUID, name, class)
    LOG:Trace("ProfileManager:NewProfile()")
    if type(GUID) ~= "string" or GUID == "" then
        LOG:Error("NewProfile(): Empty GUID")
        return
    end
    if type(name) ~= "string" or name == "" then
        LOG:Error("NewProfile(): Empty name")
        return
    end
    if self:GetProfileByGUID(GUID) or self:GetProfileByName(name) then
        LOG:Debug("NewProfile(): %s (%s) already exists", name, GUID)
        return
    end
    LOG:Debug("New profile: [%s]: %s", GUID, name)
    LedgerManager:Submit(LEDGER_PROFILE.Update:new(GUID, name, class), true)
end

function ProfileManager:RemoveProfile(GUID)
    LOG:Trace("ProfileManager:RemoveProfile()")
    if type(GUID) ~= "string" or GUID == "" then
        LOG:Error("RemoveProfile(): Empty GUID")
        return
    end
    LOG:Debug("Remove profile: [%s]", GUID)
    LedgerManager:Submit(LEDGER_PROFILE.Remove:new(GUID), true)
end

local function PruneProfile(self, GUID, log)
    local profile = self.cache.profiles[GUID]
    if not profile then return end
    local entry = profile:Entry()
    if not entry then return end
    log:Add(profile:Name())
    LedgerManager:Remove(entry)
end

function ProfileManager:MarkAsAltByNames(alt, main)
    LOG:Trace("ProfileManager:MarkAsAltByNames()")
    local altProfile = self:GetProfileByName(alt)
    if not typeof(altProfile, Profile) then
        LOG:Error("MarkAsAltByNames(): Invalid alt")
        return
    end
    local mainProfile = self:GetProfileByName(main)
    -- Unlink
    if not typeof(mainProfile, Profile) then
        if altProfile:Main() ~= "" then
            LedgerManager:Submit(LEDGER_PROFILE.Link:new(altProfile:GUID(), nil), true)
        end
    else -- Link
        -- Do not allow alt chaining if main is alt
        if typeof(self:GetProfileByGUID(mainProfile:Main()), Profile) then return end
        -- Do not allow alt chaining if alt has alts
        if altProfile:HasAlts() then return end
        -- Don't allow self setting
        if altProfile:GUID() == mainProfile:GUID() then return end
        -- Don't allow re-setting
        if altProfile:Main() == mainProfile:GUID() then return end
        LedgerManager:Submit(LEDGER_PROFILE.Link:new(altProfile:GUID(), mainProfile:GUID()), true)
    end
end

-- Functionalities

function ProfileManager:FillFromGuild(selectedRank, minLevel)
    LOG:Trace("ProfileManager:FillFromGuild()")
    if LOG.SEVERITY.DEBUG >= LOG:GetSeverity() then
        LOG:Debug("FillFromGuild: rank: {%s}, minLevel: %s", selectedRank, minLevel)
    end

    local rankFilterFn, minLevelFn
    if type(selectedRank) == "number" and selectedRank >= 0 then
        rankFilterFn = (function(rankIndex)
            return (selectedRank - 1) == rankIndex
        end)
    else
        rankFilterFn = (function(rankIndex)
            return true
        end)
    end

    minLevel = tonumber(minLevel)
    if type(minLevel) == "number" then
        minLevelFn = (function(level, minLevelValue)
            if level >= minLevelValue then
                return true
            end
            return false
        end)
    else
        minLevelFn = (function(level, _)
            return true
        end)
    end

    for i=1,GetNumGuildMembers() do
        local name, _, rankIndex, level, _, _, _, _, _, _, class, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        name, _ = strsplit("-", name)
        if rankFilterFn(rankIndex) and minLevelFn(level, minLevel) then
            self:NewProfile(GUID, name, class)
        end
    end
end

function ProfileManager:FillFromRaid()
    LOG:Trace("ProfileManager:FillFromRaid()")
    if not IsInRaid() then return end
    for i=1,MAX_RAID_MEMBERS do
        local name, _, _, _, _, class = GetRaidRosterInfo(i)
        if name ~= nil then
            name, _ = strsplit("-", name)
            local GUID = UnitGUID("raid" .. tostring(i))
            self:NewProfile(GUID, name, class)
        end
    end
end

function ProfileManager:AddTarget()
    LOG:Trace("ProfileManager:AddTarget()")
    if UnitIsPlayer("target") then
        local GUID = UnitGUID("target")
        local name = UTILS.GetUnitName("target")
        local _, class, _ = UnitClass("target");

        self:NewProfile(GUID, name, class)
    else
        LOG:Warning("Your target must be a player.")
    end
end

function ProfileManager:PruneBelowLevel(minLevel, nop)
    LOG:Trace("ProfileManager:PruneBelowLevel()")
    local log = PruneLog:New("level", nop)
    local prune
    if nop then
        LOG:Info("Pruning: No operation")
        prune = (function(GUID)
            local profile = self.cache.profiles[GUID]
            if not profile then return end
            log:Add(profile:Name())
        end)
    else
        prune = (function(GUID) PruneProfile(self, GUID, log) end)
    end
    local pruned = 0
    for i=1,GetNumGuildMembers() do
        local _, _, _, level, _, _, _, _, _, _, _, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        if level < minLevel then
            prune(GUID)
            pruned = pruned + 1
        end
    end
    if pruned > 0 then table.insert(self.db.pruneLog, log) end
    LOG:Info("Pruned %s profiles below level %s", pruned, minLevel)
end

function ProfileManager:PruneRank(rank, nop)
    LOG:Trace("ProfileManager:PruneRank()")
    local log = PruneLog:New("rank", nop)
    local prune
    if nop then
        LOG:Info("Pruning: No operation")
        prune = (function(GUID)
            local profile = self.cache.profiles[GUID]
            if not profile then return end
            log:Add(profile:Name())
        end)
    else
        prune = (function(GUID) PruneProfile(self, GUID, log) end)
    end
    local check
    if type(rank) == "number" then
        check = (function(_, rankIndexValue, rankValue)
            return (rankIndexValue == rankValue)
        end)
    else
        rank = strlower(rank or "")
        check = (function(rankNameValue, _, rankValue)
            return (strlower(rankNameValue) == rankValue)
        end)
    end
    local pruned = 0
    for i=1,GetNumGuildMembers() do
        local _, rankName, rankIndex, _, _, _, _, _, _, _, _, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        if check(rankName, rankIndex, rank) then
            prune(GUID)
            pruned = pruned + 1
        end
    end
    if pruned > 0 then table.insert(self.db.pruneLog, log) end
    LOG:Info("Pruned %s profiles with rank %s", pruned, rank)
end

function ProfileManager:PruneUnguilded(nop)
    LOG:Trace("ProfileManager:PruneUnguilded()")
    local log = PruneLog:New("unguilded", nop)
    local prune
    if nop then
        LOG:Info("Pruning: No operation")
        prune = (function(GUID)
            local profile = self.cache.profiles[GUID]
            if not profile then return end
            log:Add(profile:Name())
        end)
    else
        prune = (function(GUID) PruneProfile(self, GUID, log) end)
    end
    local GUIDs = {}
    local pruned = 0
    for i=1,GetNumGuildMembers() do
        local _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        GUIDs[GUID] = true
    end
    for GUID in pairs(self.cache.profiles) do
        if not GUIDs[GUID] then
            prune(GUID)
            pruned = pruned + 1
        end
    end
    if pruned > 0 then table.insert(self.db.pruneLog, log) end
    LOG:Info("Pruned %s unguilded profiles", pruned)
end

function ProfileManager:WipeAll()
    LOG:Trace("ProfileManager:WipeAll()")
    self.cache = { profilesGuidMap = {}, profiles = {} }
end

function ProfileManager:GetMyProfile()
    LOG:Trace("ProfileManager:GetMyProfile()")
    return self:GetProfileByGUID(whoamiGUID())
end

-- Utility

function ProfileManager:GetGUIDFromName(name)
    return self.cache.profilesGuidMap[name]
end

function ProfileManager:GetProfiles()
    return self.cache.profiles
end

function ProfileManager:GetProfileByGUID(GUID)
    return self.cache.profiles[GUID]
end

function ProfileManager:GetProfileByName(name)
    return self.cache.profiles[self.cache.profilesGuidMap[strlower(name)]]
end

-- Publis API
MODULES.ProfileManager = ProfileManager
