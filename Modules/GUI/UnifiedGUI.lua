-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs = pairs
local tinsert = table.insert

-- Libs

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local REGISTRY = "clm_unifiedgui_gui_options"

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('unifiedgui', {
        location = {nil, nil, "CENTER", 0, 0 }
    })
end

local function StoreLocation(self)
    self.db.location = { self.aceObjects.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.aceObjects.top:ClearAllPoints()
        self.aceObjects.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

local UnifiedGUI = { tabs = {} }
function UnifiedGUI:Initialize()
    InitializeDB(self)
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    self:RegisterSlash()
    self._initialized = true

    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)

end

local function UpdateScrollingTableStructure(self)
    local scrollingTable = self.aceObjects.scrollingTable:GetScrollingTable()
    -- Clean selection 
    scrollingTable:ClearSelection()
    -- Clean old event handlers
    -- Clean old filter
    self.aceObjects.scrollingTable:SetFilter(scrollingTable.Filter)
    -- Get new
    local newSt = self.tabs[self.selectedTab].tableFeeder(scrollingTable)
    -- Set new structure
    self.aceObjects.scrollingTable:SetDisplayCols(newSt.columns)
    -- Set new event handlers and clear previous ones
    self.aceObjects.scrollingTable:RegisterEvents(newSt.events, true)
    -- Set new filters
    self.aceObjects.scrollingTable:SetFilter(newSt.filter)
end

local function UpdateScrollingTableData(self)
    -- Set new data
    local newSt = self.tabs[self.selectedTab].tableFeeder(scrollingTable)
    self.aceObjects.scrollingTable:SetData(newSt.dataProvider())
end

local function UpdateOptions(self)
    AceConfigRegistry:RegisterOptionsTable(REGISTRY, self.tabs[self.selectedTab].optionsFeeder)
    AceConfigDialog:Open(REGISTRY, self.aceObjects.optionsContent)
end

local function UpdateTab(self)
    -- Update Tab sizes
    local totalWidth = self.aceObjects.tabContent.frame.width
    local stWidth = self.aceObjects.scrollingTable.frame.width
    local optionsWidth = totalWidth - stWidth
    self.aceObjects.scrollFrame:SetWidth(optionsWidth)
    self.aceObjects.optionsContent:SetWidth(optionsWidth - 20)
    self.aceObjects.tabContent:SetUserData("table", {
        columns = {
            stWidth,
            optionsWidth
        },
        alignV = "top"
    })
    -- Update options
    UpdateOptions(self)
    -- Redraw
    self.aceObjects.tabContent:DoLayout()
end

local function CreateTabsWidget(self, content)
    local tabsWidget = AceGUI:Create("TabGroup")

    local tabs = {}
    for name, _ in pairs(self.tabs) do
        tinsert(tabs, {
            value = name,
            text = CLM.L[UTILS.capitalize(name)]
        })
    end

    self.selectedTab = "standings"
    tabsWidget:SetTabs(tabs)
    tabsWidget:SetLayout("Fill")
    tabsWidget:SetTitle("")

    tabsWidget:SetCallback("OnGroupSelected", function(_, _, tab)
        self.selectedTab = tab
        UpdateScrollingTableStructure(self)
        UpdateScrollingTableData(self)
        UpdateTab(self)
    end)

    tabsWidget:AddChild(content)

    self.aceObjects.tabsWidget = tabsWidget
end

local function CreateTabsContent(self)
    local tabContent = AceGUI:Create("SimpleGroup")
    tabContent:SetLayout("Table")
    tabContent:SetUserData("table", { columns = {100, 100}, alignV =  "top" })
    self.aceObjects.tabContent = tabContent
    local scrollingTable = AceGUI:Create("CLMLibScrollingTable")
    local optionsContent = AceGUI:Create("SimpleGroup")
    self.aceObjects.scrollingTable = scrollingTable
    local scrollFrame = AceGUI:Create("ScrollFrame")
    self.aceObjects.scrollFrame = scrollFrame
    self.aceObjects.optionsContent = optionsContent
    tabContent:AddChild(scrollingTable)
    tabContent:AddChild(scrollFrame)
    scrollFrame:AddChild(optionsContent)
end

function UnifiedGUI:Create()
    LOG:Trace("UnifiedGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle(CLM.L["Classic Loot Manger"])
    f:SetStatusText("")
    f:SetLayout("Fill")
    f:EnableResize(false)
    f:SetWidth(700)
    f:SetHeight(600)
    self.aceObjects = {}
    self.aceObjects.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_UNIFIED_GUI")
    -- Widget
    CreateTabsContent(self)
    CreateTabsWidget(self, self.aceObjects.tabContent)
    RestoreLocation(self)
    f:AddChild(self.aceObjects.tabsWidget)
    -- Hide by default
    self.aceObjects.tabsWidget:SelectTab(self.selectedTab)
    f:Hide()
end

function UnifiedGUI:RegisterTab(name, tableFeeder, optionsFeeder)
    self.tabs[name] = {
        tableFeeder = tableFeeder,
        optionsFeeder = optionsFeeder
    }
    if not self.selectedTab then
        self.selectedTab = name
    end
end

function UnifiedGUI:Refresh(visible)
    LOG:Trace("UnifiedGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.aceObjects.top:IsVisible() then return end
    -- Don't update scrolling table structure on refresh.
    -- TODO if update options?
    UpdateScrollingTableData(self)
    UpdateTab(self)
end

function UnifiedGUI:Toggle()
    LOG:Trace("UnifiedGUI:Toggle()")
    if not self._initialized then return end
    if self.aceObjects.top:IsVisible() then
        self.aceObjects.top:Hide()
    else
        if IsInRaid() then
            self.filterOptions[FILTER_IN_RAID] = true
            self.filterOptions[FILTER_STANDBY] = false
        end
        self:Refresh()
        self.aceObjects.top:Show()
    end
end

function UnifiedGUI:RegisterSlash()
    local options = {
        gui = {
            type = "execute",
            name = "Standings",
            desc = CLM.L["Toggle standings window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function UnifiedGUI:Reset()
    LOG:Trace("UnifiedGUI:Reset()")
    self.aceObjects.top:ClearAllPoints()
    self.aceObjects.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.Unified = UnifiedGUI
