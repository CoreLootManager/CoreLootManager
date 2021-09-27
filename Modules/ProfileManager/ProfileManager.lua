-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local _, CLM = ...
-- Upvalues
local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
-- local CONSTANTS = CLM.CONSTANTS
-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

-- local keys = UTILS.keys
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

    local db = MODULES.Database:Personal()
    if not db.profileManager then
        db.profileManager = { pruneLog = {} }
    end
    self.db = db.profileManager

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
            local spec = entry:spec()
            local main = entry:main()
            main =  (type(main) == "number" and main ~= 0) and getGuidFromInteger(main) or ""
            -- Check if it's an update
            local profileInternal = self.cache.profiles[GUID]
            if profileInternal then
                if empty(class) then
                    class = profileInternal:Class()
                end
                if empty(spec) then
                    spec = profileInternal:Spec()
                end
                if empty(main) then
                    main = profileInternal:Main()
                end
                profileInternal.class = class
                profileInternal.spec = spec
                profileInternal.main = main
            else
                local profile = Profile:New(entry, name, class, spec, main)
                profile:SetGUID(GUID)
                self.cache.profiles[GUID] = profile
                self.cache.profilesGuidMap[name] = GUID
            end
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Remove,
        (function(entry)
            LOG:TraceAndCount("mutator(ProfileRemove)")
            local GUID = entry:GUID()
            if type(GUID) ~= "number" then return end
            GUID = getGuidFromInteger(GUID)
            if self.cache.profiles[GUID] then
                self.cache.profiles[GUID] = nil
            end
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_PROFILE.Link,
        (function(entry)
            LOG:TraceAndCount("mutator(ProfileLink)")
            local GUID = entry:GUID()
            if type(GUID) ~= "number" then return end
            GUID = getGuidFromInteger(GUID)
            local main = entry:main()
            if type(main) ~= "number" then return end
            main = getGuidFromInteger(main)
            local altProfile = self:GetProfileByGUID(GUID)
            if not typeof(altProfile, Profile) then return end
            local mainProfile = self:GetProfileByGUID(main)
            if not typeof(mainProfile, Profile) then
                altProfile:ClearMain()
            else
                altProfile:SetMain(main)
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

 -- TODO to do with the markings if profile is removed
function ProfileManager:MarkAsAltByNames(main, alt)
    LOG:Trace("ProfileManager:MarkAsAltByNames()")
    local mainProfile = self:GetProfileByName(main)
    if not typeof(mainProfile, Profile) then
        LOG:Error("MarkAsAltByNames(): Invalid main")
        return
    end
    local altProfile = self:GetProfileByName(alt)
    if not typeof(altProfile, Profile) then
        LOG:Error("MarkAsAltByNames(): Invalid alt")
        return
    end
    -- TODO: Protect from circular references / multi-level alt nesting
    if alt == main then
        if altProfile:Main() == "" then
            LOG:Error("Removal of empty main for %s", alt)
            return
        else
            -- Remove link
            LedgerManager:Submit(LEDGER_PROFILE.Link:new(altProfile:GUID(), nil), true)
        end
    else
        if mainProfile:Main() ~= "" then
            LOG:Error("Alt -> Main chain for %s -> %s", alt, main)
            return
        end
        LOG:Debug("Alt -> Main linking for %s -> %s", alt, main)
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
        check = (function(_rankName, _rankIndex, _rank)
            return (_rankIndex == _rank)
        end)
    else
        rank = strlower(rank or "")
        check = (function(_rankName, _rankIndex, _rank)
            return (strlower(_rankName) == _rank)
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
            prune(GUID, log)
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
    return self.cache.profiles[self.cache.profilesGuidMap[name]]
end

-- Publis API
MODULES.ProfileManager = ProfileManager
