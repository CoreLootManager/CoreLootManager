# Inept Loot Manager

TBC Anniversary Classic fork of [Core Loot Manager](https://github.com/ClassicLootManager/ClassicLootManager) — a DKP and EPGP based loot management system.

## About

Inept Loot Manager is a robust loot tracking and awarding tool for guilds running TBC Anniversary Classic. It supports **DKP**, **EPGP**, and **SK** point systems with automatic data synchronisation across your guild.

This fork has been stripped down to target TBC Anniversary Classic exclusively (Interface 20505).

## Features

- **Multiple point systems** — DKP, EPGP, and SK, running simultaneously if desired
- **Auto synchronisation** within and across guilds
- **Multiple roster (team) support** with independent configurations
- **Multiple item auction** — auction any number of items in a single auction
- **Alt-main linking** and **profile locking**
- **Multi-level access control** — Managers, Assistants, and Members

### Auction Modes

- Open, closed, and Vickrey bid systems
- Anonymous bidding support
- Static, ascending, and tiered item value systems
- Named buttons for custom loot system workflows
- Anti-snipe protection
- Auction from corpse or bag (default: alt-click)

### Point Awards

- On-time, raid completion, and interval bonuses
- Boss kill bonuses (configurable per boss)
- Configurable weekly and hard point caps
- Zero-Sum Bank mode, inflation, and taxation (DKP)
- Minimum GP configuration (EPGP)

### Administration

- Full history tracking (point changes and item awards)
- Auditing UI for event management
- Time travel / sandbox mode for correcting historical errors
- Multi-level logging

### Integrations

- JSON exporting via `/ilm export`
- [RCLootCouncil integration](https://github.com/evil-morfar/RCLootCouncil_Classic) for LC + EPGP/DKP

## Slash Commands

- `/ilm` — Open configuration
- `/ilm award [item]` — Award item GUI
- `/ilm export` — Export data
- `/ilm queue` — Toggle loot tracking queue
- `/ilm guireset` — Reset GUI position

## Installation

Copy the following folders into your `Interface/AddOns/` directory:

- `IneptLootManager/` — Core addon (required)
- `IneptLootManager_Alerts/` — Alert notifications (optional)
- `IneptLootManager_Tracker/` — Item tracking (optional)
- `IneptLootManager_Integrations/` — JSON export (optional)

## License

This project is licensed under the Apache License 2.0. See the `LICENSE` and `NOTICE` files for more.
