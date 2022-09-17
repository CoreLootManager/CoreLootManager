-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local GameTooltip = GameTooltip

local EVENT_FILL_AUCTION_WINDOW = "CLM_AUCTION_WINDOW_FILL" -- TODO event

BINDING_HEADER_CLM = "Classic Loot Manager"

function CLM_Binding_StartAuction() -- luacheck: ignore
    LOG:Trace("CLM_Binding_StartAuction")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
                link = itemLink,
                start = false
            })
        end
    end
end

function CLM_Binding_QuickStartAuction() -- luacheck: ignore
    LOG:Trace("CLM_Binding_QuickStartAuction")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
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
            local raid = RaidManager:GetRaid()
            if raid then
                local itemId = CLM.UTILS.GetItemIdFromLink(itemLink)
                value = raid:Roster():GetItemValues(itemId)[tier]
            end
            CLM.GlobalSlashCommands:Award(itemLink .. "/" .. value)
        end
    end
end

function CLM_Binding_AwardForBase() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForBase")
    awardForTierValue(SlotValueTier.BASE)
end

function CLM_Binding_AwardForSmall() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForSmall")
    awardForTierValue(SlotValueTier.SMALL)
end

function CLM_Binding_AwardForMedium() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForMedium")
    awardForTierValue(SlotValueTier.MEDIUM)
end

function CLM_Binding_AwardForLarge() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForLarge")
    awardForTierValue(SlotValueTier.LARGE)
end

function CLM_Binding_AwardForMax() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForMax")
    awardForTierValue(SlotValueTier.MAX)
end

function CLM_Binding_AwardForFree() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForFree")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            CLM.GlobalSlashCommands:Award(itemLink)
        end
    end
end
-- GUI Toggles

function CLM_Binding_ToggleGUI_UnifiedGUI() -- luacheck: ignore
    CLM.GUI.Unified:Toggle()
end
function CLM_Binding_ToggleGUI_LootQueue() -- luacheck: ignore
    LootQueue:Toggle()
end
function CLM_Binding_ToggleGUI_AuctionHistory() -- luacheck: ignore
    CLM.GUI.AuctionHistory:Toggle()
end
function CLM_Binding_ToggleGUI_Bidding() -- luacheck: ignore
    CLM.GUI.BiddingManager:Toggle()
end
function CLM_Binding_ToggleGUI_Auctioning() -- luacheck: ignore
    CLM.GUI.AuctionManager:Toggle()
end
