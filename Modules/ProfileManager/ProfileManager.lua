local _, CLM = ...
-- Upvalues
local LOG = CLM.LOG
local MODULE = CLM.MODULE
local UTILS =  CLM.UTILS
local RESULTS = CLM.CONSTANTS.RESULTS

local Profile = {}
local ProfileManager = { }

function ProfileManager:Initialize()
    LOG:Info("ProfileManager:Initialize()")
    self.db = MODULE.Database:Profiles()

    if type(self.db.profiles) ~= "table" then
        self.db.profiles = {}
    end

    self.cache = {
        profilesGuidMap = {},
        profiles = {}
    }
    self:LoadCache()

    MODULE.ConfigManager:RegisterUniversalExecutor("pm", "ProfileManager", self)
end

-- CORE

function ProfileManager:LoadCache()
    LOG:Info("ProfileManager:LoadCache()")

    for guid,_ in pairs(self.db.profiles) do
        local p = Profile:Restore(self.db.profiles[guid])
        self.cache.profiles[guid] = p
        self.cache.profilesGuidMap[p:Name()] = guid
    end
end

function ProfileManager:GetProfiles()
    return self.cache.profiles
end

function ProfileManager:NewProfile(guid, name, class)
    if guid == nil then return end
    if name == nil then return end
    self.db.profiles[guid] = {} -- Allocate database
    self.cache.profiles[guid] = Profile:New(self.db.profiles[guid], {name = name, class = class})
    self.cache.profilesGuidMap[name] = guid
end

function ProfileManager:MarkAsAltByNames(main, alt)
    local mainProfile = self:GetProfileByName(main)
    if mainProfile == nil then return RESULTS.IGNORE end
    local altProfile = self:GetProfileByName(alt)
    if altProfile == nil then return RESULTS.IGNORE end
    -- TODO: Protect from circular references / multi-level alt nesting
    local result
    if alt == main then
        if altProfile:Main() == "" then
            return RESULTS.IGNORE
        else
            -- Remove link
            altProfile:ClearMain()
            result = RESULTS.SUCCESS_EXTENDED
        end
    else
        altProfile:SetMain(self:GetGUIDFromName(mainProfile:Name()))
        result = RESULTS.SUCCESS
    end

    return result
end

-- Functionalities

function ProfileManager:FillFromGuild(selectedRanks, minLevel)
    LOG:Info("ProfileManager:FillFromGuild()")

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
    LOG:Info("ProfileManager:FillFromRaid()")
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
    LOG:Info("ProfileManager:AddTarget()")
    if UnitIsPlayer("target") then
        local GUID = UnitGUID("target")
        local name = GetUnitName("target")
        name, _ = strsplit("-", name)
        local _, class, _ = UnitClass("target");

        self:NewProfile(GUID, name, class)
    else
        LOG:Warning("Your target must be a player.")
    end
end

function ProfileManager:WipeAll()
    self.db.profiles = {}
    self.cache = { profilesGuidMap = {}, profiles = {} }
end

-- Utility

function ProfileManager:GetGUIDFromName(name)
    return self.cache.profilesGuidMap[name]
end

function ProfileManager:GetProfiles()
    return self.cache.profiles
end

function ProfileManager:GetProfileByGuid(guid)
    return self.cache.profiles[guid]
end

function ProfileManager:GetProfileByName(name)
    return self.cache.profiles[self.cache.profilesGuidMap[name]]
end

function Profile:New(storage, params)
    local o = UTILS.NewStorageQualifiedObject(storage, self)

    o.persistent.name  = tostring(params.name)
    o.persistent.class = params.class or ""
    o.persistent.spec  = params.spec  or ""
    o.persistent.main  = params.main  or ""

    return o
end

function Profile:Restore(storage)
    return UTILS.NewStorageQualifiedObject(storage, self)
end

function Profile:Name()
    return self.persistent.name
end

function Profile:Class()
    return self.persistent.class
end

function Profile:Spec()
    return self.persistent.spec
end

function Profile:Main()
    return self.persistent.main
end

function Profile:SetMain(main)
    self.persistent.main = main
end

function Profile:ClearMain()
    self.persistent.main = ""
end

-- Publis API
MODULE.ProfileManager = ProfileManager