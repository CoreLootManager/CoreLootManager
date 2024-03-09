-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

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
local colorGrey = {r = 0.62, g = 0.62, b = 0.62, a = 1}

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

local rowMultiplier = 2.7
local rowMultiplierBy2 = rowMultiplier/2
local rowMultiplierBy3 = rowMultiplier/3
local rowMultiplierBy4 = rowMultiplier/4
local rowMultiplierBy6 = rowMultiplier/6
local rowMultiplierBy9 = rowMultiplier/9
local ROW_HEIGHT = 25
local BASE_HEIGHT = 115
local BID_ROWS = 7
local BID_ROW_HEIGHT = 18
local BIDS_HEIGHT = ((BID_ROWS + 1) * BID_ROW_HEIGHT) + 5

local BASE_ROW_WIDTH = 170 -- Ace Row Width

local DATA_GROUP_WIDTH = BASE_ROW_WIDTH*(rowMultiplier + 0.15) + (isElvUI and 15 or 0)
local BID_INPUT_WIDTH  = BASE_ROW_WIDTH*rowMultiplierBy3

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
        advanceOnBid = true,
        hideInCombat = true,
        autoOpen = true,
        autoUpdateBidValue = false,
        includePasses = true,
        includeCancels = false
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

local function SetAutoOpen(self, value)
    self.db.autoOpen = value and true or false
end

local function GetAutoOpen(self)
    return self.db.autoOpen
end

local function SetAdvanceOnBid(self, value)
    self.db.advanceOnBid = value and true or false
end

local function GetAdvanceOnBid(self)
    return self.db.advanceOnBid
end

local function SetHideInCombat(self, value)
    self.db.hideInCombat = value and true or false
end

local function GetHideInCombat(self)
    return self.db.hideInCombat
end

local function SetAutoUpdateBidValue(self, value)
    self.db.autoUpdateBidValue = value and true or false
end

local function GetAutoUpdateBidValue(self)
    return self.db.autoUpdateBidValue
end

local function SetIncludePasses(self, value)
    self.db.includePasses = value and true or false
end

local function GetIncludePasses(self)
    return self.db.includePasses
end

local function SetIncludeCancels(self, value)
    self.db.includeCancels = value and true or false
end

local function GetIncludeCancels(self)
    return self.db.includeCancels
end

local function CreateConfig(self)
    local options = {
        bidding_header = {
            type = "header",
            name = CLM.L["Bidding"],
            order = 70
        },
          bidding_auto_update = {
            name = CLM.L["Enable auto-update bid values"],
            desc = CLM.L["Enable auto-update bid values when current highest bid changes (open auction only)."],
            type = "toggle",
            set = function(i, v) SetAutoUpdateBidValue(self, v) end,
            get = function(i) return GetAutoUpdateBidValue(self) end,
            width = "double",
            order = 72
        },
        bidding_auto_open = {
            name = CLM.L["Toggle Bidding auto-open"],
            desc = CLM.L["Toggle auto open and auto close on auction start and stop"],
            type = "toggle",
            set = function(i, v) SetAutoOpen(self, v) end,
            get = function(i) return GetAutoOpen(self) end,
            width = "double",
            order = 71
        },
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
        bidding_gui_hide_in_combat = {
            name = CLM.L["Hide in combat"],
            desc = CLM.L["Will hide bidding window if you enter combat and show it again when you exit. Will also delay auto opening if needed."],
            type = "toggle",
            set = function(i, v) SetHideInCombat(self, v) end,
            get = function(i) return GetHideInCombat(self) end,
            width = 1,
            order = 79
        },
        bidding_gui_include_passes = {
            name = CLM.L["Include passes"],
            desc = CLM.L["Include passes in bid list in open auction mode."],
            type = "toggle",
            set = function(i, v) SetIncludePasses(self, v) end,
            get = function(i) return GetIncludePasses(self) end,
            width = 1,
            order = 71.1
        },
        bidding_gui_include_cancels = {
            name = CLM.L["Include cancels"],
            desc = CLM.L["Include cancels in bid list in open auction mode."],
            type = "toggle",
            set = function(i, v) SetIncludeCancels(self, v) end,
            get = function(i) return GetIncludeCancels(self) end,
            width = 1,
            order = 72.1
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
    self.db.location[2] = nil
    if self.bar then
        self.db.barLocation = { self.bar:GetPoint() }
        self.db.barLocation[2] = nil
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
    if roster and roster:IsProfileInRoster(whoamiGUID) then
        local standings = roster:Standings(whoamiGUID)
        SetInputValue(self, standings)
        BidInputValue(self, CONSTANTS.BID_TYPE.MAIN_SPEC)
    end
end

local function OverrideNextItem(self, auctionItem)
    -- if (self.nextItem > #self.auctionOrder) then self.nextItem = 1 end
    local id = auctionItem:GetItemID()
    for i,itemId in ipairs(self.auctionOrder) do
        if itemId == id then
            self.nextItem = i + 1
            break
        end
    end
    if (self.nextItem > #self.auctionOrder) then self.nextItem = 1 end
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

local emptyTierValues = {}
do
    for _, tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
        emptyTierValues[tier] = 0
    end
end

local numRows
local function GenerateValueButtonsAuctionOptions(self, auction)
    local itemValueMode = auction and auction:GetMode() or CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED
    local useOS = auction and auction:GetUseOS()
    local auctionType = auction and auction:GetType() or 0

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
            width = (useOS and (isElvUI and 1.45 or 1.49) or (isElvUI and 2.95 or 2.99))*rowMultiplierBy6,
            order = 4
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
            width = isElvUI and (rowMultiplierBy6 - 0.05) or  rowMultiplierBy6,
            order = 6
        }
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
            width = (isElvUI and 1.45 or 1.49)*rowMultiplierBy6,
            order = 5
        }
    end
    local generateButtonOptions = {
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

    local values = self.auctionItem and self.auctionItem:GetValues() or emptyTierValues
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

        if (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) then
            generateButtonOptions["all_in"] = {
                name = CLM.L["All In"],
                desc = string.format(CLM.L["Bid your current DKP (%s)."], ""),
                type = "execute",
                func = (function()
                    BidAllIn(self)
                    if GetAdvanceOnBid(self) then self:Advance() end
                    if GetCloseOnBid(self) then self:Toggle() end
                end),
                order = offset
            }
            numButtons = numButtons + 1
        end

        if numButtons > 0 then
            numRows = numRows + 1
            local row_width = rowMultiplier/numButtons
            for _, buttonEntry in pairs(generateButtonOptions) do
                buttonEntry.width = row_width
            end
        end
    end

    self.top:SetHeight(BASE_HEIGHT + (CONSTANTS.AUCTION_TYPES_OPEN[auctionType] and BIDS_HEIGHT or 0) + (numRows*ROW_HEIGHT))

    bidOptions.args = generateBidOptions
    buttonOptions.args = generateButtonOptions
end

local function GenerateNamedButtonsAuctionOptions(self, auction)
    local options = {}
    local offset = 3
    local row_width = rowMultiplierBy2
    local numButtons = 0
    local usedTiers

    local itemValueMode = auction and auction:GetMode() or CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED

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

    local values = self.auctionItem and self.auctionItem:GetValues() or emptyTierValues
    if usedTiers then
        for _,tier in ipairs(usedTiers) do
            local value = tonumber(values[tier]) or 0
            local name = auction:GetFieldName(tier)
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
    local cancelPassWidth = rowMultiplierBy2
    if (numButtons %2 ~= 0) then
        cancelPassWidth = rowMultiplierBy4
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
        --         return CONSTANTS.AUCTION_TYPES_OPEN[auction:GetType()] and (CLM.MODULES.BiddingManager:GetLastBidValue() ~= nil)
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

    self.top:SetHeight(BASE_HEIGHT + (CONSTANTS.AUCTION_TYPES_OPEN[auction and auction:GetType()] and BIDS_HEIGHT or 0) + ((numRows)*ROW_HEIGHT))

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

    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()

    -- local shortItemLink = "item:" .. tostring(itemId)
    local namedButtonsMode = auction and auction:GetNamedButtonsMode() or false

    itemOptions.args = {
        icon = {
            name = "",
            type = "execute",
            image = icon,
            func = (function() end),
            tooltipHyperlink = itemLink,
            width = rowMultiplierBy9,
            order = 1
        },
        item = {
            name = "",
            type = "input",
            get = (function(i) return itemLink or "" end),
            set = (function(i,v) end), -- Intentionally: do not override
            width = 5*rowMultiplierBy9,
            order = 2,
            tooltipHyperlink = itemLink,
        },
        next = {
            name = CLM.L["Next"],
            desc = CLM.L["Next item"],
            type = "execute",
            func = (function()
                self:Advance()
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = (namedButtonsMode and 3 or 1.5)*rowMultiplierBy9,
            order = 4
        },
    }

    if namedButtonsMode then
        GenerateNamedButtonsAuctionOptions(self, auction)
    else
        itemOptions.args.pass = {
            name = CLM.L["Pass"],
            desc = CLM.L["Notify that you are passing on the item."],
            type = "execute",
            func = (function()
                CLM.MODULES.BiddingManager:Pass(self.auctionItem and self.auctionItem:GetItemID() or 0)
                if GetAdvanceOnBid(self) then self:Advance() end
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = 1.5*rowMultiplierBy9,
            order = 3
        }
        GenerateValueButtonsAuctionOptions(self, auction)
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
    -- BiddingGroup:SetWidth((7/3)*BID_BUTTON_WIDTH + BID_BUTTON_PADDING)
    BiddingGroup:SetWidth(2*BID_INPUT_WIDTH)
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
            if not (row or realrow) then return true end -- Disable sort
            UTILS.LibStSingleSelectClickHandler(table, nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            local _, selection = next(table:GetSelection())
            local rowData = table:GetRow(selection)
            if rowData then
                local auctionItem = data[realrow].cols[column].item
                OverrideNextItem(self, auctionItem)
                self:SetVisibleAuctionItem(auctionItem)
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
            -- GameTooltip:SetHyperlink("item:" .. (tonumber(rowData.cols[column].value) or 0))
            GameTooltip:SetHyperlink(rowData.cols[column].value or "item:0")
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
        {name = "", width = 18, DoCellUpdate = UTILS.LibStItemCellUpdate },
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

local originalBidListHeight -- ElvUI Workaround. fix it TODO
local function UpdateUIStructure(self)
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if (auction and auction:GetNamedButtonsMode() or false) then
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
    if CONSTANTS.AUCTION_TYPES_OPEN[auction and auction:GetType()] then
        self.BidList:Show()
        if isElvUI and originalBidListHeight then
            self.BidList:SetHeight(originalBidListHeight)
        end
        local itemRows = UTILS.Saturate(numRows + 6, 1, 8)
        self.ItemList:SetDisplayRows(itemRows, 32)
    else
        if isElvUI and not originalBidListHeight then
            originalBidListHeight = self.BidList.frame:GetHeight()
            self.BidList:SetHeight(0)
        end
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

function BiddingManagerGUI:RefreshItemList()
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if auction then
        local itemList = {}
        local current = self.auctionItem
        for _, auctionItem in pairs(auction:GetItems()) do
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
            if current and current:GetItemID() == auctionItem:GetItemID() then
                iconColor = colorTurquoise
            end
            local total = auctionItem:GetTotal()
            local textColor
            if total > 1 then
                textColor = { r = 0.2, g = 0.8, b = 0.2, a = 1.0 }
            else
                textColor = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
            end
            itemList[#itemList+1] = { cols = { {value = auctionItem:GetItemLink(), item = auctionItem, iconColor = iconColor, note = note, overlay = { text = total, color = textColor } }}}
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
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_REGEN_DISABLED"}, (function()
        if GetHideInCombat(self) then
            if self.top:IsVisible() then
                self.showAfterCombat = true
                self:HideDelayed()
            end
        end
    end))
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_REGEN_ENABLED"}, (function()
        if self.showAfterCombat then
            self.showAfterCombat = nil

            if not CLM.MODULES.BiddingManager:IsAuctionInProgress() then return end
            self:ShowDelayed()
        end
    end))
    self._initialized = true
end

function BiddingManagerGUI:Advance()
    if (self.nextItem > #self.auctionOrder) then self.nextItem = 1 end
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    self:SetVisibleAuctionItem(auction:GetItem(self.auctionOrder[self.nextItem]))
    self.nextItem = self.nextItem + 1
    self:Refresh()
end

function BiddingManagerGUI:BuildBidOrder()
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()

    self.auctionOrder = {}
    self.nextItem = 1
    if not auction then return end

    for id in pairs(auction:GetItems()) do
        self.auctionOrder[#self.auctionOrder+1] = id
    end

    self:Advance()
end

local toggleCb = (function() BiddingManagerGUI:Toggle() end)
function BiddingManagerGUI:StartAuction()
    self:BuildBidOrder()
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

    if GetAutoOpen(self) then
        if GetHideInCombat(self) and InCombatLockdown() then
            self.showAfterCombat = true

        else
            self:Show()
        end
    end
    -- if self.top:IsVisible() then
    --     self.showAfterCombat = true
    --     self:Show()
    -- end
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
    if not auctionItem then return end
    local values = self.auctionItem:GetValues()
    local bid = self.auctionItem:GetBid()
    local value
    if bid then
        value = bid:Value()
    else
        value = values[CONSTANTS.SLOT_VALUE_TIER.BASE]
    end

    SetInputValue(self, value)
end

local function BuildBidRow(name, response, roster, namedButtonMode, auction)
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
    local class, classColor, current = "", nil, 0
    if profile then
        class = profile:ClassInternal()
        classColor = UTILS.GetClassColor(profile:Class())
        if roster then
            if roster:GetPointType() == CONSTANTS.POINT_TYPE.DKP then
                current = roster:Standings(profile:GUID())
            else
                current = roster:Priority(profile:GUID())
            end
        end
    end
    local bidTypeString
    if namedButtonMode then
        bidTypeString = auction:GetFieldName(response:Type())
        if not bidTypeString or bidTypeString == "" then bidTypeString = nil end
    end
    local bidColor
    if response:Type() == CONSTANTS.BID_TYPE.OFF_SPEC then
        bidColor = colorTurquoise
    end
    local color, desaturate
    if CONSTANTS.BID_TYPE_HIDDEN[response:Type()] then
        color = colorGrey
        desaturate = true
        bidTypeString = response:Type() == CONSTANTS.BID_TYPE.CANCEL and CLM.L["Cancel"] or CLM.L["Pass"]
    end
    local data = {
        {value = class, color = color, desaturate = desaturate},
        {value = name, color = color or classColor},
        {value = response:Value(), text = bidTypeString, bidType = response:Type(), color = color or bidColor},
        {value = current, color = color},
        {value = response:Roll(), color = color},
    }

    local items = response:Items()
    local emptyItems = 5-#items
    for _=1,emptyItems do
        data[#data+1] = {}
    end
    for _, item in ipairs(items) do
        data[#data+1] = {value = item, desaturate = desaturate}
    end

    return {cols = data}
end

function BiddingManagerGUI:RefreshBidList()
    local bidList = {}
    local item = self.auctionItem
    local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
    if item and auction then
        local namedButtonsMode = auction:GetNamedButtonsMode()
        local roster = auction:GetRoster()
        for name, response in pairs(item:GetAllResponses()) do
            local include = true
            if (response:Type() == CONSTANTS.BID_TYPE.CANCEL and not GetIncludeCancels(self)) or
               (response:Type() == CONSTANTS.BID_TYPE.PASS and not GetIncludePasses(self)) then
                include = false
            end
            if include then
                bidList[#bidList+1] = BuildBidRow(name, response, roster, namedButtonsMode, auction)
            end
        end
    end
    self.BidList:SetData(bidList)
end

local function AutoUpdate(self)
    if GetAutoUpdateBidValue(self) then
        local item = self.auctionItem
        if not item then return end
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
    if roster and roster:IsProfileInRoster(whoamiGUID) then
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
    if not self._initialized then return end

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(ITEM_REGISTRY)
    AceConfigDialog:Open(ITEM_REGISTRY, self.ItemGroup) -- Refresh the config gui panel
    AceConfigRegistry:NotifyChange(BID_REGISTRY)
    AceConfigDialog:Open(BID_REGISTRY, self.BiddingGroup) -- Refresh the config gui panel
    AceConfigRegistry:NotifyChange(BUTTON_REGISTRY)
    AceConfigDialog:Open(BUTTON_REGISTRY, self.ButtonGroup) -- Refresh the config gui panel
    UpdateUIStructure(self)
    self:RefreshItemList()
    UpdateBarInfo(self)
    UpdateCurrentStandings(self)
    self:RefreshBidList()

    AutoUpdate(self)
end

function BiddingManagerGUI:Toggle()
    LOG:Trace("BiddingManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self:Hide()
    else
        self:Refresh()
        self:Show()
    end
end

function BiddingManagerGUI:Show()
    LOG:Trace("BiddingManagerGUI:Show()")
    if not self._initialized then return end
    if not self.top:IsVisible() then
        self:Refresh()
        self.top:Show()
    end
end

function BiddingManagerGUI:Hide()
    LOG:Trace("BiddingManagerGUI:Hide()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    end
end

function BiddingManagerGUI:ShowDelayed()
    LOG:Trace("BiddingManagerGUI:ShowDelayed()")
    if not self._initialized then return end
    if not self.top:IsVisible() then
        self:Refresh()
        self.top:Show()
        UTILS.FadeIn(self.top.frame, 0.3)
    end
end

local function HideInternal()
    BiddingManagerGUI.top:Hide()
    BiddingManagerGUI.top.frame:SetAlpha(1)
end

function BiddingManagerGUI:HideDelayed()
    LOG:Trace("BiddingManagerGUI:HideDelayed()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        UTILS.FadeOut(self.top.frame, 0.3, 1, 0, {
            finishedFunc = HideInternal
        })
    end
end

-- function BiddingManagerGUI:HideIfDone()
--     LOG:Trace("BiddingManagerGUI:HideIfDone()")
--     if not self._initialized then return end
--     if self.top:IsVisible() then
--         local auction = CLM.MODULES.BiddingManager:GetAuctionInfo()
--         if auction then

--             self.top:Hide()
--         end
--     end
-- end

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
