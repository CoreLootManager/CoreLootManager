local  _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local ACL = MODULES.ACL

local ConfigManager = MODULES.ConfigManager
local LootManager = MODULES.LootManager
local RaidManager = MODULES.RaidManager
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local ProfileInfoManager = MODULES.ProfileInfoManager
local AutoAward = MODULES.AutoAward

local GetItemIdFromLink = UTILS.GetItemIdFromLink

local GlobalSlashCommands = {}
function GlobalSlashCommands:Initialize()
    local options = {}
    if ACL:IsTrusted() then
        options.award = {
            type = "input",
            name = CLM.L["Award item"],
            desc = CLM.L["Award item without auctioning it."],
            set = (function(_, args)
                self:Award(args)
            end)
        }
    end
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
        options.link = {
            type = "input",
            name = CLM.L["Link Alt to Main"],
            set = (function(i, input)
                local alt, main = strsplit(" ", input)
                ProfileManager:MarkAsAltByNames(alt, main)
            end),
            confirm = true
        }
        options.unlink = {
            type = "input",
            name = CLM.L["Unlink Alt"],
            set = (function(i, input)
                ProfileManager:MarkAsAltByNames(input, "")
            end),
            confirm = true
        }
    end
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        options.ignore = {
            type = "input",
            name = CLM.L["Ignore entry"],
            set = (function(i, id)
                id = tonumber(id) or 0
                local realEntry = MODULES.LedgerManager.ledger.getSortedList():entries()[id]
                if realEntry then
                    MODULES.LedgerManager:Remove(realEntry)
                end
            end),
            confirm = true
        }
    end
    if ACL:IsTrusted() then
        options.prune = {
            type = "input",
            name = CLM.L["Prune profiles"],
            set = (function(i, input)
                local command, parameter, nop = strsplit("/", input)
                command = strlower(command or "")
                nop = nop and true or false
                if command == CLM.L["level"] then
                    parameter = tonumber(parameter) or 0
                    ProfileManager:PruneBelowLevel(parameter, nop)
                elseif command == CLM.L["rank"] then
                    parameter = parameter or ""
                    parameter = tonumber(parameter) or parameter
                    ProfileManager:PruneRank(parameter, nop)
                elseif command == CLM.L["unguilded"] then
                    ProfileManager:PruneUnguilded(nop)
                end
            end),
            confirm = true
        }
    end
    if ACL:IsTrusted() then
        options.version = {
            type = "execute",
            name = CLM.L["Version check in guild"],
            func = (function()
                ProfileInfoManager:RequestVersion()
            end),
            confirm = true
        }
    end
    if ACL:IsTrusted() then
        options.spec = {
            type = "execute",
            name = CLM.L["Spec guild request"],
            func = (function()
                ProfileInfoManager:RequestSpec()
            end),
            confirm = true
        }
    end
    if ACL:IsTrusted() then
        options.export = {
            type = "execute",
            name = CLM.L["Export data"],
            func = (function()
                CLM.Integration:Export()
            end),
            confirm = true
        }
    end
    if ACL:IsTrusted() then
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
                        local profile = ProfileManager:GetProfileByName(name)
                        if profile then
                            LOG:Message(CLM.L["%s profile exists."], name)
                        else
                            LOG:Message(CLM.L["%s profile missing. Adding."], name)
                            ProfileManager:NewProfile(GUID, name, class)
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
    ConfigManager:RegisterSlash(options)
end

function GlobalSlashCommands:Award(args)
    args = args or ""
    local values = {strsplit("/", args)}
    -- Item --
    local itemLink = values[1]
    local itemId = GetItemIdFromLink(itemLink)
    if not itemId or itemId == 0 then
        LOG:Message(CLM.L["Invalid item link"])
        return
    end
    -- Value --
    local value = tonumber(values[2] or 0)
    if value < 0 then
        LOG:Message(CLM.L["Item value must be positive"])
        return
    end
    -- Roster --
    local isRaid = false
    local raid
    local rosterName = values[3]
    local roster
    if not rosterName or rosterName == "" then
        raid = RaidManager:GetRaid()
        if not raid then
            LOG:Message(CLM.L["Missing roster name and you are not in raid"])
            return
        else
            isRaid = true
            LOG:Info(CLM.L["Missing roster name. Using Raid Info"])
            roster = raid:Roster()
            LOG:Info(CLM.L["Raid: %s Roster: %s"], raid:Name(), RosterManager:GetRosterNameByUid(roster:UID()))
        end
    else
        roster = RosterManager:GetRosterByName(rosterName)
        if not roster then
            LOG:Message(CLM.L["Unknown roster %s"], rosterName)
            return
        end
    end
    -- Profile --
    local name = values[4]
    if not name or name == "" then
        name = UTILS.GetUnitName("target")
    end
    local profile = ProfileManager:GetProfileByName(name)
    if not profile then
        LOG:Message(CLM.L["Missing profile %s"], name)
        return
    end
    if not roster:IsProfileInRoster(profile:GUID()) then
        LOG:Message(CLM.L["%s is not part of the %s roster"], profile:Name(), RosterManager:GetRosterNameByUid(roster:UID()))
        return
    end
    -- Award --
    local awarded = LootManager:AwardItem(isRaid and raid or roster, name, itemLink, itemId, value)
    if awarded and not AutoAward:IsIgnored(itemId) then
        if MODULES.AuctionManager:GetAutoTrade() then
            AutoAward:Track(itemId, name)
        end
    end
end

CLM.GlobalSlashCommands = GlobalSlashCommands
