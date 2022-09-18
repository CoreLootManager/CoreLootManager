local define = LibDependencyInjection.createContext(...)

define.module("ProfileRegistry", {"Utils"}, function(resolve, Utils)
    local myGUID = Utils.whoamiGUID()
    local profiles = {}
    local nameIndex = {}


    resolve({
        Add = function(profile)
            profiles[profile:GUID()] = profile
            nameIndex[strlower(profile:Name())] = profile
        end,
        Update = function(GUID, callback)
            -- Select a profile by GUID, and update it in the callback.
            local profile = profiles[GUID]
            if profile == nil then return false end
            nameIndex[strlower(profile:Name())] = nil
            profiles[profile:GUID()] = nil
            callback(profile)
            profiles[profile:GUID()] = profile
            nameIndex[strlower(profile:Name())] = profile
            return true
        end,
        Me = function()
            return profiles[myGUID]
        end,
        Get = function(GUID)
            return profiles[GUID]
        end,
        GetByName = function(name)
            return nameIndex[strlower(name)]
        end,
        -- this leaks our table, we should implement a generator intead
        All = function() return profiles end

    })

end)
define.module("ProfileManager", {
    "Log", "Utils", "ProfileManager/PruneLog", "Database", "Models/Profile",
    "L", "LedgerManager", "Modules", "ProfileRegistry"
}, function(resolve, LOG, UTILS, LedgerEntries, PruneLog, Database, Profile, L, LedgerManager, Modules, ProfileRegistry)


local pairs, type, strsplit, strlower = pairs, type, strsplit, strlower
local GetNumGuildMembers, GetGuildRosterInfo, UnitIsPlayer = GetNumGuildMembers, GetGuildRosterInfo, UnitIsPlayer
local GetRaidRosterInfo, MAX_RAID_MEMBERS, IsInRaid, UnitGUID = GetRaidRosterInfo, MAX_RAID_MEMBERS, IsInRaid, UnitGUID
local sformat = string.format

local whoamiGUID = UTILS.whoamiGUID()

local ProfileManager = {}

function ProfileManager:Initialize()
    LOG:Trace("ProfileManager:Initialize()")

    self.db = Database:Personal('profileManager', {
        pruneLog = {}
    })

    LedgerManager:RegisterOnRestart(function()
        self:WipeAll()
    end)


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
    local guidProfile = self:GetProfileByGUID(GUID)
    local nameProfile = self:GetProfileByName(name)

    local discard, warning
    if guidProfile then -- profile with this GUID already exists. Is this a rename?
        if nameProfile then -- profile with name and guid exists
            if guidProfile:GUID() == nameProfile:GUID() then -- same profile, same name - do nothing
                discard = true
                LOG:Debug("NewProfile(): guidProfile:GUID() == nameProfile:GUID()")
            else -- 2 different profiles exist. Warning
                discard = true
                LOG:Debug("NewProfile(): guidProfile:GUID() ~= nameProfile:GUID()")
                warning = sformat(L["Two different profiles exist for target GUID %s (%s:%s) and name %s (%s:%s). Verify and clean up profiles before updating."], GUID, name, guidProfile:GUID(), guidProfile:Name(), nameProfile:GUID(), nameProfile:Name())
            end
        else -- profile with this name does not exist - this is an actual rename
            discard = false
            LOG:Debug("NewProfile(): guidProfile and not nameProfile")
        end
    else -- profile with this GUID does not exist. Is this new profile?
        if nameProfile then -- name is used already by different profile? Warning
            discard = true
            LOG:Debug("NewProfile(): no guidProfile and nameProfile")
            warning = sformat(L["Profile %s already exists and is used by different GUID %s (%s). "], name, nameProfile:GUID(), nameProfile:Name())
        else -- New profile!
            discard = false
            LOG:Debug("NewProfile(): not guidProfile and not nameProfile")
        end
    end
    if discard then
        if warning then LOG:Warning(warning) end
        LOG:Debug("NewProfile(): discarding request for %s (%s)", name, GUID)
        return
    end

    LOG:Debug("New profile: [%s]: %s", GUID, name)
    LedgerManager:Submit(LedgerEntries.Update:new(GUID, name, class), true)
end

function ProfileManager:RemoveProfile(GUID)
    LOG:Trace("ProfileManager:RemoveProfile()")
    if type(GUID) ~= "string" or GUID == "" then
        LOG:Error("RemoveProfile(): UTILS.empty GUID")
        return
    end
    LOG:Debug("Remove profile: [%s]", GUID)
    LedgerManager:Submit(LedgerEntries.Remove:new(GUID), true)
end

local function PruneProfile(self, GUID, log)
    local profile = ProfileRegistry.Get(GUID)
    if not profile then return end
    local entry = profile:Entry()
    if not entry then return end
    log:Add(profile:Name())
    LedgerManager:Remove(entry)
end

function ProfileManager:MarkAsAltByNames(alt, main)
    LOG:Trace("ProfileManager:MarkAsAltByNames()")
    local altProfile = self:GetProfileByName(alt)
    if not UTILS.typeof(altProfile, Profile) then
        LOG:Error("MarkAsAltByNames(): Invalid alt")
        return
    end
    local mainProfile = self:GetProfileByName(main)
    -- Unlink
    if not UTILS.typeof(mainProfile, Profile) then
        if altProfile:Main() ~= "" then
            LedgerManager:Submit(LedgerEntries.Link:new(altProfile:GUID(), nil), true)
        end
    else -- Link
        -- Do not allow alt chaining if main is alt
        if UTILS.typeof(self:GetProfileByGUID(mainProfile:Main()), Profile) then return end
        -- Do not allow alt chaining if alt has alts
        if altProfile:HasAlts() then return end
        -- Don't allow self setting
        if altProfile:GUID() == mainProfile:GUID() then return end
        -- Don't allow re-setting
        if altProfile:Main() == mainProfile:GUID() then return end
        LedgerManager:Submit(LedgerEntries.Link:new(altProfile:GUID(), mainProfile:GUID()), true)
    end
end

function ProfileManager:SetProfilesLock(profiles, lock)
    LOG:Trace("ProfileManager:SetProfilesLock()")

    local entry = LedgerEntries.Lock:new(profiles, lock and true or false)

    local t = entry:targets()
    if not t or (#t == 0) then
        LOG:Error("ProfileManager:SetProfilesLock(): Empty targets list")
        return
    end

    LedgerManager:Submit(entry, true)
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
            local profile = ProfileRegistry.Get(GUID)
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
            local profile = ProfileRegistry.Get(GUID)
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
            local profile = ProfileRegistry.Get(GUID)
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

function ProfileRegistry.Me()
    LOG:Trace("ProfileRegistry.Me()")
    return self:GetProfileByGUID(whoamiGUID)
end

-- Utility



function ProfileRegistry.All()
    return ProfileRegistry.All()
end

function ProfileRegistry.Get(GUID)
    return ProfileRegistry.Get(GUID)
end

function ProfileRegistry.GetByName(name)
    return ProfileRegistry.GetByName(name)
end

-- Publis API
ProfileManager:Initialize()
Modules.ProfileManager = ProfileManager
resolve(ProfileManager)
end)

