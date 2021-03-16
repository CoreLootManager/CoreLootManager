local _, CLM = ...

local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS

local ACL = { }

function ACL:Initialize()
    local db = MODULES.Database:Guild()
    if type(db.ACL) ~= "table" then
        db.ACL = { whitelist = {} }
    end
    self.db = db.ACL
    -- Current user information
    self.guildMaster = IsGuildLeader()
    self.officer = C_GuildInfo.IsGuildOfficer()
    -- Overall guild information
    self.cache = {}
    self:BuildRankCache()
    self:BuildOfficerCache()
    -- Set trust level for self
    self:SetTrusted()
end

function ACL:BuildRankCache()
    self.cache.ranks = { isOfficer = {} }
    local rankInfo
    -- 4    Officerchat Speak
    -- 7    Invite Member
    -- 8    Remove Member
    -- 12   Edit Officer Note
    for i = 1,GuildControlGetNumRanks() do
        rankInfo = GuildControlGetRankName(i)
        self.cache.ranks.isOfficer[i] = (rankInfo[4] or rankInfo[7] or rankInfo[8] or rankInfo[12])
    end
end

function ACL:BuildOfficerCache()
    self.cache.officers = { }
    for i=1,GetNumGuildMembers() do
        local name, _, rankIndex = GetGuildRosterInfo(i)
        if self:IsRankOfficer(rankIndex) then
            self.cache.officers[name] = true
        end
        if rankIndex == 0 then
            self.cache.guildMaster = name
        end
    end
end

function ACL:SetTrusted()
    self.trusted = self:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
end

function ACL:IsTrusted(name)
    if name == nil then
        return self.trusted or false
    else
        self:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER, name)
    end
end

function ACL:IsRankOfficer(rank)
    return self.cache.ranks.isOfficer[rank] or false
end

function ACL:CheckLevel(level, name)
    level = level or 0
    -- Request is for self
    if name == nil then
        if self.guildMaster then
            return true
        end
        name = UTILS.GetUnitName("player")
    end
    -- Check for Guild Master
    if level >= CONSTANTS.ACL.GUILD_MASTER then
        return (self.cache.guildMaster == name)
    end
    -- Check for Officer
    if level >= CONSTANTS.ACL.OFFICER then
        return (self.cache.officers[name] or false)
    end
    -- Check for Managers
    if level >= CONSTANTS.ACL.MANAGER then
        return (self.db.whitelist[name] or false)
    end
    -- Check for unauthorized
    return true
end

function ACL:AddToWhitelist(name, level)
    if self:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        if CONSTANTS.ACL.LEVELS[level] ~= nil then
            self.db.whitelist[name] = true
        end
    end
end

function ACL:RemoveFromWhitelist(name, level)
    if self:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        self.db.whitelist[name] = nil
    end
end

CONSTANTS.ACL = {}

CONSTANTS.ACL.LEVEL = {
    UNAUTHORISED = 0,
    MANAGER = 1,
    OFFICER = 2,
    GUILD_MASTER = 3
}

CONSTANTS.ACL.LEVELS = UTILS.Set({ 0, 1, 2, 3 })

MODULES.ACL = ACL