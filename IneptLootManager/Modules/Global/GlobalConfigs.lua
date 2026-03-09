-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
-- local LOG       = ILM.LOG
local CONSTANTS = ILM.CONSTANTS
local UTILS     = ILM.UTILS
-- ------------------------------- --

local GlobalConfigs = {}
function GlobalConfigs:Initialize()
    self.db = ILM.MODULES.Database:Personal('global', {
        uiscale = 1.0,
        announce_award_to_guild = true,
        announce_loot_to_raid = false,
        announce_loot_to_raid_owner_only = true,
        announce_loot_to_raid_level = 3,
        wowdkpbot_integration = false,
        modifier_combination = CONSTANTS.MODIFIER_COMBINATION.ALT,
        award_modifier_combination = CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT,
        chat_commands = false,
        alerts = true,
        sounds = true,
        disable_sync = false,
        suppress_incoming_chat_commands = false,
        suppress_outgoing_chat_commands = false,
        tooltips_display = true,
        raid_warnings = {
            raid = true,
            auction = true,
            countdown = true,
            bids = true,
            loot = true,
            commands = false
        },
        disenchanters = "",
        loot_roll = {
            rollOnLoot = CONSTANTS.LOOT_ROLL_TYPE_IGNORE,
            includeLegendary = false,
            includeStacking = false,
            includePatterns = false,
            includeMounts = false,
            includeToys = false,
            includeCosmetics = false,
        }
    })

    local options = {
        ilm_logo = {
            name = "",
            type = "description",
            image = "Interface\\AddOns\\IneptLootManager\\Media\\Icons\\ilm-dark-64.png",
            width = 0.25,
            order = 0
        },
        author = {
            type = "description",
            name = [=[Created by |cffe6cc80Lantis|r Annalina-Mirage Raceway]=],
            fontSize = "large",
            descStyle = "inline",
            width = 3,
            order = 0.1
        },
        spacing1 = {
            type = "description",
            fontSize = "large",
            name = "",
            width = 0.25,
            order = 0.2
        },
        patron_kudos = {
            type = "description",
            name = [=[
Thank you patrons!
]=],
            fontSize = "medium",
            descStyle = "inline",
            width = 3,
            order = 0.3
        },
        spacing2 = {
            type = "description",
            fontSize = "large",
            name = "",
            width = 0.25,
            order = 0.7
        },
        discord = {
            type = "description",
            name = ILM.L["Join our discord for more info: "],
            fontSize = "medium",
            width = 1.1,
            order = 0.8
        },
        discord_link = {
            type = "input",
            name = "",
            get = (function(i) return "|cff44ee44|r" end),
            set = (function(i,v) end),
            width = 1,
            order = 0.9
        },
        global_header = {
            type = "header",
            name = ILM.L["Global"],
            order = 1
        },
        global_ui_scale = {
            name = ILM.L["UI Scale"],
            desc = ILM.L["Rescales ILM UI, except Bidding window. You can rescale Bidding window independently by using Ctrl + Mouse Wheel. Some windows may require closing and reopening."],
            type = "range",
            min = 0.5,
            max = 2,
            step = 0.1,
            set = function(i, v)
                if v < 0.5 then v = 0.5 end
                if v > 2 then v = 2 end
                self.db.uiscale = v

                ILM.MODULES.EventManager:DispatchEvent("ILM_UI_RESIZE", {
                    scale = self.db.uiscale
                })

            end,
            get = function(i) return self.db.uiscale end,
            order = 2.1,
            width = 1
        },
        global_bindings = {
            name = ILM.L["Bindings"],
            desc = ILM.L["Open Key Bindings UI for AddOns"],
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
            order = 2.2
        },
        global_sounds = {
            name = ILM.L["Addon sounds"],
            desc = ILM.L["Toggles addon sounds."],
            type = "toggle",
            set = function(i, v) self:SetSounds(v) end,
            get = function(i) return self:GetSounds() end,
            width = 1,
            order = 2.5
        },
        global_wipe_ledger = {
            name = ILM.L["Wipe events"],
            desc = ILM.L["Wipes all events from memory. This will trigger resyncing from other users."],
            type = "execute",
            confirm = true,
            func = function() ILM.MODULES.LedgerManager:Wipe() end,
            order = 4
        },
        nofunallowed = {
            type = "execute",
            name = "No fun allowed",
            desc = "Disable April fools jokes",
            func = (function()
                StaticPopup_Show("ILMNoFunAllowedReload")
            end),
            order = 4.5,
            hidden = (function() return not ILM.AF end)
        },
        global_loot_announcement_header = {
            type = "header",
            name = ILM.L["Announce loot"],
            order = 5
        },
        global_raid_loot_announcement = {
            name = ILM.L["Announce loot from corpse to Raid"],
            desc = ILM.L["Toggles loot announcement to raid"],
            type = "toggle",
            set = function(i, v) self:SetAnnounceLootToRaid(v) end,
            get = function(i) return self:GetAnnounceLootToRaid() end,
            width = "double",
            order = 6
        },
        global_raid_loot_announcement_owner_only = {
            name = ILM.L["Only when ML/RL"],
            desc = ILM.L["When enabled, this will make loot announcement display only if you're Master Looter or Raid Leader (if there is no Master Looter)."],
            type = "toggle",
            set = function(i, v) self:SetAnnounceLootToRaidOwnerOnly(v) end,
            get = function(i) return self:GetAnnounceLootToRaidOwnerOnly() end,
            width = "double",
            order = 7
        },
        global_raid_loot_announcement_level = {
            name = ILM.L["Announcement loot rarity"],
            desc = ILM.L["Select loot rarity for the annoucement to raid."],
            type = "select",
            values = CONSTANTS.ITEM_QUALITY,
            set = function(i, v) self:SetAnnounceLootToRaidLevel(v) end,
            get = function(i) return self:GetAnnounceLootToRaidLevel() end,
            order = 8
        },
        de_header = {
            type = "header",
            name = ILM.L["Disenchanters"],
            order = 80
        },
        de_list = {
            type = "input",
            -- name = "",
            name = ILM.L["Comma-separated (CSV) list of disenchanter names. Case insensitive. Player-RealmName."],
            get = (function(i) return self:GetDisenchanterCSV() end),
            set = (function(i,v) self:SetDisenchanterCSV(v) end),
            width = "full",
            order = 81
        },
        rw_header = {
            type = "header",
            name = ILM.L["Raid Warnings"],
            order = 120
        },
        rw_raid = {
            name = ILM.L["Raid Start/End"],
            desc = ILM.L["Enables announcing raid start and end."],
            type = "toggle",
            set = function(i, v) self:SetRaidWarning(v) end,
            get = function(i) return self:GetRaidWarning() end,
            -- width = "double",
            order = 121
        },
        rw_auction = {
            name = ILM.L["Auction Start/End"],
            desc = ILM.L["Enable announcing auction start and end."],
            type = "toggle",
            set = function(i, v) self:SetAuctionWarning(v) end,
            get = function(i) return self:GetAuctionWarning() end,
            order = 122
        },
        rw_countdown = {
            name = ILM.L["Auction End Countdown"],
            desc = ILM.L["Enables raid-warning countdown for auctions."],
            type = "toggle",
            set = function(i, v) self:SetCountdownWarning(v) end,
            get = function(i) return self:GetCountdownWarning() end,
            order = 124
        },
        rw_loot = {
            name = ILM.L["Loot Awards"],
            desc = ILM.L["Enables announcing loot awards."],
            type = "toggle",
            set = function(i, v) self:SetLootWarning(v) end,
            get = function(i) return self:GetLootWarning() end,
            order = 125
        },
        rw_bids = {
            name = ILM.L["Bids"],
            desc = ILM.L["Enables announcing new highest bid (when applicable)."],
            type = "toggle",
            set = function(i, v) self:SetBidsWarning(v) end,
            get = function(i) return self:GetBidsWarning() end,
            order = 126
        },
        tooltip_display_header = {
            type = "header",
            name = ILM.L["Price Tooltips"] .. " - " .. ILM.L["Not in raid"],
            order = 900
        },
        tooltip_display_toggle = {
            name = ILM.L["Display price"],
            desc = ILM.L["Enables displaying item price on tooltip."],
            type = "toggle",
            set = function(i, v) self:SetPriceTooltip(v) end,
            get = function(i) return self:GetPriceTooltip() end,
            order = 901
        },
        loot_roll_header = {
            type = "header",
            name = ILM.L["Loot Rolling"],
            order = 1200
        },
        loot_roll_behavior = {
            name = ILM.L["Roll on Loot"],
            desc = ILM.L["Select default behavior whenever group loot rolling window gets opened. This will be active only during ILM Raid and while in Raid instance."],
            type = "select",
            values = CONSTANTS.ROLL_TYPE,
            set = function(i, v) self:SetRollType(v) end,
            get = function(i) return self:GetRollType() end,
            order = 1201
        },
        loot_roll_padding = {
            name = "",
            type = "description",
            order = 1202,
            width = 2
        },
        loot_roll_include_legendary = {
            name = ILM.L["Include"] .. " " .. UTILS.ColorCodeText(ILM.L["Legendary"], "ff8000"),
            desc = ILM.L["Toggles auto-rolling on legendary items."],
            type = "toggle",
            set = function(i, v) self:SetLootRollIncludeLegendary(v) end,
            get = function(i) return self:GetLootRollIncludeLegendary() end,
            order = 1203
        },
        loot_roll_include_stacking = {
            name = ILM.L["Include"] .. " " .. ILM.L["Stacking"],
            desc = ILM.L["Toggles auto-rolling on stacking items."],
            type = "toggle",
            set = function(i, v) self:SetLootRollIncludeStacking(v) end,
            get = function(i) return self:GetLootRollIncludeStacking() end,
            order = 1204
        },
        loot_roll_include_patterns = {
            name = ILM.L["Include"] .. " " .. ILM.L["Patterns"],
            desc = ILM.L["Toggles auto-rolling on patterns."],
            type = "toggle",
            set = function(i, v) self:SetLootRollIncludePatterns(v) end,
            get = function(i) return self:GetLootRollIncludePatterns() end,
            order = 1205
        },
        loot_roll_include_mounts = {
            name = ILM.L["Include"] .. " " .. ILM.L["Mounts"],
            desc = ILM.L["Toggles auto-rolling on mounts."],
            type = "toggle",
            set = function(i, v) self:SetLootRollIncludeMounts(v) end,
            get = function(i) return self:GetLootRollIncludeMounts() end,
            order = 1206
        },
        loot_roll_include_toys = {
            name = ILM.L["Include"] .. " " .. ILM.L["Toys"],
            desc = ILM.L["Toggles auto-rolling on toys."],
            type = "toggle",
            set = function(i, v) self:SetLootRollIncludeToys(v) end,
            get = function(i) return self:GetLootRollIncludeToys() end,
            order = 1207
        },
        loot_roll_include_cosmetics = {
            name = ILM.L["Include"] .. " " .. ILM.L["Cosmetics"],
            desc = ILM.L["Toggles auto-rolling on cosmetics."],
            type = "toggle",
            set = function(i, v) self:SetLootRollIncludeCosmetics(v) end,
            get = function(i) return self:GetLootRollIncludeCosmetics() end,
            order = 1208
        },
        danger_zone_header = {
            type = "header",
            name = ILM.L["Danger Zone - Use at own risk"],
            order = 10000
        },
        danger_zone_disable_sync = {
            type = "toggle",
            name = ILM.L["Disable data synchronisation"],
            desc = ILM.L["Disable data synchronisation. This might lead to unexpected consequences. Use this at your own risk. Requires /reload to apply."],
            set = function(i, v) self:SetDisableSync(v) end,
            get = function(i) return self:GetDisableSync() end,
            width = "full",
            order = 10001
        }
    }
    ILM.MODULES.ConfigManager:Register(ILM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function GlobalConfigs:SetRollType(value)
    self.db.loot_roll.rollOnLoot = CONSTANTS.ROLL_TYPE[value] and value or CONSTANTS.LOOT_ROLL_TYPE_IGNORE
end

function GlobalConfigs:GetRollType()
    return self.db.loot_roll.rollOnLoot
end


function GlobalConfigs:SetLootRollIncludeLegendary(value)
    self.db.loot_roll.includeLegendary = value and true or false
end

function GlobalConfigs:GetLootRollIncludeLegendary()
    return self.db.loot_roll.includeLegendary
end

function GlobalConfigs:SetLootRollIncludeStacking(value)
    self.db.loot_roll.includeStacking = value and true or false
end

function GlobalConfigs:GetLootRollIncludeStacking()
    return self.db.loot_roll.includeStacking
end

function GlobalConfigs:SetLootRollIncludePatterns(value)
    self.db.loot_roll.includePatterns = value and true or false
end

function GlobalConfigs:GetLootRollIncludePatterns()
    return self.db.loot_roll.includePatterns
end

function GlobalConfigs:SetLootRollIncludeMounts(value)
    self.db.loot_roll.includeMounts = value and true or false
end

function GlobalConfigs:GetLootRollIncludeMounts()
    return self.db.loot_roll.includeMounts
end

function GlobalConfigs:SetLootRollIncludeToys(value)
    self.db.loot_roll.includeToys = value and true or false
end

function GlobalConfigs:GetLootRollIncludeToys()
    return self.db.loot_roll.includeToys
end

function GlobalConfigs:SetLootRollIncludeCosmetics(value)
    self.db.loot_roll.includeCosmetics = value and true or false
end

function GlobalConfigs:GetLootRollIncludeCosmetics()
    return self.db.loot_roll.includeCosmetics
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

function GlobalConfigs:SetAwardModifierCombination(value)
    self.db.award_modifier_combination = CONSTANTS.MODIFIER_COMBINATIONS[value] and value or CONSTANTS.MODIFIER_COMBINATION.ALT
end

function GlobalConfigs:GetAwardModifierCombination()
    return self.db.award_modifier_combination or CONSTANTS.MODIFIER_COMBINATION.ALT
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

function GlobalConfigs:SetPriceTooltip(v)
    self.db.tooltips_display = v and true or false
end

function GlobalConfigs:GetPriceTooltip()
    return self.db.tooltips_display
end


function GlobalConfigs:GetDisableSync()
    return self.db.disable_sync
end

function GlobalConfigs:SetDisableSync(value)
    self.db.disable_sync = value and true or false
end

function GlobalConfigs:GetUIScale()
    return self.db.uiscale
end

function GlobalConfigs:SetDisenchanterCSV(v)
    self.db.disenchanters = v or ""
    self.deList = nil
end

function GlobalConfigs:GetDisenchanterCSV()
    return self.db.disenchanters
end

function GlobalConfigs:GetDisenchanterList()
    if not self.deList then
        self.deList = {}
        for _, deName in ipairs({strsplit(",", self.db.disenchanters)}) do
            self.deList[#self.deList+1] = UTILS.Trim(deName)
        end
    end
    return self.deList
end

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
    [CONSTANTS.MODIFIER_COMBINATION.DISABLED] = ILM.L["Disable"],
    [CONSTANTS.MODIFIER_COMBINATION.SHIFT] = ILM.L["Shift"],
    [CONSTANTS.MODIFIER_COMBINATION.CTRL] = ILM.L["Ctrl"],
    [CONSTANTS.MODIFIER_COMBINATION.ALT] = ILM.L["Alt"],
    [CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT] = ILM.L["Shift + Alt"],
    [CONSTANTS.MODIFIER_COMBINATION.ALT_CTRL] = ILM.L["Ctrl + Alt"],
    [CONSTANTS.MODIFIER_COMBINATION.SHIFT_CTRL] = ILM.L["Shift + Ctrl"],
    [CONSTANTS.MODIFIER_COMBINATION.ALT_SHIFT_CTRL] = ILM.L["Shift + Ctrl + Alt"]
}

ILM.GlobalConfigs = GlobalConfigs