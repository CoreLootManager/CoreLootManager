-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local tonumber, tostring = tonumber, tostring
local pairs, ipairs = pairs, ipairs
local sformat, tinsert = string.format, table.insert
local GameTooltip = GameTooltip
local IsAltKeyDown,IsInRaid = IsAltKeyDown, IsInRaid
local hooksecurefunc, getglobal = hooksecurefunc, getglobal
local UnitGUID, GetNumLootItems, GetLootSlotLink, GetLootSlotInfo = UnitGUID, GetNumLootItems, GetLootSlotLink, GetLootSlotInfo
local GetItemInfoInstant = GetItemInfoInstant
local SendChatMessage = SendChatMessage

local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local ITEM_REGISTRY = "clm_am_item_options"
local AUCTION_REGISTRY = "clm_am_auction_options"
local AWARD_REGISTRY = "clm_am_award_options"

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

local ACE_GUI_COLUMN_WIDTH = 170
-- 3.5 columns + 20
local BASE_WIDTH  = 605 + (isElvUI and 15 or 0)

local whoami = UTILS.whoami()
local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}
-- local colorYellow = {r = 0.93, g = 0.93, b = 0.2, a = 1.0}
local colorTurquoise = {r = 0.2, g = 0.93, b = 0.93, a = 1.0}
local colorRedTransparent = {r = 0.93, g = 0.2, b = 0.2, a = 0.3}
local colorGreenTransparent = {r = 0.2, g = 0.93, b = 0.2, a = 0.3}
local colorBlueTransparent = {r = 0.2, g = 0.2, b = 0.93, a = 0.3}

local colorRedTransparentHex    = "ED3333"
local colorGreenTransparentHex  = "33ED33"
local colorBlueTransparentHex   = "3333ED"

local TOOLTIP_GAMETOOLTIP = 1
local TOOLTIP_ITEMREF = 2

local highlightRole = {
    ["DAMAGER"] = UTILS.getHighlightMethod(colorRedTransparent),
    ["TANK"] = UTILS.getHighlightMethod(colorBlueTransparent),
    ["HEALER"] = UTILS.getHighlightMethod(colorGreenTransparent),
}

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('auction2', { -- TODO keep original 'auction' when done
        location = {nil, nil, "CENTER", 0, 0 },
        notes = {}
    })
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

local function genericDisable()
    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    return auction:IsInProgress() or auction:Empty()
end

local function GenerateItemOptions(self)

    local icon, itemLink = "Interface\\Icons\\INV_Misc_QuestionMark", "item:0"
    self.note = ""
    local auctionItem = self.auctionItem
    if auctionItem and not auctionItem.item:IsItemEmpty() then
        _, _, _, _, icon = GetItemInfoInstant(auctionItem.item:GetItemID())
        itemLink = auctionItem.item:GetItemLink()
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
            get = (function(i) return self.auctionItem and self.auctionItem.item:GetItemLink() or "" end),
            set = (function(i,v)
                if v and GetItemInfoInstant(v) then -- validate if it is an itemLink or itemString or itemId
                    local itemID = GetItemInfoInstant(v)
                    CLM.MODULES.AuctionManager:AddItemById(itemID, function(auctionItem) self:SetVisibleAuctionItem(auctionItem) end)
                end
            end),
            width = 1.25,
            order = 2,
            tooltipHyperlink = itemLink,
        },
        note = {
            name = CLM.L["Note"],
            type = "input",
            set = (function(i,v)
                self.note = tostring(v)
                if self.auctionItem then
                    if self.note ~= "" then
                        self.db.notes[self.auctionItem.item:GetItemID()] = self.note
                    else
                        self.db.notes[self.auctionItem.item:GetItemID()] = nil
                    end
                end
            end),
            get = (function(i)
                if self.auctionItem then
                    if self.db.notes[self.auctionItem.item:GetItemID()] then
                        self.note = self.db.notes[self.auctionItem.item:GetItemID()]
                    end
                end
                return self.note
            end),
            disabled = genericDisable,
            width = 1.5,
            order = 3
        }
    }

    -- TODO: Names of buttons instead of general
    local order = 4
    local buttonOrder = {order, order + 4}
    for i,key in ipairs({CONSTANTS.SLOT_VALUE_TIER.BASE, CONSTANTS.SLOT_VALUE_TIER.MAX}) do
         options["value_"..key] = {
            name = CONSTANTS.SLOT_VALUE_TIERS_GUI[key],
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
            order = buttonOrder[i]
        }
    end
    order = order + 1
    -- TODO: Display below only if using tiered mode
    for _,key in ipairs({CONSTANTS.SLOT_VALUE_TIER.SMALL, CONSTANTS.SLOT_VALUE_TIER.MEDIUM, CONSTANTS.SLOT_VALUE_TIER.LARGE,}) do
        options["value_"..key] = {
           name = CONSTANTS.SLOT_VALUE_TIERS_GUI[key],
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
    -- ItemOptionsGroup:SetWidth(1.5*ACE_GUI_COLUMN_WIDTH + 5)
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
            UTILS.LibStSingleSelectClickHandler(table, --[[RightClickMenu]]nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            print("CLICKEDY CLICK")
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
            width = 0.6,
            order = 0,
        },
        clear_toggle = {
            name = CLM.L["Remove on award"],
            desc = CLM.L["Remove item from auction list after it's awarded."],
            type = "toggle",
            get = (function() end),
            set = (function() end),
            width = 0.9,
            order = 1,
        },
        -- award_offset = {
        --     name = "",
        --     desc = "",
        --     type = "description",
        --     order = 0,
        --     width = 1.1
        -- },
        -- award_label = {
        --     name = CLM.L["Award:"],
        --     fontSize = "medium",
        --     type = "description",
        --     width = 0.4,
        --     order = 2
        -- },
        award_multiplier = {
            name = CLM.L["Multiplier"],
            type = "input",
            set = (function(i,v)  end),
            get = (function(i) return tostring(0) end),
            width = 0.5,
            order = 3
        },
        award_value = {
            name = CLM.L["Value"],
            type = "input",
            set = (function(i,v) self:setInputAwardValue(v) end),
            get = (function(i) return tostring(self.awardValue) end),
            width = 0.5,
            order = 4
        },
        award = {
            name = CLM.L["Award"],
            type = "execute",
            func = (function()
                local awarded = CLM.MODULES.AuctionManager:Award(self.itemLink, self.itemId, self.awardValue, self.awardPlayer)
                if awarded and not CLM.MODULES.AutoAward:IsIgnored(self.itemId) then
                    if CLM.MODULES.AuctionManager:GetAutoAward() and self.lootWindowIsOpen then
                        CLM.MODULES.AutoAward:GiveMasterLooterItem(self.itemId, self.awardPlayer)
                    elseif CLM.MODULES.AuctionManager:GetAutoTrade() then
                        CLM.MODULES.AutoAward:Track(self.itemId, self.awardPlayer)
                    end
                end
                self.itemLink = nil
                self.itemId = 0
                self.awardValue = 0
                self.awardPlayer = ""
                self.st:ClearSelection()
                self:Refresh()
            end),
            confirm = (function()
                return sformat(
                    CLM.L["Are you sure, you want to award %s to %s for %s DKP?"],
                    self.itemLink,
                    UTILS.ColorCodeText(self.awardPlayer, "FFD100"),
                    tostring(self.awardValue)
                )
            end),
            width = 0.5,
            order = 5,
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

local function CreateBidList(self, width)
    local BidList = AceGUI:Create("CLMLibScrollingTable")
    self.BidList = BidList
    BidList:SetDisplayRows(12, 18)

    local totalWidth = width - 37
    local cols = {
        { name = "", width = 18, DoCellUpdate = UTILS.LibStClassCellUpdate },
        {name = CLM.L["Name"],  width = 100,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        },
        {name = CLM.L["Bid"],   width = 80, color = colorGreen,
            sort = ScrollingTable.SORT_DSC,
            sortnext = 4,
            align = "CENTER"
        },
        {name = CLM.L["Current"],  width = 80, color = {r = 0.92, g = 0.70, b = 0.13, a = 1.0},
            -- sort = ScrollingTable.SORT_DSC, -- This Sort disables nexsort of others relying on this column
            sortnext = 5,
            align = "CENTER"
        },
        {name = CLM.L["Roll"],  width = 40, color = {r = 0.92, g = 0.70, b = 0.13, a = 1.0},
            align = "CENTER"
        },
        {name = "Prio", width = 30},
        {name = "", width = 18,
            DoCellUpdate = (function(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                local item = data[realrow].cols[5]
                local item = { value = math.random(2500,45000)}
                if item then
                    local _, _, _, _, icon = GetItemInfoInstant(item.value or "")
                    if icon then
                        frame:SetNormalTexture(icon)
                    end
                end
            end)
            -- sort = ScrollingTable.SORT_DSC, -- This Sort disables nexsort of others relying on this column
        },
        {name = "", width = 18,
            DoCellUpdate = (function(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
                local item = data[realrow].cols[6]
                local item = { value = math.random(2500,45000)}
                if item then
                    local _, _, _, _, icon = GetItemInfoInstant(item.value or "")
                    if icon then
                        frame:SetNormalTexture(icon)
                    end
                end
            end)
        -- sort = ScrollingTable.SORT_DSC, -- This Sort disables nexsort of others relying on this column
        },
    }
    local currentWidth = 0
    for _, c in ipairs(cols) do
        currentWidth = currentWidth + c.width
    end
    local expand = UTILS.round(((totalWidth-currentWidth)/(#cols-3)))
    for i, _ in ipairs(cols) do
        if cols[i].name ~= "" then
            cols[i].width = cols[i].width + expand
        end
    end
    BidList:SetDisplayCols(cols)
    BidList:RegisterEvents({
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStSingleSelectClickHandler(table, --[[UnifiedGUI_Raids.RightClickMenu]]nil, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
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
            width = 0.75,
            order = 1,
        },
        time_auction = {
            name = CLM.L["Auction length"],
            type = "input",
            set = (function(i,v) CLM.MODULES.AuctionManager:SetAuctionTime(v) end),
            get = (function(i) return tostring(CLM.MODULES.AuctionManager:GetAuctionTime()) end),
            -- disabled = (function(i) return CLM.MODULES.AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.5,
            order = 2
        },
        time_antiSnipe = {
            name = CLM.L["Anti-snipe"],
            type = "input",
            set = (function(i,v) CLM.MODULES.AuctionManager:SetAntiSnipe(v) end),
            get = (function(i) return tostring(CLM.MODULES.AuctionManager:GetAntiSnipe()) end),
            -- disabled = (function(i) return CLM.MODULES.AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.5,
            order = 3
        },
        auction = {
            name = (function() return CLM.MODULES.AuctionManager:IsAuctionInProgress() and CLM.L["Stop"] or CLM.L["Start"] end),
            type = "execute",
            func = (function()
                if not CLM.MODULES.AuctionManager:IsAuctionInProgress() then
                    self:StartAuction()
                else
                    CLM.MODULES.AuctionManager:StopAuctionManual()
                end
            end),
            width = 1,
            order = 4,
            disabled = (function() return CLM.MODULES.AuctionManager:GetCurrentAuctionInfo():Empty() end)
        },
        bidding_header = {
            name = CLM.L["Bidding"],
            type = "header",
            width = "full",
            order = 10
        },
        bid_stats_info = {
            name = "Info",
            desc = (function()
                -- Legend
                local legend = "\n\nColor legend:\n" .. UTILS.ColorCodeText(CLM.L["Tank"].." ",colorBlueTransparentHex) .. UTILS.ColorCodeText(CLM.L["Healer"].." ",colorGreenTransparentHex) .. UTILS.ColorCodeText(CLM.L["DPS"],colorRedTransparentHex)
                if not CLM.MODULES.RaidManager:IsInActiveRaid() or self.raid == nil then return CLM.L["Not in raid"] .. "\n" .. legend end
                -- Unique did any action dict
                local didAnyAction = {}
                -- generateInfo closure
                local _generateInfo = (function(dataDict, ignoreListOfDicts, prefix, skipAction)
                    local dataList, userCodedString = {}, ""
                    for p,_ in pairs(dataDict) do
                        local inIgnoreList = false
                        for _,d in ipairs(ignoreListOfDicts) do
                            if d[p] then
                                inIgnoreList = true
                                break
                            end
                        end
                        if not inIgnoreList then
                            tinsert(dataList, p)
                            if not skipAction then
                                didAnyAction[p] = true
                            end
                        end
                    end
                    local count = #dataList
                    if count > 0 then
                        userCodedString = "\n\n" .. UTILS.ColorCodeText(prefix .. ": ", "EAB221")
                        for i= 1, count do
                            local profile = CLM.MODULES.ProfileManager:GetProfileByName(dataList[i])
                            local coloredName = dataList[i]
                            if profile then
                                coloredName = UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex)
                            end
                            userCodedString = userCodedString .. coloredName
                            if i ~= count then
                                userCodedString = userCodedString .. ", "
                            end
                        end
                    end
                    return count, userCodedString
                end)
                for p,_ in pairs(CLM.MODULES.AuctionManager:Bids()) do
                    didAnyAction[p] = true
                end
                -- passess list
                local _, passed = _generateInfo(
                    CLM.MODULES.AuctionManager:Passes(),
                                            { CLM.MODULES.AuctionManager:Bids() },
                                            "Passed")
                -- cant use actions
                local _, cantUse = _generateInfo(
                    CLM.MODULES.AuctionManager:CantUse(),
                                                { CLM.MODULES.AuctionManager:Bids(), CLM.MODULES.AuctionManager:Passes() },
                                                "Can't use")
                -- closed actions
                local _, closed = _generateInfo(CLM.MODULES.AuctionManager:Hidden(),
                                            { CLM.MODULES.AuctionManager:Bids(), CLM.MODULES.AuctionManager:Passes(), CLM.MODULES.AuctionManager:CantUse() },
                                            "Closed")
                -- no action
                local raidersDict = {}
                for _,GUID in ipairs(self.raid:Players()) do
                    local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
                    if profile then
                        raidersDict[profile:Name()] = true
                    end
                end
                local _, noAction = _generateInfo(raidersDict,
                                    { CLM.MODULES.AuctionManager:Bids(), CLM.MODULES.AuctionManager:Passes(), CLM.MODULES.AuctionManager:CantUse(), CLM.MODULES.AuctionManager:Hidden() },
                                    "No action", true)
                -- did any actions count
                local didAnyActionCount = 0
                for _,_ in pairs(didAnyAction) do didAnyActionCount = didAnyActionCount + 1 end
                -- Stats
                local stats = sformat("%d/%d %s", didAnyActionCount, #self.raid:Players(), "total")
                -- Result
                return stats .. passed .. cantUse .. closed .. noAction .. legend
            end),
            type = "execute",
            func = (function() end),
            image = "Interface\\Icons\\INV_Misc_QuestionMark",
            width = 0.25,
            order = 6
        }
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

    local ItemList = CreateLootList(self)
    local listWidth = ItemList:GetWidth()
    local dataWidth = BASE_WIDTH - listWidth - 20
    f:SetUserData("table", { columns = {listWidth, dataWidth}, alignV =  "top" })
    local DataGroup = AceGUI:Create("SimpleGroup")
    DataGroup:SetLayout("Flow")
    DataGroup:SetWidth(dataWidth)
    DataGroup:AddChild(CreateItemOptions(self, dataWidth))
    DataGroup:AddChild(CreateAuctionOptions(self, dataWidth))
    DataGroup:AddChild(CreateBidList(self, dataWidth))
    DataGroup:AddChild(CreateAwardOptions(self, dataWidth))

    f:AddChild(ItemList)
    f:AddChild(DataGroup)

    -- Clear active bid on close
    -- f:SetCallback('OnClose', function() self:ClearSelectedBid() end)

    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

local AuctionManagerGUI = {}
function AuctionManagerGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    -- Database
    InitializeDB(self)
    -- Create GUIs
    Create(self)
    -- Events
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function() StoreLocation(self) end))
    -- Slash
    self:RegisterSlash()
    -- Done
    self._initialized = true
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

function AuctionManagerGUI:Refresh()
    LOG:Trace("AuctionManagerGUI:Refresh()")
    if not self._initialized then return end

    local itemList = {}

    local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
    for id, auctionItem in pairs(auction:GetItems()) do
        itemList[#itemList+1] = { cols = { {value = id}, {value = auctionItem} }}
    end

    self.ItemList:SetData(itemList)

    local DEBUGDATA2 = {
        {"alpha", 1337.11, 255.11},
        {"Beta", 2137.11, 255.1},
        {"Gamma", 420.69, 245},
        {"Slurpyslurp", 100, 205},
        {"Andromedae", 100, 245},
        {"alpha", 1337.11, 255.11},
        {"Beta", 2137.11, 255.1},
        {"Gamma", 420.69, 245},
        {"Slurpyslurp", 100, 205},
        {"Andromedae", 100, 245},
        {"Andromedae", 100, 245},
        {"alpha", 1337.11, 255.11},
        {"Beta", 2137.11, 255.1},
        {"Gamma", 420.69, 245},
        {"Slurpyslurp", 100, 205},
        {"Andromedae", 100, 245},
    }
    data2 = {}
    for _, d in ipairs(DEBUGDATA2) do
        local row = {cols = {
                {value = ""},
                {value = d[1]},
                {value = d[2]},
                {value = d[3]},
                {value = math.random(1,100)},
                {value = ""},
                {value = ""},
                -- {value = math.random(2500,45000)},
                -- {value = math.random(2000,44000)},
            },
        }
        data2[#data2+1] = row
    end

    self.BidList:SetData(data2)
    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(ITEM_REGISTRY)
    AceConfigDialog:Open(ITEM_REGISTRY, self.ItemOptionsGroup)
    -- AceConfigRegistry:NotifyChange(AWARD_REGISTRY)
    -- AceConfigDialog:Open(AWARD_REGISTRY, self.AwardOptionsGroup)
    AceConfigRegistry:NotifyChange(AUCTION_REGISTRY)
    AceConfigDialog:Open(AUCTION_REGISTRY, self.AuctionOptionsGroup)
end

function AuctionManagerGUI:Toggle()
    LOG:Trace("AuctionManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() or not CLM.MODULES.ACL:IsTrusted() then
        -- Award reset on closing BidWindow.
        -- AuctionManagerGUI:ClearSelectedBid()
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function AuctionManagerGUI:Show()
    LOG:Trace("AuctionManagerGUI:Show()")
    if not self._initialized then return end
    self:Refresh()
    self.top:Show()
end

function AuctionManagerGUI:RegisterSlash()
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

function AuctionManagerGUI:Reset()
    LOG:Trace("AuctionManagerGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.AuctionManager = AuctionManagerGUI
