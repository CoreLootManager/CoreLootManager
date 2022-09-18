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
    if Acl:IsTrusted() then
        options.award = {
            type = "input",
            name = L["Award item"],
            desc = L["Award item without auctioning it."],
            set = (function(_, args)
                self:Award(args)
            end)
        }
    end
    if Acl:CheckManager() then
        options.link = {
            type = "input",
            name = L["Link Alt to Main"],
            set = (function(i, input)
                local alt, main = strsplit(" ", input)
                ProfileManager:MarkAsAltByNames(alt, main)
            end),
            confirm = true
        }
        options.unlink = {
            type = "input",
            name = L["Unlink Alt"],
            set = (function(i, input)
                ProfileManager:MarkAsAltByNames(input, "")
            end),
            confirm = true
        }
    end
    if Acl:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        options.ignore = {
            type = "input",
            name = L["Ignore entry"],
            set = (function(i, id)
                id = tonumber(id) or 0
                local realEntry = LedgerManager.ledger.getSortedList():entries()[id]
                if realEntry then
                    LedgerManager:Remove(realEntry)
                end
            end),
            confirm = true
        }
    end
    if Acl:IsTrusted() then
        options.prune = {
            type = "input",
            name = L["Prune profiles"],
            set = (function(i, input)
                local command, parameter, nop = strsplit("/", input)
                command = strlower(command or "")
                nop = nop and true or false
                if command == L["level"] then
                    parameter = tonumber(parameter) or 0
                    ProfileManager:PruneBelowLevel(parameter, nop)
                elseif command == L["rank"] then
                    parameter = parameter or ""
                    parameter = tonumber(parameter) or parameter
                    ProfileManager:PruneRank(parameter, nop)
                elseif command == L["unguilded"] then
                    ProfileManager:PruneUnguilded(nop)
                end
            end),
            confirm = true
        }
    end
    if Acl:IsTrusted() then
        options.version = {
            type = "execute",
            name = L["Version check in guild"],
            func = (function()
                ProfileInfoManager:RequestVersion()
            end),
            confirm = true
        }
    end
    if Acl:IsTrusted() then
        options.spec = {
            type = "execute",
            name = L["Spec guild request"],
            func = (function()
                ProfileInfoManager:RequestSpec()
                ProfileInfoManager:RequestRole()
            end),
            confirm = true
        }
    end
    if Acl:IsTrusted() then
        options.addprofile = {
            type = "input",
            name = "Add Profile By Name",
            set = (function(_, inputName)
                inputName = UTILS.Trim(strlower(inputName or ""))
                LOG:Message(L["Input name: %s"], inputName)
                for i=1,GetNumGuildMembers() do
                    local name, _, _, _, _, _, _, _, _, _, class, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
                    name, _ = strsplit("-", name)
                    if strlower(name) == inputName then
                        LOG:Message(L["Found %s in guild."], name)
                        local profile = ProfileRegistry.GetByName(name)
                        if profile then
                            LOG:Message(L["%s profile exists."], name)
                        else
                            LOG:Message(L["%s profile missing. Adding."], name)
                            ProfileManager:NewProfile(GUID, name, class)
                        end
                        return
                    end
                end
                LOG:Message(L["%s was not found in guild."], inputName)
            end),
            get = (function() end),
            confirm = true
        }
    end
    options.guireset = {
        type = "execute",
        name = L["Reset gui positions"],
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
    local itemId = UTILS.GetItemIdFromLink(itemLink)
    if not itemId or itemId == 0 then
        LOG:Message(L["Invalid item link"])
        return
    end
    -- Value --
    local value = tonumber(values[2] or 0)
    if value < 0 then
        LOG:Message(L["Item value must be positive"])
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
            LOG:Message(L["Missing roster name and you are not in raid"])
            return
        else
            isRaid = true
            LOG:Info(L["Missing roster name. Using Raid Info"])
            roster = raid:Roster()
            LOG:Info(L["Raid: %s Roster: %s"], raid:Name(), RosterManager:GetRosterNameByUid(roster:UID()))
        end
    else
        roster = RosterManager:GetRosterByName(rosterName)
        if not roster then
            LOG:Message(L["Unknown roster %s"], rosterName)
            return
        end
    end
    -- Profile --
    local name = values[4]
    if not name or name == "" then
        name = UTILS.GetUnitName("target")
    end
    local profile = ProfileRegistry.GetByName(name)
    if not profile then
        LOG:Message(L["Missing profile %s"], name)
        return
    end
    if not roster:IsProfileInRoster(profile:GUID()) then
        LOG:Message(L["%s is not part of the %s roster"], profile:Name(), RosterManager:GetRosterNameByUid(roster:UID()))
        return
    end
    -- Award --
    local awarded = LootManager:AwardItem(isRaid and raid or roster, name, itemLink, itemId, value)
    if awarded and not AutoAward:IsIgnored(itemId) then
        if AuctionManager:GetAutoTrade() then
            AutoAward:Track(itemId, name)
        end
    end
end

CLM.GlobalSlashCommands = GlobalSlashCommands
