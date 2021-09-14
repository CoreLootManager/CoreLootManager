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

local AuctionManager = MODULES.AuctionManager
local ProfileManager = MODULES.ProfileManager
local RaidManager = MODULES.RaidManager
local EventManager =  MODULES.EventManager

local RosterConfiguration = MODELS.RosterConfiguration

local REGISTRY = "clm_auction_manager_gui_options"

local guiOptions = {
    type = "group",
    args = {}
}

local AuctionManagerGUI = {}

local function FillAuctionWindowFromTooltip(frame, button)
    if GameTooltip and IsAltKeyDown() and not AuctionManager:IsAuctionInProgress() then
        local _, itemLink = GameTooltip:GetItem()
        if itemLink then
            AuctionManagerGUI.itemLink = itemLink
            AuctionManagerGUI:Refresh()
            if button == "RightButton" then
                AuctionManagerGUI:StartAuction()
                if AuctionManagerGUI.top.frame:IsVisible() then
                    AuctionManagerGUI.top.frame:Hide()
                end
            else
                if not AuctionManagerGUI.top.frame:IsVisible() then
                    AuctionManagerGUI.top.frame:Show()
                end
            end
        end
    end
end

local function HookBagSlots()
    hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", FillAuctionWindowFromTooltip)
end

local function HookCorpseSlots(hookedSlots)
    local UIs = {
        wow = "",
        elv = "Elv"
    }

    local numLootItems = GetNumLootItems()

    for ui, prefix in pairs(UIs) do
        for buttonIndex = 1, numLootItems do
            if not hookedSlots[ui][buttonIndex] then
                local button = getglobal(prefix .. "LootButton" .. buttonIndex)
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
            local _, _, _, rarity = GetLootSlotInfo(lootIndex)
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
    local db = MODULES.Database:GUI()
    if not db.auction then
        db.auction = { }
    end
    self.db = db.auction
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

function AuctionManagerGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    InitializeDB(self)
    EventManager:RegisterEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    if ACL:IsTrusted() then
        HookBagSlots()
    end
    self.hookedSlots = { wow = {}, elv =  {}}
    EventManager:RegisterEvent({"LOOT_OPENED"}, (function(...)self:HandleLootOpenedEvent() end))
    self:RegisterSlash()
    self._initialized = true
end

function AuctionManagerGUI:HandleLootOpenedEvent()
    -- Post loot to raid chat
    PostLootToRaidChat()
    -- Hook slots
    HookCorpseSlots(self.hookedSlots)
end


local function CreateBidWindow(self)
    local BidWindowGroup = AceGUI:Create("SimpleGroup")
    BidWindowGroup:SetLayout("Flow")
    local columns = {
        {name = "Name",     width = 70},
        {name = "Class",    width = 60},
        {name = "Spec",     width = 60},
        {name = "Bid",      width = 60, color = {r = 0.0, g = 0.93, b = 0.0, a = 1.0}, sort = ScrollingTable.SORT_DSC },
        {name = "Current",  width = 60, color = {r = 0.92, g = 0.70, b = 0.13, a = 1.0}, sort = ScrollingTable.SORT_DSC},
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
            self.top:SetStatusText("Awarding to " .. self.awardPlayer .. " for " .. self.awardValue)
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

    if not self.note then self.note = "" end
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
            name = "Item",
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
            width = 1.5,
            order = 2,
            itemLink = "item:" .. tostring(self.itemId),
        },
        note_label = {
            name = "Note",
            type = "description",
            width = 0.5,
            order = 3
        },
        note = {
            name = "Note",
            type = "input",
            set = (function(i,v) self.note = tostring(v) end),
            get = (function(i) return self.note end),
            disabled = (function() return AuctionManager:IsAuctionInProgress() end),
            width = 1.5,
            order = 4
        },
        value_label = {
            name = "Value ranges",
            type = "description",
            width = 0.5,
            order = 5
        },
        value_base = {
            name = "Base",
            type = "input",
            set = (function(i,v)
                self.base = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.base) end),
            disabled = (function(i) return AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 6
        },
        value_max = {
            name = "Max",
            type = "input",
            set = (function(i,v)
                self.max = tonumber(v) or 0
                -- todo override item value
            end),
            get = (function(i) return tostring(self.max) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 7
        },
        time_label = {
            name = "Time settings",
            type = "description",
            width = 0.5,
            order = 8
        },
        time_auction = {
            name = "Auction length [s]",
            type = "input",
            set = (function(i,v) self.configuration:Set("auctionTime", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("auctionTime")) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 9
        },
        time_antiSnipe = {
            name = "AntiSnipe [s]",
            type = "input",
            set = (function(i,v) self.configuration:Set("antiSnipe", v or 0) end),
            get = (function(i) return tostring(self.configuration:Get("antiSnipe")) end),
            disabled = (function(i) return  AuctionManager:IsAuctionInProgress() end),
            pattern = "%d+",
            width = 0.75,
            order = 10
        },
        auction = {
            name = (function() return AuctionManager:IsAuctionInProgress() and "Stop" or "Start" end),
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
            name = "Auction Results",
            type = "header",
            order = 12
        },
        award_label = {
            name = "Award item",
            type = "description",
            width = 0.5,
            order = 13
        },
        award_value = {
            name = "Award value",
            type = "input",
            set = (function(i,v) AuctionManagerGUI:setInputAwardValue(v) end),
            get = (function(i) return tostring(self.awardValue) end),
            -- disabled = (function(i) return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end),
            width = 0.75,
            order = 14
        },
        award = {
            name = "Award",
            type = "execute",
            func = (function()
                AuctionManager:Award(self.itemId, self.awardValue, self.awardPlayer)
                self.itemLink = nil
                self.itemId = 0
                self.awardValue = 0
                self.awardPlayer = ""
                self:Refresh()
            end),
            confirm = (function()
                return string.format(
                    "Are you sure, you want to award %s to %s for %s DKP?",
                    self.itemLink,
                    UTILS.ColorCodeText(self.awardPlayer, "FFD100"),
                    tostring(self.awardValue)
                )
            end),
            width = 0.75,
            order = 15,
            disabled = (function() return (not (self.itemLink or false)) or AuctionManager:IsAuctionInProgress() end)
        },
    }
end

function AuctionManagerGUI:Create()
    LOG:Trace("AuctionManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Auctioning")
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
    f:SetCallback('OnClose', function() AuctionManagerGUI:ClearSelectedBid(self) end)

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
    local max, second = GetTopBids(self)
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
end

function AuctionManagerGUI:setInputAwardValue(v)
    self.awardValue = tonumber(v) or 0;
    self.top:SetStatusText("Awarding to " .. self.awardPlayer .. " for " .. self.awardValue)
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

    if AuctionManager:IsAuctionInProgress() then
        local data = {}
        for name,bid in pairs(AuctionManager:Bids()) do -- todo currently this has names hmmm
            local profile = ProfileManager:GetProfileByName(name)
            if profile then
                local row = {cols = {}}
                table.insert(row.cols, {value = profile:Name()})
                table.insert(row.cols, {value = UTILS.ColorCodeClass(profile:Class())})
                table.insert(row.cols, {value = profile:Spec()})
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
    if self.top.frame:IsVisible() or not ACL:IsTrusted() then
        -- Award reset on closing BidWindow.
        AuctionManagerGUI:ClearSelectedBid()
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function AuctionManagerGUI:RegisterSlash()
    local options = {
        auction = {
            type = "execute",
            name = "Auctioning",
            desc = "Toggle Auctioning window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.AuctionManager = AuctionManagerGUI