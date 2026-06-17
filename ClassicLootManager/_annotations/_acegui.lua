-- Project-local LuaLS annotations for AceGUI-3.0.
-- Covers only the widget types and methods used in this project.
-- Not loaded at runtime.

---@meta _
---@diagnostic disable: duplicate-doc-field

-- ────────────────────────────────────────────────────────────
-- Base widget (methods common to every AceGUI object)
-- ────────────────────────────────────────────────────────────

---@class AceGUIWidget
---@field frame table WoW Frame underlying the widget
local AceGUIWidget = {}

---@param width number
function AceGUIWidget:SetWidth(width) end

---@param height number
function AceGUIWidget:SetHeight(height) end

---@return number
function AceGUIWidget:GetWidth() end

---@return number
function AceGUIWidget:GetHeight() end

---@param event string
---@param func function
function AceGUIWidget:SetCallback(event, func) end

---@param disabled boolean
function AceGUIWidget:SetDisabled(disabled) end

---@param key string
---@param value any
function AceGUIWidget:SetUserData(key, value) end

---@param key string
---@return any
function AceGUIWidget:GetUserData(key) end

---@param full boolean
function AceGUIWidget:SetFullWidth(full) end

---@param fraction number
function AceGUIWidget:SetRelativeWidth(fraction) end

---@return string
function AceGUIWidget:GetType() end

-- WoW Frame passthrough methods present on all AceGUI widgets
function AceGUIWidget:Show() end
function AceGUIWidget:Hide() end

---@return boolean
function AceGUIWidget:IsVisible() end

---@param point string
---@param x number
---@param y number
function AceGUIWidget:SetPoint(point, x, y) end

---@param n number?
---@return string, any, string, number, number
function AceGUIWidget:GetPoint(n) end

function AceGUIWidget:ClearAllPoints() end

-- ────────────────────────────────────────────────────────────
-- Container mixin (widgets that hold children)
-- ────────────────────────────────────────────────────────────

---@class AceGUIContainer : AceGUIWidget
---@field frame table WoW Frame underlying the widget
local AceGUIContainer = {}

---@param layout string
function AceGUIContainer:SetLayout(layout) end

---@param widget AceGUIWidget
function AceGUIContainer:AddChild(widget) end

---@param ... AceGUIWidget
function AceGUIContainer:AddChildren(...) end

function AceGUIContainer:DoLayout() end

-- ────────────────────────────────────────────────────────────
-- Frame widget  (AceGUI:Create("Frame"))
-- ────────────────────────────────────────────────────────────

---@class AceGUIFrameWidget : AceGUIContainer
local AceGUIFrameWidget = {}

---@param title string
function AceGUIFrameWidget:SetTitle(title) end

---@param text string
function AceGUIFrameWidget:SetStatusText(text) end

---@param enable boolean
function AceGUIFrameWidget:EnableResize(enable) end

-- ────────────────────────────────────────────────────────────
-- Window widget  (AceGUI:Create("Window"))
-- ────────────────────────────────────────────────────────────

---@class AceGUIWindowWidget : AceGUIContainer
local AceGUIWindowWidget = {}

---@param title string
function AceGUIWindowWidget:SetTitle(title) end

---@param text string
function AceGUIWindowWidget:SetStatusText(text) end

---@param enable boolean
function AceGUIWindowWidget:EnableResize(enable) end

-- ────────────────────────────────────────────────────────────
-- SimpleGroup widget  (AceGUI:Create("SimpleGroup"))
-- ────────────────────────────────────────────────────────────

---@class AceGUISimpleGroupWidget : AceGUIContainer
local AceGUISimpleGroupWidget = {}

-- ────────────────────────────────────────────────────────────
-- ScrollFrame widget  (AceGUI:Create("ScrollFrame"))
-- ────────────────────────────────────────────────────────────

---@class AceGUIScrollFrameWidget : AceGUIContainer
local AceGUIScrollFrameWidget = {}

-- ────────────────────────────────────────────────────────────
-- TabGroup widget  (AceGUI:Create("TabGroup"))
-- ────────────────────────────────────────────────────────────

---@class AceGUITabGroupWidget : AceGUIContainer
local AceGUITabGroupWidget = {}

---@param tabs table
function AceGUITabGroupWidget:SetTabs(tabs) end

---@param tabId string
function AceGUITabGroupWidget:SelectTab(tabId) end

-- ────────────────────────────────────────────────────────────
-- EditBox widget  (AceGUI:Create("EditBox"))
-- ────────────────────────────────────────────────────────────

---@class AceGUIEditBoxWidget : AceGUIWidget
local AceGUIEditBoxWidget = {}

---@param text string
function AceGUIEditBoxWidget:SetText(text) end

---@return string
function AceGUIEditBoxWidget:GetText() end

---@param label string
function AceGUIEditBoxWidget:SetLabel(label) end

---@param max number
function AceGUIEditBoxWidget:SetMaxLetters(max) end

---@param multi boolean
function AceGUIEditBoxWidget:SetMultiLine(multi) end

-- ────────────────────────────────────────────────────────────
-- Dropdown widget  (AceGUI:Create("Dropdown"))
-- ────────────────────────────────────────────────────────────

---@class AceGUIDropdownWidget : AceGUIWidget
local AceGUIDropdownWidget = {}

---@param list table
---@param order table?
function AceGUIDropdownWidget:SetList(list, order) end

---@param value any
function AceGUIDropdownWidget:SetValue(value) end

---@return any
function AceGUIDropdownWidget:GetValue() end

---@param label string
function AceGUIDropdownWidget:SetLabel(label) end

---@param text string
function AceGUIDropdownWidget:SetText(text) end

-- ────────────────────────────────────────────────────────────
-- CLMLibScrollingTable widget  (AceGUI:Create("CLMLibScrollingTable"))
-- ────────────────────────────────────────────────────────────

---@class AceGUICLMLibScrollingTableWidget : AceGUIWidget
local AceGUICLMLibScrollingTableWidget = {}

---@param text string
function AceGUICLMLibScrollingTableWidget:SetText(text) end

---@param r number
---@param g number
---@param b number
---@param a number?
function AceGUICLMLibScrollingTableWidget:SetTextColor(r, g, b, a) end

---@param texture string
function AceGUICLMLibScrollingTableWidget:SetTexture(texture) end

-- ────────────────────────────────────────────────────────────
-- AceGUI singleton
-- ────────────────────────────────────────────────────────────

---@class AceGUI
local AceGUI = {}

---@overload fun(self: AceGUI, widgetType: "Frame"): AceGUIFrameWidget
---@overload fun(self: AceGUI, widgetType: "Window"): AceGUIWindowWidget
---@overload fun(self: AceGUI, widgetType: "SimpleGroup"): AceGUISimpleGroupWidget
---@overload fun(self: AceGUI, widgetType: "ScrollFrame"): AceGUIScrollFrameWidget
---@overload fun(self: AceGUI, widgetType: "TabGroup"): AceGUITabGroupWidget
---@overload fun(self: AceGUI, widgetType: "EditBox"): AceGUIEditBoxWidget
---@overload fun(self: AceGUI, widgetType: "Dropdown"): AceGUIDropdownWidget
---@overload fun(self: AceGUI, widgetType: "CLMLibScrollingTable"): AceGUICLMLibScrollingTableWidget
---@param widgetType string
---@return AceGUIWidget
function AceGUI:Create(widgetType) end

---@param widget AceGUIWidget
function AceGUI:Release(widget) end
