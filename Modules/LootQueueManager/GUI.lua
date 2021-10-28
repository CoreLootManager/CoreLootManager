local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline
local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

local ACL = MODULES.ACL
local GuildInfoListener = MODULES.GuildInfoListener
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local LedgerManager = MODULES.LedgerManager
local EventManager = MODULES.EventManager
local LootQueueManager = MODULES.LootQueueManager

local REGISTRY = "clm_lootqueue_gui_options"

local LootQueueGUI = {}

local function InitializeDB(self)
    local db = MODULES.Database:GUI()
    if not db.lootQueue then
        db.lootQueue = { }
    end
    self.db = db.lootQueue
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

function LootQueueGUI:Initialize()
    LOG:Trace("LootQueueGUI:Initialize()")
    InitializeDB(self)
    self:Create()
    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:RegisterSlash()
    self._initialized = true
end

local ROW_HEIGHT = 18
local MIN_HEIGHT = 105

local function CreateLootDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = "",  width = 200},
    }
    local LootQueueGroup = AceGUI:Create("SimpleGroup")
    LootQueueGroup:SetLayout("Flow")
    LootQueueGroup:SetWidth(265)
    LootQueueGroup:SetHeight(MIN_HEIGHT)
    self.LootQueueGroup = LootQueueGroup
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 1, ROW_HEIGHT, nil, LootQueueGroup.frame, true)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", LootQueueGroup.frame, "TOPLEFT", 0, 0)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    return LootQueueGroup
end

function LootQueueGUI:Create()
    LOG:Trace("LootQueueGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Loot Queue")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(265)
    f:SetHeight(MIN_HEIGHT)
    self.top = f

    f:AddChild(CreateLootDisplay(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function LootQueueGUI:Refresh(visible)
    LOG:Trace("LootQueueGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top.frame:IsVisible() then return end
    
    local data = {}
    local rowId = 1
    local queue = LootQueueManager:GetQueue()
    if #queue > 0 then
        for seq, item in ipairs(queue) do
            local row = {
                cols = {
                    { value = item.link },
                    { value = item.id },
                    { value = seq }
                }
            }
            data[rowId] = row
            rowId = rowId + 1
        end

        local rows = (#queue < 10) and #queue or 10
        local height = MIN_HEIGHT + ROW_HEIGHT*(rows-1)
        local _, _, point, x, y = self.top:GetPoint()
        self.top:SetHeight(height)
        self.LootQueueGroup:SetHeight(height)
        self.st:SetDisplayRows(rows, ROW_HEIGHT)
        if #queue > 1 then
            self.top:SetPoint(point, x, y - ROW_HEIGHT/2) -- fakes growing down instead of omnidirectional
        end
    end
    self.st:SetData(data)
end

function LootQueueGUI:Toggle()
    LOG:Trace("LootQueueGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function LootQueueGUI:RegisterSlash()
    local options = {
        queue = {
            type = "execute",
            name = "Loot Queue",
            desc = "Toggle Loot Queue window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.LootQueue = LootQueueGUI