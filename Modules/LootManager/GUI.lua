local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

-- local LIBS =  {
--     registry = LibStub("AceConfigRegistry-3.0-CLM"),
--     gui = LibStub("AceConfigDialog-3.0-CLM")
-- }

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
-- local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

-- local mergeDictsInline = UTILS.mergeDictsInline
-- local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
-- local PointManager = MODULES.PointManager
local LedgerManager = MODULES.LedgerManager

local LootGUI = {}
function LootGUI:Initialize()
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    self.selectedRoster = 0
    LedgerManager:RegisterOnUpdate(function(lag, uncommited)
        if lag ~= 0 or uncommited ~= 0 then return end
        self:Refresh()
    end)

end

local function CreateLootDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = "Item",  width = 100},
        {name = "Date", width = 100},
        {name = "Value",  width = 100},
        {name = "Player",   width = 100}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(500)
    StandingsGroup:SetWidth(440)
    -- Roster selector
    local RosterSelectorDropDown = AceGUI:Create("Dropdown")
    RosterSelectorDropDown:SetLabel("Select roster")
    RosterSelectorDropDown:SetCallback("OnValueChanged", function() self:Refresh() end)
    self.RosterSelectorDropDown = RosterSelectorDropDown
    StandingsGroup:AddChild(RosterSelectorDropDown)
    -- Profile selector
    local ProfileSelectorDropDown = AceGUI:Create("Dropdown")
    ProfileSelectorDropDown:SetLabel("Select roster")
    ProfileSelectorDropDown:SetCallback("OnValueChanged", function() self:Refresh() end)
    self.ProfileSelectorDropDown = ProfileSelectorDropDown
    StandingsGroup:AddChild(ProfileSelectorDropDown)
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 25, 18, nil, StandingsGroup.frame, true)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", RosterSelectorDropDown.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    return StandingsGroup
end

function LootGUI:Create()
    LOG:Trace("LootGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Rosters")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(450)
    f:SetHeight(505)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Loot_GUI")

    f:AddChild(CreateLootDisplay(self))

    -- Hide by default
    f:Hide()
end

function LootGUI:Refresh()
    LOG:Trace("LootGUI:Refresh()")
    if not self._initialized then return end
    self.st:ClearSelection()
    self:RefreshRosters()
    self:RefreshProfiles()

    local roster = self:GetCurrentRoster()
    if roster == nil then return end
    local profile = self:GetCurrentProfile()


    -- local data = {}
    -- for GUID,value in pairs(roster:Standings()) do
    --     local profile = ProfileManager:GetProfileByGUID(GUID)
    --     if profile ~= nil then
    --         local row = {cols = {}}
    --         table.insert(row.cols, {value = profile:Name()})
    --         table.insert(row.cols, {value = UTILS.ColorCodeClass(profile:Class())})
    --         table.insert(row.cols, {value = profile:Spec()})
    --         table.insert(row.cols, {value = value})
    --         table.insert(data, row)
    --     end
    -- end

    -- self.st:SetData(data)
end

function LootGUI:GetCurrentRoster()
    return RosterManager:GetRosterByUid(self.RosterSelectorDropDown:GetValue())
end

function LootGUI:GetCurrentProfile()
    return ProfileManager:GetProfileByGUID(self.ProfileSelectorDropDown:GetValue())
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
    local profiles = roster:Profiles()
    local profileGUIDmap = {}
    local profileList = {}
    for _, GUID in ipairs(profiles) do
        local profile = ProfileManager:GetProfileByGUID(GUID)
        profileGUIDmap[GUID] = profile:Name()
        table.insert(profileList, GUID)
    end
    self.ProfileSelectorDropDown:SetList(profileGUIDmap, profileList)
    if not self.ProfileSelectorDropDown:GetValue() then
        if #profileList > 0 then
            self.ProfileSelectorDropDown:SetValue(profileList[1])
        end
    end
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