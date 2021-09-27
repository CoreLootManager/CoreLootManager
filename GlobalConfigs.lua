-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

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
            announce_loot_to_raid_level = 3
        }
    end
    self.db = db.global

    local options = {
        global_header = {
            type = "header",
            name = "Global",
            order = 0
        },
        global_guild_award_announcement = {
            name = "Announce award to Guild",
            desc = "Toggles loot award announcement to guild",
            type = "toggle",
            set = function(i, v) self:SetAnnounceAwardToGuild(v) end,
            get = function(i) return self:GetAnnounceAwardToGuild() end,
            width = "double",
            order = 1
        },
        global_raid_loot_announcement = {
            name = "Announce Loot from corpse to Raid",
            desc = "Toggles loot announcement to raid",
            type = "toggle",
            set = function(i, v) self:SetAnnounceLootToRaid(v) end,
            get = function(i) return self:GetAnnounceLootToRaid() end,
            width = "double",
            order = 2
        },
        global_raid_loot_announcement_level = {
            name = "Select loot rarity",
            desc = "Select loot rarity for the annoucement to raid.",
            type = "select",
            -- width = "double",
            values = {
                [0] = ColorCodeText("Poor", "9d9d9d"),
                [1] = ColorCodeText("Common", "ffffff"),
                [2] = ColorCodeText("Uncommon", "1eff00"),
                [3] = ColorCodeText("Rare", "0070dd"),
                [4] = ColorCodeText("Epic", "a335ee"),
                [5] = ColorCodeText("Legendary", "ff8000"),
            },
            set = function(i, v) self:SetAnnounceLootToRaidLevel(v) end,
            get = function(i) return self:GetAnnounceLootToRaidLevel() end,
            order = 3
        },
        global_wipe_ledger = {
            name = "Wipe events",
            desc = "Wipes all events from memory. This will trigger resyncing from other users.",
            type = "execute",
            confirm = true,
            func = function() LedgerManager:Wipe() end,
            order = 10
        }
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
    return self.db.announce_loot_to_raid_level
end



CLM.GlobalConfigs = GlobalConfigs