-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs = pairs
local strsplit, strlower, tonumber = strsplit, strlower, tonumber
local GetNumGuildMembers, GetGuildRosterInfo = GetNumGuildMembers, GetGuildRosterInfo

local GlobalSlashCommands = {}
function GlobalSlashCommands:Initialize()
    local options = {}

    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
        options.link = {
            type = "input",
            name = CLM.L["Link Alt to Main"],
            set = (function(i, input)
                local alt, main = strsplit(" ", input)
                CLM.MODULES.ProfileManager:MarkAsAltByNames(alt, main)
            end),
            confirm = true
        }
        options.unlink = {
            type = "input",
            name = CLM.L["Unlink Alt"],
            set = (function(i, input)
                CLM.MODULES.ProfileManager:MarkAsAltByNames(input, "")
            end),
            confirm = true
        }
    end
    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        options.ignore = {
            type = "input",
            name = CLM.L["Ignore entry"],
            set = (function(i, id)
                id = tonumber(id) or 0
                local realEntry = CLM.MODULES.LedgerManager.ledger.getSortedList():entries()[id]
                if realEntry then
                    CLM.MODULES.LedgerManager:Remove(realEntry)
                end
            end),
            confirm = true
        }
    end
    if CLM.MODULES.ACL:IsTrusted() then
        options.prune = {
            type = "input",
            name = CLM.L["Prune profiles"],
            set = (function(i, input)
                local command, parameter, nop = strsplit("/", input)
                command = strlower(command or "")
                nop = nop and true or false
                if command == CLM.L["level"] then
                    parameter = tonumber(parameter) or 0
                    CLM.MODULES.ProfileManager:PruneBelowLevel(parameter, nop)
                elseif command == CLM.L["rank"] then
                    parameter = parameter or ""
                    parameter = tonumber(parameter) or parameter
                    CLM.MODULES.ProfileManager:PruneRank(parameter, nop)
                elseif command == CLM.L["unguilded"] then
                    CLM.MODULES.ProfileManager:PruneUnguilded(nop)
                end
            end),
            confirm = true
        }
    end
    if CLM.MODULES.ACL:IsTrusted() then
        options.version = {
            type = "execute",
            name = CLM.L["Version check in guild"],
            func = (function()
                CLM.MODULES.ProfileInfoManager:RequestVersion()
            end),
            confirm = true
        }
    end
    if CLM.MODULES.ACL:IsTrusted() then
        options.spec = {
            type = "execute",
            name = CLM.L["Spec guild request"],
            func = (function()
                CLM.MODULES.ProfileInfoManager:RequestSpec()
                CLM.MODULES.ProfileInfoManager:RequestRole()
            end),
            confirm = true
        }
    end
    if CLM.MODULES.ACL:IsTrusted() then
        options.addprofile = {
            type = "input",
            name = "Add Profile By Name",
            set = (function(_, inputName)
                inputName = UTILS.Trim(strlower(inputName or ""))
                LOG:Message(CLM.L["Input name: %s"], inputName)
                for i=1,GetNumGuildMembers() do
                    local name, _, _, _, _, _, _, _, _, _, class, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
                    name, _ = strsplit("-", name)
                    if strlower(name) == inputName then
                        LOG:Message(CLM.L["Found %s in guild."], name)
                        local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
                        if profile then
                            LOG:Message(CLM.L["%s profile exists."], name)
                        else
                            LOG:Message(CLM.L["%s profile missing. Adding."], name)
                            CLM.MODULES.ProfileManager:NewProfile(GUID, name, class)
                        end
                        return
                    end
                end
                LOG:Message(CLM.L["%s was not found in guild."], inputName)
            end),
            get = (function() end),
            confirm = true
        }
    end
    options.guireset = {
        type = "execute",
        name = CLM.L["Reset gui positions"],
        func = (function()
            for _,GUI in pairs(CLM.GUI) do
                if GUI.Reset then
                    GUI:Reset()
                end
            end
        end),
        confirm = true
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

CLM.GlobalSlashCommands = GlobalSlashCommands
