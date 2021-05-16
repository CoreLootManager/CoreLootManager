# Classic Loot Manager

## About
Classic Loot Manager is intended to be a robust Loot Tracking and awarding tool for guilds. 
It's designed to superseed Monolith and its derivatives and solves it's biggest painpoints by focusing on optimial communication and storage. CLM implements EventSourcing and MVC programming models to achieve those targets. All data is synchronised automatically. 

## Basic Concepts
### Point Systems
Classic Loot Manager currently supports:
* DKP  

Additional point systems are planned:
* SK (Suicide Kings)
* Roll based (`/random`)
* EPGP
### Profiles and  Rosters
Each player / character needs to have his `profile` created within the AddOn (once). This allows for alt -> main linking and access level control.
`Rosters` are the central element of the addon. They can represent different teams or phases of the game. Each of them has separate Player, point standings and configuration pool.
### Raid Management and Auctioning
For the auctioning and awarding items to work, one needs to initialize a raid first. This locks the raid to that person and makes him the `auctioneer`. It's advised that `auctioneer` is a Raid Assist, Raid Leader or Master Looter. Initializing raid allows also auto-handling of features like auto-point award for bonuses (On-Time, Interval, End of Raid, Boss kill).
### ACL (Access  Control Level)
### Configuration
### Conceptual flow
### Missing / planned features