-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local ipairs = ipairs

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local RightClickMenu
local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('lootQueue', {
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

local function ST_GetItemLink(row)
    return row.cols[1].value
end

local function ST_GetItemId(row)
    return row.cols[2].value
end

local function ST_GetItemSeq(row)
    return row.cols[3].value
end

local LootQueueGUI = {}
function LootQueueGUI:Initialize()
    LOG:Trace("LootQueueGUI:Initialize()")
    InitializeDB(self)

    self.tooltip = GameTooltip

    RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            {
                title = CLM.L["Auction item"],
                func = (function()
                    local rowData = self.st:GetRow(self.st:GetSelection())
                    if not rowData or not rowData.cols then return end
                    CLM.MODULES.EventManager:DispatchEvent("CLM_AUCTION_WINDOW_FILL", {
                        link = ST_GetItemLink(rowData),
                        start = false
                    })
            end),
                trustedOnly = true,
                color = "00cc00"
            },
            {
                title = CLM.L["Remove item"],
                func = (function()
                    local rowData = self.st:GetRow(self.st:GetSelection())
                    if not rowData or not rowData.cols then return end
                    CLM.MODULES.LootQueueManager:Remove(ST_GetItemSeq(rowData))
                end),
                color = "cc0000"
            },
            {
                separator = true,
                trustedOnly = true,
            },
            {
                title = CLM.L["Remove all"],
                func = (function()
                    CLM.MODULES.LootQueueManager:Wipe()
                end),
                color = "cc0000"
            }
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )

    self:Create()
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:RegisterSlash()
    self._initialized = true
    self:Refresh()
end

local ROW_HEIGHT = 18
local MIN_HEIGHT = 105

local function CreateLootDisplay(self)
    local columns = {
        {name = "",  width = 200},
    }
    local LootQueueGroup = AceGUI:Create("SimpleGroup")
    LootQueueGroup:SetLayout("Flow")
    LootQueueGroup:SetWidth(265)
    LootQueueGroup:SetHeight(MIN_HEIGHT)
    self.LootQueueGroup = LootQueueGroup
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 1, ROW_HEIGHT, nil, LootQueueGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", LootQueueGroup.frame, "TOPLEFT", 0, 0)
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
            if IsAltKeyDown() and CLM.MODULES.ACL:IsTrusted() then
                local rowData = self.st:GetRow(realrow)
                if not rowData or not rowData.cols then return status end
                CLM.MODULES.EventManager:DispatchEvent("CLM_AUCTION_WINDOW_FILL", {
                    link = ST_GetItemLink(rowData),
                    start = false
                })
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

    return LootQueueGroup
end

function LootQueueGUI:Create()
    LOG:Trace("LootQueueGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle(CLM.L["Loot Queue"])
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(265)
    f:SetHeight(MIN_HEIGHT)
    self.top = f

    f:AddChild(CreateLootDisplay(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()

end

function LootQueueGUI:Refresh(visible)
    LOG:Trace("LootQueueGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top:IsVisible() then return end

    local data = {}
    local queue = CLM.MODULES.LootQueueManager:GetQueue()
    -- if #queue > 0 then
    -- Data
    local rowId = 1
    for seq, item in ipairs(queue) do
        local row = {
            cols = {
                { value = item.link },
                { value = item.id },
                { value = seq }
            }
        }
        data[rowId] = row
        rowId = rowId + 1
    end
    -- View
    local rows = (#queue < 10) and #queue or 10
    local previousRows = self.previousRows or rows
    local rowDiff = rows - previousRows
    self.previousRows = rows

    local height = MIN_HEIGHT + ROW_HEIGHT*(rows-1)
    if height < MIN_HEIGHT then height = MIN_HEIGHT end
    local _, _, point, x, y = self.top:GetPoint()
    self.top:SetHeight(height)
    self.LootQueueGroup:SetHeight(height)
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

function LootQueueGUI:Toggle()
    LOG:Trace("LootQueueGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
    end
end

function LootQueueGUI:RegisterSlash()
    local options = {
        queue = {
            type = "execute",
            name = "Loot Queue",
            desc = CLM.L["Toggle Loot Queue window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function LootQueueGUI:Reset()
    LOG:Trace("LootQueueGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.LootQueue = LootQueueGUI