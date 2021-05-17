local _, CLM = ...

local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local LOG = CLM.LOG
-- local MODELS = CLM.MODELS
local whoami = UTILS.whoami

local GuildInfoListener = MODULES.GuildInfoListener

local ACL = { }

function ACL:Initialize()
    self.guildMaster = IsGuildLeader()

    MODULES.ConfigManager:RegisterUniversalExecutor("acl", "ACL", self)
end

function ACL:IsTrusted(name)
    return self:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) or false
end

function ACL:CheckLevel(level, name)
    LOG:Trace("ACL:CheckLevel()")
    local info = GuildInfoListener:GetInfo()
    -- By default block everything except for GM if level not provided
    level = level or CONSTANTS.ACL.LEVEL.GUILD_MASTER
    -- Request is for self
    if name == nil then
        if self.guildMaster then
            return true
        end
        name = whoami()
    end
    local isGuildMaster = (info.guildMaster == name) or false
    local isManager = info.managers[name] or false
    local isAssistant = info.assistants[name] or false
    -- Check for Guild Master
    if level >= CONSTANTS.ACL.LEVEL.GUILD_MASTER then
        return isGuildMaster
    end
    -- Check for Officer
    if level >= CONSTANTS.ACL.LEVEL.MANAGER then
        return isManager or isGuildMaster
    end
    -- Check for Managers
    if level >= CONSTANTS.ACL.LEVEL.ASSISTANT then
        return isAssistant or isManager or isGuildMaster
    end
    -- Check for unauthorized
    return true
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
