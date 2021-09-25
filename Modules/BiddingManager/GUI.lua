local  _, CLM = ...

-- Libs
-- local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")
local LibCandyBar = LibStub("LibCandyBar-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}


local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
-- local MODELS = CLM.MODELS
-- local CONSTANTS = CLM.CONSTANTS
local GUI = CLM.GUI

local BiddingManager = MODULES.BiddingManager
local EventManager = MODULES.EventManager

local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager

local mergeDictsInline = UTILS.mergeDictsInline

whoamiGUID = UTILS.whoamiGUID

local guiOptions = {
    type = "group",
    args = {}
}

local REGISTRY = "clm_bidding_manager_gui_options"

local function UpdateOptions(self)
    for k,_ in pairs(guiOptions.args) do
        guiOptions.args[k] = nil
    end
    mergeDictsInline(guiOptions.args, self:GenerateAuctionOptions())
end

local function CreateOptions(self)
    local OptionsGroup = AceGUI:Create("SimpleGroup")
    OptionsGroup:SetLayout("Flow")
    OptionsGroup:SetWidth(505)
    self.OptionsGroup = OptionsGroup
    UpdateOptions(self)
    LIBS.registry:RegisterOptionsTable(REGISTRY, guiOptions)
    LIBS.gui:Open(REGISTRY, OptionsGroup)

    return OptionsGroup
end

local BiddingManagerGUI = {}

local function InitializeDB(self)
    local db = MODULES.Database:GUI()
    if not db.bidding then
        db.bidding = { }
    end
    self.db = db.bidding
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

function BiddingManagerGUI:Initialize()
    LOG:Trace("BiddingManagerGUI:Initialize()")
    InitializeDB(self)
    EventManager:RegisterEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    self:RegisterSlash()
    self._initialized = true
end

function BiddingManagerGUI:GenerateAuctionOptions()
    local itemId = 0
    local icon = "Interface\\Icons\\INV_Misc_QuestionMark"
    local itemLink = self.auctionInfo and self.auctionInfo:ItemLink() or nil
    if itemLink then
        itemId, _, _, _, icon = GetItemInfoInstant(self.auctionInfo:ItemLink())
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
            get = (function(i) return itemLink or "" end),
            set = (function(i,v) end), -- Intentionally: do not override
            width = 2,
            order = 2,
            itemLink = "item:" .. tostring(itemId),
        },
        bid_value = {
            name = "Bid value",
            desc = "Value you want to bid. Press Enter or click Okay button to accept.",
            type = "input",
            set = (function(i,v) self.bid = tonumber(v) or 0 end),
            get = (function(i) return tostring(self.bid) end),
            width = 0.5,
            order = 3
        },
        base = {
            name = "Base",
            desc = "Immediately bid base item value.",
            type = "execute",
            func = (function()
                self.bid = self.auctionInfo and self.auctionInfo:Base() or 0
                BiddingManager:Bid(self.bid)
            end),
            width = 0.45,
            order = 5
        },
        max = {
            name = "Max",
            desc = "Immediately bid max item value.",
            type = "execute",
            func = (function()
                self.bid = self.auctionInfo and self.auctionInfo:Max() or 0
                BiddingManager:Bid(self.bid)
            end),
            width = 0.45,
            order = 6
        },
        bid = {
            name = "Bid",
            desc = "Bid input value.",
            type = "execute",
            func = (function() BiddingManager:Bid(self.bid) end),
            width = 0.45,
            order = 4
        },
        cancel = {
            name = "Cancel",
            desc = "Cancel your bid.",
            type = "execute",
            func = (function() BiddingManager:CancelBid() end),
            width = 0.45,
            order = 7
        },
        pass = {
            name = "Pass",
            desc = "Notify that you are passing on the item. Cancels any existing bids.",
            type = "execute",
            func = (function() BiddingManager:NotifyPass() end),
            width = 0.45,
            order = 8
        }
    }
end

function BiddingManagerGUI:Create()
    LOG:Trace("BiddingManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Bidding")
    f:SetStatusText("")
    f:SetLayout("flow")
    f:EnableResize(false)
    f:SetWidth(505)
    f:SetHeight(175)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Bidding_GUI")
    self.bid = 0
    self.barPreviousPercentageLeft = 1
    self.duration = 1
    f:AddChild(CreateOptions(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function BiddingManagerGUI:UpdateCurrentBidValue(value)
    self.bid = tonumber(value or 0)
    self:Refresh(true)
end

function BiddingManagerGUI:RecolorBar()
    local currentPercentageLeft = (self.bar.remaining / self.duration)
    local percentageChange = self.barPreviousPercentageLeft - currentPercentageLeft
    if percentageChange >= 0.05 or percentageChange < 0 then
        if (currentPercentageLeft >= 0.5) then
            self.bar:SetColor(0, 0.80, 0, 1) -- green
        elseif (currentPercentageLeft >= 0.2) then
            self.bar:SetColor(0.92, 0.70, 0.20, 1) -- gold
        else
            self.bar:SetColor(0.8, 0, 0, 1) -- red
        end
        self.barPreviousPercentageLeft = currentPercentageLeft
    end
end

function BiddingManagerGUI:BuildBar(duration)
    LOG:Trace("BiddingManagerGUI:BuildBar()")
    self.bar = LibCandyBar:New("Interface\\AddOns\\ClassicLootManager\\Media\\Bars\\AceBarFrames.tga", 435, 25)
    local note = ""
    if self.auctionInfo:Note():len() > 0 then
        note = "(" .. self.auctionInfo:Note() .. ")"
    end
    self.bar:SetLabel(self.auctionInfo:ItemLink() .. " " .. note)
    self.bar:SetDuration(duration)
    local _, _, _, _, icon = GetItemInfoInstant(self.auctionInfo:ItemLink())
    self.bar:SetIcon(icon)

    self.bar:AddUpdateFunction(function()
        self:RecolorBar()
    end);
    self.bar:SetColor(0, 0.80, 0, 1)
    -- self.bar:SetParent(self.top.frame) -- makes the bar disappear
    self.bar:SetPoint("CENTER", self.top.frame, "TOP", 0, 25)
    self.bar:Start(self.auctionInfo:Time())
end

function BiddingManagerGUI:StartAuction(show, auctionInfo)
    LOG:Trace("BiddingManagerGUI:StartAuction()")
    self.auctionInfo = auctionInfo
    local duration = self.auctionInfo:EndTime() - GetServerTime()
    if duration < 0 then return end
    self.duration = duration
    self:BuildBar(duration)

    local hasBase = (self.auctionInfo:Base() > 0)
    local hasMax = (self.auctionInfo:Max() > 0)

    local statusText = ""
    local separatorAdded = true
    local myProfile = ProfileManager:GetMyProfile()
    if myProfile then
        local roster = RosterManager:GetRosterByUid(self.auctionInfo:RosterUid())
        if roster then
            if roster:IsProfileInRoster(myProfile:GUID()) then
                local standings = roster:Standings(myProfile:GUID())
                statusText = standings .. " DKP "
                if hasBase or hasMax then
                    statusText = statusText .. " >>> "
                end
            end
        end
    end

    if hasBase then
        statusText = statusText .. "Base: " .. self.auctionInfo:Base() .. " "
        self.bid = self.auctionInfo:Base()
    end
    if hasMax then
        statusText = statusText .. "Max: " .. self.auctionInfo:Max() .. " "
    end
    if self.auctionInfo:Note():len() > 0 then
        statusText = statusText .. "(" .. self.auctionInfo:Note() .. ")"
    end
    self.top:SetStatusText(statusText)
    if show then
        self:Refresh()
        self.top.frame:Show()
    end
end

function BiddingManagerGUI:EndAuction()
    LOG:Trace("BiddingManagerGUI:EndAuction()")
    if self.bar.running then
        self.bar:Stop()
    end
    self.top:SetStatusText("")
    self.bar = nil
    self.barPreviousPercentageLeft = 1
    self.duration = 1
    self.top.frame:Hide()
end

function BiddingManagerGUI:AntiSnipe()
    self.bar.exp = (self.bar.exp + self.auctionInfo:AntiSnipe()) -- trick to extend bar
end

function BiddingManagerGUI:Refresh()
    LOG:Trace("BiddingManagerGUI:Refresh()")
    if not self._initialized then return end

    UpdateOptions(self)
    LIBS.registry:NotifyChange(REGISTRY)
    LIBS.gui:Open(REGISTRY, self.OptionsGroup) -- Refresh the config gui panel
end

function BiddingManagerGUI:Toggle()
    LOG:Trace("BiddingManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function BiddingManagerGUI:RegisterSlash()
    local options = {
        bid = {
            type = "execute",
            name = "Bidding",
            desc = "Toggle Bidding window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end


GUI.BiddingManager = BiddingManagerGUI