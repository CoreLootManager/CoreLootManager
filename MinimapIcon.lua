local _, CLM = ...

local addonName = "Classic Loot Manager" -- same as the UI name for config

local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local icon = LibStub("LibDBIcon-1.0", true)
if not icon then return end

local function CreateMinimapDBI(self, dropdown)
    CLM.MinimapDBI = ldb:NewDataObject(addonName, {
        type = "data source",
        text = "0",
        icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-blue-32.tga"
    })

    CLM.MinimapDBI.OnClick = function(s, button)
        if button == "RightButton" then
            if self:IsInitialized() then
                CLM.UTILS.LibDD:ToggleDropDownMenu(1, nil, dropdown, s, -20, 0)
            end
        else
            CLM.GUI.Unified:Toggle()
        end
    end

    CLM.MinimapDBI.OnTooltipShow = function(tooltip)
        local info
        tooltip:AddDoubleLine(addonName, CLM.CORE:GetVersionString())

        if CLM.MODULES.LedgerManager:IsInitialized() then
            local lag = CLM.MODULES.LedgerManager:Lag()
            local count = CLM.MODULES.LedgerManager:Length()
            local hash = CLM.MODULES.LedgerManager:Hash()
            if lag > 0 then
                info = string.format(CLM.L["%s events (%s pending)"], count, lag)
            else
                info = string.format(CLM.L["%s events (0x%x)"], count, hash)
            end
        else
            info = string.format(CLM.L["Loading..."])
        end

        if CLM.MODULES.LedgerManager:IsInIncoherentState() then
            tooltip:AddDoubleLine(CLM.L["Incoherent state"], info, 0.6, 0.0, 0.0) -- RED
        elseif CLM.MODULES.LedgerManager:IsInSync() then
            tooltip:AddDoubleLine(CLM.L["In-Sync"], info, 0.0, 0.8, 0.0) -- GREEN
        elseif CLM.MODULES.LedgerManager:IsSyncOngoing() then
            tooltip:AddDoubleLine(CLM.L["Sync ongoing"], info, 0.75, 0.75, 0.0) -- YELLOW
        else -- Unknown state
            tooltip:AddDoubleLine(CLM.L["Unknown sync state"], info, 0.4, 0.6, 1) -- BLUE
        end

        if CLM.MODULES.SandboxManager:IsSandbox() then
            tooltip:AddLine(CLM.L["Sandbox mode"], 1, 1, 1)
        end

        if CLM.MODULES.LedgerManager:IsTimeTraveling() then
            tooltip:AddLine(CLM.L["Time Traveling"], 1, 1, 1)
        end
    end

    icon:Register(addonName, CLM.MinimapDBI, CLM2_MinimapIcon)
end

local function getIcon(ic)
    return "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-" .. ic .. "-32.tga"
end

local dropdown
local Minimap = {}

local function CreateConfig(self)
    local options = {
        minimap_toggle = {
            name = CLM.L["Toggle Minimap Icon"],
            desc = CLM.L["Enables / disables minimap Icon"],
            type = "toggle",
            set = function(i, v)
                if v then
                    self:Enable()
                else
                    self:Disable()
                end
            end,
            get = function(i) return self:IsEnabled() end,
            order = 2.5
          },
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function Minimap:Initialize()
    CreateConfig(self)
    if not CLM2_MinimapIcon then CLM2_MinimapIcon = {} end
    -- Minimap icon dropdown menu
    local options = {
        {
            title = CLM.L["Menu"],
            isTitle = true
        },
        {
            title = CLM.L["Auctioning"],
            func = (function() CLM.GUI.AuctionManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = CLM.L["Auction History"],
            func = (function() CLM.GUI.AuctionHistory:Toggle() end),
            trustedOnly = true
        },
        {
            title = CLM.L["Loot Queue"],
            func = (function() CLM.GUI.LootQueue:Toggle() end),
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
            title = CLM.L["Export"],
            func = (function() CLM.GUI.Export:Toggle() end),
            trustedOnly = true,
            managerOnly = true
        },
        {
            title = CLM.L["Configuration"],
            icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-green-32.tga",
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

    -- Create Minimap Icon
    CreateMinimapDBI(self, dropdown)

    -- Hook Minimap Icon
    hooksecurefunc(CLM.MODULES.LedgerManager, "UpdateSyncState", function()
        local ic
        if CLM.MODULES.LedgerManager:IsInIncoherentState() then
            ic = "red"
        elseif CLM.MODULES.LedgerManager:IsInSync() then
            ic = "green"
        elseif CLM.MODULES.LedgerManager:IsSyncOngoing() then
            ic = "yellow"
        elseif CLM.MODULES.SandboxManager:IsSandbox() or CLM.MODULES.LedgerManager:IsTimeTraveling() then
            ic = "white"
        else -- Unknown state
            ic = "blue"
        end
        CLM.MinimapDBI.icon = getIcon(ic)
    end)

    if CLM2_MinimapIcon.disable then icon:Hide(addonName) end

    self._initialized = true
end

function Minimap:IsInitialized()
    return self._initialized
end

function Minimap:Enable()
    CLM2_MinimapIcon.disable = false
        icon:Show(addonName)
end

function Minimap:Disable()
    CLM2_MinimapIcon.disable = true
    icon:Hide(addonName)
end

function Minimap:IsEnabled()
    return not CLM2_MinimapIcon.disable
end

CLM.MODULES.Minimap = Minimap