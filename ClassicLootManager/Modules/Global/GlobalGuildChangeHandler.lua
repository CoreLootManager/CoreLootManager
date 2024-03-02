-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local GlobalGuildChangeHandler = {}
function GlobalGuildChangeHandler:Initialize()
    CLM.MODULES.EventManager:RegisterWoWBucketEvent({"PLAYER_GUILD_UPDATE"}, 1, function()
        LOG:Message(CLM.L["Guild change detected. Disabling synchronisation until UI reload."])
        CLM.MODULES.LedgerManager:Cutoff()
        CLM.MODULES.LedgerManager:DisableAdvertising()
        CLM.MODULES.Database:ForceFallback()
        CLM.MODULES.GuildInfoListener:WipeAll()
        CLM.MODULES.Minimap:UpdateIcon()
    end)
end
CLM.GlobalGuildChangeHandler = GlobalGuildChangeHandler
