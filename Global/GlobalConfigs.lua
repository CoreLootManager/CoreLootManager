local  _, CLM = ...

-- local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
local ColorCodeText = UTILS.ColorCodeText

local ConfigManager = MODULES.ConfigManager
local LedgerManager = MODULES.LedgerManager

local GlobalConfigs = {}
function GlobalConfigs:Initialize()
    local db = MODULES.Database:Personal()
    if not db.global then
        db.global = {
            announce_award_to_guild = true,
            announce_loot_to_raid = false,
            announce_loot_to_raid_level = 3,
            tracked_loot_level = 4,
            wowdkpbot_integration = false,
            chat_commands = false
        }
    end
    self.db = db.global

    local options = {
        discord = {
            type = "description",
            name = CLM.L["Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"],
            fontSize = "medium",
            order = 0
        },
        global_header = {
            type = "header",
            name = CLM.L["Global"],
            order = 1
        },
        global_raid_loot_announcement = {
            name = CLM.L["Announce loot from corpse to Raid"],
            desc = CLM.L["Toggles loot announcement to raid"],
            type = "toggle",
            set = function(i, v) self:SetAnnounceLootToRaid(v) end,
            get = function(i) return self:GetAnnounceLootToRaid() end,
            width = "double",
            order = 3
        },
        global_raid_loot_announcement_level = {
            name = CLM.L["Announcement loot rarity"],
            desc = CLM.L["Select loot rarity for the annoucement to raid."],
            type = "select",
            -- width = "double",
            values = {
                [0] = ColorCodeText(CLM.L["Poor"], "9d9d9d"),
                [1] = ColorCodeText(CLM.L["Common"], "ffffff"),
                [2] = ColorCodeText(CLM.L["Uncommon"], "1eff00"),
                [3] = ColorCodeText(CLM.L["Rare"], "0070dd"),
                [4] = ColorCodeText(CLM.L["Epic"], "a335ee"),
                [5] = ColorCodeText(CLM.L["Legendary"], "ff8000"),
            },
            set = function(i, v) self:SetAnnounceLootToRaidLevel(v) end,
            get = function(i) return self:GetAnnounceLootToRaidLevel() end,
            order = 4
        },
        global_wodkpbot_integration = {
            name = CLM.L["WoW DKP Bot Integration"],
            desc = CLM.L["Enble WoW DKP Bot Integration. This will result in additional data stored upon logout."],
            type = "toggle",
            set = function(i, v) self:SetWoWDKPBotIntegration(v) end,
            get = function(i) return self:GetWoWDKPBotIntegration() end,
            width = "double",
            order = 5
        },
        global_wipe_ledger = {
            name = CLM.L["Wipe events"],
            desc = CLM.L["Wipes all events from memory. This will trigger resyncing from other users."],
            type = "execute",
            confirm = true,
            func = function() LedgerManager:Wipe() end,
            order = 10
        },
        global_tracked_loot = {
            type = "header",
            name = CLM.L["Loot Queue"],
            order = 110
        },
        global_tracked_loot_level = {
            name = CLM.L["Tracked loot rarity"],
            desc = CLM.L["Select loot rarity for the tracking unauctioned loot."],
            type = "select",
            -- width = "double",
            values = {
                [0] = ColorCodeText(CLM.L["Poor"], "9d9d9d"),
                [1] = ColorCodeText(CLM.L["Common"], "ffffff"),
                [2] = ColorCodeText(CLM.L["Uncommon"], "1eff00"),
                [3] = ColorCodeText(CLM.L["Rare"], "0070dd"),
                [4] = ColorCodeText(CLM.L["Epic"], "a335ee"),
                [5] = ColorCodeText(CLM.L["Legendary"], "ff8000"),
            },
            set = function(i, v) self:SetTrackedLootLevel(v) end,
            get = function(i) return self:GetTrackedLootLevel() end,
            order = 111
        },
    }
    ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function GlobalConfigs:SetAnnounceAwardToGuild(value)
    self.db.announce_award_to_guild = value and true or false
end

function GlobalConfigs:GetAnnounceAwardToGuild()
    return self.db.announce_award_to_guild
end

function GlobalConfigs:SetAnnounceLootToRaid(value)
    self.db.announce_loot_to_raid = value and true or false
end

function GlobalConfigs:GetAnnounceLootToRaid()
    return self.db.announce_loot_to_raid
end

function GlobalConfigs:SetAnnounceLootToRaidLevel(value)
    self.db.announce_loot_to_raid_level = tonumber(value)
end

function GlobalConfigs:GetAnnounceLootToRaidLevel()
    return self.db.announce_loot_to_raid_level or 3
end

function GlobalConfigs:SetTrackedLootLevel(value)
    self.db.tracked_loot_level = tonumber(value)
end

function GlobalConfigs:GetTrackedLootLevel()
    return self.db.tracked_loot_level or 4
end

function GlobalConfigs:SetWoWDKPBotIntegration(value)
    self.db.wowdkpbot_integration = value and true or false
end

function GlobalConfigs:GetWoWDKPBotIntegration()
    return self.db.wowdkpbot_integration
end

function GlobalConfigs:SetAllowChatCommands(value)
    self.db.chat_commands = value and true or false
end

function GlobalConfigs:GetAllowChatCommands()
    return self.db.chat_commands
end

CLM.GlobalConfigs = GlobalConfigs