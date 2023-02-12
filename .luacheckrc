---@diagnostic disable: lowercase-global
-- File is licensed on CC Share-Alike license by https://github.com/DeadlyBossMods and is taken from that repository
std = "lua51"
max_line_length = false

exclude_files = {
	"**/Libs/**",
	"**/.git/**",
	"**/.vscode/**",
	"**/scripts/**"
}
ignore = {
	"11./SLASH_.*", -- Setting an undefined (Slash handler) global variable
	"11./BINDING_.*", -- Setting an undefined (Keybinding header) global variable
	"113/Enum*",
	"211/CLM",
	"212", -- Unused argument
	"542", -- An empty if branch
}
globals = {
	-- Design
	"LibStub",
	-- Saved Variable
	"CLM_DB",
	"CLM_Logs",
	"CLM_MinimapIcon",
	-- 
	"CLM2_DB",
	"CLM2_Logs",
	"CLM2_MinimapIcon",
	-- Bindings
	"CLM_Undo",
	"CLM_Redo",
	-- Monolith and Essential and Community
	"MonDKP_DKPTable",
	"MonDKP_Loot",
	"CommDKP_DKPTable",
	"CommDKP_Loot",
	"CommDKP_DB",
	-- RCLC
	"RCLootCouncil",
	-- VDT 
	"ViragDevTool",
	"ViragDevTool_AddData",
	-- WoW
	"CreateFromMixins",
	"ItemMixin",
	"_G",
	"Item",
	"MAX_RAID_MEMBERS",
	"LootAlertSystem",
	"KeyBindingFrame_LoadUI",
	"KeyBindingFrame",
	"InterfaceOptionsFrame",
	"PlaySound",
	"SOUNDKIT",
	"AlertFrame",
	"strsplit",
	"strlen",
	"GetItemInfo",
	"GetItemInfoInstant",
	"GetAddOnInfo"
}