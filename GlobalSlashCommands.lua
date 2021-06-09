local  _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local ConfigManager = MODULES.ConfigManager
local LootManager = MODULES.LootManager
local RaidManager = MODULES.RaidManager
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager

local GetItemIdFromLink = UTILS.GetItemIdFromLink

local GlobalSlashCommands = {}
function GlobalSlashCommands:Initialize()
    local options = {
        award = {
            type = "input",
            name = "Award item",
            desc = "Award item without auctioning it.",
            set = (function(i, args)
                -- Formats:
                
                -- Award linked item to player in named roster for value:
                --          /clm award Item Link/Value/Roster Name/Player
                -- Example: /clm award [Hearthstone]/15/Mighty Geese/Bluntlighter

                -- Award linked item to currently targeted player in named roster for value:
                --          /clm award Item Link/Value/Roster Name
                -- Example: /clm award [Hearthstone]/15/Mighty Geese

                -- While being in active raid award linked item to targeted player for value:
                --          /clm award Item Link/Value
                -- Example: /clm award [Hearthstone]/15

                -- While being in active raid award linked item to targeted player for 0:
                --          /clm award Item Link
                -- Example: /clm award [Hearthstone]

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
                local rosterName = values[3]
                local roster
                if not rosterName or rosterName == "" then
                    local raid = RaidManager:GetRaid()
                    if not raid then
                        LOG:Message("Missing roster name and you are not in raid")
                        return
                    else
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
                LootManager:AwardItem(roster, name, itemLink, itemId, value)
            end)
        }
    }
    ConfigManager:RegisterSlash(options)
end



CLM.GlobalSlashCommands = GlobalSlashCommands
