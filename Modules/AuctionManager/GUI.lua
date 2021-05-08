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
local MODELS = CLM.MODELS
-- local CONSTANTS = CLM.CONSTANTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline

-- local RosterManager = MODULES.RosterManager
local AuctionManager = MODULES.AuctionManager
local ProfileManager = MODULES.ProfileManager
local RaidManager = MODULES.RaidManager

local RosterConfiguration = MODELS.RosterConfiguration

local REGISTRY = "clm_auction_manager_gui_options"

local guiOptions = {
    type = "group",
    args = {}
}

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
        {name = "Name",     width = 70},
        {name = "Class",    width = 60},
        {name = "Spec",     width = 60},
        {name = "Bid",      width = 60},
        {name = "Current",  width = 60},
    }
    self.st = ScrollingTable:CreateST(columns, 10, 18, nil, BidWindowGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", BidWindowGroup.frame, "TOPLEFT", 0, -25)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    --- selection ---
    local OnClickHandler = (function(rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local selected = self.st:GetRow(self.st:GetSelection())
        if type(selected) ~= "table" then return false end
        if selected.cols == nil then return false end -- Handle column titles click
        -- selected = selected.cols[1].value
        if not self.countClicks then
            self.countClicks = 0
        end
        self.countClicks = self.countClicks + 1
        self.top:SetStatusText(tostring(self.countClicks))
        return selected
    end)
    self.st:RegisterEvents({
        OnClick = OnClickHandler
    })
    --- --- ---

    return BidWindowGroup
end

local function UpdateOptions(self)
    for k,_ in pairs(guiOptions.args) do
        guiOptions.args[k] = nil
    end
    mergeDictsInline(guiOptions.args, self:GenerateAuctionOptions())
end

local function CreateOptions(self)
    local OptionsGroup = AceGUI:Create("SimpleGroup")
    OptionsGroup:SetLayout("Flow")
    OptionsGroup:SetWidth(375)
    self.OptionsGroup = OptionsGroup
    UpdateOptions(self)
    LIBS.registry:RegisterOptionsTable(REGISTRY, guiOptions)
    LIBS.gui:Open(REGISTRY, OptionsGroup)

    return OptionsGroup
end

function AuctionManagerGUI:GenerateAuctionOptions()
    local icon = "Interface\\Icons\\INV_Misc_QuestionMark"
    if self.itemLink then
        self.itemId, _, _, self.itemEquipLoc, icon = GetItemInfoInstant(self.itemLink)
    end

    if not self.note then self.note = "" end
    if not self.base then self.base = 0 end
    if not self.max then self.max = 0 end

    if RaidManager:IsRaidInProgress() then
        self.roster = RaidManager:GetRoster()
        if self.roster then
            self.configuration:Copy(self.roster.configuration)
            if false then -- if item override exists -> not yet implemented
            else -- else default slot value
                local v = self.roster:GetDefaultSlotValue(self.itemEquipLoc)
                self.base = v.base
                self.max = v.max
            end
        end
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
            name = "Item",
            type = "input",
            get = (function(i)
                return self.itemLink or ""
            end),
            set = (function(i,v)
                if v and GetItemInfoInstant(v) then -- validate if it is an itemLink or itemString or itemId
                    self.itemLink = v
                else
                    self.itemLink = nil
                end
                self:Refresh()
            end),
            disabled = (function() return AuctionManager:IsAuctionInProgress() end),
            width = 1.5,
            order = 2,
            itemLink = "item:" .. tostring(self.itemId),
        },
        note_label = {
            name = "Note",
            type = "description",
            width = 0.5,
            order = 3
        },
        note = {
            name = "Note",
            type = "input",
            set = (function(i,v) self.note = tostring(v) end),
            get = (function(i) return self.note end),
            disabled = (function() return AuctionManager:IsAuctionInProgress() end),
            width = 1.5,
            order = 4
        },
        value_label = {
            name = "Value ranges",
            type = "description",
            width = 0.5,
            order = 5
        },
        value_base = {
            name = "Base",
            type = "input",
            set = (function(i,v)
                self.base = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.base) end),
            disabled = (function(i) return AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 6
        },
        value_max = {
            name = "Max",
            type = "input",
            set = (function(i,v)
                self.max = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.max) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 7
        },
        time_label = {
            name = "Time settings",
            type = "description",
            width = 0.5,
            order = 8
        },
        time_auction = {
            name = "Auction length [s]",
            type = "input",
            set = (function(i,v) self.configuration:Set("auctionTime", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("auctionTime")) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 9
        },
        time_antiSnipe = {
            name = "AntiSnipe [s]",
            type = "input",
            set = (function(i,v) self.configuration:Set("antiSnipe", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("antiSnipe")) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 10
        },
        auction = {
            name = (function() return AuctionManager:IsAuctionInProgress() and "Stop" or "Start" end),
            type = "execute",
            func = (function()
                if not AuctionManager:IsAuctionInProgress() then
                    self.st:SetData({})
                    AuctionManager:StartAuction(self.itemId, self.itemLink, self.itemEquipLoc, self.base, self.max, self.note, self.roster, self.configuration)
                else
                    AuctionManager:StopAuctionManual()
                end
            end),
            width = 2.5,
            order = 11,
            disabled = (function() return not (self.itemLink or false) end)
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
            disabled = (function(i) return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end),
            width = 0.75,
            order = 14
        },
        award = {
            name = "Award",
            type = "execute",
            func = (function()

                self:Refresh()
            end),
            width = 0.75,
            order = 15,
            disabled = (function() return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end)
        },
    }
end

function AuctionManagerGUI:Create()
    LOG:Trace("AuctionManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Auctioning")
    f:SetStatusText("")
    f:SetLayout("flow")
    f:EnableResize(false)
    f:SetWidth(375)
    f:SetHeight(625)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Auctioning_GUI")

    self.configuration = RosterConfiguration:New()
    self.itemLink = nil
    self.itemId = 0
    self.note = ""
    self.bids = {}

    f:AddChild(CreateOptions(self))
    f:AddChild(CreateBidWindow(self))

    -- Hide by default
    f:Hide()
end

function AuctionManagerGUI:Refresh()
    LOG:Trace("AuctionManagerGUI:Refresh()")
    if not self._initialized then return end

    if AuctionManager:IsAuctionInProgress() then
        local data = {}
        for name,bid in pairs(AuctionManager:Bids()) do -- todo currently this has names hmmm
            local profile = ProfileManager:GetProfileByName(name)
            if profile then
                local row = {cols = {}}
                table.insert(row.cols, {value = profile:Name()})
                table.insert(row.cols, {value = UTILS.ColorCodeClass(profile:Class())})
                table.insert(row.cols, {value = profile:Spec()})
                table.insert(row.cols, {value = bid})
                table.insert(row.cols, {value = self.roster:Standings(profile:GUID())})
                table.insert(data, row)
            end
        end
        self.st:SetData(data)
    end

    UpdateOptions(self)
    LIBS.registry:NotifyChange(REGISTRY)
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