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
local IsTooltipTextRed = UTILS.IsTooltipTextRed
local GetItemIdFromLink = UTILS.GetItemIdFromLink
local guiOptions = {
    type = "group",
    args = {}
}

local BASE_WIDTH = 505

local REGISTRY = "clm_bidding_manager_gui_options"

local CUSTOM_BUTTON = {}
CUSTOM_BUTTON.MODE = {
    DISABLED = 1,
    ALL_IN = 2,
    CUSTOM_VALUE = 3
}
CUSTOM_BUTTON.MODES = UTILS.Set(CUSTOM_BUTTON.MODE)
CUSTOM_BUTTON.MODES_GUI = {
    [CUSTOM_BUTTON.MODE.DISABLED] = CLM.L["Disabled"],
    [CUSTOM_BUTTON.MODE.ALL_IN] = CLM.L["All in"],
    [CUSTOM_BUTTON.MODE.CUSTOM_VALUE] = CLM.L["Custom value"]
}

local function GetCustomButtonMode(self)
    return self.db.customButton.mode
end

local function SetCustomButtonMode(self, mode)
    self.db.customButton.mode = CUSTOM_BUTTON.MODES[mode] and mode or CUSTOM_BUTTON.MODE.DISABLED
end

local function GetCustomButtonValue(self)
    return self.db.customButton.value
end

local function SetCustomButtonValue(self, value)
    self.db.customButton.value = tonumber(value) or 1
end

local function UpdateOptions(self)
    for k,_ in pairs(guiOptions.args) do
        guiOptions.args[k] = nil
    end
    mergeDictsInline(guiOptions.args, self:GenerateAuctionOptions())
    if GetCustomButtonMode(self) == CUSTOM_BUTTON.MODE.ALL_IN then
        mergeDictsInline(guiOptions.args, {
            custom = {
                name = CLM.L["All In"],
                desc = string.format(CLM.L["Bid your current DKP (%s)."], tostring(self.standings)),
                type = "execute",
                func = (function()
                    self.bid = self.standings
                    BiddingManager:Bid(self.bid)
                end),
                width = 0.43,
                order = 9
            }
        })
        guiOptions.args.item.width = 2.3
        self.top:SetWidth(BASE_WIDTH + 65)
        self.OptionsGroup:SetWidth(BASE_WIDTH + 65)
    elseif GetCustomButtonMode(self) == CUSTOM_BUTTON.MODE.CUSTOM_VALUE then
        local value = GetCustomButtonValue(self)
        mergeDictsInline(guiOptions.args, {
            custom = {
                name = tostring(value),
                desc = CLM.L["Bid your preset value."],
                type = "execute",
                func = (function()
                    self.bid = value
                    BiddingManager:Bid(self.bid)
                end),
                width = 0.43,
                order = 9
            }
        })
        guiOptions.args.item.width = 2.3
        self.top:SetWidth(BASE_WIDTH + 65)
        self.OptionsGroup:SetWidth(BASE_WIDTH + 65)
    else
        guiOptions.args.item.width = 2.15
        self.top:SetWidth(BASE_WIDTH)
        self.OptionsGroup:SetWidth(BASE_WIDTH)
    end
end

local function CreateOptions(self)
    local OptionsGroup = AceGUI:Create("SimpleGroup")
    OptionsGroup:SetLayout("Flow")
    OptionsGroup:SetWidth(BASE_WIDTH)
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
    if not self.db.customButton then
        self.db.customButton = {
            mode = CUSTOM_BUTTON.MODE.DISABLED,
            value = 1,
        }
    end
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

local function CreateConfigs(self)
    local options = {
        bidding_header = {
            type = "header",
            name = CLM.L["Logging"],
            order = 90
        },
        bidding_mode = {
            name = CLM.L["Custom button mode"],
            desc = CLM.L["Select custom button mode"],
            type = "select",
            values = CUSTOM_BUTTON.MODES_GUI,
            set = function(i, v) SetCustomButtonMode(self, tonumber(v)) end,
            get = function(i) return GetCustomButtonMode(self) end,
            order = 91
        },
        bidding_value = {
            name = CLM.L["Custom value"],
            desc = CLM.L["Value to use in custom mode"],
            type = "range",
            min = 1,
            max = 1000000,
            softMin = 1,
            softMax = 10000,
            step = 0.01,
            set = function(i, v) SetCustomButtonValue(self, v) end,
            get = function(i) return GetCustomButtonValue(self) end,
            order = 92
          }
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function BiddingManagerGUI:Initialize()
    LOG:Trace("BiddingManagerGUI:Initialize()")
    InitializeDB(self)
    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    CreateConfigs(self)
    self:RegisterSlash()
    self.standings = 0
    self.canUseItem = true
    self.fakeTooltip = CreateFrame("GameTooltip", "CLMBiddingFakeTooltip", UIParent, "GameTooltipTemplate")
    self.fakeTooltip:SetScript('OnTooltipSetItem', (function(_self)
        self.canUseItem = true
        local tooltipName = _self:GetName()
        for i = 1, _self:NumLines() do
            local l = _G[tooltipName..'TextLeft'..i]
            local r = _G[tooltipName..'TextRight'..i]
            if IsTooltipTextRed(l) or IsTooltipTextRed(r) then
                self.canUseItem = false
                break
            end
        end
        _self:Hide()
    end))
    self._initialized = true
end

function BiddingManagerGUI:GenerateAuctionOptions()
    local itemId = 0
    local icon = "Interface\\Icons\\INV_Misc_QuestionMark"
    local itemLink = self.auctionInfo and self.auctionInfo:ItemLink() or nil
    if itemLink then
        itemId, _, _, _, icon = GetItemInfoInstant(self.auctionInfo:ItemLink())
        -- Force caching loot from server
        GetItemInfo(itemId)
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
            name = CLM.L["Item"],
            type = "input",
            get = (function(i) return itemLink or "" end),
            set = (function(i,v) end), -- Intentionally: do not override
            width = 2.2,
            order = 2,
            itemLink = "item:" .. tostring(itemId),
        },
        bid_value = {
            name = CLM.L["Bid value"],
            desc = CLM.L["Value you want to bid. Press Enter or click Okay button to accept."],
            type = "input",
            set = (function(i,v) self.bid = tonumber(v) or 0 end),
            get = (function(i) return tostring(self.bid) end),
            width = 0.45,
            order = 3
        },
        bid = {
            name = CLM.L["Bid"],
            desc = CLM.L["Bid input value."],
            type = "execute",
            func = (function() BiddingManager:Bid(self.bid) end),
            width = 0.43,
            order = 4
        },
        base = {
            name = CLM.L["Base"],
            desc = CLM.L["Immediately bid base item value."],
            type = "execute",
            func = (function()
                self.bid = self.auctionInfo and self.auctionInfo:Base() or 0
                BiddingManager:Bid(self.bid)
            end),
            disabled = (function()
                if self.auctionInfo then
                    return (self.auctionInfo:Base() == 0)
                else
                    return true
                end
            end),
            width = 0.43,
            order = 5
        },
        max = {
            name = CLM.L["Max"],
            desc = CLM.L["Immediately bid max item value."],
            type = "execute",
            func = (function()
                self.bid = self.auctionInfo and self.auctionInfo:Max() or 0
                BiddingManager:Bid(self.bid)
            end),
            disabled = (function()
                if self.auctionInfo then
                    return (self.auctionInfo:Max() == 0)
                else
                    return true
                end
            end),
            width = 0.43,
            order = 6
        },
        cancel = {
            name = CLM.L["Cancel"],
            desc = CLM.L["Cancel your bid."],
            type = "execute",
            func = (function() BiddingManager:CancelBid() end),
            width = 0.43,
            order = 8
        },
        pass = {
            name = CLM.L["Pass"],
            desc = CLM.L["Notify that you are passing on the item. Cancels any existing bids."],
            type = "execute",
            func = (function() BiddingManager:NotifyPass() end),
            width = 0.43,
            order = 9
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
    f:SetWidth(BASE_WIDTH)
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
    local myProfile = ProfileManager:GetMyProfile()
    if myProfile then
        local roster = RosterManager:GetRosterByUid(self.auctionInfo:RosterUid())
        if roster then
            if roster:IsProfileInRoster(myProfile:GUID()) then
                self.standings = roster:Standings(myProfile:GUID())
                statusText = self.standings .. CLM.L[" DKP "]
                if hasBase or hasMax then
                    statusText = statusText .. " >>> "
                end
            end
        end
    end

    if hasBase then
        statusText = statusText .. string.format(CLM.L["Base: %d "], self.auctionInfo:Base())
        self.bid = self.auctionInfo:Base()
    end
    if hasMax then
        statusText = statusText .. string.format(CLM.L["Max: %d "], self.auctionInfo:Max())
    end
    if self.auctionInfo:Note():len() > 0 then
        statusText = statusText .. "(" .. self.auctionInfo:Note() .. ")"
    end
    self.top:SetStatusText(statusText)

    if not show then return end

    if C_Item.IsItemDataCachedByID(self.auctionInfo:ItemLink()) then
        self.fakeTooltip:SetHyperlink("item:" .. GetItemIdFromLink(self.auctionInfo:ItemLink()))
        if self.canUseItem then
            self:Refresh()
            self.top:Show()
        end
    else
        GetItemInfo(self.auctionInfo:ItemLink())
        C_Timer.After(0.5, function()
            if C_Item.IsItemDataCachedByID(self.auctionInfo:ItemLink()) then
                self.fakeTooltip:SetHyperlink("item:" .. GetItemIdFromLink(self.auctionInfo:ItemLink()))
            else
                self.canUseItem = true -- fallback
            end
            if self.canUseItem then
                self:Refresh()
                self.top:Show()
            end
        end)
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
    self.top:Hide()
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
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function BiddingManagerGUI:RegisterSlash()
    local options = {
        bid = {
            type = "execute",
            name = CLM.L["Bidding"],
            desc = CLM.L["Toggle Bidding window display"],
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

function BiddingManagerGUI:Reset()
    LOG:Trace("BiddingManagerGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

GUI.BiddingManager = BiddingManagerGUI