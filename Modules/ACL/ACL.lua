local define = LibDependencyInjection.createContext(...)


define.module("Acl", {"Constants", "Utils", "Modules", "Log","GuildInfoListener"}, function(resolve, CONSTANTS, UTILS, Modules, LOG, GuildInfoListener)


local IsGuildLeader = IsGuildLeader

local whoami = UTILS.whoami()

local ACL = {}
function ACL:Initialize()
    LOG:Trace("ACL:Initialize()")
    self.guildMaster = IsGuildLeader()

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
        name = whoami
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

CONSTANTS.ACL.LEVELS = UTILS.Set({
    CONSTANTS.ACL.LEVEL.PLEBS,
    CONSTANTS.ACL.LEVEL.ASSISTANT,
    CONSTANTS.ACL.LEVEL.MANAGER,
    CONSTANTS.ACL.LEVEL.GUILD_MASTER
})

Modules.ACL = ACL
ACL:Initialize()
resolve(ACL)
end)