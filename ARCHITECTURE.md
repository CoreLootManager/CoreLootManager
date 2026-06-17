# CoreLootManager — Architecture Reference

> **Audience:** developers contributing to or extending the addon.
> Covers structure, key design patterns, data flow, and module responsibilities.

---

## 1. Bird's-Eye View

CLM is a WoW addon that manages loot distribution for guilds. Its two defining architectural choices are:

1. **Event Sourcing via LibEventSourcing** — all state changes are appended as immutable ledger entries. State is derived by replaying those entries. This makes cross-client sync trivial and enables time-travel / auditing.
2. **MVC-ish module system** — managers own state and business logic; GUI modules are separate and depend only on managers, never the reverse.

---

## 2. Repository Layout

```
CoreLootManager/
├── ClassicLootManager/          # Main addon package (loads first)
│   ├── ClassicLootManager.lua   # Entry point, global namespace, init stages
│   ├── Utils.lua                # CLM.UTILS + CLM.CONSTANTS
│   ├── Modules/
│   │   ├── Common/              # ACL, Comms, Config, Database, EventManager, Logger, Version, Hooks
│   │   ├── Global/              # Slash commands, chat handlers, UI handlers, guild-change handler
│   │   ├── GUI/                 # AceGUI widgets, UnifiedGUI panels, filters, UI helpers
│   │   ├── Ledger/              # LedgerManager, SandboxManager, CrossGuildSyncManager
│   │   ├── Loot/                # LootManager, Loot model, AwardGUI
│   │   ├── Points/              # PointManager, AutoAwardManager (on-time/interval/boss-kill)
│   │   ├── Profiles/            # ProfileManager, ProfileInfoManager, alt-main linking
│   │   ├── Raids/               # RaidManager, StandbyStagingManager
│   │   └── Rosters/             # RosterManager, Roster model, configuration, attendance
│   │       └── RosterManager/
│   │           ├── Roster.lua
│   │           ├── RosterManager.lua
│   │           ├── RosterConfiguration.lua
│   │           ├── ItemValueCalculator.lua
│   │           ├── AttendanceTracker.lua
│   │           ├── IndirectSlotMap.lua
│   │           ├── LedgerEntries.lua
│   │           ├── Options.lua
│   │           └── PointInfo.lua
│   ├── Libs/
│   │   ├── LibEventSourcing/    # The ledger/sync core (vendored, custom library)
│   │   ├── LibEventDispatcher/  # Internal event bus
│   │   ├── LibExpiringTimer/    # Timer utilities
│   │   ├── LibDeformat-3.0/     # String de-formatting
│   │   └── LibDataBroker-1.1/   # Minimap data broker
│   ├── Locale/                  # Localisation strings (enUS, deDE, frFR, ruRU, zhCN, zhTW, esES)
│   └── Auctioning/              # AuctionManager, BiddingManager, AutoAssign, AuctionHistory
├── ClassicLootManager_Tracker/  # Lightweight companion: item tracking / tooltip
├── ClassicLootManager_Alerts/   # Companion: UI alerts and notifications
├── ClassicLootManager_Integrations/ # Companion: CSV/MonolithDKP/CEPGP/Gargul import
└── scripts/                     # Build, release, and localization tooling (Python/bash)
```

---

## 3. Global Namespace

All code shares a single addon-local table injected via `local name, CLM = ...`. It is also exposed globally as `_G["CLM"]`.

| Namespace | Contents |
|-----------|----------|
| `CLM.MODULES` | Core runtime modules (managers) keyed by name |
| `CLM.MODELS` | Data-model constructors (Roster, Profile, Loot, …) and `CLM.MODELS.LEDGER` entry types |
| `CLM.GUI` | GUI panels — initialized after all managers |
| `CLM.OPTIONS` | AceConfig option tables |
| `CLM.EXTERNAL` | Third-party integration hooks |
| `CLM.UTILS` | Utility functions |
| `CLM.CONSTANTS` | Shared constants |
| `CLM.COMM_CHANNEL` | Named comm channel strings |
| `CLM.LOG` | Logger instance (LibLogger) |
| `CLM.L` | Localisation table |
| `CLM.AF` | April-Fools flag (time-gated) |

---

## 4. Initialization Sequence

Initialization is **asynchronous and staged**. It fires after `GUILD_ROSTER_UPDATE` confirms the player is in a guild (needed to key the database by guild name). A 10-second fallback timer fires `_ExecuteInitialize` in case the event never comes.

```
OnInitialize()
  └─ Register GUILD_ROSTER_UPDATE
  └─ C_Timer.After(10, _ExecuteInitialize)

GUILD_ROSTER_UPDATE → _ExecuteInitialize → _SequentialInitialize(stage)
  Stage 1  _InitializeDatabase    (retries until guild name resolves)
  Stage 2  _InitializeCore        (ConfigManager, ACL, Hooks)
  Stage 3  _InitializeBackend     (Logger, Comms, EventManager, TrustInfoProvider, LedgerManager)
  Stage 4  _InitializeMinimap
  Stage 5  _InitializeFeatures    (all domain managers + global handlers)
  Stage 6  _InitializeOptions
  Stage 7  _InitializeGUI
  Stage 8  _InitializeExternal    (CLM.EXTERNAL modules)
  Final    _Enable                (Comms:Enable, LedgerManager:Enable)
```

Each stage calls `C_Timer.After(0.1, next_stage)` so WoW's main thread is never blocked. Stage 1 uses a `retry = true` flag and retries up to 5 times.

---

## 5. Event Sourcing / Ledger Pattern

This is the single most important thing to understand about CLM.

### How it works

1. **Every mutation** (create roster, award loot, change points, …) is encoded as a `LogEntry` and appended to the ledger, not applied directly to state.
2. **State is a fold** — when the ledger is replayed, registered *mutator* callbacks rebuild all in-memory state from scratch.
3. **Sync is automatic** — `LibEventSourcing` syncs the ledger between all online CLM users in the guild over `LEDGER.SYNC` / `LEDGER.DATA` comm channels.

### Defining a new ledger entry type

```lua
-- 1. Define the entry schema (in LedgerEntries.lua of the relevant manager)
local MyEntry = CLM.MODELS.LEDGER.LogEntry:extend("MyEntry")
function MyEntry:fields(version)
    return { "rosterUid", "someValue" }
end
CLM.MODELS.LEDGER.MY_ENTRY = MyEntry

-- 2. Register a mutator in the manager's Initialize()
CLM.MODULES.LedgerManager:RegisterEntryType(
    CLM.MODELS.LEDGER.MY_ENTRY,
    function(entry)
        -- rebuild state from `entry`
    end
)

-- 3. Append an entry to trigger the mutation on all clients
CLM.MODULES.LedgerManager:Add(MyEntry:new({ rosterUid = ..., someValue = ... }))
```

`LedgerManager:Add()` calls the mutator locally, then broadcasts the entry to the guild for all other clients to replay.

### Sandbox mode

`SandboxManager` wraps the ledger in a "what-if" context — mutations are applied without persisting or broadcasting them. Used for previewing changes.

### Cross-guild sync

`CrossGuildSyncManager` allows sharing ledger state between different guilds via direct whisper-based sync.

---

## 6. Database

`CLM.MODULES.Database` is a thin wrapper around the WoW `SavedVariables` table `CLM2_DB`.

The database key is built from: `<expansion_prefix> <faction> <realm> <guild_name>` (lowercase), isolating each guild's data.

| Accessor | Storage path | Purpose |
|----------|-------------|---------|
| `DB:Global()` | `CLM2_DB.global` | Cross-character global settings |
| `DB:Logger()` | `CLM2_DB.global.logger` | Log severity / verbosity |
| `DB:Personal(table)` | `CLM2_DB[key].personal[table]` | Per-character data |
| `DB:GUI(table)` | `CLM2_DB[key].personal.gui[table]` | Per-character GUI layout |
| `DB:Ledger()` | `CLM2_DB[key].ledger` | The event log (owned by LibEventSourcing) |
| `DB:Server()` | `CLM2_DB[key]` | Full server-scoped namespace |

`DB:Personal(table, schema)` and `DB:GUI(table, schema)` accept an optional schema table to auto-populate missing keys on first load, making safe migrations easy.

---

## 7. Key Domain Models

### Roster (`CLM.MODELS.Roster`)

The central aggregate. A roster represents one loot-management "team" with its own point system.

```
Roster
├── uid / name
├── pointType          (DKP or EPGP)
├── configuration      (RosterConfiguration)
├── defaultSlotValues  (per-slot bid tiers, keyed by INVTYPE_*)
├── itemValues         (per-item overrides)
├── bossKillBonusValues
├── classMultipliers
├── inRoster           { GUID → true }
├── standings          { GUID → number }    (current points)
├── pointInfo          { GUID → PointInfo }
├── attendanceTracker  (AttendanceTracker)
├── pointHistory       [ PointHistoryEntry ]
├── profilePointHistory{ GUID → [entries] }
├── raidLoot           [ Loot ]
├── profileLoot        { GUID → [Loot] }
└── disenchantedLoot   [ Loot ]
```

`RosterConfiguration` stores all tunable parameters (base points, caps, decay, zero-sum bank, etc.). Configuration changes are themselves ledger entries.

### Profile (`CLM.MODELS.Profile`)

Represents a single character. Stored using `StorageQualifiedObject` (see §8).

Key fields: `name`, `guid`, `class`, `spec`, `role`, `main` (GUID or ""), `alts` (set of GUIDs), `locked`.

Alt-main linking: standings always live on the main; alts mirror from main via `Roster:MirrorStandings()`.

### Loot (`CLM.MODELS.Loot`)

An item-award record. Created from a `LedgerEntry` at replay time. Carries: item ID/link, value charged, timestamp, raidUid, profile GUID.

### Raid (`CLM.MODELS.Raid`)

Tracks an active or completed raid session: roster UID, player list, bench, configuration snapshot. Multiple raids can be active simultaneously.

---

## 8. StorageQualifiedObject

A base pattern used by `Profile` and others to split object fields into two categories:

```lua
object.persistent   -- table backed by SavedVariables
object.volatile     -- transient in-memory table
```

Constructed via `UTILS.NewStorageQualifiedObject(storage, prototype)`.

Pass `nil` as `storage` to create a "virtual" (non-persisted) object — used for the disenchanter pseudo-profile.

---

## 9. Access Control (`CLM.MODULES.ACL`)

Four trust levels gating almost every action:

| Constant | Value | Who |
|----------|-------|-----|
| `PLEBS` | 0 | Any guild member |
| `ASSISTANT` | 1 | Officers with assistant role |
| `MANAGER` | 2 | Full officers |
| `GUILD_MASTER` | 3 | Guild leader only |

`TrustInfoProvider` aggregates the guild-master name, the manager list, and the assistant list from the in-game guild roster and from CLM's own configuration. `ACL:CheckLevel(level, name)` queries this to gate operations.

Comm channels register a minimum trust level; messages from senders below that level are silently dropped.

> **Dev note:** In `--@do-not-package@` blocks (active only in a dev environment without the packager stripping them), `ACL.CheckLevel` always returns `true` so all actions are permitted during local testing.

---

## 10. Communications (`CLM.MODULES.Comms`)

A wrapper around AceComm-3.0. Channels:

| Channel | Constant | Trust | Purpose |
|---------|----------|-------|---------|
| `LedgerS3` | `LEDGER.SYNC` | PLEBS | Ledger hash advertisement (low traffic) |
| `LedgerD3` | `LEDGER.DATA` | ASSISTANT | Bulk ledger data transfer |
| `Auction5` | `AUCTION` | — | Auction state (item list, timers) |
| `Bidding5` | `BIDDING` | — | Bid submissions from raiders |
| `Bids2` | `BIDANNOUNCE` | — | Bid announcements back to raiders |
| `Standby2` | `STANDBY` | — | Standby/bench staging |
| `Version2` | `GLOBAL` | — | Version handshake |

`Comms:Send(channel, data, distribution, target, priority)` serializes and sends. `Comms:Register(channel, callback, minLevel)` receives and ACL-gates.

---

## 11. Auctioning System

The auction subsystem has a clean client/server split:

- **AuctionManager** — runs on the ML/GL's client. Owns the auction session, broadcasts item list and timers, collects bids, decides winner.
- **BiddingManager** — runs on all raiders' clients. Displays the bidding UI, sends bid packets to AuctionManager.
- **AuctionInfo** — shared data structure describing an in-flight auction (items, mode, values, anti-snipe state).
- **AuctionHistoryManager** — persists completed auctions for review.
- **AutoAssign** — post-auction logic to automatically assign items based on bid results.

Auction modes: Open, Closed, Vickrey. Item value systems: Static, Ascending, Tiered. All configurable per roster.

---

## 12. Points Subsystem

Two point types share one manager via `CONSTANTS.POINT_TYPE`:

| Type | Fields |
|------|--------|
| `DKP` | Single `standings` value per player |
| `EPGP` | `EP` (effort points) and `GP` (gear points); priority = EP/GP |

`PointManager` operations:
- `ModifyPoints` / `SetPoints` / `DecayPoints` — manual mutations, each appended as a ledger entry.
- `UpdatePointsDirectly` — used internally (zero-sum bank, auto-awards) to batch-apply points without creating a user-visible history entry.

`AutoAwardManager` fires automatic awards based on:
- **On-time bonus** — when a raid starts.
- **Interval bonus** — every N minutes during a raid.
- **Boss-kill bonus** — per encounter ID (tables in `Encounters/`), configurable per difficulty.
- **Raid-end bonus** — when a raid ends.

---

## 13. GUI Architecture

All GUI is in `CLM.GUI`. Panels register themselves and are initialized in stage 7 after all managers are ready.

`UnifiedGUI.lua` hosts a tabbed container. Individual tabs are in:
- `UnifiedGUI_Standings.lua`
- `UnifiedGUI_History.lua`
- `UnifiedGUI_Profiles.lua`
- `UnifiedGUI_Raids.lua`
- `UnifiedGUI_Audit.lua`

Custom AceGUI widgets (`AceGUIWidget-*.lua`) extend the framework with:
- `ButtonDropDown` — a button that opens a dropdown.
- `IconNoLabel` — icon-only button for item cells.
- `LibScrollingTable` — bridge between LibScrollingTable and AceGUI.

`Filters.lua` provides reusable roster/class/search filter bar logic used across multiple tabs.

**Rule:** GUI modules may read from managers; they must never write state directly — all writes go through a manager method which appends a ledger entry.

---

## 14. Companion Packages

| Package | Purpose |
|---------|---------|
| `ClassicLootManager_Tracker` | Tracks items looted from boss kills and queues them for auction without needing the ML window. |
| `ClassicLootManager_Alerts` | Floating alert banners shown to all players when loot is awarded or points change. |
| `ClassicLootManager_Integrations` | Import wizards for MonolithDKP, EssentialDKP, CommunityDKP, BastionLoot, CEPGP. |

Each companion has its own `.toc` file so they load independently. They call into `CLM.EXTERNAL` to register themselves, which is iterated in `_InitializeExternal`.

---

## 15. Multi-Expansion Compatibility

`CLM.GetExpansion()` returns the numeric expansion index from `GetBuildInfo()`. Expansion-conditional code gates:

- Class lists (Death Knight added in WotLK, Monk in MoP, Demon Hunter in Legion, Evoker in Dragonflight).
- Database key prefix (`cata`, `tww`, `exp<N>`).
- Loot roll types (Disenchant and Transmog added in Cataclysm).
- API shims in `Utils.lua` — `UTILS.GetItemInfo`, `UTILS.GetContainerNumSlots`, `UTILS.GetLootMethod`, etc. wrap both old global functions and the newer `C_Item`/`C_Container` namespaced APIs.

`CLM.IsClassicEra()` and `CLM.IsSoD()` disambiguate Season of Discovery from classic-era.

---

## 16. Adding a New Feature — Checklist

1. **Define ledger entry** in a `LedgerEntries.lua` file beside your manager. Extend `CLM.MODELS.LEDGER.LogEntry` and add to `CLM.MODELS.LEDGER`.
2. **Register mutator** inside your manager's `Initialize()` via `LedgerManager:RegisterEntryType`.
3. **Add manager** to `CLM.MODULES` and call `Initialize()` in `CORE:_InitializeFeatures()` at the correct order position.
4. **Keep GUI separate** — create/extend a panel in `CLM.GUI`, initialize in stage 7.
5. **ACL-gate** any privileged action with `CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER, sender)`.
6. **Schema-migrate** any new `DB:Personal` or `DB:GUI` tables by passing a default schema table as the second argument — missing keys are filled automatically on load.
