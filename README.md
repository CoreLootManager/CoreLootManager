Classic Loot Manager
====================

[![Lint](https://github.com/ClassicLootManager/ClassicLootManager/actions/workflows/lint.yml/badge.svg)](https://github.com/ClassicLootManager/ClassicLootManager)
[![Release](https://img.shields.io/github/v/release/ClassicLootManager/classiclootmanager.svg?color=important)](https://github.com/ClassicLootManager/ClassicLootManager/releases)
[![Issues](https://img.shields.io/github/issues/ClassicLootManager/classiclootmanager?color=blue)](https://github.com/ClassicLootManager/ClassicLootManager/issues)
[![Discord](https://img.shields.io/discord/813686248841019392?label=discord)](https://discord.gg/Qjn8KdD8yt)


About
--------------
Classic Loot Manager is intended to be a robust Loot Tracking and awarding tool for guilds. 
It's designed to superseed old WoW Classic DKP AddOns and its derivatives and solves it's biggest painpoints by focusing on optimial communication and storage. CLM implements Event Sourcing and MVC programming models to achieve those targets. All data is synchronised automatically.

### Wiki
Be sure to check our [Wiki](https://github.com/ClassicLootManager/ClassicLootManager/wiki) for lots of information.

### Point Systems
Classic Loot Manager currently supports:
* DKP  

Additional point systems are planned:
* SK (Suicide Kings)
* Roll based (`/random`)
* EPGP

### Implemented features
* Mulit-level Access Control
* Auto-magical synchronisation
* DKP system
* Point, roster and loot management
* Multiple rosters (teams) support
* Open, Closed and Vickrey bid systems
* Static and ascending price value systems
* Default item values per slot
* Item value overriding
* Auctioning and bidding (with anti-snipe protection)
* Raid management and auto-creating profiles and filling roster when initializing raid
* Multi-level logging for better issue handling
* Auctioning from bag and corpse
* Award item without auction through slash command
* Weekly and hard point cap
* Main-Alt linking
### Big planned features
* Zero-Sum Bank mode + inflation
* Auto-standby list (user to subscribe to it)
* All auto-dkp management during raid (on time / boss kill / interval / end bonuses)
* Boss kill bonus options configuration
* Auto award for Master Looter
* Player spec communication mechanism