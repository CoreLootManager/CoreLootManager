# Classic Loot Manager

[![Lint](https://github.com/ClassicLootManager/ClassicLootManager/actions/workflows/lint.yml/badge.svg)](https://github.com/ClassicLootManager/ClassicLootManager)
[![Release](https://img.shields.io/github/v/release/ClassicLootManager/classiclootmanager.svg?color=important)](https://github.com/ClassicLootManager/ClassicLootManager/releases)
[![Issues](https://img.shields.io/github/issues/ClassicLootManager/classiclootmanager?color=blue)](https://github.com/ClassicLootManager/ClassicLootManager/issues)
[![Discord](https://img.shields.io/discord/813686248841019392?label=discord)](https://discord.gg/Qjn8KdD8yt)
[![Patreon](https://img.shields.io/badge/Support%20CLM-Patreon-red)](https://www.patreon.com/classiclootmanager)

 ![Be sure to read before upgrading to v2.0.0](https://cdn.discordapp.com/attachments/843129642298376252/1017720926055452763/clm_read1.png)

# About
Classic Loot Manager is a robust Loot Tracking and awarding tool for guilds.
It's designed to superseed old WoW Classic DKP and EPGP AddOns and it's derivatives and solves it's biggest painpoints by focusing on optimial communication and storage. CLM implements Event Sourcing and MVC programming models to achieve those targets. All data is synchronised automatically.

## Wiki
Be sure to check our [Wiki](https://github.com/ClassicLootManager/ClassicLootManager/wiki) for lots of information.

## Point Systems
Classic Loot Manager currently supports **DKP** and **EPGP**. There are also mechanisms for utilizing DKP as **SK** which you can run at the same time!

# Implemented features
## Auto-magical synchronisation
## Multiple roster (teams) support
With CLM unconquered scalability, you can run multiple DKP, EPGP and SK systems in your guild, even at the same time!
## Alt-main linking
## Profile locking
If you want to block some players from receiving points or being charged for items just lock their profile!
## Mulit-level Access Control
* Managers can control every aspect of the AddOn.
* Assistants can award loot and DKP but can't control roster 
settings.
## DKP point system
* Fine-grained configurable awarding and decaying
* Configurable weekly and hard point caps
* Zero-Sum Bank mode + inflation
* Taxation options
## EPGP point system
* All the goodies from DKP and also:
* Minimum GP configuration
## Multiple auction modes
* Open auction with configurable minimum bid increment and announcements
* Support for anonymous bidding
* Closed and Vickrey bid systems
* Configurable per-slot min and max item values
* Configurable per-item min and max item values
* **Static** (constant) and **Ascending** item value systems for bidding
* **Tiered** bid system, extending min and max values to up to 5 tiers

## Named buttons for bidding
* You can now use named buttons instead of numbers for ease of implementing various loot systems while still keeping the value-based functionalities.

## History tracking and management
* Fine grained point history
* Item awards with all related information (when, who, how much)
## Extensive Auctioning system
### Auctioning
* Configurable Anti-snipe protection
* Auction from corpse or bag (default: alt-click)
* Simple item awarding
* Award item without auction through slash command
* Optional bid storing and posting to configured channel
* Item Upgrade information during auction
### Bidding
* Value increments (open bid mode only)
* Alerts and notifications
## Automated DKP / EP awards
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
## Utilities
* Built-in migration from MonolithDKP, EssentialDKP and CommunityDKP
* Loot tracking queue for fast auctioning
* Auto-posting loot to raid channel
* Player spec and role tracking
* DKP and GP price information on tooltip
## External integrations
* [WoW DKP Discord Bot integration](http://tiny.one/wowdkpbot-discord)
* [Gargul integration](https://github.com/papa-smurf/Gargul) for easy TMB-input
* [RCLootCouncil integration](https://github.com/evil-morfar/RCLootCouncil_Classic) for even easier LC + EPGP/DKP combination
* XML and JSON Exporting


# Upgrading to v2.0.0 from 1.9.x
If you wish to use your current standings during prepatch, you can now import the data from version `1.9.x`. This will however import only your profiles (without linking), standings and rosters (without history and configuration).
To export the data:  

`In v1.9.x:`
  - Open Export GUI (Minimap or `/clm export`)
  - Select: Standings (only) and JSON format (default)
  - Select which rosters and profiles you want to export (all by default)
  - Export
  - Copy the resulting JSON to a file and save it
  
`In v2.0.0:`
  - Open Import GUI (`/clm import`)
  - Paste your exported JSON string
  - Click Accept
If the data parse will be successfull you will now be able to import it by clicking:
`Import`
```
[Import should be executed only once in guild]
```

License
--------------

This project is licensed under the MIT license, see the `LICENSE` file. In-tree third party libraries in the `Libs` folder are subject to their own licenses.
Any third party files included during the build process are also subject to their own licenses.