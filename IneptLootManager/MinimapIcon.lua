local _, ILM = ...

local addonName = "Inept Loot Manager" -- same as the UI name for config

local OpenToCategory = InterfaceOptionsFrame_OpenToCategory or Settings.OpenToCategory

local ldb = LibStub:GetLibrary("LibDataBroker-1.1", true)
if not ldb then return end

local icon = LibStub("LibDBIcon-1.0", true)
if not icon then return end

local function CreateMinimapDBI(self, dropdown)
    ILM.MinimapDBI = ldb:NewDataObject(addonName, {
        type = "data source",
        text = "0",
        icon = "Interface\\AddOns\\IneptLootManager\\Media\\Icons\\ilm-blue-32.tga"
    })

    ILM.MinimapDBI.OnClick = function(s, button)
        if button == "RightButton" then
            if self:IsInitialized() then
                ILM.UTILS.LibDD:ToggleDropDownMenu(1, nil, dropdown, s, -20, 0)
            end
        else
            ILM.GUI.Unified:Toggle()
        end
    end

    ILM.MinimapDBI.OnTooltipShow = function(tooltip)
        local info
        tooltip:AddLine(addonName .. " " .. ILM.MODULES.Version:GetString())

        if ILM.MODULES.LedgerManager:IsInitialized() then
            local lag = ILM.MODULES.LedgerManager:Lag()
            local count = ILM.MODULES.LedgerManager:Length()
            local hash = ILM.MODULES.LedgerManager:Hash()
            if lag > 0 then
                info = string.format(ILM.L["%s events (%s pending)"], count, lag)
            else
                info = string.format(ILM.L["%s events (0x%x)"], count, hash)
            end
        else
            info = string.format(ILM.L["Loading..."])
        end

        if ILM.MODULES.LedgerManager:IsInIncoherentState() then
            tooltip:AddLine(ILM.L["Incoherent state"], 0.6, 0.0, 0.0) -- RED
        elseif ILM.MODULES.LedgerManager:IsInSync() then
            tooltip:AddLine(ILM.L["In-Sync"], 0.0, 0.8, 0.0) -- GREEN
        elseif ILM.MODULES.LedgerManager:IsSyncOngoing() then
            tooltip:AddLine(ILM.L["Sync ongoing"], 0.75, 0.75, 0.0) -- YELLOW
        elseif ILM.MODULES.LedgerManager:IsDisabled() then
            tooltip:AddLine(ILM.L["Disabled"], 0.6, 0.0, 0.0) -- RED
        else -- Unknown state
            tooltip:AddLine(ILM.L["Unknown sync state"], 0.4, 0.6, 1) -- BLUE
        end
        tooltip:AddLine(info)

        if ILM.MODULES.SandboxManager:IsSandbox() then
            tooltip:AddLine(ILM.L["Sandbox mode"], 1, 1, 1)
        end

        if ILM.MODULES.LedgerManager:IsTimeTraveling() then
            tooltip:AddLine(ILM.L["Time Traveling"], 1, 1, 1)
        end
    end

    icon:Register(addonName, ILM.MinimapDBI, ILM2_MinimapIcon)
end

local function getIcon(ic)
    return "Interface\\AddOns\\IneptLootManager\\Media\\Icons\\ilm-" .. ic .. "-32.tga"
end

local dropdown
local Minimap = {}

local function CreateConfig(self)
    local options = {
        minimap_toggle = {
            name = ILM.L["Toggle Minimap Icon"],
            desc = ILM.L["Enables / disables minimap Icon"],
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
    ILM.MODULES.ConfigManager:Register(ILM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

local function updateIcon()
    local ic
    if ILM.MODULES.LedgerManager:IsInIncoherentState() or ILM.MODULES.LedgerManager:IsDisabled() then
        ic = "red"
    elseif ILM.MODULES.LedgerManager:IsInSync() then
        ic = "green"
    elseif ILM.MODULES.LedgerManager:IsSyncOngoing() then
        ic = "yellow"
    elseif ILM.MODULES.SandboxManager:IsSandbox() or ILM.MODULES.LedgerManager:IsTimeTraveling() then
        ic = "white"
    else -- Unknown state
        ic = "blue"
    end
    ILM.MinimapDBI.icon = getIcon(ic)
end

function Minimap:Initialize()
    CreateConfig(self)
    if not ILM2_MinimapIcon then ILM2_MinimapIcon = {} end
    -- Minimap icon dropdown menu
    local options = {
        {
            title = ILM.L["Menu"],
            isTitle = true
        },
        {
            title = ILM.L["Auctioning"],
            func = (function() ILM.GUI.AuctionManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = ILM.L["Auction History"],
            func = (function() ILM.GUI.AuctionHistory:Toggle() end),
            trustedOnly = true
        },
        {
            title = ILM.L["Trade List"],
            func = (function() ILM.GUI.TradeList:Toggle() end),
            trustedOnly = true
        },
        {
            title = ILM.L["Bidding"],
            func = (function() ILM.GUI.BiddingManager:Toggle() end)
        },
        {
            title = ILM.L["Award"],
            func = (function() ILM.GUI.Award:Toggle() end),
            trustedOnly = true
        },
        -- Management
        {
            separator = true,
        },
        -- { -- TODO this should come from the Integrations addon
        --     title = ILM.L["Export"],
        --     func = (function() ILM.GUI.Export:Toggle() end),
        --     trustedOnly = true,
        --     managerOnly = true
        -- },
        {
            title = ILM.L["Configuration"],
            icon = "Interface\\AddOns\\IneptLootManager\\Media\\Icons\\ilm-dark-32.png",
            func = (function()
                OpenToCategory(addonName)
                OpenToCategory(addonName)
            end)
        },

    }

    dropdown = ILM.UTILS.GenerateDropDownMenu(
        options,
        ILM.MODULES.ACL:CheckLevel(ILM.CONSTANTS.ACL.LEVEL.ASSISTANT),
        ILM.MODULES.ACL:CheckLevel(ILM.CONSTANTS.ACL.LEVEL.MANAGER)
    )

    -- Create Minimap Icon
    CreateMinimapDBI(self, dropdown)

    -- Hook Minimap Icon
    hooksecurefunc(ILM.MODULES.LedgerManager, "UpdateSyncState", updateIcon)

    if ILM2_MinimapIcon.disable then icon:Hide(addonName) end

    self._initialized = true
end

function Minimap:IsInitialized()
    return self._initialized
end

function Minimap:UpdateIcon()
    if self:IsInitialized() then
        updateIcon()
    end
end

function Minimap:Enable()
    ILM2_MinimapIcon.disable = false
        icon:Show(addonName)
end

function Minimap:Disable()
    ILM2_MinimapIcon.disable = true
    icon:Hide(addonName)
end

function Minimap:IsEnabled()
    return not ILM2_MinimapIcon.disable
end

ILM.MODULES.Minimap = Minimap