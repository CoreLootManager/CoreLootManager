-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

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