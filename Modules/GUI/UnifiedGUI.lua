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
        location = {nil, nil, "CENTER", 0, 0 },
        storage = {}
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

    self:Create()

    for _, tab in pairs(self.tabs) do
        tab.handlers.initializeHandler()
    end

    self:RegisterSlash()

    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        for _, tab in pairs(self.tabs) do
            tab.handlers.dataReadyHandler()
        end
        self:Refresh(true)
    end)

    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"},
    (function()
        StoreLocation(self)
        for _, tab in pairs(self.tabs) do
            tab.handlers.storeHandler()
        end
    end))

    self._initialized = true
end

local function UpdateScrollingTableStructure(self)
    local scrollingTable = self.aceObjects.scrollingTable:GetScrollingTable()
    -- Clean selection 
    scrollingTable:ClearSelection()
    -- Clean old event handlers
    -- Clean old filter
    self.aceObjects.scrollingTable:SetFilter(scrollingTable.Filter)
    -- Get new
    local newSt = self.tabs[self.selectedTab].feeders.table(scrollingTable)
    -- Set new structure
    self.aceObjects.scrollingTable:SetDisplayCols(newSt.columns)
    -- Set new event handlers and clear previous ones
    self.aceObjects.scrollingTable:RegisterEvents(newSt.events, true)
    -- Set new filters
    self.aceObjects.scrollingTable:SetFilter(newSt.filter)
end

local function UpdateScrollingTableData(self)
    -- Set new data
    local newSt = self.tabs[self.selectedTab].feeders.table(self.aceObjects.scrollingTable:GetScrollingTable())
    self.aceObjects.scrollingTable:SetData(newSt.dataProvider())
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
    self:RefreshOptionsPane()
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
    self.aceObjects = {
      top = f
    }
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_UNIFIED_GUI")
    -- Widget
    CreateTabsContent(self)
    CreateTabsWidget(self, self.aceObjects.tabContent)
    RestoreLocation(self)
    for _, tab in pairs(self.tabs) do
        tab.handlers.restoreHandler()
    end
    f:AddChild(self.aceObjects.tabsWidget)
    -- Hide by default
    self.aceObjects.tabsWidget:SelectTab(self.selectedTab)
    f:Hide()
end

local publicHandlers = {
    "initializeHandler",
    "refreshHandler",
    "preShowHandler",
    "storeHandler",
    "restoreHandler",
    "dataReadyHandler"
}

function UnifiedGUI:RegisterTab(
    name, tableFeeder, optionsFeeder, handlers
)

    local supportedTableTypes = {["function"] = true}
    if not supportedTableTypes[type(tableFeeder)] then
        error("UnifiedGUI:RegisterTab(): tableFeeder must be a function")
    end

    local supportedOptionsTypes = { ["function"] = true, ["table"] = true }
    if not supportedOptionsTypes[type(optionsFeeder)] then
        error("UnifiedGUI:RegisterTab(): optionsFeeder must be a function or a table")
    end

    self.tabs[name] = {
        feeders = {
            table   = tableFeeder,
            options = optionsFeeder,
        },
        handlers = {}
    }

    for _, handlerName in ipairs(publicHandlers) do
        if type(handlers[handlerName]) == "function" then
            self.tabs[name].handlers[handlerName] = handlers[handlerName]
        else
            self.tabs[name].handlers[handlerName] = (function() end)
        end
    end

    if not self.selectedTab then
        self.selectedTab = name
    end
end

function UnifiedGUI:GetStorage(name)
    if self.tabs[name] then
        if not self.db.storage[name] then
            self.db.storage[name] = {}
        end
        return self.db.storage[name]
    end
    return {}
end

function UnifiedGUI:GetScrollingTable()
    return self.aceObjects.scrollingTable:GetScrollingTable()
end

-- Refresh the data
function UnifiedGUI:Refresh(visible)
    LOG:Trace("UnifiedGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.aceObjects.top:IsVisible() then return end
    -- Tab specific refresh
    self.tabs[self.selectedTab].handlers.refreshHandler()
    -- Don't update scrolling table structure on refresh.
    -- TODO if update options?
    UpdateScrollingTableData(self)
    UpdateTab(self)
end

function UnifiedGUI:RefreshOptionsPane()
    AceConfigRegistry:RegisterOptionsTable(REGISTRY, self.tabs[self.selectedTab].feeders.options)
    AceConfigDialog:Open(REGISTRY, self.aceObjects.optionsContent)
end

function UnifiedGUI:Toggle()
    LOG:Trace("UnifiedGUI:Toggle()")
    if not self._initialized then return end
    if self.aceObjects.top:IsVisible() then
        self.aceObjects.top:Hide()
    else
        self.tabs[self.selectedTab].handlers.preShowHandler()
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
