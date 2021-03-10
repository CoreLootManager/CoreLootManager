local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULE = CLM.MODULE
local GUI = CLM.GUI
local ProfileManager = MODULE.ProfileManager

local ProfileManagerGUI =  { _initialized = false }

function ProfileManagerGUI:Initialize()
    self:Create()
    ProfileManager.GUI = self
    self:RegisterSlash()
    self._initialized = true
    self:Refresh()
end

function ProfileManagerGUI:Create()
    -- Main Frame
    local f = AceGUI:Create("Frame")
    --f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) end)
    f:SetTitle("Profiles")
    f:SetStatusText("Unknown")
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetWidth(700)
    f:SetHeight(600)
    self.top = f
    -- Profile Scrolling Table
    local columns = {
        {name = "Name",  width = 100},
        {name = "Class", width = 100},
        {name = "Spec",  width = 100},
        {name = "Main",  width = 100}
    }
    local ProfileTableGroup = AceGUI:Create("SimpleGroup")
    ProfileTableGroup:SetLayout("Flow")
    ProfileTableGroup:SetHeight(400)
    ProfileTableGroup:SetWidth(450)
    self.st = ScrollingTable:CreateST(columns, 30, 15, nil, ProfileTableGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOP", ProfileTableGroup.frame, "TOP", 0, -25)
    f:AddChild(ProfileTableGroup)
    -- Management options
    local ManagementOptions = AceGUI:Create("SimpleGroup")
    ManagementOptions:SetLayout("Flow")
    ManagementOptions:SetHeight(400)
    ManagementOptions:SetWidth(200)

    -- Management options: Fill from Guild
    local FillFromGuildGroup = AceGUI:Create("InlineGroup")
    FillFromGuildGroup:SetLayout("Flow")
    FillFromGuildGroup:SetTitle("Fill from Guild Roster")

    local SetMinLevelSlider = AceGUI:Create("Slider")
    SetMinLevelSlider:SetSliderValues(1, 70, 1)
    SetMinLevelSlider:SetValue(60)
    SetMinLevelSlider:SetLabel("Minimum Level")
    FillFromGuildGroup:AddChild(SetMinLevelSlider)

    local FillFromGuildButton = AceGUI:Create("Button")
    FillFromGuildButton:SetText("Fill")
    FillFromGuildButton:SetCallback("OnClick", (function()
        ProfileManager:FillFromGuild(nil, SetMinLevelSlider:GetValue())
    end))
    FillFromGuildButton:SetDisabled(not IsInGuild())
    self.FillFromGuildButton = FillFromGuildButton
    FillFromGuildGroup:AddChild(FillFromGuildButton)
    ManagementOptions:AddChild(FillFromGuildGroup)

    -- Management options: Fill from Raid
    local FillFromRaidGroup = AceGUI:Create("InlineGroup")
    FillFromRaidGroup:SetLayout("Flow")
    FillFromRaidGroup:SetTitle("Fill from Raid Roster")

    local FillFromRaidButton = AceGUI:Create("Button")
    FillFromRaidButton:SetText("Fill")
    FillFromRaidButton:SetCallback("OnClick", (function()
        ProfileManager:FillFromRaid()
    end))
    FillFromRaidButton:SetDisabled(not IsInRaid())
    self.FillFromRaidButton = FillFromRaidButton
    FillFromRaidGroup:AddChild(FillFromRaidButton)
    ManagementOptions:AddChild(FillFromRaidGroup)

    -- Management options: Add Target
    local AddTargetGroup = AceGUI:Create("InlineGroup")
    AddTargetGroup:SetLayout("Flow")
    AddTargetGroup:SetTitle("Add target")

    local AddTargetButton = AceGUI:Create("Button")
    AddTargetButton:SetText("Add")
    AddTargetButton:SetCallback("OnClick", (function()
        ProfileManager:AddTarget()
    end))

    AddTargetGroup:AddChild(AddTargetButton)
    ManagementOptions:AddChild(AddTargetGroup)

    -- Management options: Wipe
    local WipeProfilesGroup = AceGUI:Create("InlineGroup")
    WipeProfilesGroup:SetLayout("Flow")
    WipeProfilesGroup:SetTitle("Wipe Profiles")

    local WipeProfilesButton = AceGUI:Create("Button")
    WipeProfilesButton:SetText("Wipe")
    WipeProfilesButton:SetCallback("OnClick", (function()
        ProfileManager:Wipe()
    end))

    WipeProfilesGroup:AddChild(WipeProfilesButton)
    ManagementOptions:AddChild(WipeProfilesGroup)

    f:AddChild(ManagementOptions)
    -- Hide by default
    --f:Hide()
end

function ProfileManagerGUI:Refresh()
    LOG:Info("ProfileManagerGUI:Refresh()")
    if not self._initialized then return end

    local profiles = {}
    for _,object in pairs(ProfileManager.db.data) do
        local profile = {cols = {}}
        table.insert(profile.cols, {value = object.name})
        table.insert(profile.cols, {value = UTILS.ColorCodeClass(object.class)})
        table.insert(profile.cols, {value = object.spec or "Unknown"})
        table.insert(profile.cols, {value = object.main or ""})
        table.insert(profiles, profile)
    end

    self.st:SetData(profiles)

    self.FillFromGuildButton:SetDisabled(not IsInGuild())
    self.FillFromRaidButton:SetDisabled(not IsInRaid())
end

function ProfileManagerGUI:Toggle()
    LOG:Info("ProfileManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self.top.frame:Show()
    end
end

function ProfileManagerGUI:RegisterSlash()
    local options = {
        profiles = {
            type = "execute",
            name = "Profiles",
            desc = "Toggle Profiles window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULE.ConfigManager:RegisterSlash(options)
end

GUI.ProfileManager = ProfileManagerGUI