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

local AceGUI = LibStub("AceGUI-3.0")
local LibCandyBar = LibStub("LibCandyBar-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local guiOptions = {
    type = "group",
    args = {}
}

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

local BASE_WIDTH  = 335 + (isElvUI and 15 or 0)
local ROW_HEIGHT = 25
local BASE_HEIGHT = 100

local rowMultiplier = 1.8

local REGISTRY = "clm_bidding_manager_gui_options"

local function UpdateOptions(self)
    self.top:SetWidth(BASE_WIDTH)
    for k,_ in pairs(guiOptions.args) do
        guiOptions.args[k] = nil
    end
    UTILS.mergeDictsInline(guiOptions.args, self:GenerateAuctionOptions())
    guiOptions.args.item.width = 1.45
    self.OptionsGroup:SetWidth(BASE_WIDTH)
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

local BiddingManagerGUI = {}

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('bidding', {
        location = {nil, nil, "CENTER", 0, 0 },
        closeOnBid = false
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

function BiddingManagerGUI:BidCurrent()
    CLM.MODULES.BiddingManager:Bid(self.bid)
end

local function GenerateValueButtonsAuctionOptions(self,
    icon, itemLink, shortItemLink, itemValueMode, values)
    local options = {
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
            name = "",--CLM.L["Item"],
            type = "input",
            get = (function(i) return itemLink or "" end),
            set = (function(i,v) end), -- Intentionally: do not override
            width = 1.55,
            order = 2,
            itemLink = shortItemLink,
        },
        bid_value = {
            name = "",--CLM.L["Bid value"],
            desc = CLM.L["Value you want to bid. Press Enter or click Okay button to accept."],
            type = "input",
            set = (function(i,v) self.bid = tonumber(v) or 0 end),
            get = (function(i) return tostring(self.bid) end),
            width = 0.8,
            order = 3
        },
        bid = {
            name = CLM.L["MS"],
            desc = CLM.L["Bid input values as Main spec bid."],
            type = "execute",
            func = (function()
                CLM.MODULES.BiddingManager:Bid(self.bid)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = 0.5,
            order = 4
        },
        os = {
            name = CLM.L["OS"],
            desc = CLM.L["Bid input values as Off spec bid."],
            type = "execute",
            func = (function()
                CLM.MODULES.BiddingManager:Bid(self.bid, CONSTANTS.BID_TYPE.OFF_SPEC)
                if GetCloseOnBid(self) then self:Toggle() end
            end),
            width = 0.5,
            order = 5
        },
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
                    return CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and (CLM.MODULES.BiddingManager:GetLastBidValue() ~= nil)
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
            disabled = (function() return CONSTANTS.AUCTION_TYPES_OPEN[self.auctionType] and (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) end),
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
                options[tier] = {
                    name = value,
                    desc = CONSTANTS.SLOT_VALUE_TIERS_GUI[tier] or "",
                    type = "execute",
                    func = (function()
                        self.bid = value
                        CLM.MODULES.BiddingManager:Bid(self.bid, tier)
                        if GetCloseOnBid(self) then self:Toggle() end
                    end),
                    order = offset
                }
                offset = offset + 1
                numButtons = numButtons + 1
            end
        end

        if (itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING) and not options[CONSTANTS.SLOT_VALUE_TIER.MAX] then
            local width = options[CONSTANTS.SLOT_VALUE_TIER.BASE] and (rowMultiplier/2) or rowMultiplier
            options["all_in"] = {
                name = CLM.L["All In"],
                desc = sformat(CLM.L["Bid your current DKP (%s)."], tostring(self.standings)),
                type = "execute",
                func = (function()
                    self.bid = self.standings
                    CLM.MODULES.BiddingManager:Bid(self.bid)
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
                if options[tier] then
                    options[tier].width = row_width
                end
            end
        end
    end

    self.top:SetHeight(BASE_HEIGHT + (numRows*ROW_HEIGHT))
    return options
end

local function GenerateNamedButtonsAuctionOptions(self,
    icon, itemLink, shortItemLink, itemValueMode, values)
    local options = {
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
            name = "",--CLM.L["Item"],
            type = "input",
            get = (function(i) return itemLink or "" end),
            set = (function(i,v) end), -- Intentionally: do not override
            width = 1.65,
            order = 2,
            itemLink = shortItemLink,
        },
    }
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
                        self.bid = value
                        CLM.MODULES.BiddingManager:Bid(self.bid, tier)
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

    self.top:SetHeight(BASE_HEIGHT + ((numRows + math.ceil(numButtons/2))*ROW_HEIGHT))

    return options
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

    local namedButtonsMode = self.roster and self.roster:GetConfiguration("namedButtons")

    local options
    if namedButtonsMode then
        options = GenerateNamedButtonsAuctionOptions(self, icon, itemLink, shortItemLink, itemValueMode, values)
    else
        options = GenerateValueButtonsAuctionOptions(self, icon, itemLink, shortItemLink, itemValueMode, values)
    end

    return options
end

function BiddingManagerGUI:Create()
    LOG:Trace("BiddingManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Bidding"])
    f:SetLayout("flow")
    f:EnableResize(false)
    f:SetWidth(BASE_WIDTH)
    f:SetHeight(BASE_HEIGHT)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Bidding_GUI")
    self.bid = 0
    self.barPreviousPercentageLeft = 1
    self.duration = 1
    f:AddChild(CreateOptions(self))
    RestoreLocation(self)
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
    self.bid = tonumber(value or 0)
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
    self.bar:SetPoint("CENTER", self.top.frame, "TOP", 0, 10)

    self.bar.candyBarBar:SetScript("OnMouseDown", function (_, button)
        if button == 'LeftButton' then
            self:Toggle()
        end
    end)

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
    self.bid = values[CONSTANTS.SLOT_VALUE_TIER.BASE]
    local myProfile = CLM.MODULES.ProfileManager:GetMyProfile()
    self.top:SetTitle(CLM.L["Bidding"])
    if myProfile then
        local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.auctionInfo:RosterUid())
        if roster then
            self.auctionType = roster:GetConfiguration("auctionType")
            self.roster = roster
            if roster:IsProfileInRoster(myProfile:GUID()) then
                self.standings = roster:Standings(myProfile:GUID())
                self.top:SetTitle(CLM.L["Bidding"] ..  " | " .. CLM.L["Current"] .. ": " .. tostring(self.standings))
            end
        end
    end

    if not show then return end
    self:Refresh()
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

function BiddingManagerGUI:Refresh()
    LOG:Trace("BiddingManagerGUI:Refresh()")
    if not self._initialized then return end

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(REGISTRY)
    AceConfigDialog:Open(REGISTRY, self.OptionsGroup) -- Refresh the config gui panel
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
