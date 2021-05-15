local _, CLM = ...

local addonName = "Classic Loot Manager"

local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local icon = LibStub("LibDBIcon-1.0", true)
if not icon then return end

CLM.MinimapDBI = ldb:NewDataObject(addonName, {
    type = "data source",
    text = "0",
    icon = "Interface\\ICONS\\Inv_Misc_SummerFest_BrazierBlue"
    -- icon = "Interface\\AddOns\\ClassicLootManager\\Media\\CLM-sync-D-128.blp"
})

function CLM.MinimapDBI.OnClick(self, button)
    local isTrusted = CLM.MODULES.ACL:IsTrusted()
    if button == "RightButton" then
        if IsShiftKeyDown() and isTrusted then
            CLM.GUI.Profiles:Toggle()
        elseif IsAltKeyDown() and isTrusted then
            CLM.GUI.RaidManager:Toggle()
        else
            CLM.GUI.Loot:Toggle()
        end
    else
        if IsShiftKeyDown() then
            InterfaceOptionsFrame_OpenToCategory(addonName)
            InterfaceOptionsFrame_OpenToCategory(addonName)
        elseif IsAltKeyDown() and isTrusted then
            CLM.GUI.AuctionManager:Toggle()
        else
            CLM.GUI.Standings:Toggle()
        end
    end
end

do
    function CLM.MinimapDBI.OnTooltipShow(tooltip)
        local isTrusted = CLM.MODULES.ACL:IsTrusted()
        tooltip:AddDoubleLine(addonName, CLM.CORE:GetVersionString())
        local lag = CLM.MODULES.LedgerManager:Lag()
        local count = CLM.MODULES.LedgerManager:Length()
        -- local hash = CLM.MODULES.LedgerManager:Hash()
        -- tooltip:AddLine("In-Sync", 0.0, 0.8, 0.0)
        local info = string.format("%d events (%d pending)", count, lag)
        if CLM.MODULES.LedgerManager:IsInSync() then
            tooltip:AddDoubleLine("In-Sync", info, 0.0, 0.8, 0.0)
        elseif CLM.MODULES.LedgerManager:IsSyncOngoing() then
            tooltip:AddDoubleLine("Sync ongoing", info, 0.6, 0.0, 0.0)
        else -- Unknown state
            tooltip:AddDoubleLine("Unknown sync state", info, 0.4, 0.6, 1)
        end

        -- tooltip:AddLine(string.format("We have %d events, %d lag and our state is %s", count, lag, hash))

        tooltip:AddLine(" ")

        tooltip:AddDoubleLine("|cffcfcfcfLeft Click|r", "Toggle Standings")
        tooltip:AddDoubleLine("|cffcfcfcfShift + Left Click|r", "Open Configuration")
        if isTrusted then
            tooltip:AddDoubleLine("|cffcfcfcfAlt + Left Click|r", "Toggle Auction")
        end
        tooltip:AddDoubleLine("|cffcfcfcfRight Click|r", "Toggle Loot")
        if isTrusted then
            tooltip:AddDoubleLine("|cffcfcfcfShift + Right Click|r", "Toggle Profiles")
            tooltip:AddDoubleLine("|cffcfcfcfAlt + Right Click|r", "Toggle Raid")
        end
    end
end

-- function CLM.MinimapDBI:UpdateState(inSync, syncOngoing)
--     if inSync then
--         CLM.MinimapDBI.icon = "Interface\\ICONS\\Inv_Misc_SummerFest_BrazierGreen"
--     elseif syncOngoing then
--         CLM.MinimapDBI.icon = "Interface\\ICONS\\Inv_Misc_SummerFest_BrazierRed"
--     else -- Unknown state
--         CLM.MinimapDBI.icon = "Interface\\ICONS\\Inv_Misc_SummerFest_BrazierBlue"
--     end
-- end

local f = CreateFrame("Frame")
local CLMLDBIconDB = {}
f:SetScript("OnEvent", function()
    if not CLMLDBIconDB then CLMLDBIconDB = {} end
    icon:Register(addonName, CLM.MinimapDBI, CLMLDBIconDB)
end)
f:RegisterEvent("PLAYER_LOGIN")
