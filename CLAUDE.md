# CoreLootManager

WoW TBC Anniversary Classic fork of Core Loot Manager — DKP and EPGP based loot management system.

<!-- ============================================================
     STANDARD WOW ADDON FRAMEWORK
     Everything below this line (until the addon-specific section)
     can be copied to any new WoW addon repo as-is.
     ============================================================ -->

## New Addon Setup Checklist

When creating a new addon repo from this template:

1. **Replace addon identity** — Update the `# Title` and description at the top of this file.
2. **Create `.toc` file** — Use the TOC template below, filling in your addon name, description, saved variables, and file list.
3. **Create `.pkgmeta`** — Use the template below, setting `package-as` to your addon folder name.
4. **Create `.luacheckrc`** — Copy from an existing addon and update the `globals` table for your addon's global names.
5. **Create GitHub Actions workflows** — Copy `.github/workflows/release.yml` and `.github/workflows/luacheck.yml` from an existing addon. Update the CurseForge project ID in the release workflow.
6. **Create `RELEASE.md`** — Copy from an existing addon, update addon-specific file references.
7. **Set up CurseForge** — Create the project on CurseForge, note the project ID, and add `CF_API_KEY` as a GitHub repo secret.
8. **Add addon-specific sections** — Add architecture, file structure, conventions, and patterns sections specific to this addon at the bottom of this file.

### TOC Template

```toc
## Interface: 20505
## Title: YourAddonName
## Notes: Short description of what this addon does
## Author: YourName
## Version: @project-version@
## SavedVariables: YourAddonNameDB
## OptionalDeps: Masque
## IconTexture: Interface\Icons\Your_Icon

Core.lua
```

- `Interface: 20505` is for TBC Anniversary Classic. Do NOT use BCC (Burning Crusade Classic) interface numbers.
- `@project-version@` is replaced by BigWigs packager at build time from the git tag.

### .pkgmeta Template

```yaml
package-as: YourAddonName

manual-changelog:
  filename: CHANGELOG.md
  markup-type: markdown

ignore:
  - images
  - README.md
  - CHANGELOG.md
  - .gitignore
  - .pkgmeta
  - .github
  - "*.svg"
  - "*.png"
  - docs
  - tests
  - .luacheckrc
```

### GitHub Actions: Release Workflow

`.github/workflows/release.yml` — triggers on version tags, packages and uploads to CurseForge + GitHub Releases:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

permissions:
  contents: write

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Package and Release
        uses: BigWigsMods/packager@v2
        with:
          args: -p YOUR_CURSEFORGE_PROJECT_ID
        env:
          CF_API_KEY: ${{ secrets.CF_API_KEY }}
          GITHUB_OAUTH: ${{ secrets.GITHUB_TOKEN }}
```

- Replace `YOUR_CURSEFORGE_PROJECT_ID` with the numeric ID from your CurseForge project page.
- `CF_API_KEY` must be set as a GitHub repository secret (Settings > Secrets > Actions).
- `GITHUB_TOKEN` is provided automatically by GitHub Actions.

### GitHub Actions: Luacheck Workflow

`.github/workflows/luacheck.yml` — runs luacheck on push and PR to main:

```yaml
name: Luacheck

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  luacheck:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Install Lua
        uses: leafo/gh-actions-lua@v10
        with:
          luaVersion: "5.1"

      - name: Install LuaRocks
        uses: leafo/gh-actions-luarocks@v4

      - name: Install luacheck
        run: luarocks install luacheck

      - name: Run luacheck
        run: luacheck .
```

### .luacheckrc Template

```lua
-- Luacheck configuration for WoW addon
std = "lua51"
max_line_length = false

-- Your addon globals (writable)
globals = {
    "YourAddonName",
    "YourAddonNameDB",
    "SLASH_YOURADDON1",
    "SLASH_YOURADDON2",
    "SlashCmdList",
}

read_globals = {
    -- WoW Frame API
    "CreateFrame", "UIParent", "WorldFrame", "GameTooltip",
    "DEFAULT_CHAT_FRAME", "StaticPopup_Show", "StaticPopupDialogs",
    "InterfaceOptionsFrame_OpenToCategory", "InterfaceOptions_AddCategory",
    "InterfaceOptionsFrame", "SettingsPanel", "Settings",
    "hooksecurefunc", "BackdropTemplateMixin", "ColorPickerFrame",

    -- WoW Unit API
    "UnitClass", "UnitName", "UnitExists", "UnitIsPlayer", "UnitIsUnit",
    "UnitIsDeadOrGhost", "UnitDebuff", "UnitBuff", "UnitGUID",
    "UnitAffectingCombat", "UnitPower", "UnitPowerMax", "UnitPowerType",
    "UnitCastingInfo", "UnitChannelInfo", "UnitAttackSpeed", "UnitRangedDamage",
    "UnitRace", "UnitPosition", "UnitMana", "CheckInteractDistance",

    -- WoW Game State
    "GetTime", "GetRealmName", "GetScreenWidth", "GetScreenHeight",
    "GetCursorPosition", "GetSpellInfo", "GetSpellSubtext", "GetSpellTexture",
    "GetSpellCooldown", "GetSpellBonusDamage", "IsSpellKnown", "IsPlayerSpell",
    "GetShapeshiftForm", "GetTotemInfo", "GetNumPartyMembers", "GetNumGroupMembers",
    "IsInRaid", "InCombatLockdown", "IsControlKeyDown", "IsShiftKeyDown",
    "GetNetStats", "GetInventoryItemLink", "GetInventoryItemID",
    "GetInventoryItemCooldown", "GetInventoryItemTexture", "GetItemSpell",
    "GetWeaponEnchantInfo", "GetRangedCritChance", "GetCritChance",
    "IsCurrentSpell", "IsAutoRepeatSpell", "CombatLogGetCurrentEventInfo",
    "BOOKTYPE_SPELL",

    -- WoW Constants
    "RAID_CLASS_COLORS", "LE_PARTY_CATEGORY_HOME", "Enum",
    "COMBATLOG_OBJECT_TYPE_PLAYER", "COMBATLOG_OBJECT_AFFILIATION_MINE",

    -- WoW Timer API
    "C_Timer",

    -- Lua globals
    "strsplit", "strjoin", "tContains", "tinsert", "tremove", "wipe",
    "format", "date", "bit", "sqrt", "floor", "ceil", "abs", "min", "max",
    "random", "loadstring", "setfenv",

    -- WoW string functions
    "strtrim", "strmatch", "gsub", "strlen",

    -- UI Dropdown Menu
    "UIDropDownMenu_SetWidth", "UIDropDownMenu_SetText",
    "UIDropDownMenu_Initialize", "UIDropDownMenu_CreateInfo",
    "UIDropDownMenu_AddButton", "CloseDropDownMenus",

    -- Sound
    "PlaySound", "SOUNDKIT",

    -- Misc
    "GameFontHighlightSmall", "LibStub", "C_NamePlate",
    "CastingBarFrame", "Masque", "OpacitySliderFrame",
}

ignore = {
    "211",  -- Unused local variable
    "212",  -- Unused argument (common in WoW callbacks)
    "213",  -- Unused loop variable
    "311",  -- Value assigned to variable is unused
    "412",  -- Redefining local variable
    "421",  -- Shadowing local variable
    "431",  -- Shadowing upvalue (common with 'self' in nested callbacks)
    "432",  -- Shadowing upvalue argument
    "542",  -- Empty if branch
    "611",  -- Line contains only whitespace
}

exclude_files = {
    ".lua",
    ".luarocks",
    "lua_modules",
}

files["tests/**/*.lua"] = {
    std = "+busted",
}
```

### RELEASE.md Template

```markdown
# Release Checklist

Before each release:

- [ ] Update version in `Core.lua` (or your main file)
- [ ] Update `CHANGELOG.md` (use `**vX.Y.Z**` bold text, no `###` subheadings)
- [ ] Commit with message: `chore(release): bump version to X.Y.Z`
- [ ] Create and push tag: `git tag vX.Y.Z && git push origin vX.Y.Z`

## Version Tagging Rules

Follow [Semantic Versioning](https://semver.org/):

| Type | When to use | Example |
|------|-------------|---------|
| **Major** (X.0.0) | Breaking changes, major UI overhauls, saved variable resets | 2.0.0 → 3.0.0 |
| **Minor** (X.Y.0) | New features, new modules, significant enhancements | 3.1.0 → 3.2.0 |
| **Patch** (X.Y.Z) | Bug fixes, small tweaks, spell data updates | 3.1.5 → 3.1.6 |

## Tag Format

Always prefix with `v`: `v3.1.6`
```

### CHANGELOG.md Format

Use bold version headers with bullet points. No `###` subheadings — CurseForge renders them poorly:

```markdown
**vX.Y.Z**

- Description of new feature
- Description of fix

**vPrevious**

- Previous changes
```

---

## WoW Addon Development

- This is a TBC Anniversary Classic addon project. TBC Anniversary is NOT the same as BCC (Burning Crusade Classic). Do not assume they share the same APIs, TOC interfaces, or CurseForge flavor support.
- Interface number `20505` is for TBC Anniversary Classic.
- Bindings.xml is NOT supported in TBC Classic Anniversary. Do not attempt XML keybinding approaches.
- For keybinds, use SetOverrideBindingClick instead of Bindings.xml or XML-based binding attributes.

### Lua / WoW API Guidelines

- GetSpellInfo does NOT return spell rank in TBC. Use GetSpellSubtext() for rank information.
- Always check if a spell ID is the talent ID, the buff ID, or the castable spell ID — they are often different.
- When implementing UI elements (sliders, checkboxes, frames), always verify callback functions actually fire and that dimension changes propagate to child elements.

## Release Process

When asked to "do a release" or bump version, follow the checklist in `RELEASE.md`.

## Testing

- **luacheck**: Run `luacheck .` from the project root. The `luacheck.exe` binary is included.

## Debugging Rules

- When the user reports a visual bug, ask clarifying questions about EXACTLY what they see before assuming the cause.
- When a fix causes a regression, revert immediately rather than iterating forward on a broken state.

## General Behavior

### Session Continuations
- When resuming a session, do NOT re-explore the entire codebase. Assume prior context is valid unless the user says otherwise.
- Ask what changed since last session rather than reading every file again.

<!-- ============================================================
     ADDON-SPECIFIC SECTION
     Everything below is specific to THIS addon.
     ============================================================ -->

## CLM Architecture

CoreLootManager is built on the Ace3 framework with an event sourcing architecture for guild loot management.

- **ClassicLootManager/** — Main addon directory
  - **ClassicLootManager.lua** — Entry point. Global `CLM` table, module registry, initialization pipeline.
  - **Utils.lua** — Utility functions
  - **MinimapIcon.lua** — DataBroker minimap icon
  - **Tooltips.lua** — Tooltip enhancements for item DKP/GP values
  - **_filelist.xml** — File include list
  - **Libs/** — External libraries (Ace3, LibStub, lib-st, LibDeflate, LibSerialize, etc.)
  - **Locale/** — Localization files
  - **Media/** — Icons, audio, bar textures
  - **Modules/** — Core functionality organized by domain:
    - **Common/** — Database, Comms, EventManager, ACL, ConfigManager, Hooks, Logger, Changelog, Version
    - **Global/** — GlobalBindings, GlobalConfigs, GlobalSlashCommands, GlobalChatMessageHandlers, GlobalUIHandlers
    - **Profiles/** — ProfileManager, ProfileInfoManager
    - **Rosters/** — RosterManager
    - **Raids/** — RaidManager, StandbyStagingManager
    - **Points/** — PointManager, AutoAwardManager
    - **Loot/** — LootManager
    - **Auctioning/** — AuctionManager, BiddingManager, AutoAssign, AuctionHistoryManager
    - **Ledger/** — LedgerManager, SandboxManager, CrossGuildSyncManager
    - **GUI/** — UnifiedGUI (main window), Filters, custom AceGUI widgets
- **ClassicLootManager_Alerts/** — Optional addon for alert notifications
- **ClassicLootManager_Tracker/** — Optional addon for item tracking
- **ClassicLootManager_Integrations/** — Optional addon for export (import/migration removed)

### Global Namespace

```lua
CLM = {
    CORE = AceAddon instance,
    MODULES = {},           -- Feature modules
    MODELS = { LEDGER = {} },
    CONSTANTS = {},
    COMM_CHANNEL = {...},   -- Communication channels
    UTILS = {},
    GUI = {},
    OPTIONS = {},
    ALERTS = {},
    EXTERNAL = {},
    LOG = LibLogger instance,
}
```

### Initialization Pipeline (Sequential)

1. `_InitializeDatabase()` — SavedVariables setup (CLM2_DB, CLM2_Logs, CLM2_MinimapIcon)
2. `_InitializeCore()` — ConfigManager, ACL, Hooks
3. `_InitializeBackend()` — Logger, Comms, EventManager, TrustInfoProvider, LedgerManager
4. `_InitializeMinimap()` — Minimap icon
5. `_InitializeFeatures()` — All feature managers
6. `_InitializeOptions()` — Options/Settings UI
7. `_InitializeGUI()` — Main GUI windows
8. `_InitializeExternal()` — External addon registration
9. `_Enable()` — Enable Comms and LedgerManager

### Key Design Patterns

- **Event Sourcing** (via LibEventSourcing) — All state changes stored as immutable events in the ledger
- **Ace3 Framework** — Standard WoW addon framework for events, hooks, console, GUI, comms
- **Modular Architecture** — Clean separation by feature domain
- **Access Control** — Multi-level permissions (Manager, Assistant, Member)

### Version Detection

This is a TBC-only fork. `CLM.GetExpansion()` always returns `LE_EXPANSION_BURNING_CRUSADE`. Functions `CLM.IsClassicEra()` and `CLM.IsSoD()` have been removed.

## TBC Anniversary Port Status

This fork has been stripped to TBC Anniversary only:

- **TOC files**: All set to Interface `20505` only (no multi-Interface).
- **Version detection**: Hardcoded to TBC. No expansion checks remain.
- **Encounter data**: Only TBC raids (Karazhan, Gruul, Mag, SSC, TK, BT, Hyjal, ZA, Sunwell, plus ZG/AQ20).
- **Classes**: TBC 9 classes only (no DK, Monk, DH, Evoker).
- **Roll types**: No disenchant or transmog roll types.
- **Integrations**: Import/migration removed. JSON export preserved.
- **Alerts**: Uses built-in AlertFrame system (available on modern client backbone).
- **APIs**: TBC Anniversary runs on the modern WoW client backbone, so C_Container, C_GuildInfo, Enum.ItemClass, ItemMixin, and Item:CreateFromItemID all work natively.

## CLM Conventions

- **Module registration**: `CLM.RegisterModule(name, entryPoint)` for core modules, `CLM.RegisterExternal(name, entryPoint)` for external addons.
- **SavedVariables**: `CLM2_DB` (main database), `CLM2_Logs` (event logs), `CLM2_MinimapIcon` (icon position).
- **Naming**: Module files use PascalCase. The global table is `CLM`. Local aliases use SCREAMING_CASE (`CORE`, `LOG`, `MODULES`, `UTILS`).
- **GUI**: Built on AceGUI-3.0 with custom widgets. Main window is `UnifiedGUI` with tab-based navigation.
- **Comms**: Guild channel communication via AceComm with versioned channel names (e.g., `Auction5`, `Bidding5`, `LedgerS3`).
