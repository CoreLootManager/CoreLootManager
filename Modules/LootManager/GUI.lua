local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

-- local LIBS =  {
--     registry = LibStub("AceConfigRegistry-3.0"),
--     gui = LibStub("AceConfigDialog-3.0")
-- }
local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
-- local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

-- local mergeDictsInline = UTILS.mergeDictsInline
-- local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

local getGuidFromInteger = UTILS.getGuidFromInteger
local GetClassColor = UTILS.GetClassColor
local ColorCodeText = UTILS.ColorCodeText
local GetItemIdFromLink = UTILS.GetItemIdFromLink

local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
-- local PointManager = MODULES.PointManager
local LedgerManager = MODULES.LedgerManager
local EventManager = MODULES.EventManager

local function ST_GetItemLink(row)
    return row.cols[1].value
end

local function ST_GetLoot(row)
    return row.cols[5].value
end

local LootGUI = {}
function LootGUI:Initialize()
    self:Create()
    self:RegisterSlash()
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)
    self.tooltip = CreateFrame("GameTooltip", "CLMLootGUIDialogTooltip", UIParent, "GameTooltipTemplate")
    EventManager:RegisterBucketEvent("GET_ITEM_INFO_RECEIVED", 1, self, "HandleItemInfoReceivedBucket")
    self._initialized = true
end

local columns = {
    playerLoot = {
        {name = "Item",  width = 225},
        {name = "Value",  width = 70},
        {name = "Date", width = 150, sort = ScrollingTable.SORT_DSC},
        {name = "", width = 0},
        {name = "", width = 0},
    },
    raidLoot = {
        {name = "Item",  width = 225},
        {name = "Value",  width = 70},
        {name = "Player",   width = 70},
        {name = "Date", width = 150, sort = ScrollingTable.SORT_DSC},
        {name = "", width = 0},
    }
}

local function CreateLootDisplay(self)
    -- Profile Scrolling Table
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(500)
    StandingsGroup:SetWidth(600)
    -- Roster selector
    local RosterSelectorDropDown = AceGUI:Create("Dropdown")
    RosterSelectorDropDown:SetLabel("Select roster")
    RosterSelectorDropDown:SetCallback("OnValueChanged", function()
        self.requestRefreshProfiles = true
        self:Refresh()
    end)
    self.RosterSelectorDropDown = RosterSelectorDropDown
    StandingsGroup:AddChild(RosterSelectorDropDown)
    -- Profile selector
    local ProfileSelectorDropDown = AceGUI:Create("Dropdown")
    ProfileSelectorDropDown:SetLabel("Select player")
    ProfileSelectorDropDown:SetCallback("OnValueChanged", function()
        self:Refresh()
    end)
    self.ProfileSelectorDropDown = ProfileSelectorDropDown
    StandingsGroup:AddChild(ProfileSelectorDropDown)
    -- Standings
    self.st = ScrollingTable:CreateST(columns.playerLoot, 25, 18, nil, StandingsGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", RosterSelectorDropDown.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    -- OnEnter handler -> on hover
    local OnEnterHandler = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local rowData = self.st:GetRow(realrow)
        if not rowData or not rowData.cols then return status end
        local tooltip = self.tooltip
        if not tooltip then return end
        local itemLink = ST_GetItemLink(rowData) or ""
        local itemId = GetItemIdFromLink(itemLink)
        local itemString = "item:" .. tonumber(itemId)
        tooltip:SetOwner(rowFrame, "ANCHOR_TOPRIGHT")
        tooltip:SetHyperlink(itemString)
        local loot = ST_GetLoot(rowData)
        if loot then
            local profile = ProfileManager:GetProfileByGUID(getGuidFromInteger(loot:Creator()))
            local name
            if profile then
                name = ColorCodeText(profile:Name(), GetClassColor(profile:Class()).hex)
            else
                name = "Unknown"
            end
            tooltip:AddDoubleLine("Awarded by", name)
        end
		tooltip:Show()
        return status
    end)
    -- OnLeave handler -> on hover out
    local OnLeaveHandler = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        self.tooltip:Hide()
        return status
    end)
    -- end
    self.st:RegisterEvents({
        OnEnter = OnEnterHandler,
        OnLeave = OnLeaveHandler
    })
    return StandingsGroup
end

function LootGUI:Create()
    LOG:Trace("LootGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Loot History")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(600)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Loot_GUI")
    self.requestRefreshProfiles = true

    f:AddChild(CreateLootDisplay(self))
    -- Hide by default
    f:Hide()
end

function LootGUI:Refresh(visible)
    LOG:Trace("LootGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top.frame:IsVisible() then return end
    self.st:ClearSelection()
    self:RefreshRosters()
    if self.requestRefreshProfiles then
        self:RefreshProfiles()
        self.requestRefreshProfiles = false
    end

    local roster = self:GetCurrentRoster()
    if roster == nil then return end
    local profile = self:GetCurrentProfile()

    local isProfileLoot = (profile and roster:IsProfileInRoster(profile:GUID()))
    local lootList
    -- player loot
    if isProfileLoot then
        lootList = roster:GetProfileLootByGUID(profile:GUID())
        self.st:SetDisplayCols(columns.playerLoot)
    else -- raid loot
        lootList = roster:GetRaidLoot()
        self.st:SetDisplayCols(columns.raidLoot)
    end

    self.displayedLoot = {}
    self.pendingLoot = false

    for _,loot in ipairs(lootList) do
        local _, itemLink = GetItemInfo(loot:Id())
        if not itemLink then
            self.pendingLoot = true
        elseif not self.pendingLoot then -- dont populate if we will be skipping it anyway - not displaying partially atm
            local owner = loot:Owner()
            table.insert(self.displayedLoot, {loot, itemLink, ColorCodeText(owner:Name(), GetClassColor(owner:Class()).hex)})
        end
    end

    if self.pendingLoot then
        self.st:SetData({
            {cols = {
                {value = ""},
                {value = ""},
                {value = "Loading..."},
                {value = ""},
                -- {value = ""} -- this needs to be nil -> represents the loot itself that is hidden. we use nil check to see if we have data
            }}
        })
        return
    end

    local rowId = 1
    local data = {}
    for _,lootData in ipairs(self.displayedLoot) do
        local loot = lootData[1]
        -- local link = lootData[2]
        -- local owner = lootData[3]
        local row = {cols = {}}
        row.cols[1] = {value = lootData[2]}
        row.cols[2] = {value = loot:Value()}
        row.cols[3] = {value = lootData[3]}
        row.cols[4] = {value = date("%Y/%m/%d %a %H:%M:%S", loot:Timestamp())}
        row.cols[5] = {value = loot}
        data[rowId] =  row
        rowId = rowId + 1
    end

    self.st:SetData(data)
end

function LootGUI:GetCurrentRoster()
    return RosterManager:GetRosterByUid(self.RosterSelectorDropDown:GetValue())
end

function LootGUI:GetCurrentProfile()
    return ProfileManager:GetProfileByName(self.ProfileSelectorDropDown:GetValue())
end

function LootGUI:RefreshRosters()
    LOG:Trace("LootGUI:RefreshRosters()")
    local rosters = RosterManager:GetRosters()
    local rosterUidMap = {}
    local rosterList = {}
    for name, roster in pairs(rosters) do
        rosterUidMap[roster:UID()] = name
        table.insert(rosterList, roster:UID())
    end
    self.RosterSelectorDropDown:SetList(rosterUidMap, rosterList)
    if not self.RosterSelectorDropDown:GetValue() then
        if #rosterList > 0 then
            self.RosterSelectorDropDown:SetValue(rosterList[1])
        end
    end
end

function LootGUI:RefreshProfiles()
    LOG:Trace("LootGUI:RefreshProfiles()")
    local roster = self:GetCurrentRoster()
    if not roster then return end
    local profiles = roster:Profiles()
    local profileNameMap = { ["-- Raid Loot --"] = "-- Raid Loot --"}
    local profileList = {"-- Raid Loot --"}
    for _, GUID in ipairs(profiles) do
        local profile = ProfileManager:GetProfileByGUID(GUID)
        if profile then
            profileNameMap[profile:Name()] = profile:Name()
            table.insert(profileList, profile:Name())
        end
    end
    table.sort(profileList)
    self.ProfileSelectorDropDown:SetList(profileNameMap, profileList)
    if not self.ProfileSelectorDropDown:GetValue() then
        if #profileList > 0 then
            self.ProfileSelectorDropDown:SetValue(profileList[1])
        end
    end
end

function LootGUI:HandleItemInfoReceived(itemId, success)
    -- If there was some update
    if self.pendingLootCount <= 0 and self.pendingLootCountPrevious > 0 then
        self:Refresh()
        return
    end
    -- if anything is still pending
    if self.pendingLootCount > 0 then
        self.pendingLootCountPrevious = self.pendingLootCount
        self.pendingLootCount = self.pendingLootCount - 1
        self.pendingLootInfoDict[itemId] = nil
    end
end

function LootGUI:HandleItemInfoReceivedBucket(...)
    if self.pendingLoot then self:Refresh(true) end
    self.pendingLoot = false
end

function LootGUI:Toggle()
    LOG:Trace("LootGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function LootGUI:RegisterSlash()
    local options = {
        loot = {
            type = "execute",
            name = "Standings",
            desc = "Toggle loot window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.Loot = LootGUI