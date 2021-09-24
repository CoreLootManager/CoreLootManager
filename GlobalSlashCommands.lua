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

local GetItemIdFromLink = UTILS.GetItemIdFromLink

local GlobalSlashCommands = {}
function GlobalSlashCommands:Initialize()
    local options = {}
    if ACL:IsTrusted() then
        options.award = {
            type = "input",
            name = "Award item",
            desc = "Award item without auctioning it.",
            set = (function(i, args)
                args = args or ""
                local values = {strsplit("/", args)}
                -- Item --
                local itemLink = values[1]
                local itemId = GetItemIdFromLink(itemLink)
                if not itemId or itemId == 0 then
                    LOG:Message("Invalid item link")
                    return
                end
                -- Value --
                local value = tonumber(values[2] or 0)
                if value < 0 then
                    LOG:Message("Item value must be positive")
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
                        LOG:Message("Missing roster name and you are not in raid")
                        return
                    else
                        isRaid = true
                        LOG:Info("Missing roster name. Using Raid Info")
                        roster = raid:Roster()
                        LOG:Info("Raid: %s Roster: %s", raid:Name(), RosterManager:GetRosterNameByUid(roster:UID()))
                    end
                else
                    roster = RosterManager:GetRosterByName(rosterName)
                    if not roster then
                        LOG:Message("Unknown roster %s", rosterName)
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
                    LOG:Message("Missing profile %s", name)
                    return
                end
                if not roster:IsProfileInRoster(profile:GUID()) then
                    LOG:Message("%s is not part of the %s roster", profile:Name(), RosterManager:GetRosterNameByUid(roster:UID()))
                    return
                end
                -- Award --
                LootManager:AwardItem(isRaid and raid or roster, name, itemLink, itemId, value)
            end)
        }
    end
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
        options.link = {
            type = "input",
            name = "Link Main-Alt",
            set = (function(i, input)
                local alt, main = strsplit(" ", input)
                ProfileManager:MarkAsAltByNames(alt, main)
            end),
            confirm = true
        }
        options.unlink = {
            type = "input",
            name = "Unlink Alt",
            set = (function(i, input)
                ProfileManager:MarkAsAltByNames(input, "")
            end),
            confirm = true
        }
    end
    if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
        options.ignore = {
            type = "input",
            name = "Ignore entry",
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
            name = "Prune profiles",
            set = (function(i, input)
                local command, parameter, nop = strsplit("/", input)
                command = strlower(command or "")
                nop = nop and true or false
                if command == "level" then
                    parameter = tonumber(parameter) or 0
                    ProfileManager:PruneBelowLevel(parameter, nop)
                elseif command == "rank" then
                    parameter = parameter or ""
                    parameter = tonumber(parameter) or parameter
                    ProfileManager:PruneRank(parameter, nop)
                elseif command == "unguilded" then
                    ProfileManager:PruneUnguilded(nop)
                end
            end),
            confirm = true
        }
    end
    ConfigManager:RegisterSlash(options)
end



CLM.GlobalSlashCommands = GlobalSlashCommands
