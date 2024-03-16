---@meta

---@class VersionTable
---@field major integer
---@field minor integer
---@field patch integer
---@field changeset string

---@alias playerGuid string User GUID

---@class shortGuid integer | table
---@alias possibleGuidSource integer | playerGuid | LogEntry | shortGuid

---@alias playerSet table<playerGuid, boolean>

---@alias playerRole "NONE" | "DAMAGER" | "TANK" | "HEALER"

---@class LogEntry
---@field new function
---@field extend function
---@field fields string[]
---@field time function
---@field creatorFull function

---@alias canonicalClass "WARRIOR" | "PALADIN" | "HUNTER" | "ROGUE" | "PRIEST" | "DEATHKNIGHT" | "SHAMAN" | "MAGE" | "WARLOCK" | "MONK" | "DRUID" | "DEMONHUNTER" | "EVOKER"

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