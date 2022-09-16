local define = LibDependencyInjection.createContext(...)

define.module("MinimapIcon", {
    "LibStub:LibDataBroker-1.1", "LibStub:LibDBIcon-1.0", "LedgerManager", "L", "Acl", "SandboxManager", "ConfigManager", "Meta:ADDON_TABLE", "UnifiedGUI", "Core", "Constants/Configs", "AuctionManager", "BiddingManager/Gui", "Constants/AclLevel"
}, function(resolve, ldb, icon, LedgerManager, L, Acl, SandboxManager, ConfigManager, CLM, UnifiedGUI, Core, Configs, AuctionManager, BiddingManagerGui, AclLevel)
local addonName = "Classic Loot Manager" -- same as the UI name for config

local MinimapDBI
local function CreateMinimapDBI(dropdown)
    MinimapDBI = ldb:NewDataObject(addonName, {
        type = "data source",
        text = "0",
        icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-blue-32.tga"
    })

    MinimapDBI.OnClick = function(s, button)
        if button == "RightButton" then
            CLM.UTILS.LibDD:ToggleDropDownMenu(1, nil, dropdown, s, -20, 0)
        else
            UnifiedGUI:Toggle()
        end
    end

    MinimapDBI.OnTooltipShow = function(tooltip)
        local info
        tooltip:AddDoubleLine(addonName, Core:GetVersionString())


        local lag = LedgerManager:Lag()
        local count = LedgerManager:Length()
        local hash = LedgerManager:Hash()
        if lag > 0 then
            info = string.format(L["%s events (%s pending)"], count, lag)
        else
            info = string.format(L["%s events (0x%x)"], count, hash)
        end

        if LedgerManager:IsInIncoherentState() then
            tooltip:AddDoubleLine(L["Incoherent state"], info, 0.6, 0.0, 0.0) -- RED
        elseif LedgerManager:IsInSync() then
            tooltip:AddDoubleLine(L["In-Sync"], info, 0.0, 0.8, 0.0) -- GREEN
        elseif LedgerManager:IsSyncOngoing() then
            tooltip:AddDoubleLine(L["Sync ongoing"], info, 0.75, 0.75, 0.0) -- YELLOW
        else -- Unknown state
            tooltip:AddDoubleLine(L["Unknown sync state"], info, 0.4, 0.6, 1) -- BLUE
        end

        if SandboxManager:IsSandbox() then
            tooltip:AddLine(L["Sandbox mode"], 1, 1, 1)
        end

        if LedgerManager:IsTimeTraveling() then
            tooltip:AddLine(L["Time Traveling"], 1, 1, 1)
        end
    end

    icon:Register(addonName, MinimapDBI, CLM2_MinimapIcon)
end

local function getIcon(ic)
    return "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-" .. ic .. "-32.tga"
end

local dropdown
local Minimap = {}

local function CreateConfig(self)
    local options = {
        minimap_toggle = {
            name = L["Toggle Minimap Icon"],
            desc = L["Enables / disables minimap Icon"],
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
    ConfigManager:Register(Configs.GROUP.GLOBAL, options)
end

function Minimap:Initialize()
    CreateConfig(self)
    if not CLM2_MinimapIcon then CLM2_MinimapIcon = {} end
    -- Minimap icon dropdown menu
    local options = {
        {
            title = L["Menu"],
            isTitle = true
        },
        -- {
        --     title = L["Standings"],
        --     func = (function() UnifiedGUI_Standings:Toggle() end)
        -- },
        -- {
        --     title = L["Loot History"],
        --     func = (function() CLM.GUI.Loot:Toggle() end)
        -- },
        -- {
        --     title = L["Point History"],
        --     func = (function() CLM.GUI.PointHistory:Toggle() end)
        -- },
        -- {
        --     title = L["Raids"],
        --     func = (function() CLM.GUI.RaidManager:Toggle() end),
        -- },
        -- {
        --     separator = true,
        -- },
        {
            title = L["Auctioning"],
            func = (function() AuctionManager:Toggle() end),
            trustedOnly = true
        },
        {
            title = L["Auction History"],
            func = (function() AuctionHistory:Toggle() end),
            trustedOnly = true
        },
        {
            title = L["Loot Queue"],
            func = (function() LootQueue:Toggle() end),
            trustedOnly = true
        },
        {
            title = L["Bidding"],
            func = (function() BiddingManagerGui:Toggle() end)
        },
        -- Management
        {
            separator = true,
        },
        {
            title = L["Export"],
            func = (function() Export:Toggle() end),
            trustedOnly = true,
            managerOnly = true
        },
        {
            title = L["Configuration"],
            icon = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-green-32.tga",
            func = (function()
                InterfaceOptionsFrame_OpenToCategory(addonName)
                InterfaceOptionsFrame_OpenToCategory(addonName)
            end)
        },

    }

    dropdown = CLM.UTILS.GenerateDropDownMenu(
        options,
        Acl:CheckLevel(AclLevel.ASSISTANT),
        Acl:CheckLevel(AclLevel.MANAGER)
    )

    -- Create Minimap Icon
    CreateMinimapDBI(dropdown)

    -- Hook Minimap Icon
    hooksecurefunc(LedgerManager, "UpdateSyncState", function()
        local ic
        if LedgerManager:IsInIncoherentState() then
            ic = "red"
        elseif LedgerManager:IsInSync() then
            ic = "green"
        elseif LedgerManager:IsSyncOngoing() then
            ic = "yellow"
        elseif SandboxManager:IsSandbox() or LedgerManager:IsTimeTraveling() then
            ic = "white"
        else -- Unknown state
            ic = "blue"
        end
        MinimapDBI.icon = getIcon(ic)
    end)

    if CLM2_MinimapIcon.disable then icon:Hide(addonName) end

    self._initialized = true
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

Minimap:Initialize()
resolve(Minimap)

end)