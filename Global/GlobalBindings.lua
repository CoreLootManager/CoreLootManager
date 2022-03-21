
-- Globals: Keybinds
local  _, CLM = ...

local LOG = CLM.LOG

local EVENT_FILL_AUCTION_WINDOW = "CLM_AUCTION_WINDOW_FILL"

BINDING_HEADER_CLM = "Classic Loot Manager"

function CLM_Binding_StartAuction()
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

function CLM_Binding_QuickStartAuction()
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

function CLM_Binding_AwardForBase()
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

function CLM_Binding_AwardForFree()
    LOG:Trace("CLM_Binding_AwardForFree")
    if GameTooltip then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            CLM.GlobalSlashCommands:Award(itemLink)
        end
    end
end

function CLM_Binding_BidBase()
    CLM.GUI.BiddingManager:BidBase()
end
function CLM_Binding_BidMax()
    CLM.GUI.BiddingManager:BidMax()
end
function CLM_Binding_BidCurrent()
    CLM.GUI.BiddingManager:BidCurrent()
end
-- GUI Toggles

function CLM_Binding_ToggleGUI_Standings()
    CLM.GUI.Standings:Toggle()
end
function CLM_Binding_ToggleGUI_PointHistory()
    CLM.GUI.PointHistory:Toggle()
end
function CLM_Binding_ToggleGUI_LootHistory()
    CLM.GUI.Loot:Toggle()
end
function CLM_Binding_ToggleGUI_LootQueue()
    CLM.GUI.LootQueue:Toggle()
end
function CLM_Binding_ToggleGUI_AuctionHistory()
    CLM.GUI.AuctionHistory:Toggle()
end
function CLM_Binding_ToggleGUI_Bidding()
    CLM.GUI.BiddingManager:Toggle()
end
function CLM_Binding_ToggleGUI_Auctioning()
    CLM.GUI.AuctionManager:Toggle()
end
function CLM_Binding_ToggleGUI_Profiles()
    CLM.GUI.Profiles:Toggle()
end
function CLM_Binding_ToggleGUI_Audit()
    CLM.GUI.Audit:Toggle()
end
function CLM_Binding_ToggleGUI_Raids()
    CLM.GUI.RaidManager:Toggle()
end