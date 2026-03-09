-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --

local EVENT_FILL_AUCTION_WINDOW = "ILM_AUCTION_WINDOW_FILL" -- TODO event

BINDING_HEADER_ILM = "Inept Loot Manager"

function ILM_Binding_StartAuction() -- luacheck: ignore
    LOG:Trace("ILM_Binding_StartAuction")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            ILM.MODULES.EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
                link = itemLink,
                start = false
            })
        end
    end
end

function ILM_Binding_QuickStartAuction() -- luacheck: ignore
    LOG:Trace("ILM_Binding_QuickStartAuction")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            ILM.MODULES.EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
                link = itemLink,
                start = true
            })
        end
    end
end

local function awardForTierValue(tier)
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            local value = 0
            local raid = ILM.MODULES.RaidManager:GetRaid()
            if raid then
                local itemId = ILM.UTILS.GetItemIdFromLink(itemLink)
                value = raid:Roster():GetItemValues(itemId)[tier]
            end
            ILM.GlobalSlashCommands:Award(itemLink .. "/" .. value)
        end
    end
end

function ILM_Binding_AwardForBase() -- luacheck: ignore
    LOG:Trace("ILM_Binding_AwardForBase")
    awardForTierValue(CONSTANTS.SLOT_VALUE_TIER.BASE)
end

function ILM_Binding_AwardForSmall() -- luacheck: ignore
    LOG:Trace("ILM_Binding_AwardForSmall")
    awardForTierValue(CONSTANTS.SLOT_VALUE_TIER.SMALL)
end

function ILM_Binding_AwardForMedium() -- luacheck: ignore
    LOG:Trace("ILM_Binding_AwardForMedium")
    awardForTierValue(CONSTANTS.SLOT_VALUE_TIER.MEDIUM)
end

function ILM_Binding_AwardForLarge() -- luacheck: ignore
    LOG:Trace("ILM_Binding_AwardForLarge")
    awardForTierValue(CONSTANTS.SLOT_VALUE_TIER.LARGE)
end

function ILM_Binding_AwardForMax() -- luacheck: ignore
    LOG:Trace("ILM_Binding_AwardForMax")
    awardForTierValue(CONSTANTS.SLOT_VALUE_TIER.MAX)
end

function ILM_Binding_AwardForFree() -- luacheck: ignore
    LOG:Trace("ILM_Binding_AwardForFree")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            ILM.GlobalSlashCommands:Award(itemLink)
        end
    end
end
-- GUI Toggles

function ILM_Binding_ToggleGUI_UnifiedGUI() -- luacheck: ignore
    ILM.GUI.Unified:Toggle()
end
function ILM_Binding_ToggleGUI_LootQueue() -- luacheck: ignore
    ILM.GUI.LootQueue:Toggle()
end
function ILM_Binding_ToggleGUI_AuctionHistory() -- luacheck: ignore
    ILM.GUI.AuctionHistory:Toggle()
end
function ILM_Binding_ToggleGUI_Bidding() -- luacheck: ignore
    ILM.GUI.BiddingManager:Toggle()
end
function ILM_Binding_ToggleGUI_Auctioning() -- luacheck: ignore
    ILM.GUI.AuctionManager:Toggle()
end
