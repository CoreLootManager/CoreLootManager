local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local GUI = CLM.GUI

local getGuidFromInteger = UTILS.getGuidFromInteger
local GetClassColor = UTILS.GetClassColor
local ColorCodeText = UTILS.ColorCodeText
local GetItemIdFromLink = UTILS.GetItemIdFromLink
local Trim = UTILS.Trim

local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local RaidManager = MODULES.RaidManager
local LedgerManager = MODULES.LedgerManager
local EventManager = MODULES.EventManager

local function ST_GetItemLink(row)
    return row.cols[1].value
end

local function ST_GetLoot(row)
    return row.cols[5].value
end

local RightClickMenu

local LootGUI = {}

local function InitializeDB(self)
    self.db = MODULES.Database:GUI('loot', {
        location = {nil, nil, "CENTER", 0, 0 }
    })
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

function LootGUI:Initialize()
    InitializeDB(self)
    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    self:RegisterSlash()
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)
    self.tooltip = CreateFrame("GameTooltip", "CLMLootGUIDialogTooltip", UIParent, "GameTooltipTemplate")

    RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            {
                title = CLM.L["Remove selected"],
                func = (function()
                    local row = self.st:GetRow(self.st:GetSelection())
                    if row then
                        local loot = ST_GetLoot(row)
                        LedgerManager:Remove(loot:Entry(), true)
                    end
                end),
                trustedOnly = true,
                color = "cc0000"
            }
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )

    EventManager:RegisterWoWBucketEvent("GET_ITEM_INFO_RECEIVED", 1, self, "HandleItemInfoReceivedBucket")
    self._initialized = true
end

local columns = {
    playerLoot = {
        {name = CLM.L["Item"],  width = 265},
        {name = CLM.L["Value"],  width = 70, color = {r = 0.0, g = 0.93, b = 0.0, a = 1.0}},
        {name = CLM.L["Date"], width = 160, sort = ScrollingTable.SORT_DSC},
        {name = "", width = 0},
        {name = "", width = 0},
    },
    raidLoot = {
        {name = CLM.L["Item"], width = 265},
        {name = CLM.L["Value"], width = 70, color = {r = 0.0, g = 0.93, b = 0.0, a = 1.0}},
        {name = CLM.L["Date"], width = 160, sort = ScrollingTable.SORT_DSC},
        {name = CLM.L["Player"], width = 90},
        {name = "", width = 0},
    }
}

local function CreateLootDisplay(self)
    -- Profile Scrolling Table
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(500)
    StandingsGroup:SetWidth(620)
    -- Roster selector
    local RosterSelectorDropDown = AceGUI:Create("Dropdown")
    RosterSelectorDropDown:SetLabel(CLM.L["Select roster"])
    RosterSelectorDropDown:SetCallback("OnValueChanged", function()
        self.requestRefreshProfiles = true
        self:Refresh()
    end)
    self.RosterSelectorDropDown = RosterSelectorDropDown
    StandingsGroup:AddChild(RosterSelectorDropDown)
    -- Profile selector
    local ProfileSelectorDropDown = AceGUI:Create("Dropdown")
    ProfileSelectorDropDown:SetLabel(CLM.L["Select player"])
    ProfileSelectorDropDown:SetCallback("OnValueChanged", function()
        self:Refresh()
    end)
    self.ProfileSelectorDropDown = ProfileSelectorDropDown
    StandingsGroup:AddChild(ProfileSelectorDropDown)
    -- Search
    local SearchInput = AceGUI:Create("EditBox")
    SearchInput:SetLabel(CLM.L["Search"])
    SearchInput:SetCallback("OnEnterPressed", function()
        self:Refresh()
    end)
    self.SearchInput = SearchInput
    StandingsGroup:AddChild(SearchInput)
    -- Standings
    self.st = ScrollingTable:CreateST(columns.playerLoot, 25, 18, nil, StandingsGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", RosterSelectorDropDown.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    self.st:SetFilter((function(stobject, row)
        local item = strlower(ST_GetItemLink(row))
        local searchKeyword = self.SearchInput:GetText()
        if searchKeyword and strlen(searchKeyword) >= 3 then
            local searchList = { strsplit(",", searchKeyword) }
            for _, searchString in ipairs(searchList) do
                searchString = Trim(searchString)
                if strlen(searchString) >= 3 then
                    searchString = ".*" .. strlower(searchString) .. ".*"
                    if (string.find(item, searchString)) then
                        return true
                    end
                end
            end
            return false
        end
        return true
    end))
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
                name = CLM.L["Unknown"]
            end
            local raid = RaidManager:GetRaidByUid(loot:RaidUid())
            if raid then
                tooltip:AddLine(raid:Name())
            end
            tooltip:AddDoubleLine(CLM.L["Awarded by"], name)
            local auction = MODULES.AuctionHistoryManager:GetByUUID(loot:Entry():uuid())
            if auction then
                tooltip:AddLine(CLM.L["Bids"])
                for bidder, bid in pairs(auction.bids) do
                    local bidderProfile = ProfileManager:GetProfileByName(bidder)
                    if bidderProfile then
                        bidder = UTILS.ColorCodeText(bidder, UTILS.GetClassColor(bidderProfile:Class()).hex)
                    end
                    tooltip:AddDoubleLine(bidder, bid)
                end
            end
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
    -- OnClick handler
    local OnClickHandler = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
        local rightButton = (button == "RightButton")
        local status
        local selected = self.st:GetSelection()
        if selected ~= realrow then
            status = self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, rightButton and "LeftButton" or button, ...)
        end
        if rightButton then
            UTILS.LibDD:CloseDropDownMenus()
            UTILS.LibDD:ToggleDropDownMenu(1, nil, RightClickMenu, cellFrame, -20, 0)
        end
        return status
    end
    -- end

    self.st:RegisterEvents({
        OnEnter = OnEnterHandler,
        OnLeave = OnLeaveHandler,
        OnClick = OnClickHandler
    })
    return StandingsGroup
end

function LootGUI:Create()
    LOG:Trace("LootGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle(CLM.L["Loot History"])
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(670)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Loot_GUI")
    self.requestRefreshProfiles = true
    f:AddChild(CreateLootDisplay(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function LootGUI:Refresh(visible)
    LOG:Trace("LootGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top:IsVisible() then return end
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
        if GetItemInfoInstant(loot:Id()) then
            local _, itemLink = GetItemInfo(loot:Id())
            if not itemLink then
                self.pendingLoot = true
            elseif not self.pendingLoot then -- dont populate if we will be skipping it anyway - not displaying partially atm
                local owner = loot:Owner()
                table.insert(self.displayedLoot, {loot, itemLink, ColorCodeText(owner:Name(), GetClassColor(owner:Class()).hex)})
            end
        end
    end

    if self.pendingLoot then
        self.st:SetData({
            {cols = {
                {value = ""},
                {value = ""},
                {value = CLM.L["Loading..."]},
                {value = ""},
                {value = nil}
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
        row.cols[3] = {value = date(CLM.L["%Y/%m/%d %a %H:%M:%S"], loot:Timestamp())}
        row.cols[4] = {value = lootData[3]}
        row.cols[5] = {value = loot}
        data[rowId] =  row
        rowId = rowId + 1
    end

    self.st:SetData(data)
end

function LootGUI:GetCurrentRoster()
    self.db.selectedRosterUid = self.RosterSelectorDropDown:GetValue()
    return RosterManager:GetRosterByUid(self.db.selectedRosterUid)
end

function LootGUI:GetCurrentProfile()
    return ProfileManager:GetProfileByName(self.ProfileSelectorDropDown:GetValue())
end

function LootGUI:RefreshRosters()
    LOG:Trace("LootGUI:RefreshRosters()")
    local rosters = RosterManager:GetRosters()
    local rosterUidMap = {}
    local rosterList = {}
    local positionOfSavedRoster = 1
    local n = 1
    for name, roster in pairs(rosters) do
        rosterUidMap[roster:UID()] = name
        rosterList[n] = roster:UID()
        if roster:UID() == self.db.selectedRosterUid then
            positionOfSavedRoster = n
        end
        n = n + 1
    end
    self.RosterSelectorDropDown:SetList(rosterUidMap, rosterList)
    if not self.RosterSelectorDropDown:GetValue() then
        if #rosterList > 0 then
            self.RosterSelectorDropDown:SetValue(rosterList[positionOfSavedRoster])
        end
    end
end

function LootGUI:RefreshProfiles()
    LOG:Trace("LootGUI:RefreshProfiles()")
    local roster = self:GetCurrentRoster()
    if not roster then return end
    local profiles = roster:Profiles()
    local profileNameMap = { [CLM.L["-- Raid Loot --"]] = CLM.L["-- Raid Loot --"]}
    local profileList = {CLM.L["-- Raid Loot --"]}
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
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function LootGUI:RegisterSlash()
    local options = {
        loot = {
            type = "execute",
            name = CLM.L["Standings"],
            desc = CLM.L["Toggle loot window display"],
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

function LootGUI:Reset()
    LOG:Trace("LootGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

GUI.Loot = LootGUI