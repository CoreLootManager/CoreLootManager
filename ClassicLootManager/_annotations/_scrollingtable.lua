-- Project-local LuaLS annotations for LibScrollingTable-1.0.
-- Covers only the fields and methods used in this project.
-- Not loaded at runtime.

---@meta _

---@class LibSTTable
---@field frame table WoW Frame that contains the scrolling table
---@field scrollframe table WoW ScrollFrame child
---@field DefaultEvents table Default event handler callbacks provided by the library
---@field rowHeight number Height of a single row in pixels
local LibSTTable = {}

---@param data table
function LibSTTable:SetData(data) end

---@param numRows number
---@param rowHeight number
function LibSTTable:SetDisplayRows(numRows, rowHeight) end

---@param enable boolean
function LibSTTable:EnableSelection(enable) end

---@return number?
function LibSTTable:GetSelection() end

---@param index number
---@return table?
function LibSTTable:GetRow(index) end

---@param events table
function LibSTTable:RegisterEvents(events) end

function LibSTTable:ClearSelection() end

---@param cols table
function LibSTTable:SetDisplayCols(cols) end

function LibSTTable:Show() end
function LibSTTable:Hide() end

-- ────────────────────────────────────────────────────────────
-- ScrollingTable singleton (LibStub result)
-- ────────────────────────────────────────────────────────────

---@class LibScrollingTable
local LibScrollingTable = {}

---@param columns table
---@param numRows number
---@param rowHeight number
---@param highlight? any
---@param parent? table
---@return LibSTTable
function LibScrollingTable:CreateST(columns, numRows, rowHeight, highlight, parent) end
