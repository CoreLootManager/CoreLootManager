local  _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local CONSTANTS = CLM.CONSTANTS
local GUI = CLM.GUI
local ACL = MODULES.ACL

local mergeDictsInline = UTILS.mergeDictsInline
local RemoveColorCode = UTILS.RemoveColorCode

local AuctionManager = MODULES.AuctionManager
local ProfileManager = MODULES.ProfileManager
local RaidManager = MODULES.RaidManager
local EventManager =  MODULES.EventManager
local AutoAward = MODULES.AutoAward

local RosterConfiguration = MODELS.RosterConfiguration

local REGISTRY = "clm_auction_manager_gui_options"

local EVENT_FILL_AUCTION_WINDOW = "CLM_AUCTION_WINDOW_FILL"

local guiOptions = {
    type = "group",
    args = {}
}

local function FillAuctionWindowFromTooltip(frame, button)
    if GameTooltip and IsAltKeyDown() then
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

local function PostLootToRaidChat()
    if not IsInRaid() then return end
    if not ACL:IsTrusted() then return end
    if CLM.GlobalConfigs:GetAnnounceLootToRaid() then
        local numLootItems = GetNumLootItems()

        for lootIndex = 1, numLootItems do
            local _, _, _, _, rarity = GetLootSlotInfo(lootIndex)
            local itemLink = GetLootSlotLink(lootIndex)
            if itemLink then
                if (tonumber(rarity) or 0) >= CLM.GlobalConfigs:GetAnnounceLootToRaidLevel() then -- post Blue Purple and Legendary to Raid -- 3 -blue
                    SendChatMessage(lootIndex .. ". " .. itemLink, "RAID")
                end
            end
        end
    end
end

local function InitializeDB(self)
    self.db = MODULES.Database:GUI('auction', {
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
    if ACL:IsTrusted() then
        HookBagSlots()
    end
    self.hookedSlots = { wow = {}, elv =  {}}
    EventManager:RegisterWoWEvent({"LOOT_OPENED"}, (function(...)self:HandleLootOpenedEvent() end))
    EventManager:RegisterWoWEvent({"LOOT_CLOSED"}, (function(...)self:HandleLootClosedEvent() end))
    EventManager:RegisterEvent(EVENT_FILL_AUCTION_WINDOW, function(event, data)
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
        {name = CLM.L["Name"],  width = 70},
        {name = CLM.L["Class"], width = 60,
            comparesort = UTILS.LibStCompareSortWrapper(
                (function(a1, b1)
                    return RemoveColorCode(a1), RemoveColorCode(b1)
                end)
            )
        },
        {name = CLM.L["Spec"],  width = 60},
        {name = CLM.L["Bid"],   width = 60, color = {r = 0.0, g = 0.93, b = 0.0, a = 1.0},
            sort = ScrollingTable.SORT_DSC,
            sortnext = 5
        },
        {name = CLM.L["Current"],  width = 60, color = {r = 0.92, g = 0.70, b = 0.13, a = 1.0},
            -- sort = ScrollingTable.SORT_DSC, -- This Sort disables nexsort of others relying on this column
        },
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
        self.awardPlayer = selected.cols[1].value or ""
        -- self.awardValue = selected.cols[4].value or 0
        if not self.awardValue or self.awardValue == '' then
            AuctionManagerGUI:UpdateBids()
        end
        if self.awardPlayer and self.awardPlayer:len() > 0 then
            self.top:SetStatusText(string.format(CLM.L["Awarding to %s for %d."], self.awardPlayer, self.awardValue))
        else
            self.top:SetStatusText("")
        end
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

    self.note = ""
    if not self.base then self.base = 0 end
    if not self.max then self.max = 0 end

    if RaidManager:IsInActiveRaid() then
        self.raid = RaidManager:GetRaid()
        self.roster = self.raid:Roster()
        if self.roster then
            self.configuration:Copy(self.roster.configuration)
            local v = self.roster:GetItemValue(self.itemId)
            self.base = v.base
            self.max = v.max
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
            name = CLM.L["Item"],
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
            itemLink = "item:" .. tostring(self.itemId),
        },
        note_label = {
            name = CLM.L["Note"],
            type = "description",
            width = 0.5,
            order = 3
        },
        note = {
            name = CLM.L["Note"],
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
            name = CLM.L["Value ranges"],
            type = "description",
            width = 0.5,
            order = 5
        },
        value_base = {
            name = CLM.L["Base"],
            type = "input",
            set = (function(i,v)
                self.base = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.base) end),
            disabled = (function(i) return AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.7,
            order = 6
        },
        value_max = {
            name = CLM.L["Max"],
            type = "input",
            set = (function(i,v)
                self.max = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.max) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.7,
            order = 7
        },
        time_label = {
            name = CLM.L["Time settings"],
            type = "description",
            width = 0.5,
            order = 8
        },
        time_auction = {
            name = CLM.L["Auction length"],
            type = "input",
            set = (function(i,v) self.configuration:Set("auctionTime", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("auctionTime")) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.7,
            order = 9
        },
        time_antiSnipe = {
            name = CLM.L["Anti-snipe"],
            type = "input",
            set = (function(i,v) self.configuration:Set("antiSnipe", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("antiSnipe")) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.7,
            order = 10
        },
        auction = {
            name = (function() return AuctionManager:IsAuctionInProgress() and CLM.L["Stop"] or CLM.L["Start"] end),
            type = "execute",
            func = (function()
                if not AuctionManager:IsAuctionInProgress() then
                    self:StartAuction()
                else
                    AuctionManager:StopAuctionManual()
                end
            end),
            width = 2.5,
            order = 11,
            disabled = (function() return not ((self.itemLink or false) and RaidManager:IsInProgressingRaid()) end)
        },
        auction_results = {
            name = CLM.L["Auction Results"],
            type = "header",
            order = 12
        },
        award_label = {
            name = CLM.L["Award item"],
            type = "description",
            width = 0.5,
            order = 13
        },
        award_value = {
            name = CLM.L["Award value"],
            type = "input",
            set = (function(i,v) AuctionManagerGUI:setInputAwardValue(v) end),
            get = (function(i) return tostring(self.awardValue) end),
            -- disabled = (function(i) return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end),
            width = 0.55,
            order = 14
        },
        award = {
            name = CLM.L["Award"],
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
                return string.format(
                    CLM.L["Are you sure, you want to award %s to %s for %s DKP?"],
                    self.itemLink,
                    UTILS.ColorCodeText(self.awardPlayer, "FFD100"),
                    tostring(self.awardValue)
                )
            end),
            width = 0.55,
            order = 15,
            disabled = (function() return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end)
        },
        bid_stats_info = {
            name = "Info",
            desc = (function()
                if not RaidManager:IsInActiveRaid() or self.raid == nil then return "Not in raid" end
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
                            table.insert(dataList, p)
                            if not skipAction then
                                didAnyAction[p] = true
                            end
                        end
                    end
                    local count = #dataList
                    if count > 0 then
                        userCodedString = "\n\n" .. UTILS.ColorCodeText(prefix .. ": ", "EAB221")
                        for i= 1, count do
                            local profile = ProfileManager:GetProfileByName(dataList[i])
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
                    local profile = ProfileManager:GetProfileByGUID(GUID)
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
                local stats = string.format("%d/%d %s", didAnyActionCount, #self.raid:Players(), "total")
                -- Result
                return stats .. passed .. cantUse .. closed .. noAction
            end),
            type = "execute",
            func = (function() end),
            image = "Interface\\Icons\\INV_Misc_QuestionMark",
            width = 0.3,
            order = 16
        }
    }
end

function AuctionManagerGUI:Create()
    LOG:Trace("AuctionManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle(CLM.L["Auctioning"])
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
    AuctionManager:StartAuction(self.itemId, self.itemLink, self.itemEquipLoc, self.base, self.max, self.note, self.raid, self.configuration)
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
            self.awardValue = self.base or 0
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
    self.top:SetStatusText(string.format(CLM.L["Awarding to %s for %d."], self.awardPlayer, self.awardValue))
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
        local data = {}
        for name,bid in pairs(AuctionManager:Bids()) do
            local profile = ProfileManager:GetProfileByName(name)
            if profile then
                local row = {cols = {}}
                table.insert(row.cols, {value = profile:Name()})
                table.insert(row.cols, {value = UTILS.ColorCodeClass(profile:Class())})
                table.insert(row.cols, {value = profile:SpecString()})
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
    if self.top:IsVisible() or not ACL:IsTrusted() then
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
            desc = CLM.L["Toggle Auctioning window display"],
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

function AuctionManagerGUI:Reset()
    LOG:Trace("AuctionManagerGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

GUI.AuctionManager = AuctionManagerGUI
