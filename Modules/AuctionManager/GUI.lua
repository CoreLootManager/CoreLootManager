local  _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0-CLM"),
    gui = LibStub("AceConfigDialog-3.0-CLM")
}

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
-- local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline

-- local RosterManager = MODULES.RosterManager
-- local AuctionManager = MODULES.AuctionManager


local REGISTRY = "clm_auction_manager_gui_options"

local AuctionManagerGUI = {}

function AuctionManagerGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    self:Create()
    self:RegisterSlash()
    self._initialized = true
end

local function CreateBidWindow(self)
    local BidWindowGroup = AceGUI:Create("SimpleGroup")
    BidWindowGroup:SetLayout("Flow")
    local columns = {
        {name = "Name",  width = 95},
        {name = "Class", width = 95},
        {name = "Spec",  width = 95},
        {name = "Bid",   width = 95},
        {name = "Current",   width = 95},
    }
    self.st = ScrollingTable:CreateST(columns, 10, 18, nil, BidWindowGroup.frame, true)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", BidWindowGroup.frame, "TOPLEFT", 0, -25)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)
    return BidWindowGroup
end

local function GenerateAuctionOptions(self)
    local itemID, itemType, itemSubType, itemEquipLoc, icon, itemClassID, itemSubClassID
    if self.link then
        itemID, itemType, itemSubType, itemEquipLoc, icon, itemClassID, itemSubClassID = GetItemInfoInstant(self.link) 
    end
    local button_name = "Start"
    if self.auctionInProgress then
        button_name = "Stop"
    end

    return {
        icon = {
            name = "",
            type = "description",
            image = icon,
            width = 0.5,
            order = 1
        },
        item = {
            name = "Item Link / Id",
            type = "input",
            get = (function(i)
                return self.link
            end),
            set = (function(i,v)
                if v and GetItemInfoInstant(v) then
                    self.link = v
                else 
                    self.link = nil
                end

                self:CreateOptions()
                self:Refresh()
            end),
            width = 1.5,
            order = 2,
            itemLink = "item:" .. tostring(itemID),
        },
        auction = {
            name = button_name,
            type = "execute",
            func = function() self:Refresh() end,
            width = 1,
            order = 3,
            disabled = (function() return not (self.link or false) end)
        },
        note_label = {
            name = "Note",
            type = "description",
            width = 0.5,
            order = 4
        },
        note = {
            name = "Note",
            type = "input",
            set = (function(i,v) end),
            get = (function(i) return end),
            width = 2.5,
            order = 5
        },
        value_label = {
            name = "Value ranges",
            type = "description",
            width = 0.5,
            order = 6
        },
        value_min = {
            name = "Min",
            type = "input",
            set = (function(i,v) end),
            get = (function(i) return end),
            disabled = (function(i) return false end),
            width = 1.25,
            order = 7
        },
        value_max = {
            name = "Max",
            type = "input",
            set = (function(i,v) end),
            get = (function(i) return end),
            disabled = (function(i) return false end),
            width = 1.25,
            order = 8
        },
        time_label = {
            name = "Time settings",
            type = "description",
            width = 0.5,
            order = 9
        },
        time_auction = {
            name = "Auction length [s]",
            type = "input",
            set = (function(i,v) end),
            get = (function(i) return end),
            disabled = (function(i) return false end),
            width = 1.25,
            order = 10
        },
        time_antiSnipe = {
            name = "AntiSnipe [s]",
            type = "input",
            set = (function(i,v) end),
            get = (function(i) return end),
            disabled = (function(i) return false end),
            width = 1.25,
            order = 11
        },
        auction_results = {
            name = "Auction Results",
            type = "header",
            order = 12
        },
        award_label = {
            name = "Award item",
            type = "description",
            width = 0.5,
            order = 13
        },
        award_value = {
            name = "Award value",
            type = "input",
            set = (function(i,v) end),
            get = (function(i) return end),
            disabled = (function(i) return false end),
            width = 1.25,
            order = 14
        },
        award = {
            name = "Award",
            type = "execute",
            func = function() self:Refresh() end,
            width = 1.25,
            order = 15,
            disabled = (function() return not (self.link or false) end)
        },
    }
end

function AuctionManagerGUI:CreateOptions()
    local OptionsGroup = AceGUI:Create("SimpleGroup")
    OptionsGroup:SetLayout("Flow")
    OptionsGroup:SetWidth(550)
    self.OptionsGroup = OptionsGroup
    self.selectedRoster = ""
    local options = {
        type = "group",
        args = {}
    }
    mergeDictsInline(options.args, GenerateAuctionOptions(self))
    LIBS.registry:RegisterOptionsTable(REGISTRY, options)
    LIBS.gui:Open(REGISTRY, OptionsGroup)
end

function AuctionManagerGUI:Create()
    LOG:Trace("AuctionManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Auctioning")
    f:SetStatusText("")
    f:SetLayout("flow")
    f:EnableResize(false)
    f:SetWidth(550)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Auctioning_GUI")
    self:CreateOptions()
    f:AddChild(self.OptionsGroup)
    f:AddChild(CreateBidWindow(self))

    -- Hide by default
    f:Hide()
end

function AuctionManagerGUI:Refresh()
    LOG:Trace("AuctionManagerGUI:Refresh()")
    if not self._initialized then return end

    -- local data = {}
    -- for _,_ in pairs(AuctionManager:Bids()) do
    --     local row = {cols = {}}
    --     table.insert(row.cols, {value = profile:Name()})
    --     table.insert(row.cols, {value = UTILS.ColorCodeClass(profile:Class())})
    --     table.insert(row.cols, {value = profile:Spec()})
    --     table.insert(row.cols, {value = value})
    --     table.insert(row.cols, {value = value})
    --     table.insert(data, row)
    -- end

    -- self.st:SetData(data)

    LIBS.gui:Open(REGISTRY, self.OptionsGroup) -- Refresh the config gui panel
end

function AuctionManagerGUI:Toggle()
    LOG:Trace("AuctionManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function AuctionManagerGUI:RegisterSlash()
    local options = {
        auction = {
            type = "execute",
            name = "Auctioning",
            desc = "Toggle Auctioning window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.AuctionManager = AuctionManagerGUI