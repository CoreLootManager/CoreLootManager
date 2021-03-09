local _, CLM = ...
-- Upvalues
local LOG = CLM.LOG
local MODULE = CLM.MODULE
local UTILS = CLM.UTILS

local Profile = {}
--local ProfileOptions = {}
local ProfileManager = { }

function ProfileManager:Initialize()
    LOG:Info("ProfileManager:Initialize()")
    self.db = MODULE.Database:Profiles()

    if type(self.db.metadata) ~= "table" then
        self.db.metadata = {}
    end

    if type(self.db.data) ~= "table" then
        self.db.data = {}
    end
    self.metadata = { playerGuidMap = {} }
    self:RebuildMetadata()

    ProfileManager:RegisterSlash()
end

function ProfileManager:Wipe()
    self.db.data = {}
    self.metadata = { playerGuidMap = {} }
    self.GUI:Refresh()
end

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
            self.db.data[GUID] = Profile:New(name, class, nil)
        end
    end
    self:RebuildMetadata()
    self.GUI:Refresh()
end

function ProfileManager:RebuildMetadata()
    LOG:Info("ProfileManager:RebuildMetadata()")
    for guid,object in pairs(self.db.data) do -- currently full rebuild
        self.metadata.playerGuidMap[object.name] = guid
    end
end

function ProfileManager:RegisterSlash()
    local options = {
        pm = {
            type = "input",
            name = "ProfileManager Debug",
            desc = "Debug Execute any ProfileManager API",
            set = function(info, value) UTILS.UniversalCliMethodExecutor("ProfileManager", self, value) end
        }
    }
    MODULE.ConfigManager:RegisterSlash(options)
end

function Profile:New(name, class, spec)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.name = name or ""
    o.class = class or ""
    o.spec = spec or ""

    return o
end

-- Publis API
MODULE.ProfileManager = ProfileManager