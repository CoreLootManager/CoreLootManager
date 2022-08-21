-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local GameTooltip = GameTooltip

local EVENT_FILL_AUCTION_WINDOW = "CLM_AUCTION_WINDOW_FILL"

BINDING_HEADER_CLM = "Classic Loot Manager"

function CLM_Binding_StartAuction() -- luacheck: ignore
    LOG:Trace("CLM_Binding_StartAuction")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            CLM.MODULES.EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
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
            CLM.MODULES.EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
                link = itemLink,
                start = true
            })
        end
    end
end

function CLM_Binding_AwardForBase() -- luacheck: ignore
    LOG:Trace("CLM_Binding_AwardForBase")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            local base = 0
            local raid = CLM.MODULES.RaidManager:GetRaid()
            if raid then
                local itemId = CLM.UTILS.GetItemIdFromLink(itemLink)
                base = raid:Roster():GetItemValue(itemId).base
            end
            CLM.GlobalSlashCommands:Award(itemLink .. "/" .. base)
        end
    end
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

function CLM_Binding_BidBase() -- luacheck: ignore
    CLM.GUI.BiddingManager:BidBase()
end
function CLM_Binding_BidMax() -- luacheck: ignore
    CLM.GUI.BiddingManager:BidMax()
end
function CLM_Binding_BidCurrent() -- luacheck: ignore
    CLM.GUI.BiddingManager:BidCurrent()
end
-- GUI Toggles

function CLM_Binding_ToggleGUI_Standings() -- luacheck: ignore
    CLM.GUI.Standings:Toggle()
end
function CLM_Binding_ToggleGUI_PointHistory() -- luacheck: ignore
    CLM.GUI.PointHistory:Toggle()
end
function CLM_Binding_ToggleGUI_LootHistory() -- luacheck: ignore
    CLM.GUI.Loot:Toggle()
end
function CLM_Binding_ToggleGUI_LootQueue() -- luacheck: ignore
    CLM.GUI.LootQueue:Toggle()
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
function CLM_Binding_ToggleGUI_Profiles() -- luacheck: ignore
    CLM.GUI.Profiles:Toggle()
end
function CLM_Binding_ToggleGUI_Audit() -- luacheck: ignore
    CLM.GUI.Audit:Toggle()
end
function CLM_Binding_ToggleGUI_Raids() -- luacheck: ignore
    CLM.GUI.RaidManager:Toggle()
end