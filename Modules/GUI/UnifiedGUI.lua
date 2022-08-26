-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local CreateFrame, UIParent = CreateFrame, UIParent
local tonumber, tostring, type = tonumber, tostring, type
local strlen, sfind, sformat, tinsert = strlen, string.find, string.format, table.insert

-- Libs

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local REGISTRY = "clm_unifiedgui_gui_options"

local UnifiedGUI = { tabs = {} }

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

function UnifiedGUI:Initialize()
    InitializeDB(self)
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self.tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIListGUIDialogTooltip", UIParent, "GameTooltipTemplate")
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    -- self.selectedRoster = 0
    -- self.numSelected = 0
    -- self.numInRoster = 0
    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)

end

local function ST_GetName(row)
    return row.cols[1].value
end

local function ST_GetClass(row)
    return row.cols[3].value
end

-- local function UpdateStatusText(self)
--     local selectCount = self.numSelected
--     if not self.numSelected or self.numSelected == 0 then
--         selectCount = CLM.L["all"]
--     end
--     self.aceObjects.top:SetStatusText(self.numInRoster .. CLM.L[" players in roster"] .. " (" .. selectCount .. " " .. CLM.L["selected"] ..  ")")
-- end

local function UpdateST(self)
    local scrollingTable = self.aceObjects.scrollingTable:GetScrollingTable()
    -- Clean selection 
    scrollingTable:ClearSelection()
    -- Clean old event handlers
    self.aceObjects.scrollingTable:RegisterEvents(scrollingTable.DefaultEvents)
    -- Clean old filter
    self.aceObjects.scrollingTable:SetFilter(scrollingTable.Filter)
    -- Get new
    local newSt = self.tabs[self.selectedTab].tableFeeder(scrollingTable)
    -- Set new structure
    self.aceObjects.scrollingTable:SetDisplayCols(newSt.columns)
    -- Set new event handlers
    -- Set new filters
    self.aceObjects.scrollingTable:SetFilter(newSt.filter)
    -- Set new data
    self.aceObjects.scrollingTable:SetData(newSt.dataProvider())
end

local function UpdateOptions(self)
    AceConfigRegistry:RegisterOptionsTable(REGISTRY, self.tabs[self.selectedTab].optionsFeeder)
    AceConfigDialog:Open(REGISTRY, self.aceObjects.optionsContent)
end

local function UpdateTab(self)
    print("UpdateST")
    UpdateST(self)

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
    print("UpdateOptions")
    UpdateOptions(self)
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
    -- All registers must happen before creations of widget
    -- self:RegisterTab("standings", {}, {})
    -- self:RegisterTab("history", {}, {})
    -- self:RegisterTab("raids", {}, {})
    -- self:RegisterTab("profiles", function() return {columns = {}} end, { type = "group", args = {} })

    -- Widget
    CreateTabsContent(self)
    CreateTabsWidget(self, self.aceObjects.tabContent)
    -- UpdateSelectedTab(self)
    -- f:AddChild(CreateManagementOptions(self))
    RestoreLocation(self)
    f:AddChild(self.aceObjects.tabsWidget)
    -- Hide by default
    self.aceObjects.tabsWidget:SelectTab(self.selectedTab)
    -- f:Hide()
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
    print("UnifiedGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.aceObjects.top:IsVisible() then return end
    UpdateTab(self)
end


-- function UnifiedGUI:GetSelected(filter)
--     if type(filter) ~= "function" then
--         filter = (function(roster, profile) return profile end)
--     end
--     -- Roster
--     local roster = self:GetCurrentRoster()
--     if not roster then
--         return nil, nil
--     end
--     -- Profiles
--     local selected = self.aceObjects.scrollingTable:GetSelection()
--     local profiles = {}
--     if #selected == 0 then -- nothing selected: assume all visible are selected
--         selected = self.aceObjects.scrollingTable:DoFilter()
--     end
--     for _,s in pairs(selected) do
--         local profile = CLM.MODULES.ProfileManager:GetProfileByName(ST_GetName(self.aceObjects.scrollingTable:GetRow(s)))
--         if profile then
--             tinsert(profiles, profile)
--         else
--             LOG:Debug("No profile for %s", ST_GetName(self.aceObjects.scrollingTable:GetRow(s)))
--         end
--     end
--     local profiles_filtered = {}
--     for _, profile in ipairs(profiles) do
--         if filter(roster, profile) then
--             tinsert(profiles_filtered, profile)
--         end
--     end
--     return roster, profiles_filtered
-- end

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
