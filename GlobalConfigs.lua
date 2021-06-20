local  _, CLM = ...

-- local LOG = CLM.LOG
local MODULES = CLM.MODULES
-- local UTILS = CLM.UTILS

local ConfigManager = MODULES.ConfigManager
local LedgerManager = MODULES.LedgerManager

local GlobalConfigs = {}
function GlobalConfigs:Initialize()
    local db = MODULES.Database:Personal()

    if not db.global then
        db.global = { announce_loot_to_guild = true }
    end
    self.db = db.global

    local options = {
        global_header = {
            type = "header",
            name = "Global",
            order = 0
        },
        global_guild_loot_announcement = {
            name = "Announce award to Guild",
            desc = "Toggles loot award announcement to guild",
            type = "toggle",
            set = function(i, v) self:SetAnnounceLootToGuild(v) end,
            get = function(i) return self:GetAnnounceLootToGuild() end,
            width = "double",
            order = 1
        },
        global_wipe_ledger = {
            name = "Wipe events",
            desc = "Wipes all events from memory. This will trigger resyncing from other users.",
            type = "execute",
            confirm = true,
            func = function() LedgerManager:Wipe() end,
            order = 2
        }
    }
    ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function GlobalConfigs:SetAnnounceLootToGuild(value)
    self.db.announce_loot_to_guild = value and true or false
end

function GlobalConfigs:GetAnnounceLootToGuild()
    return self.db.announce_loot_to_guild
end

CLM.GlobalConfigs = GlobalConfigs