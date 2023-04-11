-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local RightClickMenu

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('tradeList', {
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

local function ST_GetItemLink(row)
    return row.cols[1].value
end

local function ST_GetItemId(row)
    return row.cols[1].id
end

local function ST_GetTradeTarget(row)
    return row.cols[2].value
end

local TradeListGUI = {}
function TradeListGUI:Initialize()
    LOG:Trace("TradeListGUI:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    InitializeDB(self)

    self.tooltip = GameTooltip
    RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            {
                title = CLM.L["Open trade"],
                func = (function()
                    local rowData = self.st:GetRow(self.st:GetSelection())
                    if not rowData or not rowData.cols then return end
                    CLM.MODULES.AutoAssign:InitiateTrade(ST_GetTradeTarget(rowData))
                end),
                color = "00cc00"
            },
            {
                separator = true,
                trustedOnly = true,
            },
            {
                title = CLM.L["Remove"],
                func = (function()
                    local rowData = self.st:GetRow(self.st:GetSelection())
                    if not rowData or not rowData.cols then return end
                    CLM.MODULES.AutoAssign:Remove(ST_GetItemId(rowData), ST_GetTradeTarget(rowData))
                end),
                color = "cc0000"
            },
            -- {
            --     separator = true,
            --     trustedOnly = true,
            -- },
            -- {
            --     title = CLM.L["Remove all"],
            --     func = (function()
            --         -- CLM.MODULES.AuctionHistoryManager:Wipe()
            --     end),
            --     color = "cc0000"
            -- }
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CLM.CONSTANTS.ACL.LEVEL.MANAGER)
    )

    self:Create()
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function()
        TradeListGUI:UpdateSize(0) -- workaround for the movement
        StoreLocation(self)
    end))
    self:RegisterSlash()
    self._initialized = true
    self:Refresh()

    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then
            self:Refresh(true)
        end
    end)

end

local ROW_HEIGHT = 18
local MIN_HEIGHT = 75--105

local function CreateTradeDisplay(self)
    local columns = {
        {name = "", width = 200},
        {name = "", width = 95,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        }
    }
    local TradeHistoryGroup = AceGUI:Create("SimpleGroup")
    TradeHistoryGroup:SetLayout("Flow")
    TradeHistoryGroup:SetWidth(350)
    TradeHistoryGroup:SetHeight(MIN_HEIGHT)
    self.TradeHistoryGroup = TradeHistoryGroup
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 1, ROW_HEIGHT, nil, TradeHistoryGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", TradeHistoryGroup.frame, "TOPLEFT", 0, 0)
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
        local itemString = "item:" .. tostring(itemId)
        tooltip:SetOwner(rowFrame, "ANCHOR_TOPRIGHT")
        tooltip:SetHyperlink(itemString)
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
        else
            local rowData = self.st:GetRow(selected)
            if not rowData or not rowData.cols then return status end
            if IsAltKeyDown() then
                CLM.MODULES.AutoAssign:InitiateTrade(ST_GetTradeTarget(rowData))
            elseif IsModifiedClick() then
                local message = string.format(CLM.L["%s trade me for %s"], ST_GetTradeTarget(rowData), ST_GetItemLink(rowData))
                HandleModifiedItemClick(message)
            end
        end
        return status
    end
    -- end

    self.st:RegisterEvents({
        OnEnter = OnEnterHandler,
        OnLeave = OnLeaveHandler,
        OnClick = OnClickHandler
    })

    return TradeHistoryGroup
end

function TradeListGUI:Create()
    LOG:Trace("TradeListGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Trade List"])
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(350)
    f:SetHeight(MIN_HEIGHT)
    self.top = f

    f:AddChild(CreateTradeDisplay(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function TradeListGUI:UpdateSize(rows)
    local previousRows = self.previousRows or rows
    local rowDiff = rows - previousRows
    self.previousRows = rows

    local height = MIN_HEIGHT + ROW_HEIGHT*(rows-1)
    if height < MIN_HEIGHT then height = MIN_HEIGHT end
---@diagnostic disable-next-line: missing-parameter
    local _, _, point, x, y = self.top:GetPoint()
    self.top:SetHeight(height)
    self.TradeHistoryGroup:SetHeight(height)
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
end

function TradeListGUI:Refresh(visible)
    LOG:Trace("TradeListGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top:IsVisible() then return end

    local data = {}
    local tracked = CLM.MODULES.AutoAssign:GetTracked()
    -- Data
    for playerName, trackedList in pairs(tracked) do
        for _, itemId in ipairs(trackedList) do
            local _, itemLink = GetItemInfo(itemId)
            local color
            local profile = CLM.MODULES.ProfileManager:GetProfileByName(playerName)
            if profile then
                color = UTILS.GetClassColor(profile:Class())
            end
            local row = {
                cols = {
                    { value = itemLink or itemId, id = itemId},
                    { value = playerName, color = color },
                }
            }
            data[#data+1] = row
        end
    end
    -- View
    self:UpdateSize((#data < 20) and #data or 20)
    self.st:SetData(data)
end

function TradeListGUI:Toggle()
    LOG:Trace("TradeListGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function TradeListGUI:RegisterSlash()
    local options = {
        trade = {
            type = "execute",
            name = "Trade List",
            desc = CLM.L["Toggle Trade List window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function TradeListGUI:Reset()
    LOG:Trace("TradeListGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.TradeList = TradeListGUI