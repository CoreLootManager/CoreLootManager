local _, CLM = ...

local addonName = "Classic Loot Manager"

local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local icon = LibStub("LibDBIcon-1.0", true)
if not icon then return end

CLM.MinimapDBI = ldb:NewDataObject(addonName, {
    type = "data source",
    text = "0",
    icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-sync-32.tga"
})

-- Minimap icon dropdown menu
local dropdown
local Minimap = {}
function Minimap:Initialize()
    local options = {
        {
            title = "Menu",
            isTitle = true
        },
        {
            title = "Standings",
            func = (function() CLM.GUI.Standings:Toggle() end)
        },
        {
            title = "Loot History",
            func = (function() CLM.GUI.Loot:Toggle() end)
        },
        {
            title = "Point History",
            func = (function() CLM.GUI.PointHistory:Toggle() end)
        },
        {
            title = "Bidding",
            func = (function() CLM.GUI.BiddingManager:Toggle() end)
        },
        {
            title = "Auctioning",
            func = (function() CLM.GUI.AuctionManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = "Raid",
            func = (function() CLM.GUI.RaidManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = "Profiles",
            func = (function() CLM.GUI.Profiles:Toggle() end),
            trustedOnly = true
        },
        {
            title = "Audit",
            func = (function() CLM.GUI.Audit:Toggle() end),
            trustedOnly = true
        },
        {
            title = "Configuration",
            icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-ok-32.tga",
            func = (function()
                InterfaceOptionsFrame_OpenToCategory(addonName)
                InterfaceOptionsFrame_OpenToCategory(addonName)
            end)
        },

    }

    dropdown = CLM.UTILS.GenerateDropDownMenu(options, CLM.MODULES.ACL:IsTrusted())

    self._initialized = true
end

function Minimap:IsInitialized()
    return self._initialized
end

function CLM.MinimapDBI.OnClick(self, button)
    if button == "RightButton" then
        if Minimap:IsInitialized() then
            CLM.UTILS.LibDD:ToggleDropDownMenu(1, nil, dropdown, self, -20, 0)
        end
    else
        CLM.GUI.Standings:Toggle()
    end
end

do
    function CLM.MinimapDBI.OnTooltipShow(tooltip)
        local info
        tooltip:AddDoubleLine(addonName, CLM.CORE:GetVersionString())
        if CLM.MODULES.LedgerManager:IsInitialized() then
            local lag = CLM.MODULES.LedgerManager:Lag()
            local count = CLM.MODULES.LedgerManager:Length()
            -- hash = CLM.MODULES.LedgerManager:Hash()
            if lag > 0 then
                info = string.format("%s events (%s pending)", count, lag)
            else
                info = string.format("%s events", count)
            end
        else
            info = string.format("Loading events...")
        end
        if CLM.MODULES.LedgerManager:IsInSync() then
            tooltip:AddDoubleLine("In-Sync", info, 0.0, 0.8, 0.0)
        elseif CLM.MODULES.LedgerManager:IsSyncOngoing() then
            tooltip:AddDoubleLine("Sync ongoing", info, 0.6, 0.0, 0.0)
        else -- Unknown state
            tooltip:AddDoubleLine("Unknown sync state", info, 0.4, 0.6, 1)
        end
    end
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
    if not CLM_MinimapIcon then CLM_MinimapIcon = {} end
    icon:Register(addonName, CLM.MinimapDBI, CLM_MinimapIcon)
end)
f:RegisterEvent("PLAYER_LOGIN")

CLM.MODULES.Minimap = Minimap