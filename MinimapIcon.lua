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
            title = CLM.L["Menu"],
            isTitle = true
        },
        {
            title = CLM.L["Standings"],
            func = (function() CLM.GUI.Standings:Toggle() end)
        },
        {
            title = CLM.L["Loot History"],
            func = (function() CLM.GUI.Loot:Toggle() end)
        },
        {
            title = CLM.L["Point History"],
            func = (function() CLM.GUI.PointHistory:Toggle() end)
        },
        -- Raid
        {
            separator = true,
        },
        {
            title = CLM.L["Raid"],
            func = (function() CLM.GUI.RaidManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = CLM.L["Loot Queue"],
            func = (function() CLM.GUI.LootQueue:Toggle() end),
            trustedOnly = true
        },
        {
            title = CLM.L["Auctioning"],
            func = (function() CLM.GUI.AuctionManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = CLM.L["Bidding"],
            func = (function() CLM.GUI.BiddingManager:Toggle() end)
        },
        -- Management
        {
            separator = true,
        },
        {
            title = CLM.L["Profiles"],
            func = (function() CLM.GUI.Profiles:Toggle() end),
            trustedOnly = true
        },
        {
            title = CLM.L["Audit"],
            func = (function() CLM.GUI.Audit:Toggle() end),
            trustedOnly = true,
            managerOnly = true
        },
        {
            title = CLM.L["Configuration"],
            icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-ok-32.tga",
            func = (function()
                InterfaceOptionsFrame_OpenToCategory(addonName)
                InterfaceOptionsFrame_OpenToCategory(addonName)
            end)
        },

    }

    dropdown = CLM.UTILS.GenerateDropDownMenu(
        options,
        CLM.MODULES.ACL:CheckLevel(CLM.CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CLM.CONSTANTS.ACL.LEVEL.MANAGER)
    )

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
                info = string.format(CLM.L["%s events (%s pending)"], count, lag)
            else
                info = string.format(CLM.L["%s events"], count)
            end
        else
            info = string.format(CLM.L["Loading..."])
        end
        if CLM.MODULES.SandboxManager:IsSandbox() then
            local timetravelInfo = CLM.MODULES.LedgerManager:IsTimeTraveling() and CLM.L[" and Time Traveling"] or ""
            tooltip:AddDoubleLine(CLM.L["Sandbox mode"] .. timetravelInfo, info, 1, 1, 1)
        elseif CLM.MODULES.LedgerManager:IsTimeTraveling() then
            tooltip:AddDoubleLine(CLM.L["Time Traveling"], info, 0.45, 0.45, 0)
        else
            if CLM.MODULES.LedgerManager:IsInSync() then
                tooltip:AddDoubleLine(CLM.L["In-Sync"], info, 0.0, 0.8, 0.0)
            elseif CLM.MODULES.LedgerManager:IsSyncOngoing() then
                tooltip:AddDoubleLine(CLM.L["Sync ongoing"], info, 0.6, 0.0, 0.0)
            else -- Unknown state
                tooltip:AddDoubleLine(CLM.L["Unknown sync state"], info, 0.4, 0.6, 1)
            end
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