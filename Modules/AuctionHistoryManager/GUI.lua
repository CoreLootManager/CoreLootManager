local define = LibDependencyInjection.createContext(...)

define.module("AuctionHistoryGui", {"Database", "Acl", "AuctionHistoryManager", "L", "Log", "Utils", "EventManager", "ProfileRegistry", "ConfigManager"},
function(resolve, Database, Acl, AuctionHistoryManager, L, LOG, UTILS, EventManager, ProfileRegistry, ConfigManager)


-- ------------------------------- --

local UIParent, CreateFrame = UIParent, CreateFrame
local pairs, ipairs = pairs, ipairs
local tonumber = tonumber
local date = date

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local RightClickMenu

local function InitializeDB(self)
    self.db = Database:GUI('auctionHistory', {
        location = {nil, nil, "CENTER", 0, 0 }
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

local function ST_GetItemId(row)
    return row.cols[2].value
end

local function ST_GetAuctionBids(row)
    return row.cols[3].value
end

local function ST_GetAuctionTime(row)
    return row.cols[4].value
end

local function ST_GetItemSeq(row)
    return row.cols[5].value
end

local AuctionHistoryGUI = {}
function AuctionHistoryGUI:Initialize()
    LOG:Trace("AuctionHistoryGUI:Initialize()")
    if not Acl:IsTrusted() then return end
    InitializeDB(self)

    self.tooltip = CreateFrame("GameTooltip", "CLMAuctionHistoryGUIDialogTooltip", UIParent, "GameTooltipTemplate")

    RightClickMenu = UTILS.GenerateDropDownMenu(
        {
            {
                title = L["Remove auction"],
                func = (function()
                    local rowData = self.st:GetRow(self.st:GetSelection())
                    if not rowData or not rowData.cols then return end
                    AuctionHistoryManager:Remove(ST_GetItemSeq(rowData))
                end),
                color = "cc0000"
            },
            {
                separator = true,
                trustedOnly = true,
            },
            {
                title = L["Remove old"],
                func = (function()
                    AuctionHistoryManager:RemoveOld()
                end),
                color = "cc0000"
            },
            {
                separator = true,
                trustedOnly = true,
            },
            {
                title = L["Remove all"],
                func = (function()
                    AuctionHistoryManager:Wipe()
                end),
                color = "cc0000"
            }
        },
        Acl:CheckAssistant(),
        Acl:CheckManager()
    )

    self:Create()
    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:RegisterSlash()
    self._initialized = true
    self:Refresh()
end

local ROW_HEIGHT = 18
local MIN_HEIGHT = 105

local function CreateAuctionDisplay(self)
    local columns = {
        {name = "",  width = 200},
    }
    local AuctionHistoryGroup = AceGUI:Create("SimpleGroup")
    AuctionHistoryGroup:SetLayout("Flow")
    AuctionHistoryGroup:SetWidth(265)
    AuctionHistoryGroup:SetHeight(MIN_HEIGHT)
    self.AuctionHistoryGroup = AuctionHistoryGroup
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 1, ROW_HEIGHT, nil, AuctionHistoryGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", AuctionHistoryGroup.frame, "TOPLEFT", 0, 0)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)
    self.st:SetData({})
    -- fix weird behavior when scaling down list and scrollbar not hiding
    self.st.scrollframe:SetScript("OnHide", function() end)
    -- OnEnter handler -> on hover
    local OnEnterHandler = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local rowData = self.st:GetRow(realrow)
        if not rowData or not rowData.cols then return status end
        local tooltip = self.tooltip
        if not tooltip then return end
        local itemId = ST_GetItemId(rowData)
        local itemString = "item:" .. tonumber(itemId)
        tooltip:SetOwner(rowFrame, "ANCHOR_TOPRIGHT")
        tooltip:SetHyperlink(itemString)
        tooltip:AddLine(ST_GetAuctionTime(rowData))
        tooltip:AddLine(L["Bids"])
        local noBids = true
        for bidder, bid in pairs(ST_GetAuctionBids(rowData)) do
            noBids = false
            local bidderProfile = ProfileRegistry.GetByName(bidder)
            if bidderProfile then
                bidder = UTILS.ColorCodeText(bidder, UTILS.GetClassColor(bidderProfile:Class()).hex)
            end
            tooltip:AddDoubleLine(bidder, bid)
        end
        if noBids then
            tooltip:AddLine(L["No bids"])
        end
        tooltip:Show()
        return status
    end)
    -- OnLeave handler -> on hover out
    local OnLeaveHandler = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        self.tooltip:Hide()
        return status
    end)
    -- end
    -- OnClick handler
    local OnClickHandler = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
        local rightButton = (button == "RightButton")
        local status
        local selected = self.st:GetSelection()
        if selected ~= realrow then
            if (row or realrow) then -- disables sorting click
                status = self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, rightButton and "LeftButton" or button, ...)
            end
        end
        if rightButton then
            UTILS.LibDD:CloseDropDownMenus()
            UTILS.LibDD:ToggleDropDownMenu(1, nil, RightClickMenu, cellFrame, -20, 0)
        end
        return status
    end
    -- end

    self.st:RegisterEvents({
        OnEnter = OnEnterHandler,
        OnLeave = OnLeaveHandler,
        OnClick = OnClickHandler
    })

    return AuctionHistoryGroup
end

function AuctionHistoryGUI:Create()
    LOG:Trace("AuctionHistoryGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle(L["Auction History"])
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(265)
    f:SetHeight(MIN_HEIGHT)
    self.top = f

    f:AddChild(CreateAuctionDisplay(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()

end

function AuctionHistoryGUI:Refresh(visible)
    LOG:Trace("AuctionHistoryGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top:IsVisible() then return end

    local data = {}
    local stack = AuctionHistoryManager:GetHistory()
    -- Data
    local rowId = 1
    for seq, auction in ipairs(stack) do
        local row = {
            cols = {
                { value = auction.link},
                { value = auction.id },
                { value = auction.bids },
                { value = date(L["%Y/%m/%d %a %H:%M:%S"], auction.time) },
                { value = seq }
            }
        }
        data[rowId] = row
        rowId = rowId + 1
    end
    -- View
    local rows = (#stack < 20) and #stack or 20
    local previousRows = self.previousRows or rows
    local rowDiff = rows - previousRows
    self.previousRows = rows

    local height = MIN_HEIGHT + ROW_HEIGHT*(rows-1)
    if height < MIN_HEIGHT then height = MIN_HEIGHT end
    local _, _, point, x, y = self.top:GetPoint()
    self.top:SetHeight(height)
    self.AuctionHistoryGroup:SetHeight(height)
    self.st:SetDisplayRows((rows == 0) and 1 or rows, ROW_HEIGHT)

    -- Makes it grow down / shorten up instead of omnidirectional
    if (rows == 0 and previousRows == 1) then -- Removed last one
        -- do nothing
    elseif (rows == 0 and previousRows > 0) then -- Removed all
        self.top:SetPoint(point, x, y + ((-rowDiff - 1)*ROW_HEIGHT/2))
    elseif (rows == 1 and previousRows == 0) then -- Added first
        -- do nothing
    else
        if (rowDiff > 0) then
            self.top:SetPoint(point, x, y - (rowDiff*ROW_HEIGHT/2))
        elseif (rowDiff < 0) then
            self.top:SetPoint(point, x, y + (-rowDiff*ROW_HEIGHT/2))
        end
    end
    self.st:SetData(data)
end

function AuctionHistoryGUI:Toggle()
    LOG:Trace("AuctionHistoryGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function AuctionHistoryGUI:RegisterSlash()
    local options = {
        auction_history = {
            type = "execute",
            name = "Auction History",
            desc = L["Toggle Auction History window display"],
            handler = self,
            func = "Toggle",
        }
    }
    ConfigManager:RegisterSlash(options)
end

function AuctionHistoryGUI:Reset()
    LOG:Trace("AuctionHistoryGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

AuctionHistoryGUI:Initialize()
resolve(AuctionHistoryGUI)
end)