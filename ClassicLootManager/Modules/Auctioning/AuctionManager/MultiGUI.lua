---@diagnostic disable: param-type-mismatch
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

local ITEM_REGISTRY = "clm_am_item_options"
local AUCTION_REGISTRY = "clm_am_auction_options"
local AWARD_REGISTRY = "clm_am_award_options"

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

-- 3.5 columns + 20
local BASE_WIDTH  = 605 + (isElvUI and 15 or 0)

local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}
-- local colorYellow = {r = 0.93, g = 0.93, b = 0.2, a = 1.0}
local colorGold = {r = 0.93, g = 0.70, b = 0.13, a = 1.0}
local colorTurquoise = {r = 0.2, g = 0.93, b = 0.93, a = 1.0}
local colorRedTransparent = {r = 0.93, g = 0.27, b = 0.2, a = 0.3}
-- local colorGreenTransparent = {r = 0.2, g = 0.93, b = 0.2, a = 0.3}
-- local colorBlueTransparent = {r = 0.2, g = 0.27, b = 0.93, a = 0.3}

local highlightInvalid = UTILS.getHighlightMethod(colorRedTransparent, true)

local tooltip = CreateFrame("GameTooltip", "CLMAuctionManagerGUIDialogTooltip", UIParent, "GameTooltipTemplate")

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('auction2', {
        location = {nil, nil, "CENTER", 0, 0 }
    })
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
    self.db.location[2] = nil
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

local function UpdateAwardPrice(self)
    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    self.awardPrice = UTILS.round((self.awardValue * self.awardMultiplier) + (auction:GetTax() or 0), auction:GetRounding())
end

local function SetInputAwardValue(self, value)
    self.awardValue = tonumber(value) or 1
    UpdateAwardPrice(self)
end

local function SetInputAwardMultiplier(self, value)
    self.awardMultiplier = tonumber(value) or 1
    UpdateAwardPrice(self)
end

local function disableInProgress()
    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    return auction:IsInProgress()
end

local function genericDisable()
    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    return auction:IsInProgress() or auction:IsEmpty() or auction:IsAcceptingRolls()
end

local function GenerateItemOptions(self)
    local icon, itemLink = "Interface\\Icons\\INV_Misc_QuestionMark", "item:0"
    self.note = ""
    local auctionItem = self.auctionItem
    if auctionItem and not auctionItem.item:IsItemEmpty() then
---@diagnostic disable-next-line: cast-local-type
        _, _, _, _, icon = GetItemInfoInstant(auctionItem:GetItemID())
        itemLink = auctionItem:GetItemLink()
    end

    local options = {
        icon = {
            name = "",
            type = "execute",
            image = icon,
            func = (function() end),
            width = 0.25,
            order = 1,
            tooltipHyperlink = itemLink,
        },
        item = {
            name = CLM.L["Item"],
            type = "input",
            get = (function(i) return auctionItem and auctionItem:GetItemLink() or "" end),
            set = (function(i,v)
                if v and GetItemInfoInstant(v) then -- validate if it is an itemLink or itemString or itemId
                    local itemID = GetItemInfoInstant(v)
                    if tostring(itemID) == v then
                        CLM.MODULES.AuctionManager:AddItemById(itemID, function(ai) self:SetVisibleAuctionItem(ai) end)
                    else
                        CLM.MODULES.AuctionManager:AddItemByLink(v, function(ai) self:SetVisibleAuctionItem(ai) end)
                    end
                end
            end),
            disabled = disableInProgress,
            width = 1.25,
            order = 2,
            tooltipHyperlink = itemLink,
        },
        note = {
            name = CLM.L["Note"],
            type = "input",
            set = (function(i,v)
                if auctionItem then
                    CLM.MODULES.AuctionManager:SetItemNote(auctionItem, tostring(v))
                end
            end),
            get = (function(i)
                local note = ""
                if auctionItem then
                    note = auctionItem:GetNote()
                end
                return note
            end),
            disabled = genericDisable,
            width = 1.5,
            order = 3
        }
    }

    -- TODO: Names of buttons instead of general
    local auction
    if CLM.MODULES.RaidManager:IsInRaid() then
        auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    end
    local order = 4
    local buttonOrder = {order, order + 4}
    for j,key in ipairs({CONSTANTS.SLOT_VALUE_TIER.BASE, CONSTANTS.SLOT_VALUE_TIER.MAX}) do
        options["value_"..key] = {
            name = UTILS.GetAuctionConditionalFieldName(key, auction),
            type = "input",
            set = (function(i,v)
                if self.auctionItem then
                    self.auctionItem.values[key] = tonumber(v) or 0
                end
            end),
            get = (function(i) return self.auctionItem and tostring(self.auctionItem.values[key] or 0) or "0" end),
            disabled = genericDisable,
            pattern = CONSTANTS.REGEXP_FLOAT,
            width = 0.75,
            order = buttonOrder[j]
        }
    end
    order = order + 1
    -- TODO: Display below only if using tiered mode
    for _,key in ipairs({CONSTANTS.SLOT_VALUE_TIER.SMALL, CONSTANTS.SLOT_VALUE_TIER.MEDIUM, CONSTANTS.SLOT_VALUE_TIER.LARGE,}) do
        options["value_"..key] = {
            name = UTILS.GetAuctionConditionalFieldName(key, auction),
            type = "input",
            set = (function(i,v)
                if self.auctionItem then
                    self.auctionItem.values[key] = tonumber(v) or 0
                end
            end),
            get = (function(i) return self.auctionItem and tostring(self.auctionItem.values[key] or 0) or "0" end),
            disabled = genericDisable,
            pattern = CONSTANTS.REGEXP_FLOAT,
            width = 0.5,
            order = order
       }
       order = order + 1
   end

    return options
end

local itemOptions = {
    type = "group",
    args = {}
}
local function UpdateItemOptions(self)
    itemOptions.args = GenerateItemOptions(self)
end

local function CreateItemOptions(self, width)
    local ItemOptionsGroup = AceGUI:Create("SimpleGroup")
    ItemOptionsGroup:SetLayout("Flow")
    ItemOptionsGroup:SetWidth(width - 5)
    self.ItemOptionsGroup = ItemOptionsGroup
    UpdateItemOptions(self)
    AceConfigRegistry:RegisterOptionsTable(ITEM_REGISTRY, itemOptions)
    AceConfigDialog:Open(ITEM_REGISTRY, ItemOptionsGroup)

    return ItemOptionsGroup
end

local function CreateLootList(self)
    local ItemList = AceGUI:Create("CLMLibScrollingTable")
    self.ItemList = ItemList
    ItemList:SetHeaderless()
    ItemList:SetDisplayRows(16, 32)
    ItemList:SetDisplayCols({
        { name = "",  width = 32, DoCellUpdate = UTILS.LibStItemCellUpdate }, -- Icon
        -- { name = "", width = 255 }
    })
    ItemList:RegisterEvents({
        OnClick = (function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            if not (row or realrow) then return true end -- Disable sort
            UTILS.LibStSingleSelectClickHandler(table, --[[RightClickMenu]]nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            local _, selection = next(table:GetSelection())
            local dataRow = table:GetRow(selection)
            if dataRow then
                local item = dataRow.cols[2].value
                if button == "RightButton" then
                    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
                    if auction:IsInProgress() then
                        LOG:Message(CLM.L["Removing items not allowed during auction."])
                    else
                        if IsControlKeyDown() then
                            LOG:Message(CLM.L["Removing %s from current queue."], item:GetItemLink())
                            CLM.MODULES.AuctionManager:RemoveItemFromCurrentAuction(item)
                            self.auctionitem = nil
                        else
                            LOG:Message(CLM.L["Moving %s from current queue to pending queue."], item:GetItemLink())
                            CLM.MODULES.AuctionManager:MoveItemToPendingList(item)
                        end
                        self:Refresh()
                    end
                else
                    self:SetVisibleAuctionItem(item)
                end
            end
            self.BidList:ClearSelection()
            return true
        end),
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            GameTooltip:SetOwner(rowFrame, "ANCHOR_LEFT")
            -- GameTooltip:SetHyperlink("item:" .. (tostring(rowData.cols[column].value) or 0))
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

local function GenerateAwardOptions(self)
    local options = {
        clear = {
            name = CLM.L["Clear"],
            desc = CLM.L["Remove all items from auction list. Populates new one if there are any pending."],
            type = "execute",
            func = (function() CLM.MODULES.AuctionManager:ClearItemList() end),
            confirm = true,
            disabled = disableInProgress,
            width = 0.5,
            order = 0,
        },
        clear_toggle = {
            name = CLM.L["Remove on award"],
            -- name = CLM.L["Remove"],
            desc = CLM.L["Remove item from auction list after it's awarded."],
            type = "toggle",
            set = (function(i, v) self.removeOnAward = v and true or false end),
            get = (function(i) return self.removeOnAward end),
            disabled = genericDisable,
            width = 0.8,
            order = 1,
        },
        award_multiplier = {
            name = CLM.L["Multiplier"],
            type = "input",
            set = (function(i,v) SetInputAwardMultiplier(self, v) end),
            get = (function(i) return tostring(self.awardMultiplier) end),
            disabled = genericDisable,
            width = 0.5,
            order = 3
        },
        award_value = {
            name = CLM.L["Value"],
            type = "input",
            set = (function(i,v) SetInputAwardValue(self, v) end),
            get = (function(i) return tostring(self.awardValue) end),
            disabled = genericDisable,
            width = 0.5,
            order = 4
        },
        award = {
            name = CLM.L["Award"],
            type = "execute",
            func = (function()
                CLM.MODULES.AuctionManager:Award(self.auctionItem, self.awardPlayer, self.awardPrice)
                self.BidList:ClearSelection()
                if self.removeOnAward then
                    CLM.MODULES.AuctionManager:RemoveItemFromCurrentAuction(self.auctionItem)
                    self.auctionItem = nil
                end
                self.awardPlayer = nil
                self:Refresh()
            end),
            confirm = (function()
                local roster = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo():GetRoster()
                return string.format(
                    CLM.L["Are you sure, you want to award %s to %s for %s %s?"],
                    self.auctionItem:GetItemLink(),
                    UTILS.ColorCodeText(self.awardPlayer, "FFD100"),
                    tostring(self.awardPrice),
                    (roster and roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP) and CLM.L["GP"] or CLM.L["DKP"]
                )
            end),
            width = 0.5,
            order = 5,
            disabled = (function() return genericDisable() or not self.awardPlayer end),
        },
        disenchant = {
            name = CLM.L["Disenchant"],
            type = "execute",
            func = (function()
                CLM.MODULES.AuctionManager:Disenchant(self.auctionItem)
                self.BidList:ClearSelection()
                if self.removeOnAward then
                    CLM.MODULES.AuctionManager:RemoveItemFromCurrentAuction(self.auctionItem)
                    self.auctionItem = nil
                end
                self.awardPlayer = nil
                self:Refresh()
            end),
            confirm = (function()
                return string.format(CLM.L["Are you sure, you want to disenchant %s?"], self.auctionItem:GetItemLink())
            end),
            control = "CLMIconNoLabel",
            width = 0.2,
            order = 6,
            image = "Interface\\Buttons\\UI-GroupLoot-DE-Up",
            -- image = "Interface\\AddOns\\ClassicLootManager\\Media\\Buttons\\delete2.tga",
            disabled = genericDisable,
        }
    }
    return options
end

local awardOptions = {
    type = "group",
    args = {}
}

local function UpdateAwardOptions(self)
    awardOptions.args = GenerateAwardOptions(self)
end

local function CreateAwardOptions(self, width)
    local AwardOptionsGroup = AceGUI:Create("SimpleGroup")
    AwardOptionsGroup:SetLayout("Flow")
    AwardOptionsGroup:SetWidth(width - 5)
    self.AwardOptionsGroup = AwardOptionsGroup
    UpdateAwardOptions(self)
    AceConfigRegistry:RegisterOptionsTable(AWARD_REGISTRY, awardOptions)
    AceConfigDialog:Open(AWARD_REGISTRY, AwardOptionsGroup)

    return AwardOptionsGroup
end

local function ST_GetPlayerClass(row)
    return row.cols[1].value
end

local function ST_GetPlayerName(row)
    return row.cols[2].value
end

local function ST_GetPlayerBidValue(row)
    return row.cols[3].value
end

local function ST_GetPlayerBidType(row)
    return row.cols[3].bidType
end

local function UpdateBids(self, cutoff, type)
    LOG:Trace("AuctionManagerGUI:UpdateAwardValue()")
    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    local bidType = type
    if auction:GetNamedButtonsMode() then
        bidType = nil
    end
    local max, second = self.auctionItem:GetTopBids(cutoff, bidType)
    local values = self.auctionItem:GetValues()
    local isVickrey = (auction:GetType() ==  CONSTANTS.AUCTION_TYPE.VICKREY)
    if isVickrey then
        if second.bid == 0 then
            SetInputAwardValue(self, values[CONSTANTS.SLOT_VALUE_TIER.BASE] or 0)
        else
            SetInputAwardValue(self, second.bid)
        end
    else
        SetInputAwardValue(self, max.bid)
    end
end

local function CreateBidList(self)
    local BidList = AceGUI:Create("CLMLibScrollingTable")
    self.BidList = BidList
    BidList:SetDisplayRows(12, 18)

    self:BuildColumns()

    BidList:RegisterEvents({
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if rowData and rowData.invalidReason then
                tooltip:SetOwner(cellFrame, "ANCHOR_LEFT")
                tooltip:AddLine(UTILS.ColorCodeText(CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[rowData.invalidReason] or CLM.L["Unknown"], "ee4444"))
                tooltip:Show()
            end
            return table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            tooltip:Hide()
            if rowData and rowData.highlightFn then
                rowData.highlightFn(rowFrame, cellFrame, data, cols, row, realrow, column, true, table, ...)
            end
            return status
        end),
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            if not (row or realrow) then return true end -- Disable sort
            UTILS.LibStSingleSelectClickHandler(table, --[[UnifiedGUI_Raids.RightClickMenu]]nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            local _, selection = next(table:GetSelection())
            local selected = table:GetRow(selection)
            if selected then
                self.awardPlayer = ST_GetPlayerName(selected)
                local multiplier = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo():GetAwardMultiplier(ST_GetPlayerClass(selected), self.auctionItem:GetItemID())
                SetInputAwardMultiplier(self, multiplier)
                UpdateBids(self, ST_GetPlayerBidValue(selected), ST_GetPlayerBidType(selected))
                self:Refresh()
            end
            return true
        end
    })
    return BidList
end

local function GenerateAuctionOptions(self)
    local options = {
        auction_header = {
            name = CLM.L["Auction settings"],
            type = "header",
            width = "full",
            order = 0
        },
        auction_filler = {
            name = "",
            desc = "",
            type = "description",
            width = 0.75+0.25,
            order = 1,
        },
        time_auction = {
            name = CLM.L["Auction length"],
            type = "input",
            set = (function(i,v) CLM.MODULES.AuctionManager:SetAuctionTime(v) end),
            get = (function(i) return tostring(CLM.MODULES.AuctionManager:GetAuctionTime()) end),
            disabled = genericDisable,
            pattern = "%d+",
            width = 0.5,
            order = 2
        },
        time_antiSnipe = {
            name = CLM.L["Anti-snipe"],
            type = "input",
            set = (function(i,v) CLM.MODULES.AuctionManager:SetAntiSnipe(v) end),
            get = (function(i) return tostring(CLM.MODULES.AuctionManager:GetAntiSnipe()) end),
            disabled = genericDisable,
            pattern = "%d+",
            width = 0.5,
            order = 3
        },
        auction = {
            name = (function() return CLM.MODULES.AuctionManager:IsAuctionInProgress() and CLM.L["Stop"] or CLM.L["Start"] end),
            type = "execute",
            func = (function()
                if CLM.MODULES.AuctionManager:IsAuctionInProgress() then
                    CLM.MODULES.AuctionManager:StopAuctionManual()
                else
                    CLM.MODULES.AuctionManager:StartAuction()
                end
                self:Refresh()
            end),
            width = 0.8,
            order = 4,
            disabled = (function()
                local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
                return auction:IsEmpty() or auction:IsAcceptingRolls()
            end)
        },
        roll = {
            name = (function() return (CLM.MODULES.AuctionManager:IsAcceptingRolls() and CLM.L["Stop"] or CLM.L["Start"])  .. " " .. CLM.L["Roll"] end),
            type = "execute",
            func = (function()
                if CLM.MODULES.AuctionManager:IsAcceptingRolls() then
                    CLM.MODULES.AuctionManager:StopRoll()
                else
                    CLM.MODULES.AuctionManager:StartRoll(self.auctionItem:GetItemID())
                end
            end),
            control = "CLMIconNoLabel",
            width = 0.2,
            order = 4.5,
            image = "Interface\\Buttons\\UI-GroupLoot-Dice-Up",
            disabled = (function()
                return CLM.MODULES.AuctionManager:GetCurrentAuctionInfo():IsEmpty() or
                        not self.auctionItem or
                        CLM.MODULES.AuctionManager:IsAuctionInProgress()
            end)
        },
        bidding_header = {
            name = CLM.L["Bidding"],
            type = "header",
            width = "full",
            order = 10
        },
        -- bid_stats_info = {
        --     name = "Info",
        --     desc = (function()
        --         -- Legend
        --         if not CLM.MODULES.RaidManager:IsInActiveRaid() or self.raid == nil then return CLM.L["Not in raid"] end
        --         -- Unique did any action dict
        --         local didAnyAction = {}
        --         -- generateInfo closure
        --         local _generateInfo = (function(dataDict, ignoreListOfDicts, prefix, skipAction)
        --             local dataList, userCodedString = {}, ""
        --             for p,_ in pairs(dataDict) do
        --                 local inIgnoreList = false
        --                 for _,d in ipairs(ignoreListOfDicts) do
        --                     if d[p] then
        --                         inIgnoreList = true
        --                         break
        --                     end
        --                 end
        --                 if not inIgnoreList then
        --                     tinsert(dataList, p)
        --                     if not skipAction then
        --                         didAnyAction[p] = true
        --                     end
        --                 end
        --             end
        --             local count = #dataList
        --             if count > 0 then
        --                 userCodedString = "\n\n" .. UTILS.ColorCodeText(prefix .. ": ", "EAB221")
        --                 for i= 1, count do
        --                     local profile = CLM.MODULES.ProfileManager:GetProfileByName(dataList[i])
        --                     local coloredName = dataList[i]
        --                     if profile then
        --                         coloredName = UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex)
        --                     end
        --                     userCodedString = userCodedString .. coloredName
        --                     if i ~= count then
        --                         userCodedString = userCodedString .. ", "
        --                     end
        --                 end
        --             end
        --             return count, userCodedString
        --         end)
        --         for p,_ in pairs(CLM.MODULES.AuctionManager:Bids()) do
        --             didAnyAction[p] = true
        --         end
        --         -- passess list
        --         local _, passed = _generateInfo(
        --             CLM.MODULES.AuctionManager:Passes(),
        --                                     { CLM.MODULES.AuctionManager:Bids() },
        --                                     "Passed")
        --         -- cant use actions
        --         local _, cantUse = _generateInfo(
        --             CLM.MODULES.AuctionManager:CantUse(),
        --                                         { CLM.MODULES.AuctionManager:Bids(), CLM.MODULES.AuctionManager:Passes() },
        --                                         "Can't use")
        --         -- closed actions
        --         local _, closed = _generateInfo(CLM.MODULES.AuctionManager:Hidden(),
        --                                     { CLM.MODULES.AuctionManager:Bids(), CLM.MODULES.AuctionManager:Passes(), CLM.MODULES.AuctionManager:CantUse() },
        --                                     "Closed")
        --         -- no action
        --         local raidersDict = {}
        --         for _,GUID in ipairs(self.raid:Players()) do
        --             local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
        --             if profile then
        --                 raidersDict[profile:Name()] = true
        --             end
        --         end
        --         local _, noAction = _generateInfo(raidersDict,
        --                             { CLM.MODULES.AuctionManager:Bids(), CLM.MODULES.AuctionManager:Passes(), CLM.MODULES.AuctionManager:CantUse(), CLM.MODULES.AuctionManager:Hidden() },
        --                             "No action", true)
        --         -- did any actions count
        --         local didAnyActionCount = 0
        --         for _,_ in pairs(didAnyAction) do didAnyActionCount = didAnyActionCount + 1 end
        --         -- Stats
        --         local stats = string.format("%d/%d %s", didAnyActionCount, #self.raid:Players(), "total")
        --         -- Result
        --         return stats .. passed .. cantUse .. closed .. noAction
        --     end),
        --     type = "execute",
        --     func = (function() end),
        --     image = "Interface\\Icons\\INV_Misc_QuestionMark",
        --     width = 0.25,
        --     order = 6
        -- }
    }
    return options
end

local auctionOptions = {
    type = "group",
    args = {}
}

local function UpdateAuctionOptions(self)
    auctionOptions.args = GenerateAuctionOptions(self)
end

local function CreateAuctionOptions(self, width)
    local AuctionOptionsGroup = AceGUI:Create("SimpleGroup")
    AuctionOptionsGroup:SetLayout("Flow")
    AuctionOptionsGroup:SetWidth(width - 5)
    self.AuctionOptionsGroup = AuctionOptionsGroup
    UpdateAuctionOptions(self)
    AceConfigRegistry:RegisterOptionsTable(AUCTION_REGISTRY, auctionOptions)
    AceConfigDialog:Open(AUCTION_REGISTRY, AuctionOptionsGroup)

    return AuctionOptionsGroup
end

local function Create(self)
    LOG:Trace("AuctionManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Auctioning"])
    f:SetLayout("table")
    f:EnableResize(false)
    f:SetHeight(570)
    f:SetWidth(BASE_WIDTH)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Auctioning_MultiGUI")

    -- Display placeholders
    self.item = nil
    self.note = ""
    self.awardValue = 0
    self.awardMultiplier = 1
    self.awardPrice = 0
    self.removeOnAward = CLM.MODULES.AuctionManager:GetDefaultRemoveOnAward()

    local ItemList = CreateLootList(self)
    local listWidth = ItemList:GetWidth()
    self.dataWidth = BASE_WIDTH - listWidth - 20
    f:SetUserData("table", { columns = {listWidth, self.dataWidth}, alignV =  "top" })
    local DataGroup = AceGUI:Create("SimpleGroup")
    DataGroup:SetLayout("Flow")
    DataGroup:SetWidth(self.dataWidth)
    DataGroup:AddChild(CreateItemOptions(self, self.dataWidth))
    DataGroup:AddChild(CreateAuctionOptions(self, self.dataWidth))
    DataGroup:AddChild(CreateBidList(self, self.dataWidth))
    DataGroup:AddChild(CreateAwardOptions(self, self.dataWidth))

    f:AddChild(ItemList)
    f:AddChild(DataGroup)

    -- Clear active bid on close
    -- f:SetCallback('OnClose', function() self:ClearSelectedBid() end)

    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

local function RegisterSlash(self)
    local options = {
        auction = {
            type = "execute",
            name = "Auctioning",
            desc = CLM.L["Toggle Auctioning window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

local AuctionManagerGUI = {}
function AuctionManagerGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    -- Database
    InitializeDB(self)
    -- External
    self.externalColumns = {}
    -- Create GUIs
    Create(self)
    -- Events
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function() StoreLocation(self) end))
    -- Slash
    RegisterSlash(self)
    -- Done
    self._initialized = true
end

function AuctionManagerGUI:BuildColumns()
    local totalWidth = self.dataWidth - 37
    local columns = {
        { name = "", width = 18, DoCellUpdate = UTILS.LibStClassCellUpdate },
        {name = CLM.L["Name"],  width = 100,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        },
        {name = CLM.L["Bid"],   width = 100, color = colorGreen,
            sort = ScrollingTable.SORT_DSC,
            sortnext = 4,
            align = "CENTER",
            DoCellUpdate = (function(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                table.DoCellUpdate(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                frame.text:SetText(data[realrow].cols[column].text or data[realrow].cols[column].value)
            end)
        },
        {name = CLM.L["Current"],  width = 80, color = {r = 0.93, g = 0.70, b = 0.13, a = 1.0},
            -- sort = ScrollingTable.SORT_DSC, -- This Sort disables nexsort of others relying on this column
            sortnext = 5,
            align = "CENTER"
        },
        {name = CLM.L["Roll"],  width = 40, color = {r = 0.93, g = 0.70, b = 0.13, a = 1.0},
            sortnext = 2,
            align = "CENTER"
        },
    }
    -- Add external columns
    for _, externalColumn in ipairs(self.externalColumns) do
        columns[#columns+1] = externalColumn.column
    end
    -- Items
    columns[#columns+1] = {name = "", width = 18, align = "CENTER", DoCellUpdate = UTILS.LibStItemCellUpdate }
    columns[#columns+1] = {name = "", width = 18, align = "CENTER", DoCellUpdate = UTILS.LibStItemCellUpdate }
    columns[#columns+1] = {name = "", width = 18, align = "CENTER", DoCellUpdate = UTILS.LibStItemCellUpdate }
    columns[#columns+1] = {name = "", width = 18, align = "CENTER", DoCellUpdate = UTILS.LibStItemCellUpdate }
    columns[#columns+1] = {name = "", width = 18, align = "CENTER", DoCellUpdate = UTILS.LibStItemCellUpdate }
    -- Done

    local currentWidth = 0
    for _, c in ipairs(columns) do
        currentWidth = currentWidth + c.width
    end
    local expand = UTILS.round(((totalWidth-currentWidth)/(#columns-3)))
    for i, _ in ipairs(columns) do
        if columns[i].name ~= "" then
            columns[i].width = columns[i].width + expand
        end
    end

    self.BidList:SetDisplayCols(columns)
end


function AuctionManagerGUI:RegisterExternalColumn(column, callback)
    self.externalColumns[#self.externalColumns+1] = {column = column, callback = callback}
    self:BuildColumns()
end

function AuctionManagerGUI:SetVisibleAuctionItem(auctionItem)
    self.auctionItem = auctionItem
    self:Refresh()
end

local function UpdateOptions(self)
    UpdateItemOptions(self)
    UpdateAuctionOptions(self)
    UpdateAwardOptions(self)
end

local function BuildBidRow(name, response, roster, namedButtonMode, externalData)
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
    -- local primaryItem = items[1]
    -- local secondaryItem = items[2]
    -- if (not primaryItem) and secondaryItem then
    --     primaryItem = secondaryItem
    --     secondaryItem = nil
    -- end

    local highlight, invalidReason
    if response:IsInvalid() then
        highlight = highlightInvalid
        invalidReason = response:GetInvalidReason()
    end

    -- Basic data
    local data = {
        {value = class},
        {value = name, color = classColor},
        {value = response:Value(), text = bidTypeString, bidType = response:Type(), color = bidColor},
        {value = current},
        {value = response:Roll()},
    }
    -- External Data
    for _, dataRow in ipairs(externalData) do
        data[#data+1] = dataRow
    end
    -- Items
    local items = response:Items()
    local emptyItems = 5-#items
    for _=1,emptyItems do
        data[#data+1] = {}
    end
    for _, item in ipairs(items) do
        data[#data+1] = {value = item}
    end
    -- Done

    return {cols = data,
        invalidReason = invalidReason,
        highlightFn = highlight,
        DoCellUpdate = highlight
    }
end

local function GetExternalColumnData(self, auction, item, name, response)
    local data = {}
    for _,externalColumn in pairs(self.externalColumns) do
        data[#data+1] = externalColumn.callback(auction, item, name, response)
    end
    return data
end

local function iterateSortByBid(auctionItems)
    -- collect the keys
    local keys = {}
    for k in pairs(auctionItems) do keys[#keys+1] = k end

    -- sort by bids
    table.sort(keys, function(a,b) return auctionItems[a]:GetHighestBid() > auctionItems[b]:GetHighestBid() end)

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], auctionItems[keys[i]]
        end
    end
end

function AuctionManagerGUI:Refresh()
    LOG:Trace("AuctionManagerGUI:Refresh()")
    if not self._initialized then return end
    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()

    if not self.auctionItem  then
        local _, item = next(auction:GetItems())
        self.auctionItem = item
    end

    local itemList = {}
    for _, auctionItem in iterateSortByBid(auction:GetItems()) do
        local iconColor, note
        if not auctionItem:HasValidBids() and auction:IsComplete() then
            iconColor = colorGold
            note = CLM.L["No bids"]
        end
        itemList[#itemList+1] = { cols = { {value = auctionItem:GetItemLink(), iconColor = iconColor, note = note }, {value = auctionItem} }}
    end
    self.ItemList:SetData(itemList)

    local bidList = {}
    local item = self.auctionItem
    if item then
        local namedButtonsMode = auction:GetNamedButtonsMode()
        local roster = auction:GetRoster()
        for name, response in pairs(item:GetAllResponses()) do
            if not CONSTANTS.BID_TYPE_HIDDEN[response:Type()] then -- TODO configurable?
                local externalData = GetExternalColumnData(self, auction, item, name, response)
                bidList[#bidList+1] = BuildBidRow(name, response, roster, namedButtonsMode, externalData)
            end
        end
    end
    self.BidList:SetData(bidList)

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(ITEM_REGISTRY)
    AceConfigDialog:Open(ITEM_REGISTRY, self.ItemOptionsGroup)
    AceConfigRegistry:NotifyChange(AUCTION_REGISTRY)
    AceConfigDialog:Open(AUCTION_REGISTRY, self.AuctionOptionsGroup)
    AceConfigRegistry:NotifyChange(AWARD_REGISTRY)
    AceConfigDialog:Open(AWARD_REGISTRY, self.AwardOptionsGroup)
end

function AuctionManagerGUI:Toggle()
    LOG:Trace("AuctionManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() or not CLM.MODULES.ACL:IsTrusted() then
        self.top:Hide()
    else
        self:Show()
    end
end

function AuctionManagerGUI:Show()
    LOG:Trace("AuctionManagerGUI:Show()")
    if not self._initialized then return end
    self.BidList:ClearSelection()
    self.removeOnAward = CLM.MODULES.AuctionManager:GetDefaultRemoveOnAward()
    self:Refresh()
    self.top:Show()
end

function AuctionManagerGUI:Reset()
    LOG:Trace("AuctionManagerGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.AuctionManager = AuctionManagerGUI
