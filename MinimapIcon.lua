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
})

function CLM.MinimapDBI.OnClick(self, button)
    local isTrusted = CLM.MODULES.ACL:IsTrusted()
	if button == "RightButton" then
        if IsShiftKeyDown() and isTrusted then
            CLM.GUI.Profiles:Toggle()
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
        tooltip:AddLine(addonName)
		-- tooltip:AddLine("In-Sync", 0.0, 0.8, 0.0)
        if CLM.MODULES.LedgerManager:IsInSync() then
            tooltip:AddLine("In-Sync", 0.0, 0.8, 0.0)
        elseif CLM.MODULES.LedgerManager:IsSyncOngoing() then
            tooltip:AddLine("Sync ongoing", 0.6, 0.0, 0.0)
        else -- Unknown state
            tooltip:AddLine("Unknown sync state", 0.4, 0.6, 1)
        end
        tooltip:AddLine(" ")
        tooltip:AddLine("|cffcfcfcfLeft Click:|r Toggle Standings window")
        tooltip:AddLine("|cffcfcfcfShift + Left Click:|r Open configuration window")
        if isTrusted then
            tooltip:AddLine("|cffcfcfcfAlt + Left Click:|r Toggle Auction window")
        end
        tooltip:AddLine("|cffcfcfcfRight Click:|r Toggle Loot window")
        if isTrusted then
            tooltip:AddLine("|cffcfcfcfShift + Right Click:|r Toggle Profiles window")
        end
	end
end

local f = CreateFrame("Frame")
local CLMLDBIconDB = {}
f:SetScript("OnEvent", function()
	if not CLMLDBIconDB then CLMLDBIconDB = {} end
	icon:Register(addonName, CLM.MinimapDBI, CLMLDBIconDB)
end)
f:RegisterEvent("PLAYER_LOGIN")