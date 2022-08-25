# Classic Loot Manager

[![Lint](https://github.com/ClassicLootManager/ClassicLootManager/actions/workflows/lint.yml/badge.svg)](https://github.com/ClassicLootManager/ClassicLootManager)
[![Release](https://img.shields.io/github/v/release/ClassicLootManager/classiclootmanager.svg?color=important)](https://github.com/ClassicLootManager/ClassicLootManager/releases)
[![Issues](https://img.shields.io/github/issues/ClassicLootManager/classiclootmanager?color=blue)](https://github.com/ClassicLootManager/ClassicLootManager/issues)
[![Discord](https://img.shields.io/discord/813686248841019392?label=discord)](https://discord.gg/Qjn8KdD8yt)
[![Patreon](https://img.shields.io/badge/Support%20CLM-Patreon-red)](https://www.patreon.com/classiclootmanager)

# About
Classic Loot Manager is a robust Loot Tracking and awarding tool for guilds.
It's designed to superseed old WoW Classic DKP AddOns and its derivatives and solves it's biggest painpoints by focusing on optimial communication and storage. CLM implements Event Sourcing and MVC programming models to achieve those targets. All data is synchronised automatically.

## Wiki
Be sure to check our [Wiki](https://github.com/ClassicLootManager/ClassicLootManager/wiki) for lots of information.

## Point Systems
Classic Loot Manager currently supports **DKP**

# Implemented features
## Auto-magical synchronisation
## Multiple roster (teams) support
## Alt-main linking
## Mulit-level Access Control
* Managers can control every aspect of the AddOn.
* Assistants can award loot and DKP but can't control roster 
settings.
## DKP point system
* Fine-grained configurable awarding and decaying
* Configurable weekly and hard point caps
* Zero-Sum Bank mode + inflation
* Taxation options
## Multiple auction modes
* Open auction with configurable minimum bid increment and announcements
* Support for anonymous bidding
* Closed and Vickrey bid systems
* Configurable per-slot min and max item values
* Configurable per-item min and max item values
* Static (constant) and Ascending item value systems for bidding
## History tracking and management
* Fine grained point history
* Item awards with all related information (when, who, how much)
## Extensive Auctioning system
### Auctioning
* Configurable Anti-snipe protection
* Auction from corpse or bag (with alt-click)
* Simple item awarding
* Award item without auction through slash command
* Optional bid storing and posting to configured channel
### Bidding
* Value increments (open bid mode only)
* Alerts and notifications
## Automated DKP awards
* All options are configurable
* On-time bonus - awarded when starting raid
* Raid completion bonus - awarded when ending raid
* Interval bonus - awarded every interval minutes
* Boss kill bonus - configurable per boss and through global value
## Multiple simultaneous Raids management
* Raid management and auto-creating profiles and filling roster when initializing raid
* Multi-level logging for better issue handling
## Chat commands
* Send `!dkp` and `!bid` Whisper or Raid commands for bidding without using addon
* Out of guild bidding using commands or CLM
## Administration
* Auditing UI - Check and manage all events that happened in the addon
* Time travel mode - correct errors and add entries in history to keep the data in place
* Sandbox mode - check out options, do trainings, and experiment without affecting other players
## Utilities
* Built-in migration from MonolithDKP, EssentialDKP and CommunityDKP
* Loot tracking queue for fast auctioning
* Auto-posting loot to raid channel
* Player spec tracking
## External integrations
* [WoW DKP Discord Bot integration](http://tiny.one/wowdkpbot-discord)
* XML and JSON Exporting

License
--------------

This project is licensed under the MIT license, see the `LICENSE` file. In-tree third party libraries in the `Libs` folder are subject to their own licenses.
Any third party files included during the build process are also subject to their own licenses.