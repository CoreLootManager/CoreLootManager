local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES

local UTILS = CLM.UTILS
local RemoveServer = UTILS.RemoveServer

local GuildInfoListener = {}
function GuildInfoListener:Initialize()
    LOG:Trace("GuildInfoListener:Initialize()")
    self:WipeAll()
    self:BuildCache()
    MODULES.EventManager:RegisterWoWEvent({"PLAYER_GUILD_UPDATE", "GUILD_ROSTER_UPDATE"}, (function(...)
        LOG:Debug("Rebuild trust cache after event")
        if self.cacheUpdateRequired then
            GuildRoster()
            self.cacheUpdateRequired = false
        end
    end))
end

function GuildInfoListener:BuildCache()
    LOG:Trace("GuildInfoListener:BuildCache()")
    if not self.cacheUpdateRequired then
        self:WipeAll()
        self:BuildRankCache()
        self:BuildTrustedCache()
        self.cacheUpdateRequired = true
    end
end

function GuildInfoListener:BuildRankCache()
    LOG:Trace("GuildInfoListener:BuildRankCache()")
    for i=1,GuildControlGetNumRanks() do
        local rankInfo = C_GuildInfo.GuildControlGetRankFlags(i)
        self.cache.ranks[i] = {}
        -- 11 View Officer Note
        self.cache.ranks[i].isAssistant = rankInfo[11]
        -- 12 Edit Officer Note
        self.cache.ranks[i].isManager = rankInfo[12]
    end
    -- Add GM
    -- self.cache.ranks[0] = { isManager = true, isAssistant = true}
end

function GuildInfoListener:BuildTrustedCache()
    LOG:Trace("GuildInfoListener:BuildTrustedCache()")
    for i=1,GetNumGuildMembers() do
        local name, rankName, rankIndex = GetGuildRosterInfo(i)
        -- https://wowwiki-archive.fandom.com/wiki/API_GetGuildRosterInfo
        -- rankIndex
        -- Number - The number corresponding to the guild's rank.
        -- The Rank Index starts at 0, add 1 to correspond with the index used in GuildControlGetRankName(index)
        rankIndex = rankIndex + 1
        name = RemoveServer(name)
        self.cache.ranks[rankIndex].name = rankName
        if self.cache.ranks[rankIndex] then
            if self.cache.ranks[rankIndex].isAssistant then
                self.cache.assistants[name] = true
            end
            if self.cache.ranks[rankIndex].isManager then
                self.cache.managers[name] = true
            end
        end
        if rankIndex == 1 then
            self.cache.guildMaster = name
        end
    end
end

function GuildInfoListener:GetInfo()
    self:BuildCache()
    return self.cache
end

function GuildInfoListener:GetRanks()
    self:BuildCache()
    return self.cache.ranks
end

function GuildInfoListener:WipeAll()
    LOG:Trace("GuildInfoListener:WipeAll()")
    self.cache = { guildMaster = "", managers = {}, assistants = {}, ranks = {} }
end


MODULES.GuildInfoListener = GuildInfoListener