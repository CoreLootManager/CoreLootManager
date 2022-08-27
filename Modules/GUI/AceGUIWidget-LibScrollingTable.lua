--[[-----------------------------------------------------------------------------
LibScrollingTable Widget
Wraps ScrollingTable provided by LibScrollingTable in AceGUI widget
-------------------------------------------------------------------------------]]
local Type, Version ="CLMLibScrollingTable", 1
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
    "DoCellUpdate",
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
    self:SetHeight(self.st.frame:GetHeight() + self.st.rowHeight + 8)
end

--[[-----------------------------------------------------------------------------
Methods
-------------------------------------------------------------------------------]]

local methods = {
    ["OnAcquire"] = function(self)
        Resize(self)
    end,

    -- ["OnRelease"] = nil,

    ["GetScrollingTable"] = function(self)
        return self.st
    end,

    ["GetWidth"] = function(self)
        return self.frame.width
    end,

	["SetBackdropColor"] = function(self, ...)
		self.st.frame:SetBackdropColor(...)
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
    local st = ScrollingTable:CreateST({{name ="A", width = 1}}, 25, 18, nil, frame, true)
    st:EnableSelection(true)
    frame:Hide()
    -- create widget
    local widget = {
        st = st,
        frame = frame,
        type  = Type
    }
    for method, func in pairs(methods) do
        widget[method] = func
    end

	for _, methodName in ipairs(STMethodsToExposeDirectly) do
    	widget[methodName] = function(self, ...) return self.st[methodName](self.st, ...) end
	end

	for _, methodName in ipairs(STMethodsToExposeWithResize) do
    	widget[methodName] = function(self, ...)
			local r = self.st[methodName](self.st, ...)
			Resize(self)
			return r
		end
	end

    return AceGUI:RegisterAsWidget(widget)
end

AceGUI:RegisterWidgetType(Type, Constructor, Version)
