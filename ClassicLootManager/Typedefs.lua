---@meta

---@class VersionTable
---@field major integer
---@field minor integer
---@field patch integer
---@field changeset string

---@class playerGuid User GUID

---@class shortGuid integer | table
---@alias possibleGuidSource integer | string | LogEntry | shortGuid

---@alias playerSet table<playerGuid, boolean>

---@alias playerRole "NONE" | "DAMAGER" | "TANK" | "HEALER"

---@class LogEntry

---@alias canonicalClass "WARRIOR" | "PALADIN" | "HUNTER" | "ROGUE" | "PRIEST" | "DEATHKNIGHT" | "SHAMAN" | "MAGE" | "WARLOCK" | "MONK" | "DRUID" | "DEMONHUNTER" | "EVOKER"

---@alias mouseButton "LeftButton" | "RightButton" | "MiddleButton" | "Button4" | "Button5"

---@class ColorDefinition
---@field r number
---@field g number
---@field b number
---@field a number
---@field hex string

---@class itemLink

---@class UIDropdownMenuTemplate

---@class STselected
---@field IsSelected function
---@field _storage integer[]

---@class ScrollingTable
---@field DefaultEvents table<string, function>
---@field selected STselected
---@field filtered integer[]
---@field ClearSelection function

---@class DropdownMenu

---@class equipLoc