--[[-----------------------------------------------------------------------------
LibScrollingTable Widget
Wraps ScrollingTable provided by LibScrollingTable in AceGUI widget
-------------------------------------------------------------------------------]]
local Type, Version ="CLMLibScrollingTable", 2
local AceGUI = LibStub and LibStub("AceGUI-3.0", true)
if not AceGUI or (AceGUI:GetWidgetVersion(Type) or 0) >= Version then return end
local ScrollingTable = LibStub("ScrollingTable")
if not ScrollingTable then return end

-- Lua APIs
local pairs = pairs

-- WoW APIs
local CreateFrame, UIParent = CreateFrame, UIParent


--[[-----------------------------------------------------------------------------
Support functions
-------------------------------------------------------------------------------]]

local STMethodsToExposeDirectly = {
    "SetData",
    "SortData",
    "CompareSort",
    "RegisterEvents",
    "FireUserEvent",
    "SetDefaultHighlightBlank",
    "SetDefaultHighlight",
    "GetDefaultHighlightBlank",
    "GetDefaultHighlight",
    "EnableSelection",
    "SetHighLightColor",
    "ClearSelection",
    "SetSelection",
    "GetSelection",
    "GetCell",
    "GetRow",
    "IsRowVisible",
    "SetFilter",
    "DoFilter",
}

local STMethodsToExposeWithResize = {
    "SetDisplayRows",
    "SetRowHeight",
    "SetDisplayCols",
}

local function Resize(self)
    self:SetWidth(self.st.frame:GetWidth())
    -- self.st.rowHeight + 8 comes from the lib implementation of header frame
    -- self:SetHeight(self.st.frame:GetHeight() + self.st.rowHeight + 8)
    self:SetHeight(self.st.frame:GetHeight() + self.st.rowHeight)
end

local function SetHeaderless(self)
    self:SetWidth(self.st.frame:GetWidth())
    self:SetHeight(self.st.frame:GetHeight())
    self.st.frame:SetPoint("TOPLEFT", self.frame , "TOPLEFT", 0, 0)
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]

local methods = {
    ["OnAcquire"] = function(self)
        Resize(self)
    end,

    ["Show"] = function(self)
        self.st:Show()
    end,

    ["Hide"] = function(self)
        self.st:Hide()
    end,

    -- ["OnRelease"] = nil,

    ["GetScrollingTable"] = function(self)
        return self.st
    end,

    ["GetDefaultEvent"] = function(self, event)
        return self.st.DefaultEvents[event]
    end,

    ["GetWidth"] = function(self)
        return self.frame.width
    end,

    ["SetBackdropColor"] = function(self, ...)
        self.st.frame:SetBackdropColor(...)
    end,
    ["SetHeaderless"] = function(self, ...) 
        SetHeaderless(self, ...)
    end,

    -- AFAIK needed for input type of AceConfigDialog
    ["SetDisabled"] = function(self)
    end,
    ["SetLabel"] = function(self)
    end,
    ["SetText"] = function(self)
    end,
}

--[[-----------------------------------------------------------------------------
Constructor
-------------------------------------------------------------------------------]]
local function Constructor()
    local frame = CreateFrame("Frame", nil, UIParent)
    -- local st = ScrollingTable:CreateST({{name ="A", width = 1}}, 25, 18, nil, frame, true)
    local st = ScrollingTable:CreateST({{name = "A", width = 1}}, 0, 18, nil, frame, true)
    st.frame:SetPoint("TOPLEFT", frame , "TOPLEFT", 0, -18)
    -- Override  Set height to ignore the  odd bottom 10px padding
    -- st.SetHeight = function(self)
	-- 	self.frame:SetHeight((self.displayRows * self.rowHeight))
	-- 	self:Refresh();
	-- end

    st:EnableSelection(true)
    frame:Hide()
    -- create widget
    local widget = {
        st = st,
        frame = frame,
        type  = Type
    }
    for method, func in pairs(methods) do
---@diagnostic disable-next-line: assign-type-mismatch
        widget[method] = func
    end

    for _, methodName in ipairs(STMethodsToExposeDirectly) do
---@diagnostic disable-next-line: assign-type-mismatch
        widget[methodName] = function(self, ...) return self.st[methodName](self.st, ...) end
    end

    -- Methods that we do not want to be touched directly as they require resize
    for _, methodName in ipairs(STMethodsToExposeWithResize) do
---@diagnostic disable-next-line: assign-type-mismatch
        widget[methodName] = function(self, ...)
            -- local newMethodName = "ace3_" .. methodName
            -- self.st[newMethodName] = self.st[methodName]
            -- self.st[newMethodName](self.st, ...)
            -- self.st[methodName] = (function()
            --     error("Do not call " .. methodName .. " directly when using Ace3 wrapper.")
            -- end)
            self.st[methodName](self.st, ...)
            Resize(self)
        end
    end

    return AceGUI:RegisterAsWidget(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
