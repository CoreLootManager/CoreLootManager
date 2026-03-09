-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
local CONSTANTS = ILM.CONSTANTS
local UTILS     = ILM.UTILS
-- ------------------------------- --

local function Award(args)
    args = args or ""
    local values = {strsplit("/", args)}
    -- Item --
    local itemLink = values[1]
    local itemId, extra = UTILS.GetItemIdFromLink(itemLink)
    if not itemId or itemId == 0 then
        LOG:Message(ILM.L["Invalid item link"])
        return
    end
    -- Value --
    local value = tonumber(values[2] or 0)
    if value < 0 then
        LOG:Message(ILM.L["Item value must be positive"])
        return
    end
    -- Roster --
    local isRaid = false
    local raid
    local rosterName = values[3]
    local roster
    if not rosterName or rosterName == "" then
        raid = ILM.MODULES.RaidManager:GetRaid()
        if not raid then
            LOG:Message(ILM.L["Missing roster name and you are not in raid"])
            return
        else
            isRaid = true
            LOG:Info(ILM.L["Missing roster name. Using Raid Info"])
            roster = raid:Roster()
            LOG:Info(ILM.L["Raid: %s Roster: %s"], raid:Name(), ILM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()))
        end
    else
        roster = ILM.MODULES.RosterManager:GetRosterByName(rosterName)
        if not roster then
            LOG:Message(ILM.L["Unknown roster %s"], rosterName)
            return
        end
    end
    -- Profile --
    local name = values[4]
    if not name or name == "" then
        name = UTILS.GetUnitName("target")
    end
    local profile = ILM.MODULES.ProfileManager:GetProfileByName(name)
    if not profile then
        LOG:Message(ILM.L["Missing profile %s"], name)
        return
    end
    if not roster:IsProfileInRoster(profile:GUID()) then
        LOG:Message(ILM.L["%s is not part of the %s roster"], profile:Name(), ILM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()))
        return
    end
    -- Award --

    local awarded = ILM.MODULES.LootManager:AwardItem(isRaid and raid or roster, name, itemLink, itemId, extra, value)
    if awarded and not ILM.MODULES.AutoAssign:IsIgnored(itemLink) then
        if ILM.MODULES.AuctionManager:GetAutoTrade() then
            ILM.MODULES.AutoAssign:Track(itemLink, name)
        end
    end
end

local GlobalSlashCommands = {}
function GlobalSlashCommands:Initialize()
    local options = {}
    if ILM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        options.ignore = {
            type = "input",
            name = ILM.L["Ignore entry"],
            set = (function(i, id)
                id = tonumber(id) or 0
                local realEntry = ILM.MODULES.LedgerManager.ledger.getSortedList():entries()[id]
                if realEntry then
                    ILM.MODULES.LedgerManager:Remove(realEntry)
                end
            end),
            confirm = true
        }
    end
    if ILM.MODULES.ACL:IsTrusted() then
        options.prune = {
            type = "input",
            name = ILM.L["Prune profiles"],
            set = (function(i, input)
                local command, parameter, nop = strsplit("/", input)
                command = strlower(command or "")
                nop = nop and true or false
                if command == ILM.L["level"] then
                    parameter = tonumber(parameter) or 0
                    ILM.MODULES.ProfileManager:PruneBelowLevel(parameter, nop)
                elseif command == ILM.L["rank"] then
                    parameter = parameter or ""
                    parameter = tonumber(parameter) or parameter
                    ILM.MODULES.ProfileManager:PruneRank(parameter, nop)
                elseif command == ILM.L["unguilded"] then
                    ILM.MODULES.ProfileManager:PruneUnguilded(nop)
                end
            end),
            confirm = true
        }
    end
    if ILM.MODULES.ACL:IsTrusted() then
        options.version = {
            type = "execute",
            name = ILM.L["Version check in guild"],
            func = (function()
                ILM.MODULES.ProfileInfoManager:RequestVersion()
            end),
            confirm = true
        }
    end
    if ILM.MODULES.ACL:IsTrusted() then
        options.addprofile = {
            type = "input",
            name = "Add Profile By Name",
            set = (function(_, inputName)
                inputName = UTILS.Trim(strlower(inputName or ""))
                LOG:Message(ILM.L["Input name: %s"], inputName)
                for i=1,GetNumGuildMembers() do
                    local name, _, _, _, _, _, _, _, _, _, class, _, _, _, _, _, GUID = GetGuildRosterInfo(i)
                    name, _ = strsplit("-", name)
                    if strlower(name) == inputName then
                        LOG:Message(ILM.L["Found %s in guild."], name)
                        local profile = ILM.MODULES.ProfileManager:GetProfileByName(name)
                        if profile then
                            LOG:Message(ILM.L["%s profile exists."], name)
                        else
                            LOG:Message(ILM.L["%s profile missing. Adding."], name)
                            ILM.MODULES.ProfileManager:NewProfile(GUID, name, class)
                        end
                        return
                    end
                end
                LOG:Message(ILM.L["%s was not found in guild."], inputName)
            end),
            get = (function() end),
            confirm = true
        }
    end
    options.guireset = {
        type = "execute",
        name = ILM.L["Reset gui positions"],
        func = (function()
            for _,GUI in pairs(ILM.GUI) do
                if GUI.Reset then
                    GUI:Reset()
                end
            end
        end),
        confirm = true
    }
    if ILM.MODULES.ACL:IsTrusted() then
        options.aw = {
            type = "input",
            name = ILM.L["Award item"],
            set = (function(_, args)
                Award(args)
            end)
        }
    end
    options.testbar = {
        type = "execute",
        name = ILM.L["Toggle test bar"],
        func = (function()
            ILM.GUI.BiddingManager:ToggleTestBar()
        end),
        confirm = true
    }
    ILM.MODULES.ConfigManager:RegisterSlash(options)
end

ILM.GlobalSlashCommands = GlobalSlashCommands
