local _, CLM = ...

local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local LOG = CLM.LOG
local MODELS = CLM.MODELS
local LEDGER_ACL = MODELS.LEDGER.ACL
local whoami = UTILS.whoami

local getGuidFromInteger = UTILS.getGuidFromInteger

local ACL = { }

function ACL:Initialize()
    -- Current user information
    self.guildMaster = IsGuildLeader()
    -- Overall guild information
    self:WipeAll()

    -- Cache the guild master
    self:GetGuildMaster()

    MODULES.ConfigManager:RegisterUniversalExecutor("acl", "ACL", self)
end

function ACL:RegisterMutators()
-- Register mutators
    MODULES.LedgerManager:RegisterEntryType(
        LEDGER_ACL.UpdateManagers,
        (function(entry)
            LOG:TraceAndCount("mutator(ACLUpdateManagers)")

            local profiles = entry:profiles()
            if not profiles or type(profiles) ~= "table" or #profiles == 0 then
                LOG:Debug("Empty profiles table in mutator(ACLUpdateManagers)")
                return
            end

            if entry:remove() then
                for _, iGUID in ipairs(profiles) do
                    self:RemoveOfficerByGUID(getGuidFromInteger(iGUID))
                end
            else
                for _, iGUID in ipairs(profiles) do
                    self:AddOfficerByGUID(getGuidFromInteger(iGUID))
                end
            end
        end),
        CONSTANTS.ACL.LEVEL.GUILD_MASTER)

    MODULES.LedgerManager:RegisterEntryType(
        LEDGER_ACL.UpdateAssistants,
        (function(entry)
            LOG:TraceAndCount("mutator(ACLUpdateAssistants)")

            local profiles = entry:profiles()
            if not profiles or type(profiles) ~= "table" or #profiles == 0 then
                LOG:Debug("Empty profiles table in mutator(ACLUpdateAssistants)")
                return
            end

            if entry:remove() then
                for _, iGUID in ipairs(profiles) do
                    self:RemoveManagerByGUID(getGuidFromInteger(iGUID))
                end
            else
                for _, iGUID in ipairs(profiles) do
                    self:AddManagerByGUID(getGuidFromInteger(iGUID))
                end
            end
        end),
        CONSTANTS.ACL.LEVEL.MANAGER)

    -- register on restart: remove the cahce
    MODULES.LedgerManager:RegisterOnRestart(function()
        self:WipeAll()
    end)
end

function ACL:UpdateManagers(profiles, remove)
    LOG:Trace("ACL:UpdateManagers()")
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Error("Empty profiles table in UpdateManagers()")
        return
    end

    local entry = LEDGER_ACL.UpdateManagers:new(profiles, remove)

    local t = entry:profiles()
    if not t or (#t == 0) then
        LOG:Error("ACL:UpdateManagers(): Empty profiles list")
        return
    end

    MODULES.LedgerManager:Submit(entry, true)
end

function ACL:UpdateAssistants(profiles, remove)
    LOG:Trace("ACL:UpdateAssistants()")
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Error("Empty profiles table in UpdateAssistants()")
        return
    end

    local entry = LEDGER_ACL.UpdateAssistants:new(profiles, remove)

    local t = entry:profiles()
    if not t or (#t == 0) then
        LOG:Error("ACL:UpdateAssistants(): Empty profiles list")
        return
    end

    MODULES.LedgerManager:Submit(entry, true)
end

function ACL:GetGuildMaster()
    for i=1,GetNumGuildMembers() do
        local name, rankName, rankIndex = GetGuildRosterInfo(i)
        if rankIndex == 0 then
            self.cache.guildMaster = UTILS.RemoveServer(name)
        end
        self.cache.ranks[rankIndex] = name -- for reference in other places
    end
end

function ACL:AddOfficerByGUID(GUID)
    local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
    if profile then
        self.cache.officers[profile:Name()] = true
    end
end

function ACL:RemoveOfficerByGUID(GUID)
    local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
    if profile then
        self.cache.officers[profile:Name()] = nil
    end
end

function ACL:AddManagerByGUID(GUID)
    local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
    if profile then
        self.cache.managers[profile:Name()] = true
    end
end

function ACL:RemoveManagerByGUID(GUID)
    local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
    if profile then
        self.cache.managers[profile:Name()] = nil
    end
end

function ACL:IsTrusted(name)
    return self:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) or false
end

function ACL:CheckLevel(level, name)
    LOG:Trace("ACL:CheckLevel()")
    -- By default block everything except for GM if level not provided
    level = level or CONSTANTS.ACL.LEVEL.GUILD_MASTER
    -- Request is for self
    if name == nil then
        if self.guildMaster then
            return true
        end
        name = whoami()
    end
    local isGuildMaster = (self.cache.guildMaster == name) or false
    local isOfficer = self.cache.officers[name] or false
    local isManager = self.cache.managers[name] or false
    -- Check for Guild Master
    if level >= CONSTANTS.ACL.LEVEL.GUILD_MASTER then
        return isGuildMaster
    end
    -- Check for Officer
    if level >= CONSTANTS.ACL.LEVEL.MANAGER then
        return isOfficer or isGuildMaster
    end
    -- Check for Managers
    if level >= CONSTANTS.ACL.LEVEL.ASSISTANT then
        return isManager or isOfficer or isGuildMaster
    end
    -- Check for unauthorized
    return true
end

function ACL:GetGuildRanks()
    return self.cache.ranks
end

function ACL:WipeAll()
    self.cache = { guildMaster = "", officers = {}, managers = {}, ranks = {} }
end

CONSTANTS.ACL = {}

CONSTANTS.ACL.LEVEL = {
    PLEBS = 0,
    ASSISTANT = 1,
    MANAGER = 2,
    GUILD_MASTER = 3
}

CONSTANTS.ACL.LEVELS = UTILS.Set({ 0, 1, 2, 3 })

MODULES.ACL = ACL
