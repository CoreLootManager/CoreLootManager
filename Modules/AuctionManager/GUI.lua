local define = LibDependencyInjection.createContext(...)

define.module("AuctionManagerGui", {"ConfigManager", "Constants/BidType", "Utils", "Log", "RaidManager", "AuctionManager", "ProfileRegistry", "Models/RosterConfiguration"},
function(resolve, ConfigManager, BidType, UTILS, LOG, RaidManager, AuctionManager, ProfileRegistry, RosterConfiguration)




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

local REGISTRY = "clm_auction_manager_gui_options"

local EVENT_FILL_AUCTION_WINDOW = "CLM_AUCTION_WINDOW_FILL"

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

local BASE_WIDTH  = 365 + (isElvUI and 15 or 0)

local whoami = UTILS.whoami()
local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}
local colorYellow = {r = 0.93, g = 0.93, b = 0.2, a = 1.0}
local colorRedTransparent = {r = 0.93, g = 0.2, b = 0.2, a = 0.3}
local colorGreenTransparent = {r = 0.2, g = 0.93, b = 0.2, a = 0.3}
local colorBlueTransparent = {r = 0.2, g = 0.2, b = 0.93, a = 0.3}

local colorRedTransparentHex = "ED3333"
local colorGreenTransparentHex = "33ED33"
local colorBlueTransparentHex = "3333ED"

local guiOptions = {
    type = "group",
    args = {}
}

local function ST_GetHighlightFunction(row)
    return row.cols[5].value
end

local highlightRole = {
    ["DAMAGER"] = UTILS.getHighlightMethod(colorRedTransparent),
    ["TANK"] = UTILS.getHighlightMethod(colorBlueTransparent),
    ["HEALER"] = UTILS.getHighlightMethod(colorGreenTransparent),
}

local function GetModifierCombination()
    local combination = ""

    if IsAltKeyDown() then
        combination = combination .. "a"
    end

    if IsShiftKeyDown() then
        combination = combination .. "s"
    end

    if IsControlKeyDown() then
        combination = combination .. "c"
    end

    return combination
end

local function CheckModifierCombination()
    return (GlobalConfigs:GetModifierCombination() == GetModifierCombination())
end

local function FillAuctionWindowFromTooltip(frame, button)
    if GameTooltip and CheckModifierCombination() then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            EventManager:DispatchEvent(EVENT_FILL_AUCTION_WINDOW, {
                link = itemLink,
                start = (button == "RightButton")
            })
        end
    end
end

local function HookBagSlots()
    hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", FillAuctionWindowFromTooltip)
end

local function HookCorpseSlots(hookedSlots)
    local UIs = {
        wow = "LootButton",
        elv = "ElvLootSlot"
    }

    local numLootItems = GetNumLootItems()

    for ui, prefix in pairs(UIs) do
        for buttonIndex = 1, numLootItems do
            if not hookedSlots[ui][buttonIndex] then
                local button = getglobal(prefix .. buttonIndex)
                if button then
                    button:HookScript("OnClick", FillAuctionWindowFromTooltip)
                    hookedSlots[ui][buttonIndex] = true
                end
            end
        end
    end
end

local alreadyPostedLoot = {}
local function PostLootToRaidChat()
    if not IsInRaid() then return end
    if not Acl:IsTrusted() then return end
    if not GlobalConfigs:GetAnnounceLootToRaid() then return end
    if GlobalConfigs:GetAnnounceLootToRaidOwnerOnly() then
        if not RaidManager:IsRaidOwner(whoami) then return end
    end
    local targetGuid = UnitGUID("target")
    if targetGuid then
        if alreadyPostedLoot[targetGuid] then return end
        alreadyPostedLoot[targetGuid] = true
    end

    local numLootItems = GetNumLootItems()
    local num = 1
    for lootIndex = 1, numLootItems do
        local _, _, _, _, rarity = GetLootSlotInfo(lootIndex)
        local itemLink = GetLootSlotLink(lootIndex)
        if itemLink then
            if (tonumber(rarity) or 0) >= GlobalConfigs:GetAnnounceLootToRaidLevel() then
                SendChatMessage(num .. ". " .. itemLink, "RAID")
                num = num + 1
            end
        end
    end
end

local function InitializeDB(self)
    self.db = Database:GUI('auction', {
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

local AuctionManagerGUI = {}
function AuctionManagerGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    InitializeDB(self)
    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    if Acl:IsTrusted() then
        HookBagSlots()
    end
    self.hookedSlots = { wow = {}, elv =  {}}
    self.values = {}
    EventManager:RegisterWoWEvent({"LOOT_OPENED"}, (function(...)self:HandleLootOpenedEvent() end))
    EventManager:RegisterWoWEvent({"LOOT_CLOSED"}, (function(...)self:HandleLootClosedEvent() end))
    EventManager:RegisterEvent(EVENT_FILL_AUCTION_WINDOW, function(event, data)
        if not RaidManager:IsInProgressingRaid() then
            return
        end
        if not AuctionManager:IsAuctionInProgress() then
            self.itemLink = data.link
            self:Refresh()
            if data.start then
                self:StartAuction()
                if self.top:IsVisible() then
                    self.top:Hide()
                end
            else
                if not self.top:IsVisible() then
                    self.top:Show()
                end
            end
        end
    end)
    self:RegisterSlash()
    self._initialized = true
end

function AuctionManagerGUI:HandleLootOpenedEvent()
    -- Set window open
    self.lootWindowIsOpen = true
    -- Post loot to raid chat
    PostLootToRaidChat()
    -- Hook slots
    HookCorpseSlots(self.hookedSlots)
end

function AuctionManagerGUI:HandleLootClosedEvent()
    self.lootWindowIsOpen = false
end


local function CreateBidWindow(self)
    local BidWindowGroup = AceGUI:Create("SimpleGroup")
    BidWindowGroup:SetLayout("Flow")
    local columns = {
        {name = L["Name"],  width = 70},
        {name = L["Class"], width = 60,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        },
        {name = L["Bid"],   width = 120, color = colorGreen,
            sort = ScrollingTable.SORT_DSC,
            sortnext = 4
        },
        {name = L["Current"],  width = 60, color = {r = 0.92, g = 0.70, b = 0.13, a = 1.0},
            -- sort = ScrollingTable.SORT_DSC, -- This Sort disables nexsort of others relying on this column
        },
    }
    self.st = ScrollingTable:CreateST(columns, 10, 18, nil, BidWindowGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", BidWindowGroup.frame, "TOPLEFT", 0, -25)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    self.st:RegisterEvents({
        OnClick = (function(rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local selected = self.st:GetRow(self.st:GetSelection())
            if type(selected) ~= "table" then return false end
            if selected.cols == nil then return false end -- Handle column titles click
            self.awardPlayer = selected.cols[1].value or ""
            if not self.awardValue or self.awardValue == '' then
                AuctionManagerGUI:UpdateBids()
            end
            return selected
        end),
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            local highlight = ST_GetHighlightFunction(rowData)
            if highlight then
                highlight(rowFrame, cellFrame, data, cols, row, realrow, column, true, table, ...)
            end
            return status
        end),
    })

    return BidWindowGroup
end

local function UpdateOptions(self)
    for k,_ in pairs(guiOptions.args) do
        guiOptions.args[k] = nil
    end
    UTILS.mergeDictsInline(guiOptions.args, self:GenerateAuctionOptions())
end

local function CreateOptions(self)
    local OptionsGroup = AceGUI:Create("SimpleGroup")
    OptionsGroup:SetLayout("Flow")
    OptionsGroup:SetWidth(BASE_WIDTH)
    self.OptionsGroup = OptionsGroup
    UpdateOptions(self)
    AceConfigRegistry:RegisterOptionsTable(REGISTRY, guiOptions)
    AceConfigDialog:Open(REGISTRY, OptionsGroup)

    return OptionsGroup
end

function AuctionManagerGUI:GenerateAuctionOptions()
    local icon = "Interface\\Icons\\INV_Misc_QuestionMark"
    if self.itemLink then
        self.itemId, _, _, self.itemEquipLoc, icon = GetItemInfoInstant(self.itemLink)
    end

    self.note = ""
    self.values = {}
    if RaidManager:IsInRaid() then
        self.raid = RaidManager:GetRaid()
        self.roster = self.raid:Roster()
        if self.roster then
            self.configuration:Copy(self.roster.configuration)
            self.values = UTILS.ShallowCopy(self.roster:GetItemValues(self.itemId))
        end
    end
    local itemLink = "item:" .. tostring(self.itemId)
    local options = {
        icon = {
            name = "",
            type = "execute",
            image = icon,
            func = (function() end),
            width = 0.50,
            order = 1,
            itemLink = itemLink,
        },
        item = {
            name = L["Item"],
            type = "input",
            get = (function(i)
                return self.itemLink or ""
            end),
            set = (function(i,v)
                if v and GetItemInfoInstant(v) then -- validate if it is an itemLink or itemString or itemId
                    self.itemLink = v
                    self.st:SetData({})
                else
                    self.itemLink = nil
                end
                self:Refresh()
            end),
            disabled = (function() return AuctionManager:IsAuctionInProgress() end),
            width = 1.4,
            order = 2,
            itemLink = itemLink,
        },
        note_label = {
            name = L["Note"],
            type = "description",
            width = 0.50,
            order = 3
        },
        note = {
            name = L["Note"],
            type = "input",
            set = (function(i,v)
                self.note = tostring(v)
                if self.itemId then
                    if self.note ~= "" then
                        self.db.notes[self.itemId] = self.note
                    else
                        self.db.notes[self.itemId] = nil
                    end
                end
            end),
            get = (function(i)
                if self.itemId then
                    if self.db.notes[self.itemId] then
                        self.note = self.db.notes[self.itemId]
                    end
                end
                return self.note
            end),
            disabled = (function() return AuctionManager:IsAuctionInProgress() end),
            width = 1.4,
            order = 4
        },
        value_label = {
            name = L["Value ranges"],
            type = "description",
            width = 0.50,
            order = 5
        },
        time_label = {
            name = L["Time settings"],
            type = "description",
            width = 0.50,
            order = 11
        },
        time_auction = {
            name = L["Auction length"],
            type = "input",
            set = (function(i,v) self.configuration:Set("auctionTime", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("auctionTime")) end),
            disabled = (function(i) return AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.7,
            order = 12
        },
        time_antiSnipe = {
            name = L["Anti-snipe"],
            type = "input",
            set = (function(i,v) self.configuration:Set("antiSnipe", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("antiSnipe")) end),
            disabled = (function(i) return AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.7,
            order = 13
        },
        auction = {
            name = (function() return AuctionManager:IsAuctionInProgress() and L["Stop"] or L["Start"] end),
            type = "execute",
            func = (function()
                if not AuctionManager:IsAuctionInProgress() then
                    self:StartAuction()
                else
                    AuctionManager:StopAuctionManual()
                end
            end),
            width = 2.5,
            order = 14,
            disabled = (function() return not ((self.itemLink or false) and RaidManager:IsInProgressingRaid()) end)
        },
        auction_results = {
            name = L["Auction Results"],
            type = "header",
            order = 15
        },
        award_label = {
            name = L["Award item"],
            type = "description",
            width = 0.5,
            order = 16
        },
        award_value = {
            name = L["Award value"],
            type = "input",
            set = (function(i,v) AuctionManagerGUI:setInputAwardValue(v) end),
            get = (function(i) return tostring(self.awardValue) end),
            width = 0.55,
            order = 17
        },
        award = {
            name = L["Award"],
            type = "execute",
            func = (function()
                local awarded = AuctionManager:Award(self.itemLink, self.itemId, self.awardValue, self.awardPlayer)
                if awarded and not AutoAward:IsIgnored(self.itemId) then
                    if AuctionManager:GetAutoAward() and self.lootWindowIsOpen then
                        AutoAward:GiveMasterLooterItem(self.itemId, self.awardPlayer)
                    elseif AuctionManager:GetAutoTrade() then
                        AutoAward:Track(self.itemId, self.awardPlayer)
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
                    L["Are you sure, you want to award %s to %s for %s DKP?"],
                    self.itemLink,
                    UTILS.ColorCodeText(self.awardPlayer, "FFD100"),
                    tostring(self.awardValue)
                )
            end),
            width = 0.55,
            order = 18,
            disabled = (function() return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end)
        },
        bid_stats_info = {
            name = "Info",
            desc = (function()
                -- Legend
                local legend = "\n\nColor legend:\n" .. UTILS.ColorCodeText(L["Tank"].."\n",colorBlueTransparentHex) .. UTILS.ColorCodeText(L["Healer"].."\n",colorGreenTransparentHex) .. UTILS.ColorCodeText(L["DPS"],colorRedTransparentHex)
                if not RaidManager:IsInActiveRaid() or self.raid == nil then return L["Not in raid"] .. "\n" .. legend end
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
                            local profile = ProfileRegistry.GetByName(dataList[i])
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
                for p,_ in pairs(AuctionManager:Bids()) do
                    didAnyAction[p] = true
                end
                -- passess list
                local _, passed = _generateInfo(
                    AuctionManager:Passes(),
                                            { AuctionManager:Bids() },
                                            "Passed")
                -- cant use actions
                local _, cantUse = _generateInfo(
                    AuctionManager:CantUse(),
                                                { AuctionManager:Bids(), AuctionManager:Passes() },
                                                "Can't use")
                -- closed actions
                local _, closed = _generateInfo(AuctionManager:Hidden(),
                                            { AuctionManager:Bids(), AuctionManager:Passes(), AuctionManager:CantUse() },
                                            "Closed")
                -- no action
                local raidersDict = {}
                for _,GUID in ipairs(self.raid:Players()) do
                    local profile = ProfileRegistry.Get(GUID)
                    if profile then
                        raidersDict[profile:Name()] = true
                    end
                end
                local _, noAction = _generateInfo(raidersDict,
                                    { AuctionManager:Bids(), AuctionManager:Passes(), AuctionManager:CantUse(), AuctionManager:Hidden() },
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
            width = 0.3,
            order = 19
        }
    }

    local order = 6
    for _,key in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
         options["value_"..key] = {
            name = CONSTANTS.SLOT_VALUE_TIERS_GUI[key],
            type = "input",
            set = (function(i,v)
                self.values[key] = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.values[key] or 0) end),
            disabled = (function(i) return AuctionManager:IsAuctionInProgress() end),
            pattern = CONSTANTS.REGEXP_FLOAT,
            width = 0.3,
            order = order
        }
        order = order + 1
    end

    return options
end

function AuctionManagerGUI:Create()
    LOG:Trace("AuctionManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(L["Auctioning"])
    f:SetStatusText("")
    f:SetLayout("flow")
    f:EnableResize(false)
    f:SetWidth(BASE_WIDTH)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Auctioning_GUI")

    self.configuration = RosterConfiguration:New()
    self.itemLink = nil
    self.itemId = 0
    self.note = ""
    self.awardValue = 0
    self.bids = {}

    f:AddChild(CreateOptions(self))
    f:AddChild(CreateBidWindow(self))

    -- Clear active bid on close
    f:SetCallback('OnClose', function() AuctionManagerGUI:ClearSelectedBid() end)

    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function AuctionManagerGUI:StartAuction()
    self:ClearSelectedBid()
    AuctionManager:ClearBids()
    AuctionManager:StartAuction(self.itemId, self.itemLink, self.itemEquipLoc, self.values, self.note, self.raid, self.configuration)
end

local function GetTopBids()
    LOG:Trace("AuctionManagerGUI:GetTopBids()")
    local max = {name = "", bid = 0}
    for name,bid in pairs(AuctionManager:Bids()) do
        bid = tonumber(bid) or 0
        if bid > max.bid then
            max.bid = bid
            max.name = name
        end
    end
    local second = {name = "", bid = 0}
    for name,bid in pairs(AuctionManager:Bids()) do
        bid = tonumber(bid) or 0
        if bid > second.bid and name ~= max.name then
            second.bid = bid
            second.name = name
        end
    end
    return max, second
end

function AuctionManagerGUI:UpdateAwardValue()
    LOG:Trace("AuctionManagerGUI:UpdateAwardValue()")
    local max, second = GetTopBids()
    local isVickrey = (self.roster:GetConfiguration("auctionType") ==  CONSTANTS.AUCTION_TYPE.VICKREY)
    if isVickrey then
        if second.bid == 0 then
            self.awardValue = self.values[SlotValueTier.BASE] or 0
        else
            self.awardValue = second.bid
        end
    else
        self.awardValue = max.bid
    end
    self.awardValue = self.awardValue + self.roster:GetConfiguration("tax")
end

function AuctionManagerGUI:setInputAwardValue(v)
    self.awardValue = tonumber(v) or 0;
    self:Refresh()
end

function AuctionManagerGUI:ClearSelectedBid()
    LOG:Trace("AuctionManagerGUI:ClearAwardValue()")
    self.awardValue = ""
    self.awardPlayer = ""
    self.top:SetStatusText("")
    self.st:ClearSelection()
end

function AuctionManagerGUI:UpdateBids()
    LOG:Trace("AuctionManagerGUI:UpdateBids()")
    AuctionManagerGUI:UpdateAwardValue()
    self:Refresh()
end

function AuctionManagerGUI:Refresh()
    LOG:Trace("AuctionManagerGUI:Refresh()")
    if not self._initialized then return end

    if RaidManager:IsInActiveRaid() then
        local roster = RaidManager:GetRaid():Roster()
        local namedButtons = roster:GetConfiguration("namedButtons")
        local bids, bidTypes = AuctionManager:Bids()
        local data = {}
        for name,bid in pairs(bids) do
            local color
            if namedButtons then
                bid = roster:GetFieldName(bidTypes[name]) or bid
            else
                if bidTypes[name] == BidType.OFF_SPEC then
                    color = colorYellow
                end
            end
            local profile = ProfileRegistry.GetByName(name)
            if profile then
                local row = {cols = {
                    {value = profile:Name()},
                    {value = UTILS.ColorCodeClass(profile:Class())},
                    {value = bid, color = color},
                    {value = self.roster:Standings(profile:GUID())},
                    {value = highlightRole[profile:Role()]},
                },
                DoCellUpdate = highlightRole[profile:Role()]
                }
                data[#data+1] = row
            end
        end
        self.st:SetData(data)
    end

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(REGISTRY)
    AceConfigDialog:Open(REGISTRY, self.OptionsGroup) -- Refresh the config gui panel
end

function AuctionManagerGUI:Toggle()
    LOG:Trace("AuctionManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() or not Acl:IsTrusted() then
        -- Award reset on closing BidWindow.
        AuctionManagerGUI:ClearSelectedBid()
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function AuctionManagerGUI:RegisterSlash()
    local options = {
        auction = {
            type = "execute",
            name = "Auctioning",
            desc = L["Toggle Auctioning window display"],
            handler = self,
            func = "Toggle",
        }
    }
    ConfigManager:RegisterSlash(options)
end

function AuctionManagerGUI:Reset()
    LOG:Trace("AuctionManagerGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

resolve(AuctionManagerGUI)


end)