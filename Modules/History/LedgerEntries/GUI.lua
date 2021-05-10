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

local ProfileManager = MODULES.ProfileManager
-- local RosterManager = MODULES.RosterManager
-- local PointManager = MODULES.PointManager
-- local LedgerManager = MODULES.LedgerManager

local LedgerHistoryGUI = {}
function LedgerHistoryGUI:Initialize()
    self:Create()
    self:RegisterSlash()
    self._initialized = true
end

-- local function GenerateUntrustedOptions(self)
--     return {}
-- end

-- local function GenerateManagerOptions(self)
--     return {}
-- end

-- local function GenerateOfficerOptions(self)
--     return {}
-- end

local function CreateManagementOptions(self, container)
    local ManagementOptions = AceGUI:Create("SimpleGroup")
    ManagementOptions:SetLayout("Flow")
    ManagementOptions:SetWidth(200)

    return ManagementOptions
end

local function CreateHistoryDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = "Num",  width = 100},
        {name = "UUID",  width = 200},
        {name = "Time", width = 150},
        {name = "Type",  width = 75},
        {name = "Author",   width = 100}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(400)
    StandingsGroup:SetWidth(650)
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 25, 15, nil, StandingsGroup.frame, true)
    -- self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", StandingsGroup.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    return StandingsGroup
end

function LedgerHistoryGUI:Create()
    LOG:Trace("LedgerHistoryGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Ledger Entries Inspection")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(900)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Ledger_Entries_Inspection_GUI")

    f:AddChild(CreateHistoryDisplay(self))
    f:AddChild(CreateManagementOptions(self))

    -- Hide by default
    f:Hide()
end

local function GetEntryInfo(entry)
    local entryId = entry:uuid()
    local entryTime = date("%d/%m/%Y %H:%M:%S", entry:time())
    local entryType = entry:class()
    local profile = ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(entry:creator()))
    local entryAuthor
    if profile == nil then
        entryAuthor = "UNKNOWN"
    else
        entryAuthor = profile:Name()
    end
    return entryId, entryTime, entryType, entryAuthor
end

function LedgerHistoryGUI:Refresh()
    LOG:Trace("LedgerHistoryGUI:Refresh()")
    if not self._initialized then return end

    local data = {}
    for i,entry in ipairs(MODULES.Database:Ledger()) do
        -- entry
        local entryId, entryTime, entryType, entryAuthor = GetEntryInfo(entry)
        -- table
        local row = {cols = {}}
        table.insert(row.cols, {value = i})
        table.insert(row.cols, {value = entryId})
        table.insert(row.cols, {value = entryTime})
        table.insert(row.cols, {value = entryType})
        table.insert(row.cols, {value = entryAuthor})
        table.insert(data, row)
    end

    self.st:SetData(data)
end


function LedgerHistoryGUI:Toggle()
    LOG:Trace("LedgerHistoryGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function LedgerHistoryGUI:RegisterSlash()
    local options = {
        inspect = {
            type = "execute",
            name = "Inspect",
            desc = "Toggle ledgerentries inspection window",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.LedgerHistory = LedgerHistoryGUI