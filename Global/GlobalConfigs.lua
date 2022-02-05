local  _, CLM = ...

-- local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS
local ColorCodeText = UTILS.ColorCodeText

local ConfigManager = MODULES.ConfigManager
local LedgerManager = MODULES.LedgerManager

local GlobalConfigs = {}
function GlobalConfigs:Initialize()
    self.db = MODULES.Database:Personal('global', {
        announce_award_to_guild = true,
        announce_loot_to_raid = false,
        announce_loot_to_raid_level = 3,
        tracked_loot_level = 4,
        wowdkpbot_integration = false,
        chat_commands = false,
        alerts = true,
        raid_warnings = {
            raid = true,
            auction = true,
            countdown = true,
            bids = true,
            loot = true,
            commands = false
        }
    })

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
        global_alerts = {
            name = CLM.L["DKP & Loot alerts"],
            desc = CLM.L["Toggles alerts display when receiving DKP or loot."],
            type = "toggle",
            set = function(i, v) self:SetAlerts(v) end,
            get = function(i) return self:GetAlerts() end,
            width = "double",
            order = 2
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
        rw_header = {
            type = "header",
            name = CLM.L["Raid Warnings"],
            order = 120
        },
        rw_raid = {
            name = CLM.L["Raid Start/End"],
            desc = CLM.L["Enables announcing raid start and end."],
            type = "toggle",
            set = function(i, v) self:SetRaidWarning(v) end,
            get = function(i) return self:GetRaidWarning() end,
            -- width = "double",
            order = 121
        },
        rw_auction = {
            name = CLM.L["Auction Start/End"],
            desc = CLM.L["Enable announcing auction start and end."],
            type = "toggle",
            set = function(i, v) self:SetAuctionWarning(v) end,
            get = function(i) return self:GetAuctionWarning() end,
            -- width = "double",
            order = 122
        },
        rw_commands = {
            name = CLM.L["Chat Commands"],
            desc = CLM.L["Enables announcing chat commands at auction start."],
            type = "toggle",
            set = function(i, v) self:SetCommandsWarning(v) end,
            get = function(i) return self:GetCommandsWarning() end,
            -- width = "double",
            order = 123
        },
        rw_countdown = {
            name = CLM.L["Auction End Countdown"],
            desc = CLM.L["Enables raid-warning countdown for auctions."],
            type = "toggle",
            set = function(i, v) self:SetCountdownWarning(v) end,
            get = function(i) return self:GetCountdownWarning() end,
            -- width = "double",
            order = 124
        },
        rw_loot = {
            name = CLM.L["Loot Awards"],
            desc = CLM.L["Enables announcing loot awards."],
            type = "toggle",
            set = function(i, v) self:SetLootWarning(v) end,
            get = function(i) return self:GetLootWarning() end,
            -- width = "double",
            order = 125
        },
        rw_bids = {
            name = CLM.L["Bids"],
            desc = CLM.L["Enables announcing new highest bid (when applicable)."],
            type = "toggle",
            set = function(i, v) self:SetBidsWarning(v) end,
            get = function(i) return self:GetBidsWarning() end,
            -- width = "double",
            order = 126
        }
    }
    ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function GlobalConfigs:SetAlerts(value)
    self.db.alerts = value and true or false
end

function GlobalConfigs:GetAlerts()
    return self.db.alerts
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

function GlobalConfigs:SetRaidWarning(value)
    self.db.raid_warnings.raid = value and true or false
end

function GlobalConfigs:GetRaidWarning()
    return self.db.raid_warnings.raid
end

function GlobalConfigs:SetAuctionWarning(value)
    self.db.raid_warnings.auction = value and true or false
end

function GlobalConfigs:GetAuctionWarning()
    return self.db.raid_warnings.auction
end

function GlobalConfigs:SetCommandsWarning(value)
    self.db.raid_warnings.commands = value and true or false
end

function GlobalConfigs:GetCommandsWarning()
    return self.db.raid_warnings.commands
end

function GlobalConfigs:SetCountdownWarning(value)
    self.db.raid_warnings.countdown = value and true or false
end

function GlobalConfigs:GetCountdownWarning()
    return self.db.raid_warnings.countdown
end

function GlobalConfigs:SetLootWarning(value)
    self.db.raid_warnings.loot = value and true or false
end

function GlobalConfigs:GetLootWarning()
    return self.db.raid_warnings.loot
end

function GlobalConfigs:SetBidsWarning(value)
    self.db.raid_warnings.bids = value and true or false
end

function GlobalConfigs:GetBidsWarning()
    return self.db.raid_warnings.bids
end

CLM.GlobalConfigs = GlobalConfigs