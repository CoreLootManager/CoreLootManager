-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local GuildRoster, GetGuildRosterInfo = GuildRoster, GetGuildRosterInfo
local GuildControlGetNumRanks, GetNumGuildMembers = GuildControlGetNumRanks, GetNumGuildMembers
local C_GuildInfoGuildControlGetRankFlags = C_GuildInfo.GuildControlGetRankFlags

local GuildInfoListener = {}
function GuildInfoListener:Initialize()
    LOG:Trace("GuildInfoListener:Initialize()")
    self:WipeAll()
    self:BuildCache()
    self.cacheUpdateRequired = true
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_GUILD_UPDATE", "GUILD_ROSTER_UPDATE"}, (function(...)
        LOG:Debug("Rebuild trust cache after event")
        if not self.cacheUpdateRequired then
            GuildRoster()
            self.cacheUpdateRequired = true
        end
    end))
end

function GuildInfoListener:BuildCache()
    -- LOG:Trace("GuildInfoListener:BuildCache()")
    if self.cacheUpdateRequired then
        self:WipeAll()
        self:BuildRankCache()
        self:BuildGuildCache()
        self.cacheUpdateRequired = false
    end
end

function GuildInfoListener:BuildRankCache()
    LOG:Trace("GuildInfoListener:BuildRankCache()")
    for i=1,GuildControlGetNumRanks() do
        local rankInfo = C_GuildInfoGuildControlGetRankFlags(i)
        self.cache.ranks[i] = {}
        -- 11 View Officer Note
        self.cache.ranks[i].isAssistant = rankInfo[11]
        -- 12 Edit Officer Note
        self.cache.ranks[i].isManager = rankInfo[12]
    end
    -- Add GM
    -- self.cache.ranks[0] = { isManager = true, isAssistant = true}
end

function GuildInfoListener:BuildGuildCache()
    LOG:Trace("GuildInfoListener:BuildGuildCache()")
    for i=1,GetNumGuildMembers() do
        local name, rankName, rankIndex = GetGuildRosterInfo(i)
        if name then
            -- https://wowwiki-archive.fandom.com/wiki/API_GetGuildRosterInfo
            -- rankIndex
            -- Number - The number corresponding to the guild's rank.
            -- The Rank Index starts at 0, add 1 to correspond with the index used in GuildControlGetRankName(index)
            rankIndex = rankIndex + 1
            name = UTILS.RemoveServer(name)
            self.cache.guildies[name] = rankIndex
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
end

function GuildInfoListener:GetInfo()
    self:BuildCache()
    return self.cache
end

function GuildInfoListener:GetRanks()
    self:BuildCache()
    return self.cache.ranks
end

function GuildInfoListener:GetGuildies()
    self:BuildCache()
    return self.cache.guildies
end

function GuildInfoListener:WipeAll()
    LOG:Trace("GuildInfoListener:WipeAll()")
    self.cache = { guildMaster = "", managers = {}, assistants = {}, ranks = {}, guildies = {} }
end


CLM.MODULES.GuildInfoListener = GuildInfoListener