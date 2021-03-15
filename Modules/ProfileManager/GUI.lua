local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULE = CLM.MODULE
local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI
local ProfileManager = MODULE.ProfileManager

local ProfileManagerGUI =  { _initialized = false }

function ProfileManagerGUI:Initialize()
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    self:Refresh()
    self.selected = ""
end

function ProfileManagerGUI:Create()
    LOG:Info("ProfileManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Profiles")
    f:SetStatusText("")
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
    local OnClickHandler = (function(rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local selected = self.st:GetRow(self.st:GetSelection())
        if type(selected) ~= "table" then return end
        if selected.cols == nil then return end -- Handle column titles click
        selected = selected.cols[1].value
        if self.selected == "" then
            self.selected = selected
            self.top:SetStatusText("Click on a profile to mark it as alt of " .. selected)
        else
            local main = self.selected
            local alt = selected
            local result = MODULE.ProfileManager:MarkAsAltByNames(main, alt)
            self.selected = ""
            if result == RESULTS.SUCCESS then
                self.top:SetStatusText("Marked " .. main .. " as main of " .. alt)
            elseif result == RESULTS.SUCCESS_EXTENDED then
                self.top:SetStatusText("Removed link from " .. alt)
            else
                self.top:SetStatusText("")
            end
            self:Refresh()
        end
    end)
    self.st:RegisterEvents({
        OnClick = OnClickHandler
    })
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
        self:Refresh()
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
        self:Refresh()
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
        self:Refresh()
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
        ProfileManager:WipeAll()
        self:Refresh()
    end))

    -- -- Management options: SetMain
    -- local WipeProfilesGroup = AceGUI:Create("InlineGroup")
    -- WipeProfilesGroup:SetLayout("Flow")
    -- WipeProfilesGroup:SetTitle("Connect alts")

    -- local WipeProfilesButton = AceGUI:Create("Button")
    -- WipeProfilesButton:SetText("Set")
    -- WipeProfilesButton:SetCallback("OnClick", (function()
    --     if self.selected == "" then
    --         local selected = self.st:GetRow(self.st:GetSelection());
    --         self.selected = selected[0]
    --         self.top:SetStatusText("Setting ")
    --     else
    --         self.selected
    --     end
    -- end))

    WipeProfilesGroup:AddChild(WipeProfilesButton)
    ManagementOptions:AddChild(WipeProfilesGroup)

    f:AddChild(ManagementOptions)
    -- Hide by default
    f:Hide()
end

function ProfileManagerGUI:Refresh()
    LOG:Info("ProfileManagerGUI:Refresh()")
    if not self._initialized then return end

    local data = {}
    local profiles = ProfileManager:GetProfiles()
    for _,object in pairs(profiles) do
        local row = {cols = {}}
        table.insert(row.cols, {value = object:Name()})
        table.insert(row.cols, {value = UTILS.ColorCodeClass(object:Class())})
        table.insert(row.cols, {value = object:Spec()})
        local profile = ProfileManager:GetProfileByGuid(object:Main())
        local main
        if profile ~= nil then
            main = profile:Name()
        else
            main = ""
        end
        table.insert(row.cols, {value = main})
        table.insert(data, row)
    end

    self.st:SetData(data)

    self.FillFromGuildButton:SetDisabled(not IsInGuild())
    self.FillFromRaidButton:SetDisabled(not IsInRaid())
end

function ProfileManagerGUI:Toggle()
    LOG:Info("ProfileManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
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