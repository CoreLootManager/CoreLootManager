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
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local DISPLAY_MODE_VALUES  = 1
local DISPLAY_MODE_BUTTONS = 2

local colorGreen = {r = 0.27, g = 0.93, b = 0.27, a = 1.0}
local colorGold = {r = 0.93, g = 0.70, b = 0.13, a = 1.0}
local colorRed = {r = 0.93, g = 0.27, b = 0.2, a = 1.0}
local colorBlue = {r = 0.2, g = 0.2, b = 0.93, a = 1.0}
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

local DATA_GROUP_WIDTH = BASE_ACE_WIDTH*(rowMultiplier + 0.15) + (isElvUI and 15 or 0)
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
        barWidth = 340,
        closeOnBid = false,
        advanceOnBid = true
    })
end

local function ShowTestBar(self)
    self.testBar = CLM.MODELS.BiddingTimerBar:Test(
        {
            anchor = self.db.barLocation,
            width = self.db.barWidth,
            height = 25,
        }
    )
end

local function HideTestBar(self)
    if self.testBar then
        self.db.barLocation = { self.testBar:GetPoint() }
        self.testBar:Stop()
    end
    self.testBar = nil
end

local function ToggleTestBar(self)
    if CLM.MODULES.BiddingManager:IsAuctionInProgress() then return end
    if self.testBar then
        HideTestBar(self)
    else
        ShowTestBar(self)
    end
end

local function SetCloseOnBid(self, value)
    self.db.closeOnBid = value and true or false
end

local function GetCloseOnBid(self)
    return self.db.closeOnBid
end

local function SetAdvanceOnBid(self, value)
    self.db.advanceOnBid = value and true or false
end

local function GetAdvanceOnBid(self)
    return self.db.advanceOnBid
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
        },
        bidding_gui_advance_on_bid = {
            name = CLM.L["Advance to next item after bid"],
            desc = CLM.L["Toggle advancing to next item on the list after bid."],
            type = "toggle",
            set = function(i, v) SetAdvanceOnBid(self, v) end,
            get = function(i) return GetAdvanceOnBid(self) end,
            width = 2,
            order = 76
        },
        bidding_gui_bar_width = {
            name = CLM.L["Auction timer bar width"],
            desc = CLM.L["Changes auction timer bar width."],
            type = "range",
            min = 0,
            max = 1000,
            step = 1,
            set = function(i, v)
                v = tonumber(v) or 0
                if v < 0 then v = 0 end
                if v > 1000 then v = 1000 end
                self.db.barWidth = v

                if self.bar then
                    self.bar.bar:SetWidth(self.db.barWidth)
                elseif self.testBar then
                    self.testBar.bar:SetWidth(self.db.barWidth)
                end
            end,
            get = function(i) return self.db.barWidth end,
            order = 77,
            width = 1
        },
        bidding_gui_bar_test_bar = {
            name = CLM.L["Toggle test bar"],
            type = "execute",
            func = function()
                ToggleTestBar(self)
            end,
            order = 78,
            width = 1
        },
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
    if self.bar then
        self.db.barLocation = { self.bar:GetPoint() }
    end
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
                if GetAdvanceOnBid(self) then self:Advance() end
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
                if GetAdvanceOnBid(self) then self:Advance() end
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = rowMultiplier*0.3,
            order = 5
        }
    end
    local generateButtonOptions = {
        pass = {
            name = CLM.L["Pass"],
            desc = CLM.L["Notify that you are passing on the item."],
            type = "execute",
            func = (function()
                CLM.MODULES.BiddingManager:Pass(self.auctionItem and self.auctionItem:GetItemID() or 0)
                if GetAdvanceOnBid(self) then self:Advance() end
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
                CLM.MODULES.BiddingManager:CancelBid(self.auctionItem and self.auctionItem:GetItemID() or 0)
                if GetAdvanceOnBid(self) then self:Advance() end
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

    local doDisplayValue = (function() return true end)
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
                        if GetAdvanceOnBid(self) then self:Advance() end
                        if GetCloseOnBid(self) then self:Toggle() end
                    end),
                    order = offset
                }
                offset = offset + 1
                numButtons = numButtons + 1
            end
        end

        if (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING)
            -- and not generateButtonOptions[CONSTANTS.SLOT_VALUE_TIER.MAX]
            and not doDisplayValue(values[CONSTANTS.SLOT_VALUE_TIER.MAX]) then
            local width = generateButtonOptions[CONSTANTS.SLOT_VALUE_TIER.BASE] and (rowMultiplier/2) or rowMultiplier
            generateButtonOptions["all_in"] = {
                name = CLM.L["All In"],
                desc = sformat(CLM.L["Bid your current DKP (%s)."], ""),
                type = "execute",
                func = (function()
                    BidAllIn(self)
                    if GetAdvanceOnBid(self) then self:Advance() end
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
                        if GetAdvanceOnBid(self) then self:Advance() end
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
        desc = CLM.L["Notify that you are passing on the item."],
        type = "execute",
        func = (function()
            CLM.MODULES.BiddingManager:Pass(self.auctionItem and self.auctionItem:GetItemID() or 0)
            if GetAdvanceOnBid(self) then self:Advance() end
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
            CLM.MODULES.BiddingManager:CancelBid(self.auctionItem and self.auctionItem:GetItemID() or 0)
            if GetAdvanceOnBid(self) then self:Advance() end
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
            local rowData = table:GetRow(selection)
            if rowData then
                self:SetVisibleAuctionItem(rowData.cols[2].value)
                self:Refresh()
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

local prevBLH
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
        if isElvUI and prevBLH then
            self.BidList:SetHeight(prevBLH)
        end
        local itemRows = UTILS.Saturate(numRows + 6, 1, 8)
        self.ItemList:SetDisplayRows(itemRows, 32)
    else
        self.BidList:Hide()
        if isElvUI then
            prevBLH = self.BidList.frame:GetHeight()
            self.BidList:SetHeight(0)
        end

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
    f:SetWidth(DATA_GROUP_WIDTH + listWidth + (isElvUI and 30 or 0))
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
            local iconColor, note
            if not auctionItem:GetCanUse() then
                iconColor = colorRed
                note = CLM.L["Can't use"]
            elseif auctionItem:BidAccepted() then
                if CONSTANTS.BID_TYPE_REMOVING_BIDS[auctionItem:GetBid():Type()] then
                    iconColor = colorBlue
                    note = CLM.L["Pass"] .. " / " .. CLM.L["Cancel"]
                else
                    iconColor = colorGreen
                    note = CLM.L["Bid accepted!"]
                end
            elseif auctionItem:BidDenied() then
                iconColor = colorGold
                note = CLM.L["Bid denied!"]
            end
            itemList[#itemList+1] = { cols = { {value = id, iconColor = iconColor, note = note}, {value = auctionItem} }}
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

    self.ToggleTestBar = ToggleTestBar

    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function() StoreLocation(self) end))
end

function BiddingManagerGUI:Advance()
    if (self.nextItem > #self.auctionOrder) then self.nextItem = 1 end
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()

    self:SetVisibleAuctionItem(auction:GetItem(self.auctionOrder[self.nextItem]))
    self.nextItem = self.nextItem + 1
    self:Refresh()
end

local toggleCb = (function() BiddingManagerGUI:Toggle() end)
function BiddingManagerGUI:StartAuction()
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    self.auctionOrder = {}
    for id in pairs(auction:GetItems()) do
        self.auctionOrder[#self.auctionOrder+1] = id
    end
    self.nextItem = 1

    self:Advance()
    -- Hide Test Bar if present
    HideTestBar(self)
    -- Build Bar
    self.bar = CLM.MODELS.BiddingTimerBar:New(
        self.auctionItem,
        CLM.MODULES.BiddingManager:GetAuctionInfo(),
        {
            anchor = self.db.barLocation,
            width = self.db.barWidth,
            height = 25,
            callback = toggleCb
        }
    )
end

function BiddingManagerGUI:EndAuction()
    StoreLocation(self)
    if self.bar then
        self.bar:Stop()
    end
end

function BiddingManagerGUI:AntiSnipe()
    if self.bar then
        self.bar:UpdateTime(CLM.MODULES.BiddingManager:GetAuctionInfo():GetAntiSnipe())
    end
end

function BiddingManagerGUI:SetVisibleAuctionItem(auctionItem)
    self.auctionItem = auctionItem
    local values = self.auctionItem:GetValues()
    SetInputValue(self, values[CONSTANTS.SLOT_VALUE_TIER.BASE])
end

local function BuildBidRow(name, response, roster, namedButtonMode)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
    local class, classColor, current = "", nil, 0
    if profile then
        class = profile:ClassInternal()
        classColor = UTILS.GetClassColor(profile:Class())
        if roster:GetPointType() == CONSTANTS.POINT_TYPE.DKP then
            current = roster:Standings(profile:GUID())
        else
            current = roster:Priority(profile:GUID())
        end
    end
    local bidTypeString
    if namedButtonMode then
        bidTypeString = roster:GetFieldName(response:Type())
        if not bidTypeString or bidTypeString == "" then bidTypeString = nil end
    end
    local bidColor
    if response:Type() == CONSTANTS.BID_TYPE.OFF_SPEC then
        bidColor = colorTurquoise
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
            {value = response:Value(), text = bidTypeString, bidType = response:Type(), color = bidColor},
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

local function AutoUpdate(self)
    if CLM.MODULES.BiddingManager:GetAutoUpdateBidValue() then
        local item = self.auctionItem
        local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
        if item and auction then
            local value = item:GetHighestBid() + auction:GetIncrement()
            if value >= 0 then
                SetInputValue(self, value)
            end
        end
    end
end

local function UpdateBarInfo(self)
    if self.bar then
        self.bar:UpdateInfo(self.auctionItem)
    end
end

local function UpdateCurrentStandings(self)
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if not auction then return end
    local roster = CLM.MODULES.BiddingManager:GetAuctionInfo():GetRoster()
    if roster:IsProfileInRoster(whoamiGUID) then
        local value
        if roster:GetPointType() == CONSTANTS.POINT_TYPE.DKP then
            value = tostring(roster:Standings(whoamiGUID)) .. " " .. CLM.L["DKP"]
        else
            value = tostring(roster:Priority(whoamiGUID)) .. " " .. CLM.L["PR"]
        end
        self.top:SetTitle(CLM.L["Bidding"] .. " | " .. CLM.L["Current"] .. ": " .. value)
    end
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
    UpdateBarInfo(self)
    UpdateCurrentStandings(self)
    self:RefreshBidList()

    AutoUpdate(self)
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
    self.db.location = nil
    self.db.barLocation = nil
end

CLM.GUI.BiddingManager = BiddingManagerGUI
