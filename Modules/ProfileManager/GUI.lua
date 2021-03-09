local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable");
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
    self._initialized = true
end

function ProfileManagerGUI:Create()
    local f = AceGUI:Create("Frame")
    f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) end)
    f:SetTitle("Profiles")
    f:SetStatusText("Unknown")
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetWidth(400)
    f:SetHeight(600)
    local columns = {
        {name = "Name", width = 100},
        {name = "Class", width = 100},
        {name = "Spec", width = 100}
    }
    self.top = f
    self.st = ScrollingTable:CreateST(columns, 30, 15, nil, f.frame)
    self.st:EnableSelection(true)
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
        table.insert(profiles, profile)
    end

    self.st:SetData(profiles)
end

GUI.ProfileManager = ProfileManagerGUI