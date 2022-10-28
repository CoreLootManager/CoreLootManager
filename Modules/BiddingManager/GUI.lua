-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local tostring, tonumber = tostring, tonumber
local sformat = string.format
local GetItemInfoInstant, GetItemInfo = GetItemInfoInstant, GetItemInfo
local C_TimerAfter, C_ItemIsItemDataCachedByID = C_Timer.After, C_Item.IsItemDataCachedByID

local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")
local LibCandyBar = LibStub("LibCandyBar-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local DISPLAY_MODE_VALUES  = 1
local DISPLAY_MODE_BUTTONS = 2

local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}
local colorGold = {r = 0.92, g = 0.70, b = 0.13, a = 1.0}
local colorTurquoise = {r = 0.2, g = 0.93, b = 0.93, a = 1.0}

local itemOptions = {
    type = "group",
    args = {}
}
local bidOptions = {
    type = "group",
    args = {}
}
local buttonOptions = {
    type = "group",
    args = {}
}
local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

local rowMultiplier = 2.05

local BASE_WIDTH  = 375 + (isElvUI and 30 or 0)
local ROW_HEIGHT = 25
local BASE_HEIGHT = 110
local BID_ROWS = 6
local BID_ROW_HEIGHT = 18
local BIDS_HEIGHT = ((BID_ROWS + 1) * BID_ROW_HEIGHT) + 5
local BID_INPUT_WIDTH  = 170*rowMultiplier*0.4
local BID_BUTTON_WIDTH = 170*rowMultiplier*0.3

local BID_BUTTON_PADDING = (isElvUI and 12 or 2)

local ITEM_REGISTRY = "clm_bidding_manager_gui_item_options"
local BID_REGISTRY = "clm_bidding_manager_gui_bid_options"
local BUTTON_REGISTRY = "clm_bidding_manager_gui_button_options"

local function UpdateOptions(self)
    self.top:SetWidth(BASE_WIDTH)
    for k,_ in pairs(itemOptions.args) do itemOptions.args[k] = nil end
    for k,_ in pairs(bidOptions.args) do bidOptions.args[k] = nil end
    for k,_ in pairs(buttonOptions.args) do buttonOptions.args[k] = nil end
    local _itemOptions, _bidOptions, _buttonOptions = self:GenerateAuctionOptions()
    UTILS.mergeDictsInline(itemOptions.args, _itemOptions)
    UTILS.mergeDictsInline(bidOptions.args, _bidOptions)
    UTILS.mergeDictsInline(buttonOptions.args, _buttonOptions)


    -- self.BidGroup:SetWidth(BASE_WIDTH)
    -- self.ItemGroup:SetWidth(BASE_WIDTH)
end

local function CreateOptions(self)
    -- Item Display
    local ItemGroup = AceGUI:Create("SimpleGroup")
    ItemGroup:SetLayout("Flow")
    ItemGroup:SetWidth(BASE_WIDTH)
    self.ItemGroup = ItemGroup
    -- Bid Display
    local BidGroup = AceGUI:Create("SimpleGroup")
    BidGroup:SetLayout("Flow")
    BidGroup:SetWidth(2*BID_BUTTON_WIDTH + BID_BUTTON_PADDING)
    self.BidGroup = BidGroup
    -- Button Display
    local ButtonGroup = AceGUI:Create("SimpleGroup")
    ButtonGroup:SetLayout("Flow")
    ButtonGroup:SetWidth(BASE_WIDTH)
    self.ButtonGroup = ButtonGroup
    -- Build options
    UpdateOptions(self)
    -- register
    AceConfigRegistry:RegisterOptionsTable(ITEM_REGISTRY, itemOptions)
    AceConfigDialog:Open(ITEM_REGISTRY, ItemGroup)
    AceConfigRegistry:RegisterOptionsTable(BID_REGISTRY, bidOptions)
    AceConfigDialog:Open(BID_REGISTRY, BidGroup)
    AceConfigRegistry:RegisterOptionsTable(BUTTON_REGISTRY, buttonOptions)
    AceConfigDialog:Open(BUTTON_REGISTRY, ButtonGroup)

    return ItemGroup, BidGroup, ButtonGroup
end

local BiddingManagerGUI = {}

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('bidding', {
        location = {nil, nil, "CENTER", 0, 0 },
        scale = 1,
        closeOnBid = false
    })
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
    self.db.scale = self.top.frame:GetScale()
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
    if self.db.scale then
        self.top.frame:SetScale(self.db.scale)
    end
end

local function GetCloseOnBid(self)
    return self.db.closeOnBid
end

local function CreateConfig(self)
    local options = {
        bidding_gui_close_on_bid = {
            name = CLM.L["Close on bid"],
            desc = CLM.L["Toggle closing bidding UI after submitting bid."],
            type = "toggle",
            set = function(i, v) self.db.closeOnBid = v and true or false end,
            get = function(i) return GetCloseOnBid(self) end,
            order = 75
        }
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function BiddingManagerGUI:Initialize()
    LOG:Trace("BiddingManagerGUI:Initialize()")
    InitializeDB(self)
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    CreateConfig(self)
    self:RegisterSlash()
    self.standings = 0
    self.canUseItem = true
    self.fakeTooltip = CreateFrame("GameTooltip", "CLMBiddingFakeTooltip", UIParent, "GameTooltipTemplate")
    self.fakeTooltip:SetScript('OnTooltipSetItem', (function(s)
        self.canUseItem = true
        local tooltipName = s:GetName()
        for i = 1, s:NumLines() do
            local l = _G[tooltipName..'TextLeft'..i]
            local r = _G[tooltipName..'TextRight'..i]
            if UTILS.IsTooltipTextRed(l) or UTILS.IsTooltipTextRed(r) then
                self.canUseItem = false
                break
            end
        end
        s:Hide()
    end))
    self._initialized = true
end

function BiddingManagerGUI:GetInputValue()
    local input = self.BidInput:GetText()
    -- TODO sanitize
    return input
end

function BiddingManagerGUI:SetInputValue(value)
    -- TODO sanitize
    self.BidInput:SetText(value)
end

function BiddingManagerGUI:BidInputValue(bidType)
    self.bid = self:GetInputValue()
    self:SetInputValue(self.bid)
    CLM.MODULES.BiddingManager:Bid(self.bid, bidType)
end

function BiddingManagerGUI:BidValue(value, bidType)
    self:SetInputValue(value)
    self.bid = self:GetInputValue()
    CLM.MODULES.BiddingManager:Bid(self.bid, bidType)
end

function BiddingManagerGUI:BidAllIn()
    self:BidValue(self.standings, CONSTANTS.BID_TYPE.MAIN_SPEC)
end

local function GenerateValueButtonsAuctionOptions(self, itemValueMode, values)
    local generateBidOptions = {
        bid = {
            name = CLM.L["MS"],
            desc = CLM.L["Bid input values as Main spec bid."],
            type = "execute",
            func = (function()
                self:BidInputValue(CONSTANTS.BID_TYPE.MAIN_SPEC)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = rowMultiplier*0.3,
            order = 4
        },
        os = {
            name = CLM.L["OS"],
            desc = CLM.L["Bid input values as Off spec bid."],
            type = "execute",
            func = (function()
                self:BidInputValue(CONSTANTS.BID_TYPE.OFF_SPEC)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = rowMultiplier*0.3,
            order = 5
        },
    }
    local generateButtonOptions = {
        pass = {
            name = CLM.L["Pass"],
            desc = (function()
                if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
                    return CLM.L["Notify that you are passing on the item."]
                else
                    return CLM.L["Notify that you are passing on the item. Cancels any existing bids."]
                end
            end),
            type = "execute",
            func = (function()
                CLM.MODULES.BiddingManager:NotifyPass()
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            disabled = (function()
                    return (
                        CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and
                        (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) and
                        (CLM.MODULES.BiddingManager:GetLastBidValue() ~= nil)
                    )
            end),
            width = rowMultiplier/2,
            order = 20
        },
        cancel = {
            name = CLM.L["Cancel"],
            desc = CLM.L["Cancel your bid."],
            type = "execute",
            func = (function()
                CLM.MODULES.BiddingManager:CancelBid()
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            disabled = (function()
                return (
                    CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and
                    (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING)
                )
            end),
            width = rowMultiplier/2,
            order = 21
        }
    }
    local offset = 8
    local numRows = 2
    local usedTiers

    local doDisplayValue
    if itemValueMode == CONSTANTS.ITEM_VALUE_MODE.TIERED then
        usedTiers = CONSTANTS.SLOT_VALUE_TIERS_ORDERED
        doDisplayValue = (function(value) return (value >= 0) end)
    elseif (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) then
        usedTiers = {
            CONSTANTS.SLOT_VALUE_TIER.BASE,
            CONSTANTS.SLOT_VALUE_TIER.MAX
        }
        doDisplayValue = (function(value) return (value > 0) end)
    end

    if usedTiers then
        local alreadyExistingValues = {}
        local numButtons = 0
        for _,tier in ipairs(usedTiers) do
            local value = tonumber(values[tier]) or 0
            if not alreadyExistingValues[value] and doDisplayValue(value) then -- this will display in ascending max 0
                alreadyExistingValues[value] = true
                generateButtonOptions[tier] = {
                    name = value,
                    desc = CONSTANTS.SLOT_VALUE_TIERS_GUI[tier] or "",
                    type = "execute",
                    func = (function()
                        self:BidInputValue(tier)
                        if GetCloseOnBid(self) then self:Toggle() end
                    end),
                    order = offset
                }
                offset = offset + 1
                numButtons = numButtons + 1
            end
        end

        if (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) and not generateButtonOptions[CONSTANTS.SLOT_VALUE_TIER.MAX] then
            local width = generateButtonOptions[CONSTANTS.SLOT_VALUE_TIER.BASE] and (rowMultiplier/2) or rowMultiplier
            generateButtonOptions["all_in"] = {
                name = CLM.L["All In"],
                desc = sformat(CLM.L["Bid your current DKP (%s)."], tostring(self.standings)),
                type = "execute",
                func = (function()
                    self:BidAllIn()
                    if GetCloseOnBid(self) then self:Toggle() end
                end),
                width = width,
                order = offset
            }
            numButtons = numButtons + 1
        end

        if numButtons > 0 then
            numRows = numRows + 1
            local row_width = rowMultiplier/numButtons
            for _,tier in ipairs(usedTiers) do
                if generateButtonOptions[tier] then
                    generateButtonOptions[tier].width = row_width
                end
            end
        end
    end

    self.top:SetHeight(BASE_HEIGHT + (CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and BIDS_HEIGHT or 0) + (numRows*ROW_HEIGHT))
    return generateBidOptions, generateButtonOptions
end

local function GenerateNamedButtonsAuctionOptions(self, itemValueMode, values)
    local options = {}
    local offset = 3
    local row_width = rowMultiplier/2
    local numButtons = 0
    local usedTiers
    if itemValueMode == CONSTANTS.ITEM_VALUE_MODE.TIERED then
        usedTiers = CONSTANTS.SLOT_VALUE_TIERS_ORDERED_REVERSED
    elseif itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING then
        usedTiers = {
            CONSTANTS.SLOT_VALUE_TIER.BASE,
            CONSTANTS.SLOT_VALUE_TIER.MAX
        }
    elseif itemValueMode == CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED then
        usedTiers = {
            CONSTANTS.SLOT_VALUE_TIER.BASE
        }
    end
    if usedTiers then
        for _,tier in ipairs(usedTiers) do
            local value = tonumber(values[tier]) or 0
            local name = self.roster:GetFieldName(tier)
            if name and name ~= "" and (value >= 0) then
                options[tier] = {
                    name = name,
                    desc = tostring(value),
                    type = "execute",
                    func = (function()
                        self:BidValue(value, tier)
                        if GetCloseOnBid(self) then self:Toggle() end
                    end),
                    width = row_width,
                    order = offset
                }
                offset = offset + 1
                numButtons = numButtons + 1
            end
        end
    end
    local isEven = true
    local cancelPassWidth = rowMultiplier/2
    if (numButtons %2 ~= 0) then
        cancelPassWidth = rowMultiplier/4
        isEven = false
    end

    options.pass = {
        name = CLM.L["Pass"],
        desc = (function()
            if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
                return CLM.L["Notify that you are passing on the item."]
            else
                return CLM.L["Notify that you are passing on the item. Cancels any existing bids."]
            end
        end),
        type = "execute",
        func = (function()
            CLM.MODULES.BiddingManager:NotifyPass()
            if GetCloseOnBid(self) then self:Toggle() end
        end),
        disabled = (function()
                return CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and (CLM.MODULES.BiddingManager:GetLastBidValue() ~= nil)
        end),
        width = cancelPassWidth,
        order = offset
    }
    options.cancel = {
        name = CLM.L["Cancel"],
        desc = CLM.L["Cancel your bid."],
        type = "execute",
        func = (function()
            CLM.MODULES.BiddingManager:CancelBid()
            if GetCloseOnBid(self) then self:Toggle() end
        end),
        disabled = (function() return CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) end),
        width = cancelPassWidth,
        order = offset + 1
    }

    local numRows = 0
    if isEven then numRows = 1 end

    self.top:SetHeight(BASE_HEIGHT + (CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and BIDS_HEIGHT or 0) + ((numRows + math.ceil(numButtons/2))*ROW_HEIGHT))

    return {}, options
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
    local shortItemLink = "item:" .. tostring(itemId)
    local itemValueMode = self.auctionInfo and self.auctionInfo:Mode() or CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED
    local values = self.auctionInfo and self.auctionInfo:Values() or {}

    local namedButtonsMode
    if self.roster then
        namedButtonsMode = self.roster:GetConfiguration("namedButtons")
    end

    local _itemOptions = {
        icon = {
            name = "",
            type = "execute",
            image = icon,
            func = (function() end),
            itemLink = shortItemLink,
            width = 0.25,
            order = 1
        },
        item = {
            name = "",
            type = "input",
            get = (function(i) return itemLink or "" end),
            set = (function(i,v) end), -- Intentionally: do not override
            width = rowMultiplier - 0.25,
            order = 2,
            itemLink = shortItemLink,
        },
    }

    local _bidOptions, _buttonOptions
    if namedButtonsMode then
        _bidOptions, _buttonOptions = GenerateNamedButtonsAuctionOptions(self, itemValueMode, values)
    else
        _bidOptions, _buttonOptions = GenerateValueButtonsAuctionOptions(self, itemValueMode, values)
    end

    return _itemOptions, _bidOptions, _buttonOptions
end

local function CreateBidList(self)
    local BidList = AceGUI:Create("CLMLibScrollingTable")
    BidList:SetDisplayRows(BID_ROWS, BID_ROW_HEIGHT)
    local columns = {
        {name = "", width = 18, DoCellUpdate = UTILS.LibStClassCellUpdate },
        {name = CLM.L["Name"],  width = (86 + (isElvUI and 30 or 0)) },
        {name = CLM.L["Bid"],   width = 120, color = colorGreen,
            sort = ScrollingTable.SORT_DSC,
            sortnext = 4,
            align = "CENTER",
            DoCellUpdate = (function(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                BidList.st.DoCellUpdate(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                frame.text:SetText(data[realrow].cols[7].value or data[realrow].cols[column].value)
            end)
        },
        {name = CLM.L["Current"],  width = 60, color = colorGold,
            align = "CENTER"
        },
        {name = "", width = 18, DoCellUpdate = UTILS.LibStItemCellUpdate },
        {name = "", width = 18, DoCellUpdate = UTILS.LibStItemCellUpdate },
    }
    BidList:SetDisplayCols(columns)
    BidList:RegisterEvents({
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStSingleSelectClickHandler(table, nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            return true
        end
    })
    return BidList
end

local function RescaleLibCandyBar(bar, scale)
    if not bar then return end
    bar:SetWidth(BASE_WIDTH*scale)
    bar:SetHeight(25*scale)
    bar.candyBarBar:SetScale(scale)
end

function BiddingManagerGUI:Create()
    LOG:Trace("BiddingManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Bidding"])
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetWidth(BASE_WIDTH)
    f:SetHeight(BASE_HEIGHT)
    f.frame:SetScript("OnMouseWheel", (function(frame, delta)
        if IsControlKeyDown() then
            self.db.scale = UTILS.ResizeFrame(frame, (delta > 0), self.db.scale)
            RescaleLibCandyBar(self.bar, self.db.scale)
        end
    end))
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Bidding_GUI")
    self.barPreviousPercentageLeft = 1
    self.duration = 1
    local BidInputGroup = AceGUI:Create("SimpleGroup")
    BidInputGroup:SetLayout("Flow")
    BidInputGroup:SetWidth(BASE_WIDTH)
    self.BidInputGroup = BidInputGroup
    local _, BidGroup, _ = CreateOptions(self)
    local BidInput = AceGUI:Create("EditBox")
    self.BidInput = BidInput
    BidInput:DisableButton(true)
    BidInput:SetWidth(BID_INPUT_WIDTH)
    BidInputGroup:AddChild(BidInput)
    BidInputGroup:AddChild(BidGroup)
    local BidList = CreateBidList(self)
    self.BidList = BidList
    RestoreLocation(self)
    self:SetInputValue(0)
    -- Handle onHide information passing whenever the UI is closed
    local oldOnHide = f.frame:GetScript("OnHide")
    f.frame:SetScript("OnHide", (function(...)
        CLM.MODULES.BiddingManager:NotifyHide()
        oldOnHide(...)
    end))
    -- Hide by default
    f:Hide()
end

function BiddingManagerGUI:UpdateCurrentBidValue(value)
    self:SetInputValue(value)
    self:Refresh()
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
    self.bar = LibCandyBar:New("Interface\\AddOns\\ClassicLootManager\\Media\\Bars\\AceBarFrames.tga", BASE_WIDTH, 25)
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
    self.bar:SetPoint("CENTER", self.top.frame, "TOP", 0, (isElvUI and 15 or 10))
    self.bar.candyBarBar:SetScript("OnMouseDown", function (_, button) if button == 'LeftButton' then self:Toggle() end end)

    if self.db.scale then
        RescaleLibCandyBar(self.bar, self.db.scale)
    end

    self.bar:Start(self.auctionInfo:Time())
end

local function EvaluateItemUsability(self)
    self.fakeTooltip:SetHyperlink("item:" .. UTILS.GetItemIdFromLink(self.auctionInfo:ItemLink()))
end

local function HandleWindowDisplay(self)
    if self.canUseItem then
        self:Refresh()
        self.top:Show()
    else
        CLM.MODULES.BiddingManager:NotifyCantUse()
    end
end

function BiddingManagerGUI:StartAuction(show, auctionInfo)
    LOG:Trace("BiddingManagerGUI:StartAuction()")
    self.auctionInfo = auctionInfo
    local duration = self.auctionInfo:EndTime() - GetServerTime()
    if duration < 0 then return end
    self.duration = duration
    self:BuildBar(duration)
    local values = auctionInfo:Values()
    self:SetInputValue(values[CONSTANTS.SLOT_VALUE_TIER.BASE] or 0)
    local myProfile = CLM.MODULES.ProfileManager:GetMyProfile()
    self.top:SetTitle(CLM.L["Bidding"])
    local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.auctionInfo:RosterUid())
    self.roster = roster
    if myProfile then
        if roster then
            self.auctionType = roster:GetConfiguration("auctionType")
            if roster:IsProfileInRoster(myProfile:GUID()) then
                if roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP then
                    self.standings = roster:Priority(myProfile:GUID())
                else
                    self.standings = roster:Standings(myProfile:GUID())
                end
                self.top:SetTitle(CLM.L["Bidding"] ..  " | " .. CLM.L["Current"] .. ": " .. tostring(self.standings))
            end
        end
    end

    if not show then return end
    -- self:Refresh()
    if C_ItemIsItemDataCachedByID(self.auctionInfo:ItemLink()) then
        EvaluateItemUsability(self)
        HandleWindowDisplay(self)
    else
        GetItemInfo(self.auctionInfo:ItemLink())
        C_TimerAfter(0.5, function()
            if C_ItemIsItemDataCachedByID(self.auctionInfo:ItemLink()) then
                EvaluateItemUsability(self)
            else
                self.canUseItem = true -- fallback
            end
            HandleWindowDisplay(self)
        end)
    end
end

function BiddingManagerGUI:EndAuction()
    LOG:Trace("BiddingManagerGUI:EndAuction()")
    if self.bar.running then
        self.bar:Stop()
    end
    self.bar = nil
    self.barPreviousPercentageLeft = 1
    self.duration = 1
    self.top:Hide()
end

function BiddingManagerGUI:AntiSnipe()
    self.bar.exp = (self.bar.exp + self.auctionInfo:AntiSnipe()) -- trick to extend bar
end

local function BuildBidderData(self)
    if CLM.MODULES.RaidManager:IsInRaid() and CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
        local data = {}
        for bidder, bid in pairs(CLM.MODULES.BiddingManager:GetBids()) do
            local profile = CLM.MODULES.ProfileManager:GetProfileByName(bidder)
            local current
            local class
            local color
            local bidName = bid:Value()
            local roster = CLM.MODULES.RaidManager:GetRaid():Roster()
            if profile then
                class = profile:ClassInternal()
                color = UTILS.GetClassColor(profile:Class())
                if roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP then
                    current = roster:Priority(profile:GUID())
                else
                    current = roster:Standings(profile:GUID())
                end
            else
                current = ""
            end
            local namedButtons = roster:GetConfiguration("namedButtons")
            if namedButtons then
                bidName = roster:GetFieldName(bid:Type())
                if not bidName or bidName == "" then bidName = tostring(bid:Value()) end
            end
            local items = bid:Items()
            local primaryItem = items[1]
            local secondaryItem = items[2]
            if (not primaryItem) and secondaryItem then
                primaryItem = secondaryItem
                secondaryItem = nil
            end
            if (bid:Type() ~= CONSTANTS.BID_TYPE.PASS) and (bid:Type() ~= CONSTANTS.BID_TYPE.CANCEL) then
                local bidColor
                if (not namedButtons) and (bid:Type() ~= CONSTANTS.BID_TYPE.MAIN_SPEC) then
                    bidColor = colorTurquoise
                end
                local row = {cols = {
                    {value = class}, -- Class Icon
                    {value = bidder, color = color}, -- Name
                    {value = bid:Value(), color = bidColor}, -- Bid Value
                    {value = current}, -- Current standings / priority
                    {value = primaryItem}, -- Primary item Icon
                    {value = secondaryItem}, -- Secondary Item Icon
                    -- Not visible
                    {value = bidName}
                }}
                data[#data+1] = row
            end
        end
        self.BidList:SetData(data)
    end
end

function BiddingManagerGUI:RefreshBidList()
    if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
        BuildBidderData(self)
        self.BidList:Show()
    else
        self.BidList:Hide()
    end
end

local function RegenerateRows(self)
    local namedButtonsMode
    if self.roster then
        namedButtonsMode = self.roster:GetConfiguration("namedButtons")
    end
    if namedButtonsMode then
        if (self.currentDisplayMode ~= DISPLAY_MODE_BUTTONS) then
            local isVisible = self.top:IsVisible()
            self.top:Show() -- this helps to fix scaling issues with Ace3

            self.BidInputGroup.frame:Hide()
            self.top.children = {}
            self.top:AddChildren(self.ItemGroup, self.ButtonGroup, self.BidList)
            self.top:DoLayout()
            self.currentDisplayMode = DISPLAY_MODE_BUTTONS

            if not isVisible then
                self.top:Hide() -- this helps to fix scaling issues with Ace3
            end
        end
    else
        if (self.currentDisplayMode ~= DISPLAY_MODE_VALUES) then
            local isVisible = self.top:IsVisible()
            self.top:Show() -- this helps to fix scaling issues with Ace3

            self.top.children = {}
            self.top:AddChildren(self.ItemGroup, self.BidInputGroup, self.ButtonGroup, self.BidList)
            self.top:DoLayout()
            self.currentDisplayMode = DISPLAY_MODE_VALUES

            if not isVisible then
                self.top:Hide() -- this helps to fix scaling issues with Ace3
            end
        end
    end
end

function BiddingManagerGUI:Refresh()
    LOG:Trace("BiddingManagerGUI:Refresh()")
    if not self._initialized then return end

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(ITEM_REGISTRY)
    AceConfigDialog:Open(ITEM_REGISTRY, self.ItemGroup) -- Refresh the config gui panel
    AceConfigRegistry:NotifyChange(BID_REGISTRY)
    AceConfigDialog:Open(BID_REGISTRY, self.BidGroup) -- Refresh the config gui panel
    AceConfigRegistry:NotifyChange(BUTTON_REGISTRY)
    AceConfigDialog:Open(BUTTON_REGISTRY, self.ButtonGroup) -- Refresh the config gui panel
    RegenerateRows(self)
    self:RefreshBidList()
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
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function BiddingManagerGUI:Reset()
    LOG:Trace("BiddingManagerGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.BiddingManager = BiddingManagerGUI
