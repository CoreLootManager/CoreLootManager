---@meta

---@class VersionTable
---@field major integer
---@field minor integer
---@field patch integer
---@field changeset string

---@class playerGuid User GUID
---@class shortGuid User GUID integer or table

---@alias playerSet table<playerGuid, boolean>

---@alias playerRole "NONE" | "DAMAGER" | "TANK" | "HEALER"

---@class LogEntry

---@alias canonicalClass "WARRIOR" | "PALADIN" | "HUNTER" | "ROGUE" | "PRIEST" | "DEATHKNIGHT" | "SHAMAN" | "MAGE" | "WARLOCK" | "MONK" | "DRUID" | "DEMONHUNTER" | "EVOKER"