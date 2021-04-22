local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager

local StandingsGUI = {}
function StandingsGUI:Initialize()
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    self:Refresh()
    self.selectedRoster = 0
end

function StandingsGUI:Create()
    LOG:Trace("StandingsGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Rosters")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0} })
    f:EnableResize(false)
    f:SetWidth(700)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Rosters_GUI")
    -- Profile Scrolling Table
    local columns = {
        {name = "Name",  width = 100},
        {name = "Class", width = 100},
        {name = "Spec",  width = 100},
        {name = "DKP",   width = 100}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetPoint("TOP", f.frame, "TOP", 0, 0)
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(400)
    StandingsGroup:SetWidth(450)
    -- Roster selector
    local RosterSelectorDropDown = AceGUI:Create("Dropdown")
    RosterSelectorDropDown:SetLabel("Select roster")
    RosterSelectorDropDown:SetCallback("OnValueChanged", function() self:Refresh() end)
    self.RosterSelectorDropDown = RosterSelectorDropDown
    StandingsGroup:AddChild(RosterSelectorDropDown)

    self.st = ScrollingTable:CreateST(columns, 25, 15, nil, StandingsGroup.frame, true)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", RosterSelectorDropDown.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)
    local OnClickHandler = (function(rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        return status
    end)
    self.st:RegisterEvents({
        OnClick = OnClickHandler
    })
    f:AddChild(StandingsGroup)

    -- Management options
    local ManagementOptions = AceGUI:Create("SimpleGroup")
    ManagementOptions:SetLayout("Flow")
    ManagementOptions:SetHeight(350)
    ManagementOptions:SetWidth(200)
    f:AddChild(ManagementOptions)

    -- Management options: Award DKP
    local PointManagementGroup = AceGUI:Create("InlineGroup")
    PointManagementGroup:SetLayout("Flow")
    PointManagementGroup:SetTitle("Manage points")

    local AwardValueEditBox = AceGUI:Create("EditBox")
    AwardValueEditBox:SetMaxLetters(10)
    AwardValueEditBox:SetText("")
    AwardValueEditBox:SetLabel("Value")
    PointManagementGroup:AddChild(AwardValueEditBox)

    local AwardValueButton = AceGUI:Create("Button")
    AwardValueButton:SetText("Decay")
    AwardValueButton:SetCallback("OnClick", (function()
        self:Refresh()
    end))
    PointManagementGroup:AddChild(AwardValueButton)
    ManagementOptions:AddChild(PointManagementGroup)
    -- Management options: Decay

    local DecayPercentageValueEditBox = AceGUI:Create("EditBox")
    DecayPercentageValueEditBox:SetMaxLetters(3)
    DecayPercentageValueEditBox:SetText("60")
    DecayPercentageValueEditBox:SetLabel("Decay %")
    PointManagementGroup:AddChild(DecayPercentageValueEditBox)

    local DecayPercentageButton = AceGUI:Create("Button")
    DecayPercentageButton:SetText("Decay")
    DecayPercentageButton:SetCallback("OnClick", (function()
        self:Refresh()
    end))
    PointManagementGroup:AddChild(DecayPercentageButton)
    ManagementOptions:AddChild(PointManagementGroup)
    -- Hide by default
    f:Hide()
end

function StandingsGUI:Refresh()
    LOG:Trace("StandingsGUI:Refresh()")
    if not self._initialized then return end
    self:RefreshRosters()

    local roster = RosterManager:GetRosterByUid(self.RosterSelectorDropDown:GetValue())
    if roster == nil then return end

    local data = {}
    for GUID,value in pairs(roster:Standings()) do
        local profile = ProfileManager:GetProfileByGuid(GUID)
        if profile ~= nil then
            local row = {cols = {}}
            table.insert(row.cols, {value = profile:Name()})
            table.insert(row.cols, {value = UTILS.ColorCodeClass(profile:Class())})
            table.insert(row.cols, {value = profile:Spec()})
            table.insert(row.cols, {value = value})
            table.insert(data, row)
        end
    end

    self.st:SetData(data)
end

function StandingsGUI:RefreshRosters()
    LOG:Trace("StandingsGUI:RefreshRosters()")
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


function StandingsGUI:Toggle()
    LOG:Trace("StandingsGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function StandingsGUI:RegisterSlash()
    local options = {
        rosters = {
            type = "execute",
            name = "Standings",
            desc = "Toggle standigns window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.DKPStandings = StandingsGUI