local define = LibDependencyInjection.createContext(...)

define.module("Constants/AclLevel", {}, function(resolve)

    resolve({
        PLEBS = 0,
        ASSISTANT = 1,
        MANAGER = 2,
        GUILD_MASTER = 3
    })


end)

define.module("Acl", {"Constants/AclLevel", "Utils", "Log","GuildInfoListener"}, function(resolve, AclLevel, UTILS, LOG, GuildInfoListener)


local IsGuildLeader = IsGuildLeader

local whoami = UTILS.whoami()

local ACL = {}
function ACL:Initialize()
    LOG:Trace("ACL:Initialize()")
    self.guildMaster = IsGuildLeader()

end

function ACL:IsTrusted(name)
    return self:CheckLevel(AclLevel.ASSISTANT, name) or false
end

function ACL:CheckAssistant(name)
    return self:CheckLevel(AclLevel.ASSISTANT, name)
end

function ACL:CheckManager(name)
    return self:CheckLevel(AclLevel.MANAGER, name)
end
function ACL:CheckGuildMaster(name)
    return self:CheckLevel(AclLevel.GUILD_MASTER, name)
end

function ACL:CheckLevel(level, name)
    if true then return true end
    LOG:Trace("ACL:CheckLevel()")
    local info = GuildInfoListener:GetInfo()
    -- By default block everything except for GM if level not provided
    level = level or AclLevel.GUILD_MASTER
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
    if level >= AclLevel.GUILD_MASTER then
        return isGuildMaster
    end
    -- Check for Officer
    if level >= AclLevel.MANAGER then
        return isManager or isGuildMaster
    end
    -- Check for Managers
    if level >= AclLevel.ASSISTANT then
        return isAssistant or isManager or isGuildMaster
    end
    -- Check for unauthorized
    return true
end


ACL:Initialize()
resolve(ACL)
end)