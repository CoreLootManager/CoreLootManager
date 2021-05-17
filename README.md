Classic Loot Manager
====================

About
--------------
Classic Loot Manager is intended to be a robust Loot Tracking and awarding tool for guilds. 
It's designed to superseed old WoW Classic DKP AddOns and its derivatives and solves it's biggest painpoints by focusing on optimial communication and storage. CLM implements Event Sourcing and MVC programming models to achieve those targets. All data is synchronised automatically.

Basic Concepts
--------------
### Point Systems
Classic Loot Manager currently supports:
* DKP  

Additional point systems are planned:
* SK (Suicide Kings)
* Roll based (`/random`)
* EPGP
### Profiles and  Rosters
Each player / character needs to have his `profile` created within the AddOn (once). This allows for alt -> main linking and access control lists.
`Rosters` are the central element of the addon. They can represent different teams or phases of the game. Each of them has separate Player, point standings and configuration pool.

### Raid Management and Auctioning
For the auctioning and awarding items to work, `trusted` player needs to initialize a raid first. This locks the raid to that person and makes him the `auctioneer`. It's advised that `auctioneer` is a Raid Assist, Raid Leader or Master Looter. Initializing raid allows also auto-handling of features like auto-point award for bonuses (On-Time, Interval, End of Raid, Boss kill).

### ACL (Access  Control List)
There are four levels of access. Most important are `Manager` (full) and `Assistant` (limited).  
`Manager` is a player with guild rank allowing `writing officer notes`.  
`Assistant` is a player with guild rank allowing `reading officer notes`.  
`Guild Master` always has full rights.  
Rest of the players are called `untrusted`.

### Synchronisation
Data synchroniation occurs automatically, starting from the newest to oldest data, whenever any `trusted` player is online. Only missing data is transmitted. This is achieved by announcing only information about what data users have and `trusted` players responding with missing entries. This mechanism is achieved by using [lua-eventsourcing](https://github.com/SamMousa/lua-eventsourcing) library co-developed for this AddOn. 
### Configuration
Each roster has separate configuration located under `ESC -> Interface -> AddOns -> Classic Loot Manager -> Rosters`. This allows for multiple and very different teams to be running within same guild and even at the same time. 

## Conceptual flows
### First Time setup
1. Set appropriate ranks in guild ranks configuration
1. Create player profiles for specified ranks or levels
1. Create first rosters 
1. Add players to rosters
1. Award players some points
### Raiding
1. Select the roster and initialize raid
1. Raid
1. Kill bosses
1. Loot stuff
1. Auction the loot
1. Award auctioned loot
1. Give players the loot
## Features
### Implemented
* Mulit-level Access Control
* Auto-magical synchronisation
* DKP system
* Point, roster and loot management
* Multiple rosters (teams) support
* Closed and Vickrey bid systems
* Static and ascending price value systems
* Default item values per slot
* Item value overriding
* Auctioning and bidding (with anti-snipe protection)
* Raid management and auto-creating profiles and filling roster when initializing raid
* Most GUIs
* Multi-level logging for better issue handling
### Missing / planned
* Zero-Sum Bank mode + inflation
* Open auction mode
* Point history GUI + invalid entry removal management
* Loot history invalid entry removal management
* Weekly point hard-cap
* Auto-standby list (user to subscribe to it)
* All auto-dkp management during raid (on time / boss kill / interval / end bonuses)
* Boss kill bonus options configuratio
* Naming and `/clm command` cleanup
* Better and more descriptive options
* Auto loot award for single winner (the only one highest bid)
* Auctioning from corpse + auto award for Master Looter
* Player spec communication mechanism
* Award item without auction through CLI `/clm award itemLink value [playerName]`
* GUI fixes to be more content aware
* Right click on bids to mark them as invalid (and gray them out). Also all the max/2nd price calculation would skip those