-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local sformat = string.format

local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")
local LibCandyBar = LibStub("LibCandyBar-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local DISPLAY_MODE_VALUES  = 1
local DISPLAY_MODE_BUTTONS = 2

local colorGreen = {r = 0.27, g = 0.93, b = 0.27, a = 1.0}
local colorGold = {r = 0.93, g = 0.70, b = 0.13, a = 1.0}
local colorRed = {r = 0.93, g = 0.27, b = 0.2, a = 1.0}
local colorTurquoise = {r = 0.2, g = 0.93, b = 0.93, a = 1.0}

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

-- local rowMultiplier = 2.05
local rowMultiplier = 2.4

local ROW_HEIGHT = 25
local BASE_HEIGHT = 115
local BID_ROWS = 7
local BID_ROW_HEIGHT = 18
local BIDS_HEIGHT = ((BID_ROWS + 1) * BID_ROW_HEIGHT) + 5

local BASE_ACE_WIDTH = 170

-- local BASE_WIDTH       = 400 + (isElvUI and 30 or 0)
-- local DATA_GROUP_WIDTH = 375 + (isElvUI and 30 or 0)
local DATA_GROUP_WIDTH = BASE_ACE_WIDTH*(rowMultiplier + 0.15) + (isElvUI and 30 or 0)
local BID_INPUT_WIDTH  = BASE_ACE_WIDTH*rowMultiplier*0.4
local BID_BUTTON_WIDTH = BASE_ACE_WIDTH*rowMultiplier*0.3

local BID_BUTTON_PADDING = (isElvUI and 12 or 2)

local ITEM_REGISTRY     = "clm_bm_gui_opt_item"
local BID_REGISTRY      = "clm_bm_gui_opt_bid"
local BUTTON_REGISTRY   = "clm_bm_gui_opt_button"


local BiddingManagerGUI = {}

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('bidding', {
        location = {nil, nil, "CENTER", 0, 0 },
        scale = 1,
        closeOnBid = false
    })
end

local function SetCloseOnBid(self, value)
    self.db.closeOnBid = value and true or false
end

local function GetCloseOnBid(self)
    return self.db.closeOnBid
end

local function CreateConfig(self)
    local options = {
        bidding_gui_close_on_bid = {
            name = CLM.L["Close on bid"],
            desc = CLM.L["Toggle closing bidding UI after submitting bid for all items."],
            type = "toggle",
            set = function(i, v) SetCloseOnBid(self, v) end,
            get = function(i) return GetCloseOnBid(self) end,
            order = 75
        }
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

local function RegisterSlash(self)
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

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
    self.db.scale = self.top.frame:GetScale()
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
    -- if self.db.scale then
        -- self.top.frame:SetScale(self.db.scale)
    -- end
end

local function GetInputValue(self)
    local input = self.BidInput:GetText()
    -- TODO sanitize
    return input
end

local function SetInputValue(self, value)
    -- TODO sanitize
    self.BidInput:SetText(value)
end

local function BidInputValue(self, bidType)
    local bid = GetInputValue(self)
    SetInputValue(self, bid)
    local itemId = self.auctionItem and self.auctionItem:GetItemID() or 0
    CLM.MODULES.BiddingManager:Bid(itemId, bid, bidType)
end

local whoamiGUID = UTILS.whoamiGUID()
local function BidAllIn(self)
    local roster = CLM.MODULES.BiddingManager:GetAuctionInfo():GetRoster()
    if roster:IsProfileInRoster(whoamiGUID) then
        local standings = roster:Standings(whoamiGUID)
        SetInputValue(self, standings)
        BidInputValue(self, CONSTANTS.BID_TYPE.MAIN_SPEC)
    end
end

local function BidPass(self)
    local itemId = self.auctionItem and self.auctionItem:GetItemID() or 0
    CLM.MODULES.BiddingManager:Bid(itemId, 0, CONSTANTS.BID_TYPE.PASS)
end

local function BidCancel(self)
    local itemId = self.auctionItem and self.auctionItem:GetItemID() or 0
    CLM.MODULES.BiddingManager:Bid(itemId, 0, CONSTANTS.BID_TYPE.CANCEL)
end

------------------------
--- Options Creation ---
------------------------
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

local numRows

local function GenerateValueButtonsAuctionOptions(self, auctionInfo)
    local itemValueMode = auctionInfo and auctionInfo:GetMode() or CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED
    local useOS = auctionInfo and auctionInfo:GetUseOS()
    local auctionType = auctionInfo and auctionInfo:GetType() or 0

    numRows = 2

    local generateBidOptions = {
        bid = {
            name = useOS and CLM.L["MS"] or CLM.L["Bid"],
            desc = CLM.L["Bid input values as Main spec bid."],
            type = "execute",
            func = (function()
                BidInputValue(self, CONSTANTS.BID_TYPE.MAIN_SPEC)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = (useOS and 1 or 2)*rowMultiplier*0.3,
            order = 4
        },
    }
    if useOS then
        generateBidOptions.os = {
            name = CLM.L["OS"],
            desc = CLM.L["Bid input values as Off spec bid."],
            type = "execute",
            func = (function()
                BidInputValue(self, CONSTANTS.BID_TYPE.OFF_SPEC)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = rowMultiplier*0.3,
            order = 5
        }
    end
    local generateButtonOptions = {
        pass = {
            name = CLM.L["Pass"],
            -- desc = (function()
            --     if CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] then
            --         return CLM.L["Notify that you are passing on the item."]
            --     else
            --         return CLM.L["Notify that you are passing on the item. Cancels any existing bids."]
            --     end
            -- end),
            type = "execute",
            func = (function()
                BidPass(self)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            -- disabled = (function()
            --         return (
            --             CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and
            --             (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) and
            --             (CLM.MODULES.BiddingManager:GetLastBidValue() ~= nil)
            --         )
            -- end),
            width = rowMultiplier/2,
            order = 20
        },
        cancel = {
            name = CLM.L["Cancel"],
            desc = CLM.L["Cancel your bid."],
            type = "execute",
            func = (function()
                BidCancel(self)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            -- disabled = (function()
            --     return (
            --         CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and
            --         (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING)
            --     )
            -- end),
            width = rowMultiplier/2,
            order = 21
        }
    }
    local offset = 8
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

    local values = self.auctionItem and self.auctionItem:GetValues() or {}
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
                        SetInputValue(self, value)
                        BidInputValue(self, tier)
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
                    BidAllIn(self)
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

    self.top:SetHeight(BASE_HEIGHT + (CONSTANTS.AUCTION_TYPES_OPEN[auctionType] and BIDS_HEIGHT or 0) + (numRows*ROW_HEIGHT))
    
    bidOptions.args = generateBidOptions
    buttonOptions.args = generateButtonOptions
end

local function GenerateNamedButtonsAuctionOptions(self, auctionInfo)
    local options = {}
    local offset = 3
    local row_width = rowMultiplier/2
    local numButtons = 0
    local usedTiers

    local itemValueMode = auctionInfo and auctionInfo:GetMode() or CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED

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

    local values = self.auctionItem and self.auctionItem:GetValues() or {}
    if usedTiers then
        for _,tier in ipairs(usedTiers) do
            local value = tonumber(values[tier]) or 0
            local name = auctionInfo:GetFieldName(tier)
            if name and name ~= "" and (value >= 0) then
                options[tier] = {
                    name = name,
                    desc = tostring(value),
                    type = "execute",
                    func = (function()
                        SetInputValue(self, value)
                        BidInputValue(self, tier)
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
            if CONSTANTS.AUCTION_TYPES_OPEN[auctionInfo:GetType()] then
                return CLM.L["Notify that you are passing on the item."]
            else
                return CLM.L["Notify that you are passing on the item. Cancels any existing bids."]
            end
        end),
        type = "execute",
        func = (function()
            -- CLM.MODULES.BiddingManager:NotifyPass()
            if GetCloseOnBid(self) then self:Toggle() end
        end),
        -- disabled = (function()
        --         return CONSTANTS.AUCTION_TYPES_OPEN[auctionInfo:GetType()] and (CLM.MODULES.BiddingManager:GetLastBidValue() ~= nil)
        -- end),
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
        -- disabled = (function() return CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) end),
        width = cancelPassWidth,
        order = offset + 1
    }

    numRows = 0
    if isEven then numRows = 1 end
    numRows = numRows + math.ceil(numButtons/2)

    self.top:SetHeight(BASE_HEIGHT + (CONSTANTS.AUCTION_TYPES_OPEN[auctionInfo and auctionInfo:GetType()] and BIDS_HEIGHT or 0) + ((numRows)*ROW_HEIGHT))

    bidOptions.args = {}
    buttonOptions.args = options
end

local function GenerateAuctionOptions(self)
    local icon, itemLink = "Interface\\Icons\\INV_Misc_QuestionMark", "item:0"
    self.note = ""
    local auctionItem = self.auctionItem
    if auctionItem and not auctionItem.item:IsItemEmpty() then
        _, _, _, _, icon = GetItemInfoInstant(auctionItem:GetItemID())
        itemLink = auctionItem:GetItemLink()
    end

    local auctionInfo = CLM.MODULES.BiddingManager:GetAuctionInfo()

    -- local shortItemLink = "item:" .. tostring(itemId)
    local namedButtonsMode = auctionInfo and auctionInfo:GetNamedButtonsMode() or false

    itemOptions.args = {
        icon = {
            name = "",
            type = "execute",
            image = icon,
            func = (function() end),
            tooltipHyperlink = itemLink,
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
            tooltipHyperlink = itemLink,
        },
    }

    if namedButtonsMode then
        GenerateNamedButtonsAuctionOptions(self, auctionInfo)
    else
        GenerateValueButtonsAuctionOptions(self, auctionInfo)
    end
end

local function UpdateOptions(self)
    -- self.top:SetWidth(BASE_WIDTH)
    GenerateAuctionOptions(self)
end

local function CreateOptions(self)
    -- Item Display
    local ItemGroup = AceGUI:Create("SimpleGroup")
    ItemGroup:SetLayout("Flow")
    ItemGroup:SetWidth(DATA_GROUP_WIDTH)
    self.ItemGroup = ItemGroup
    -- Bid Display
    local BiddingGroup = AceGUI:Create("SimpleGroup")
    BiddingGroup:SetLayout("Flow")
    BiddingGroup:SetWidth(2*BID_BUTTON_WIDTH + BID_BUTTON_PADDING)
    self.BiddingGroup = BiddingGroup
    -- Button Display
    local ButtonGroup = AceGUI:Create("SimpleGroup")
    ButtonGroup:SetLayout("Flow")
    ButtonGroup:SetWidth(DATA_GROUP_WIDTH)
    self.ButtonGroup = ButtonGroup
    -- Build options
    UpdateOptions(self)
    -- register
    AceConfigRegistry:RegisterOptionsTable(ITEM_REGISTRY, itemOptions)
    AceConfigDialog:Open(ITEM_REGISTRY, ItemGroup)
    AceConfigRegistry:RegisterOptionsTable(BID_REGISTRY, bidOptions)
    AceConfigDialog:Open(BID_REGISTRY, BiddingGroup)
    AceConfigRegistry:RegisterOptionsTable(BUTTON_REGISTRY, buttonOptions)
    AceConfigDialog:Open(BUTTON_REGISTRY, ButtonGroup)

    return ItemGroup, BiddingGroup, ButtonGroup
end
-------------------
--- UI Creation ---
-------------------
local function CreateBidInputGroup(self)
    local BidInputGroup = AceGUI:Create("SimpleGroup")
    BidInputGroup:SetLayout("Flow")
    BidInputGroup:SetWidth(DATA_GROUP_WIDTH)
    self.BidInputGroup = BidInputGroup
    local _, BiddingGroup, _ = CreateOptions(self)
    local BidInput = AceGUI:Create("EditBox")
    self.BidInput = BidInput
    BidInput:DisableButton(true)
    BidInput:SetWidth(BID_INPUT_WIDTH)
    BidInputGroup:AddChild(BidInput)
    BidInputGroup:AddChild(BiddingGroup)

    return BidInputGroup
end

local function CreateItemList(self)
    local ItemList = AceGUI:Create("CLMLibScrollingTable")
    self.ItemList = ItemList
    ItemList:SetHeaderless()
    ItemList:SetDisplayRows(8, 32)
    ItemList:SetDisplayCols({
        { name = "",  width = 32, DoCellUpdate = UTILS.LibStItemCellUpdate }, -- Icon
    })
    ItemList:RegisterEvents({
        OnClick = (function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStSingleSelectClickHandler(table, nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            local _, selection = next(table:GetSelection())
            local row = table:GetRow(selection)
            if row then
                self:SetVisibleAuctionItem(row.cols[2].value)
            end
            return true
        end),
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            GameTooltip:SetOwner(rowFrame, "ANCHOR_LEFT")
            GameTooltip:SetHyperlink("item:" .. (tonumber(rowData.cols[column].value) or 0))
            GameTooltip:Show()
            return status
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            GameTooltip:Hide()
            return status
        end),
    })
    ItemList:EnableSelection(false)
    ItemList:SetTransparent()
    return ItemList
end

local function CreateBidList(self)
    local BidList = AceGUI:Create("CLMLibScrollingTable")
    BidList:SetDisplayRows(BID_ROWS, BID_ROW_HEIGHT)
    local columns = {
        {name = "", width = 18, DoCellUpdate = UTILS.LibStClassCellUpdate },
        {name = CLM.L["Name"],  width = 100,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        }, -- + (isElvUI and 30 or 0)) },
        {name = CLM.L["Bid"],   width = 100, color = colorGreen,
            sort = ScrollingTable.SORT_DSC,
            sortnext = 4,
            align = "CENTER",
            DoCellUpdate = (function(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                table.DoCellUpdate(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                frame.text:SetText(data[realrow].cols[column].text or data[realrow].cols[column].value)
            end)
        },
        {name = CLM.L["Current"],  width = 80, color = colorGold,
            sortnext = 5,
            align = "CENTER"
        },
        {name = CLM.L["Roll"],  width = 40, color = {r = 0.93, g = 0.70, b = 0.13, a = 1.0},
            sortnext = 2,
            align = "CENTER"
        },
        {name = "", width = 18, DoCellUpdate = UTILS.LibStItemCellUpdate },
        {name = "", width = 18, DoCellUpdate = UTILS.LibStItemCellUpdate },
    }
    BidList:SetDisplayCols(columns)
    -- BidList:RegisterEvents({
    --     OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
    --         UTILS.LibStSingleSelectClickHandler(table, nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
    --         return true
    --     end
    -- })
    -- TODO disable click
    BidList:EnableSelection(false)
    self.BidList = BidList
    return BidList
end

local function CreateDataGroup(self)
    local DataGroup = AceGUI:Create("SimpleGroup")
    DataGroup:SetLayout("Flow")
    DataGroup:SetWidth(DATA_GROUP_WIDTH)

    local BidInputGroup = CreateBidInputGroup(self)
    local BidList = CreateBidList(self)

    DataGroup:AddChild(BidInputGroup)
    DataGroup:AddChild(BidList)

    self.DataGroup = DataGroup
    return DataGroup
end

local function UpdateUIStructure(self)
    local auctionInfo = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if (auctionInfo and auctionInfo:GetNamedButtonsMode() or false) then
        if (self.currentDisplayMode ~= DISPLAY_MODE_BUTTONS) then
            local isVisible = self.top:IsVisible()
            self.top:Show() -- this helps to fix scaling issues with Ace3

            self.BidInputGroup.frame:Hide()
            self.DataGroup.children = {}
            self.DataGroup:AddChildren(self.ItemGroup, self.ButtonGroup, self.BidList)
            self.DataGroup:DoLayout()
            -- self.top:DoLayout()
            self.currentDisplayMode = DISPLAY_MODE_BUTTONS

            if not isVisible then
                self.top:Hide() -- this helps to fix scaling issues with Ace3
            end
        end
    else
        if (self.currentDisplayMode ~= DISPLAY_MODE_VALUES) then
            local isVisible = self.top:IsVisible()
            self.top:Show() -- this helps to fix scaling issues with Ace3

            self.DataGroup.children = {}
            self.DataGroup:AddChildren(self.ItemGroup, self.BidInputGroup, self.ButtonGroup, self.BidList)
            self.DataGroup:DoLayout()
            -- self.top:DoLayout()
            self.currentDisplayMode = DISPLAY_MODE_VALUES

            if not isVisible then
                self.top:Hide() -- this helps to fix scaling issues with Ace3
            end
        end
    end
    if CONSTANTS.AUCTION_TYPES_OPEN[auctionInfo and auctionInfo:GetType()] then
        self.BidList:Show()
        local itemRows = UTILS.Saturate(numRows + 6, 1, 8)
        self.ItemList:SetDisplayRows(itemRows, 32)
    else
        self.BidList:Hide()
        local itemRows = UTILS.Saturate(numRows + 1, 1, 4)
        self.ItemList:SetDisplayRows(itemRows, 32)
    end
end

local function Create(self)
    LOG:Trace("BiddingManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    self.top = f

    f:SetTitle(CLM.L["Bidding"])
    f:SetLayout("table")
    f:EnableResize(false)
    f:SetHeight(BASE_HEIGHT)
    -- f.frame:SetScript("OnMouseWheel", (function(frame, delta)
    --     if IsControlKeyDown() then
    --         self.db.scale = UTILS.ResizeFrame(frame, (delta > 0), self.db.scale)
    --         RescaleLibCandyBar(self.bar, self.db.scale)
    --     end
    -- end))
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Bidding_GUI")
    -- self.barPreviousPercentageLeft = 1
    -- self.duration = 1

    local ItemList = CreateItemList(self)
    local DataGroup = CreateDataGroup(self)
    local listWidth = ItemList:GetWidth()
    f:SetWidth(DATA_GROUP_WIDTH + listWidth)
    f:SetUserData("table", { columns = {listWidth, DATA_GROUP_WIDTH}, alignV =  "top" })

    f:AddChild(ItemList)
    f:AddChild(DataGroup)

    UpdateUIStructure(self)

    -- self:SetInputValue(0)
    -- -- Handle onHide information passing whenever the UI is closed
    -- local oldOnHide = f.frame:GetScript("OnHide")
    -- f.frame:SetScript("OnHide", (function(...)
    --     CLM.MODULES.BiddingManager:NotifyHide()
    --     oldOnHide(...)
    -- end))
    -- Hide by default
    SetInputValue(self, 0)
    RestoreLocation(self)
    f:Hide()
end

local function RefreshItemList(self)
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if auction then
        local itemList = {}
        for id, auctionItem in pairs(auction:GetItems()) do
            local iconColor
            if not auctionItem:GetCanUse() then
                iconColor = colorRed
            elseif auctionItem:BidAccepted() then
                iconColor = colorGreen
            elseif auctionItem:BidDenied() then
                iconColor = colorGold
            end
            itemList[#itemList+1] = { cols = { {value = id, iconColor = iconColor}, {value = auctionItem} }}
        end
        self.ItemList:SetData(itemList)
    end
end

--------------
--- PUBLIC ---
--------------
function BiddingManagerGUI:Initialize()
    LOG:Trace("BiddingManagerGUI:Initialize()")
    InitializeDB(self)

    CreateConfig(self)

    Create(self)

    RegisterSlash(self)

    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function() StoreLocation(self) end))
end

function BiddingManagerGUI:SetVisibleAuctionItem(auctionItem)
    self.auctionItem = auctionItem
    self:Refresh()
end

local function BuildBidRow(name, response, roster, namedButtonMode)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
    local name, class, classColor, current = name, "", nil, 0
    if profile then
        class = profile:ClassInternal()
        classColor = UTILS.GetClassColor(profile:Class())
        current = roster:Standings(profile:GUID())
    end
    local bidTypeString
    if namedButtonMode then
        bidTypeString = roster:GetFieldName(response:Type())
        if not bidTypeString or bidTypeString == "" then bidTypeString = nil end
    end

    local items = response:Items()
    local primaryItem = items[1]
    local secondaryItem = items[2]
    if (not primaryItem) and secondaryItem then
        primaryItem = secondaryItem
        secondaryItem = nil
    end

    return {cols = {
            {value = class},
            {value = name, color = classColor},
            {value = response:Value(), text = bidTypeString, bidType = response:Type()},
            {value = current},
            {value = response:Roll()},
            {value = primaryItem},
            {value = secondaryItem},
        },
    }
end

function BiddingManagerGUI:RefreshBidList()
    local bidList = {}
    local item = self.auctionItem
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if item and auction then
        local namedButtonsMode = auction:GetNamedButtonsMode()
        local roster = auction:GetRoster()
        for name, response in pairs(item:GetAllResponses()) do
            if not CONSTANTS.BID_TYPE_HIDDEN[response:Type()] then -- TODO CONFIGURABLE
                bidList[#bidList+1] = BuildBidRow(name, response, roster, namedButtonsMode)
            end
        end
    end
    self.BidList:SetData(bidList)
end

function BiddingManagerGUI:Refresh()
    LOG:Trace("BiddingManagerGUI:Refresh()")
    -- if not self._initialized then return end

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(ITEM_REGISTRY)
    AceConfigDialog:Open(ITEM_REGISTRY, self.ItemGroup) -- Refresh the config gui panel
    AceConfigRegistry:NotifyChange(BID_REGISTRY)
    AceConfigDialog:Open(BID_REGISTRY, self.BiddingGroup) -- Refresh the config gui panel
    AceConfigRegistry:NotifyChange(BUTTON_REGISTRY)
    AceConfigDialog:Open(BUTTON_REGISTRY, self.ButtonGroup) -- Refresh the config gui panel
    UpdateUIStructure(self)
    RefreshItemList(self)

    self:RefreshBidList()
end

function BiddingManagerGUI:Toggle()
    LOG:Trace("BiddingManagerGUI:Toggle()")
    -- if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function BiddingManagerGUI:Show()
    LOG:Trace("BiddingManagerGUI:Show()")
    -- if not self._initialized then return end
    if not self.top:IsVisible() then
        self:Refresh()
        self.top:Show()
    end
end

function BiddingManagerGUI:Hide()
    LOG:Trace("BiddingManagerGUI:Hide()")
    -- if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
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
