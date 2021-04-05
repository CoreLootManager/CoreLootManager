local _, CLM = ...
-- Upvalues
local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
local CONSTANTS = CLM.CONSTANTS
local RESULTS = CONSTANTS.RESULTS
local ACL_LEVEL = CONSTANTS.ACL.LEVEL

-- local keys = UTILS.keys
local typeof = UTILS.typeof
local empty = UTILS.empty
local capitalize = UTILS.capitalize
local getGuidFromInteger = UTILS.getGuidFromInteger
local NumberToClass = UTILS.NumberToClass

local Profile = CLM.MODELS.Profile

local LedgerManager = MODULES.LedgerManager

local LEDGER_PROFILE = CLM.MODELS.LEDGER.PROFILE

local ProfileManager = { }

function ProfileManager:Initialize()
    LOG:Trace("ProfileManager:Initialize()")

    self.cache = {
        profilesGuidMap = {},
        profiles = {}
    }

    -- Register mutators
    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Update,
        (function(entry)
            LOG:Trace("mutator(ProfileUpdate)")
            local iGUID = entry:GUID()
            if type(iGUID) ~= "number" then return end
            local GUID = getGuidFromInteger(iGUID)
            local name = entry:name()
            if empty(name) then return end

            local class = capitalize(NumberToClass(entry:ingameClass()))
            local spec = entry:spec()
            local main = entry:main()
            main =  (type(main) == "number" and main ~= 0) and getGuidFromInteger(main) or ""
            -- Check if it's an update
            local profileInternal = self.cache.profiles[GUID]
            if profileInternal ~= nil then
                if empty(class) then
                    class = profileInternal:Class()
                end
                if empty(spec) then
                    spec = profileInternal:Spec()
                end
                if empty(main) then
                    main = profileInternal:Main()
                end
            end

            local profile = Profile:New(name, class, spec, main)
            profile:SetGUID(GUID)
            self.cache.profiles[GUID] = profile
            self.cache.profilesGuidMap[name] = GUID
        end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Remove,
        (function(entry)
            LOG:Trace("mutator(ProfileRemove)")
            local GUID = entry:GUID()
            if type(GUID) ~= "number" then return end
            GUID = getGuidFromInteger(GUID)
            if self.cache.profiles[GUID] ~= nil then
                self.cache.profiles[GUID] = nil
            end
        end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Link,
        (function(entry)
            LOG:Trace("mutator(ProfileLink)")
            local GUID = entry:GUID()
            if type(GUID) ~= "number" then return end
            GUID = getGuidFromInteger(GUID)
            local main = entry:main()
            if type(main) ~= "number" then return end
            main = getGuidFromInteger(main)
            local altProfile = self:GetProfileByGuid(GUID)
            if not typeof(altProfile, Profile) then return end
            local mainProfile = self:GetProfileByGuid(main)
            if not typeof(mainProfile, Profile) then
                altProfile:ClearMain()
            else
                altProfile:SetMain(main)
            end
        end),
        ACL_LEVEL.OFFICER)

    MODULES.ConfigManager:RegisterUniversalExecutor("pm", "ProfileManager", self)
end

function ProfileManager:NewProfile(GUID, name, class)
    LOG:Trace("ProfileManager:NewProfile()")
    if GUID == nil or GUID == "" then
        LOG:Debug("NewProfile(): Empty GUID")
        return
    end
    if name == nil or name == "" then
        LOG:Debug("NewProfile(): Empty name")
        return
    end
    LOG:Debug("New profile: [%s]: %s", GUID, name)
    LedgerManager:Submit(LEDGER_PROFILE.Update:new(GUID, name, class), true)
end

function ProfileManager:RemoveProfile(GUID)
    LOG:Trace("ProfileManager:RemoveProfile()")
    if GUID == nil then
        LOG:Debug("RemoveProfile(): Empty GUID")
        return
    end
    LOG:Debug("Remove profile: [%s]", GUID)
    LedgerManager:Submit(LEDGER_PROFILE.Remove:new(GUID), true)
end

function ProfileManager:MarkAsAltByNames(main, alt)
    LOG:Trace("ProfileManager:MarkAsAltByNames()")
    local mainProfile = self:GetProfileByName(main)
    if not typeof(mainProfile, Profile) then
        LOG:Debug("MarkAsAltByNames(): Invalid main")
        return RESULTS.IGNORE
    end
    local altProfile = self:GetProfileByName(alt)
    if not typeof(altProfile, Profile) then
        LOG:Debug("MarkAsAltByNames(): Invalid alt")
        return RESULTS.IGNORE
    end
    -- TODO: Protect from circular references / multi-level alt nesting
    local result
    if alt == main then
        if altProfile:Main() == "" then
            LOG:Debug("Removal of empty main for %s", alt)
            return RESULTS.IGNORE
        else
            -- Remove link
            result = RESULTS.SUCCESS_EXTENDED
            LedgerManager:Submit(LEDGER_PROFILE.Link:new(altProfile:GUID(), nil), true)
        end
    else
        if mainProfile:Main() ~= "" then
            LOG:Debug("Alt -> Main chain for %s -> %s", alt, main)
            return RESULTS.IGNORE
        end
        LOG:Debug("Alt -> Main linking for %s -> %s", alt, main)
        LedgerManager:Submit(LEDGER_PROFILE.Link:new(altProfile:GUID(), mainProfile:GUID()), true)
        result = RESULTS.SUCCESS
    end

    return result
end

-- Functionalities

function ProfileManager:FillFromGuild(selectedRanks, minLevel)
    LOG:Trace("ProfileManager:FillFromGuild()")
    if LOG.SEVERITY.DEBUG >= LOG:GetSeverity() then
        LOG:Debug("FillFromGuild: ranks: {%s}, minLevel: %s", UTILS.stringifyList(selectedRanks), minLevel)
    end

    local rankFilterFn, minLevelFn
    if type(selectedRanks) == "table" then
        rankFilterFn = (function(rankIndex, _selectedRanks)
            if _selectedRanks[rankIndex] then
                return true
            end
            return false
        end)
    else
        rankFilterFn = (function(rankIndex, _selectedRanks)
            return true
        end)
    end

    minLevel = tonumber(minLevel)
    if type(minLevel) == "number" then
        minLevelFn = (function(level, _minLevel)
            if level >= _minLevel then
                return true
            end
            return false
        end)
    else
        minLevelFn = (function(level, _minLevel)
            return true
        end)
    end

    for i=1,GetNumGuildMembers() do
        local name, _, rankIndex, level, _, _, _, _, _, _, class, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
        name, _ = strsplit("-", name)
        if rankFilterFn(rankIndex, selectedRanks) and minLevelFn(level, minLevel) then
            self:NewProfile(GUID, name, class)
        end
    end
end

function ProfileManager:FillFromRaid()
    LOG:Trace("ProfileManager:FillFromRaid()")
    if not IsInRaid() then return end
    for i=1,40 do
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

function ProfileManager:WipeAll()
    LOG:Trace("ProfileManager:WipeAll()")
    self.cache = { profilesGuidMap = {}, profiles = {} }
end

function ProfileManager:ExportAll()
    LOG:Trace("ProfileManager:ExportAll()")
    local db = CLM.MODULES.Database:Personal()
    db['profiles'] = self:GetProfiles()
end

-- Utility

function ProfileManager:GetGUIDFromName(name)
    return self.cache.profilesGuidMap[name]
end

function ProfileManager:GetProfiles()
    return self.cache.profiles
end

function ProfileManager:GetProfileByGuid(GUID)
    return self.cache.profiles[GUID]
end

function ProfileManager:GetProfileByName(name)
    return self.cache.profiles[self.cache.profilesGuidMap[name]]
end

-- Publis API
MODULES.ProfileManager = ProfileManager