local define = LibDependencyInjection.createContext(...)

define.module("GlobalConfigs", {
    "Constants",
    "Utils",
    "Database",
    "L",
}, function(resolve,CONSTANTS, UTILS, Database, L)

    CONSTANTS.MODIFIER_COMBINATION = {
        DISABLED        = "-",
        ALT             = "a",
        SHIFT           = "s",
        CTRL            = "c",
        ALT_SHIFT       = "as",
        ALT_CTRL        = "ac",
        SHIFT_CTRL      = "sc",
        ALT_SHIFT_CTRL  = "asc",
    }

    CONSTANTS.MODIFIER_COMBINATIONS_SORTED = {
        CONSTANTS.MODIFIER_COMBINATION.DISABLED,
        CONSTANTS.MODIFIER_COMBINATION.SHIFT,
        CONSTANTS.MODIFIER_COMBINATION.CTRL,
        CONSTANTS.MODIFIER_COMBINATION.ALT,
        CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT,
        CONSTANTS.MODIFIER_COMBINATION.ALT_CTRL,
        CONSTANTS.MODIFIER_COMBINATION.SHIFT_CTRL,
        CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT_CTRL
    }

    CONSTANTS.MODIFIER_COMBINATIONS = UTILS.Set(CONSTANTS.MODIFIER_COMBINATIONS_SORTED)

    CONSTANTS.MODIFIER_COMBINATIONS_GUI = {
        [CONSTANTS.MODIFIER_COMBINATION.DISABLED] = L["Disable"],
        [CONSTANTS.MODIFIER_COMBINATION.SHIFT] = L["Shift"],
        [CONSTANTS.MODIFIER_COMBINATION.CTRL] = L["Ctrl"],
        [CONSTANTS.MODIFIER_COMBINATION.ALT] = L["Alt"],
        [CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT] = L["Shift + Alt"],
        [CONSTANTS.MODIFIER_COMBINATION.ALT_CTRL] = L["Ctrl + Alt"],
        [CONSTANTS.MODIFIER_COMBINATION.SHIFT_CTRL] = L["Shift + Ctrl"],
        [CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT_CTRL] = L["Shift + Ctrl + Alt"]
    }

local tonumber = tonumber

local GlobalConfigs = {
    db = Database:Personal('global', {
        announce_award_to_guild = true,
        announce_loot_to_raid = false,
        announce_loot_to_raid_owner_only = true,
        announce_loot_to_raid_level = 3,
        wowdkpbot_integration = false,
        modifier_combination = CONSTANTS.MODIFIER_COMBINATION.ALT,
        chat_commands = false,
        alerts = true,
        sounds = true,
        disable_sync = false,
        suppress_incoming_chat_commands = false,
        suppress_outgoing_chat_commands = false,
        raid_warnings = {
            raid = true,
            auction = true,
            countdown = true,
            bids = true,
            loot = true,
            commands = false
        }
    })
}


function GlobalConfigs:SetAlerts(value)
    self.db.alerts = value and true or false
end

function GlobalConfigs:GetAlerts()
    return self.db.alerts
end

function GlobalConfigs:SetSounds(value)
    self.db.sounds = value and true or false
end

function GlobalConfigs:GetSounds()
    return self.db.sounds
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

function GlobalConfigs:SetAnnounceLootToRaidOwnerOnly(value)
    self.db.announce_loot_to_raid_owner_only = value and true or false
end

function GlobalConfigs:GetAnnounceLootToRaidOwnerOnly()
    return self.db.announce_loot_to_raid_owner_only
end

function GlobalConfigs:SetAnnounceLootToRaidLevel(value)
    self.db.announce_loot_to_raid_level = tonumber(value)
end

function GlobalConfigs:GetAnnounceLootToRaidLevel()
    return self.db.announce_loot_to_raid_level or 3
end

function GlobalConfigs:SetModifierCombination(value)
    self.db.modifier_combination = CONSTANTS.MODIFIER_COMBINATIONS[value] and value or CONSTANTS.MODIFIER_COMBINATION.ALT
end

function GlobalConfigs:GetModifierCombination()
    return self.db.modifier_combination or CONSTANTS.MODIFIER_COMBINATION.ALT
end

function GlobalConfigs:SetAllowChatCommands(value)
    self.db.chat_commands = value and true or false
end

function GlobalConfigs:GetAllowChatCommands()
    return self.db.chat_commands
end

function GlobalConfigs:SetSuppressIncomingChatCommands(value)
    self.db.suppress_incoming_chat_commands = value and true or false
end

function GlobalConfigs:GetSuppressIncomingChatCommands()
    return self.db.suppress_incoming_chat_commands
end

function GlobalConfigs:SetSuppressOutgoingChatCommands(value)
    self.db.suppress_outgoing_chat_commands = value and true or false
end

function GlobalConfigs:GetSuppressOutgoingChatCommands()
    return self.db.suppress_outgoing_chat_commands
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

function GlobalConfigs:GetDisableSync()
    return self.db.disable_sync
end

function GlobalConfigs:SetDisableSync(value)
    self.db.disable_sync = value and true or false
end



resolve(GlobalConfigs)

end)

define.module("GlobalConfigs/GUI", {"L", "ConfigManager", "GlobalConfigs", "Constants/ItemQuality"}, function(resolve, L, ConfigManager, GlobalConfigs, ItemQuality)

    local options = {
        discord = {
            type = "description",
            name = L["Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"],
            fontSize = "medium",
            order = 0
        },
        global_header = {
            type = "header",
            name = L["Global"],
            order = 1
        },
        global_alerts = {
            name = L["Point & Loot alerts"],
            desc = L["Toggles alerts display when receiving Points or loot."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetAlerts(v) end,
            get = function(i) return GlobalConfigs:GetAlerts() end,
            width = "double",
            order = 2
        },
        global_bindings = {
            name = L["Bindings"],
            desc = L["Open Key Bindings UI for AddOns"],
            type = "execute",
            func = (function()
                local category = "AddOns"
                category = _G[category] or category
                KeyBindingFrame_LoadUI()
                KeyBindingFrame.mode = 1
                for _,buttons in pairs(KeyBindingFrame.categoryList.buttons) do
                    if buttons.element then
                        if buttons.element.name == category then
                            HideUIPanel(InterfaceOptionsFrame)
                            ShowUIPanel(KeyBindingFrame)
                            KeyBindingFrame.cntCategory = buttons.element.category
                            buttons:Click()
                            -- OptionsList_SelectButton(buttons:GetParent(), buttons)
                        end
                    end
                end
            end),
            width = 1,
            order = 2.1
        },
        global_sounds = {
            name = L["Addon sounds"],
            desc = L["Toggles addon sounds."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetSounds(v) end,
            get = function(i) return GlobalConfigs:GetSounds() end,
            width = "double",
            order = 2.5
        },
        global_wipe_ledger = {
            name = L["Wipe events"],
            desc = L["Wipes all events from memory. This will trigger resyncing from other users."],
            type = "execute",
            confirm = true,
            func = function() LedgerManager:Wipe() end,
            order = 4
        },
        global_loot_announcement_header = {
            type = "header",
            name = L["Announce loot"],
            order = 5
        },
        global_raid_loot_announcement = {
            name = L["Announce loot from corpse to Raid"],
            desc = L["Toggles loot announcement to raid"],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetAnnounceLootToRaid(v) end,
            get = function(i) return GlobalConfigs:GetAnnounceLootToRaid() end,
            width = "double",
            order = 6
        },
        global_raid_loot_announcement_owner_only = {
            name = L["Only when ML/RL"],
            desc = L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetAnnounceLootToRaidOwnerOnly(v) end,
            get = function(i) return GlobalConfigs:GetAnnounceLootToRaidOwnerOnly() end,
            width = "double",
            order = 7
        },
        global_raid_loot_announcement_level = {
            name = L["Announcement loot rarity"],
            desc = L["Select loot rarity for the annoucement to raid."],
            type = "select",
            values = ItemQuality,
            set = function(i, v) GlobalConfigs:SetAnnounceLootToRaidLevel(v) end,
            get = function(i) return GlobalConfigs:GetAnnounceLootToRaidLevel() end,
            order = 8
        },
        rw_header = {
            type = "header",
            name = L["Raid Warnings"],
            order = 120
        },
        rw_raid = {
            name = L["Raid Start/End"],
            desc = L["Enables announcing raid start and end."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetRaidWarning(v) end,
            get = function(i) return GlobalConfigs:GetRaidWarning() end,
            -- width = "double",
            order = 121
        },
        rw_auction = {
            name = L["Auction Start/End"],
            desc = L["Enable announcing auction start and end."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetAuctionWarning(v) end,
            get = function(i) return GlobalConfigs:GetAuctionWarning() end,
            order = 122
        },
        rw_commands = {
            name = L["Chat Commands"],
            desc = L["Enables announcing chat commands at auction start."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetCommandsWarning(v) end,
            get = function(i) return GlobalConfigs:GetCommandsWarning() end,
            order = 123
        },
        rw_countdown = {
            name = L["Auction End Countdown"],
            desc = L["Enables raid-warning countdown for auctions."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetCountdownWarning(v) end,
            get = function(i) return GlobalConfigs:GetCountdownWarning() end,
            order = 124
        },
        rw_loot = {
            name = L["Loot Awards"],
            desc = L["Enables announcing loot awards."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetLootWarning(v) end,
            get = function(i) return GlobalConfigs:GetLootWarning() end,
            order = 125
        },
        rw_bids = {
            name = L["Bids"],
            desc = L["Enables announcing new highest bid (when applicable)."],
            type = "toggle",
            set = function(i, v) GlobalConfigs:SetBidsWarning(v) end,
            get = function(i) return GlobalConfigs:GetBidsWarning() end,
            order = 126
        },
        danger_zone_header = {
            type = "header",
            name = L["Danger Zone - Use at own risk"],
            order = 10000
        },
        danger_zone_disable_sync = {
            type = "toggle",
            name = L["Disable data synchronisation"],
            desc = L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."],
            set = function(i, v) GlobalConfigs:SetDisableSync(v) end,
            get = function(i) return GlobalConfigs:GetDisableSync() end,
            width = "full",
            order = 10001
        }
    }
    ConfigManager:RegisterGlobal(options)
end)