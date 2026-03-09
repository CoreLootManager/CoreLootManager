-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --

local GlobalGuildChangeHandler = {
    changeDetected = false
}
function GlobalGuildChangeHandler:Initialize()
    self.isInGuild = IsInGuild()
    ILM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_GUILD_UPDATE"}, function(_, _, unitTarget)
        if unitTarget ~= "player" then return end
        if GlobalGuildChangeHandler.isInGuild == IsInGuild() then return end -- no change
        if GlobalGuildChangeHandler.changeDetected then return end -- Change alredy detected
        LOG:Message(ILM.L["Guild change detected. Disabling synchronisation until UI reload."])
        ILM.MODULES.LedgerManager:Cutoff()
        ILM.MODULES.LedgerManager:DisableAdvertising()
        ILM.MODULES.Database:ForceFallback()
        ILM.MODULES.TrustInfoProvider:WipeAll()
        ILM.MODULES.Minimap:UpdateIcon()
        GlobalGuildChangeHandler.changeDetected = true
        GlobalGuildChangeHandler.isInGuild = IsInGuild()
    end)
end
ILM.GlobalGuildChangeHandler = GlobalGuildChangeHandler
