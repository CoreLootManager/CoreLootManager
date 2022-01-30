# Classic Loot Manager v1.4.1
## Fixes
### Shade of Akama Boss kill bonus
AddOn should now properly detect Shade of Akama kill and award Boss kill bonus.
### PvP
Joining Battleground / Arena as trusted player in CLM raid should no longer interfere.
# Classic Loot Manager v1.4.0
## Translations
### French
First version of French translation available thanks to `Paracétamole`.
### Russian
Minor updates as always thanks to `Cyber`.
## Features
### Raid Messages
You can now disable specific messages so they won't be displayed in Raid Warnings or Raid chat. Thank you `grecaun`.
## Fixes
### Auctioning
You are no longer able to bid base value if you already bid in Open Ascending auction.
### Loot announcement
Fixed announcement of dropped loot from corpse. Thank you `grecaun`.
### Auto trade
Auto trade for soulbound items with trade timer not exipred should now work properly.
# Classic Loot Manager v1.3.1
## Hotfixes
- Open Ascending auction should now have the announcements and auto-increments working properly.
- Disabling local configs should now be stored properly.
- Bids will now be cleared only on start of new auction, not when new item is added to auctioning window. This will again allow for multiples of same items being awarded through auction window.
- Fixed typos in localisations.


# Classic Loot Manager v1.3.0
## Features
### Attendance tracking
CLM now tracks and reports attendance based on local configuration. You can set 2 parameters: `Max raids per week` and `Week window size`. First one defines the amount of raiders a player must join to have `100%` attendance. The latter determines the number of weeks take into account.
### Auto Item Award and Auto Trade
CLM will now auto-give items if awarding them when corpse is open, or will try to auto-trade them otherwise. Both behaviors can be disabled in configuration.
### Extended auction information
Addon tracks now various additional bidder behavior: If they did pass, can't use item, closed window without any action or let the timer expire. You can now get those various informations by hovering over `Info` icon. `PASS` has been removed from main bid display. No action might also mean player has not received bid command (was during reload) or has no or outdated addon installed.
### Open auction alignment
Players can no longer `cancel` bids in Open Auctions or `pass` if they already bid. Players can now always bid minimum in those auctions. This allows for handling both English and Swedish House Auctions.
### Item notes
Item notes are now stored locally per item (they are never synced).
### New filtering options
New filters are available in various UIs: Mains only; In Guild only; External (outside of guild) only.
## Fixes
### Bid sorting
Bids will now properly sort in the order of Highest Bid 1st > Total DKP 2nd (on equal bids).
### Class sorting
### Classess in various UIs will now properly sort alphabetically.
### Icon fixes
Missing CLM Icons should now be visible again.
### Localisation enhancements
Multiple localisation enhancements added.
# Classic Loot Manager v1.2.0
## Happy new Year
It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to `support us`!
## DKP-backwards incompatible changes
**This version alters how DKP was calculated. When migrating to it please check the changelong notes and correct values accordingly.**

## Features
### Localization
CLM supports now localization. First one to come is `russian`. If you are interesting in adding other ones please contact us on discord!
### Anonymous Open Auction
New auction type - Anonymous Open. In this mode bidder name will not get posted.
### Relaxed auctioning
Auctioning is no longer limited to RL and ML, but is also allowed for Raid Assists (as long as they are trusted in guild).
### Cross-guild bidding
You can now bid through UI even if you are not in the same guild as auctioneer.
## Fixes
### Multiple linked alts standings
When linking multiple alts to a main, there was an error that resulted in artificially increasing the standings of linked characters. This is fixed now. `If you have multiple alts linked, their standings will now be incorrect. You are required to manually correct it.`
### Linking display in Point history
Alt-main linking will now display in point history as `Linking override`.
### Loot GUI stuck
Loot GUI should no longer get stuck on `Loading...` if there was an entry with non-existent item. Those entries should also no longer be allowed to be created.
### Anti-Snipe limits
Anti-Snipe will be now semi-unlimited (100 times instead of 3) for all Open auction modes.
### State ID
State ID (data hash) is now visible on the tooltip for easy comparison of data sets between users.
### Reworked color signaling
During syncing icon will now turn yellow. Red icon means error in internal state of the AddOn.
# Classic Loot Manager v1.1.3
## Fixes
### Migration
CommunityDKP migration should now properly add players to multiple teams.
### Loot award with multiple linked alts
Points should now be properly distributed when awarding loot to alt, whose main has multiple alts.
### Profile creation
You can now create profiles from guild by name through `/clm addprofile NAME`.
# Classic Loot Manager v1.1.2
## Fixes
### Migration
First sync after migration should now take significantly shorter time for new migrations but in worst case it can still take around 15 min.
### Chat commands
Chat commands should now work properly through raid channel.
### Changelog
You can now disable changelog pop-up permanently in Configuration.
                
# Classic Loot Manager v1.1.1
## Fixes
### Auto Awarding
Auto awarding should now work properly again.
# Classic Loot Manager v1.1.0

## Features
### Per-raid config overrides
You can now override configuration on raid basis, when creating it, without altering global roster settings. This way roster settings become default ones.
### DKP award notes
You can now add a visible note to any DKP award. It will be displayed in point history.
### Boss Kill Bonus info
Boss kill bonus should now have boss name displayed in the note. You can also add it when adding points manually by specifying encounter id in the note field. Addon will take care of the rest.
### Custom bid button
You can now enable an additional bidding button, that is configurable. You can set it to an All-In (all of your DKP), Custom value (1 - 10000) or disable it (default).
### Automated bid value increase
Automated bid value increase is an opt-in feature for Open Bidding mode that will increase your bid by min. increment automatically. Disabled by default.
## Fixes
### Script errors on zoning
Fixed sporadic script errors related to zoning and guild cache.
### Lib-ST collision
There should be no more collision with other addons using older version of Lib-ST. This includes Classic Loot Assistant, Gargul, MizusRaidTracker and many more.
# Classic Loot Manager v1.0.4
## Fixes
### Bidding popup
Bidding UI should now properly popup based on item data received, and in case of missing info popup by default.
### In Raid tick
In Raid filter tick should now be properly checked when in ingame raid thus not requiring clicking twice to remove it.
### Search filter
Search should now properly ignore any additional commas or spaces.
# Classic Loot Manager v1.0.3
## Fixes
### Chat bidding
Chat bidding will no longer result in an error if non-numeric (other than `pass` or `cancel`) value is used.
### First week sync issues
Updated sync library to fix problems with syncing of first week after migration. It should take now around 15 minutes for full sync after using `/clm migrate`.
### ElvUI search issues
Fixed loot search location issue for ElvUI users
### GUI position reset
You can now reset GUI position by typing `/clm guireset`

# Classic Loot Manager v1.0.2
## Fixes
### Loot search
Loot history is now searchable.
### Unusable items ignoring
Bidding window will no longer auto open if item is not usable by player.

# Classic Loot Manager v1.0.1
## Fixes
### Roster creation
Creating roster with provided name now works properly.
### Version notification
You will no longer get notification about new version available if the major part is lower than your current, while minor being bigger.


# Classic Loot Manager v1.0.0
**Classic Loot Manager** is now fully complete! Thanks everyone for supporting us through this journey!

## Features
### Time travel mode
Have you ever awarded some DKP only a few days later, to realise it was in error? The thought of fixing it is such a hassle since you did a bunch of other stuff since then (eg, decay) and instead of the audit table looking clean now, it's full of manual corrections? Then this feature is for you!  
With **Time Travel** mode, you can now jump back to a point in time in your audit log and add/remove entries to make corrections / additions in certain point in time! Simply activate time travel through audit GUI and make your changes. They are applied instantly.  
AddOn management is almost fully available during time traveling. Raid management is disabled during time travel.

### Sandbox mode
**Sandbox** mode allows you to place the addon in a state where you are disconnected from others. While disconnected, you are free to do whatever you want without the worry of a change affecting your DKP setup. 
What might this be useful for? Say you bring a new officer into your team and you'd like to assign them the task of managing DKP. With this mode, they can train themselves doing all the normal DKP operations in isolation.  
If you make a set of changes, you can either choose to apply them or discard them once you are done.


# Classic Loot Manager v0.13.1
## Fixes
### ElvUI compatibility
Fix for ElvUI users which, after patch 2.19, handles UI differently, thus resulting in very weird button placements.

# Classic Loot Manager v0.13.0
While this is a backwards compatible fix there is marginal chance to lead to DKP difference when using alt-main linking. Please double check the values when upgrading to this version.

## Features
### Loot Queue
You can now track items that you have looted into the inventory and auction them from a convenient list. Toggle it through `/clm queue`. Tracked loot quality can be changed in configuration.

## Fixes
### Alt-Main linking points fix
When alt-main linking in case of alt missing in roster, when that alt was added to roster, there was an error that did set both main and alts standings to 0 instead of keeping current. **Please double check point values if using alt-main linking when moving to this version.**
### Untrusted window display
Profiles, Raid and Audit window are now read-only accessible to all users through `/clm commands`

### Window location storing
Window location is now properly stored and restored when window is moved to the right side of the screen."}

## Notes
### Event based communication
Auction Manager now uses events to communication. This is a needed step to allow further AddOn / WeakAuras integration.

# Classic Loot Manager v0.12.0
While this is a backwards compatible fix there is marginal chance to lead to DKP difference if profile that had DKP in multiple rosters was removed and then added again. Please double check the values when upgrading to this version.

## Features
Introducing new auditing UI for managers. You can now check every entry created by ledger and restore already ignored entries by ignoring (removing) the original ignore.
## Fixes
### Migration
Migration is now executed with comms disabled and is reversible by wiping entries.
### Hydross DKP award
Hydross DKP boss kill bonus award workaround is now fixed.
### Weekly gains display
Weekly gains are now tracked and displayed even if there is no weekly cap.
### Roster Decay
Roster decay should now use proper, optimised entries.

# Classic Loot Manager v0.11.0
## Features
### Auto-DKP awarding
* On-time bonus - awarded when starting raid
* Raid completion bonus - awarded when ending raid
* Interval bonus - awarded every interval minutes
* Boss kill bonus - configurable per boss and through global value

## Fixes
* `!dkp` without parameters should now return requester standings
* Removed odd alerts when using `!bid` chat command while CLM was enabled (still not recommended).
# Classic Loot Manager v0.10.1
Hotfix version check for lower patch version in bigger minor

# Classic Loot Manager v0.10.0
## Features
### Zero-Sum DKP
CLM now support Zero-Sum DKP. If you aren't aware of how Zero-Sum works, it's a DKP system where, at a rosters inception, an amount of DKP is awarded to each player and from that point onwards, no new DKP is awarded (although addon does not restrict it). When a player spends DKP (loot is awarded), that DKP is awarded evenly to the rest of the roster.

### Chat commands
You can now use the `!bid X` function to bid (even if you don't have CLM installed). It's not recommended though if you have CLM. Values supported include: value / pass / cancel. You can also get information about your standings through `!dkp`. This function needs to be enabled per trusted person.

### Player search
For convenience, you can now search for players by name on the standings screen. This is particularly helpful to those guilds with large rosters.
### Minimum bid increment
You can now configure minimum bid increment to be used in open auction mode.
## Quality of Life
### Smart DKP award
When applying DKP, CLM is now more context aware depending on filter settings. If you are in a raid, DKP will be assigned to raid members. If you aren't, it'll consider the roster, otherwise it will fall back onto the individual player selection. Alternately, selecting a player (or players) in a raid will override this new behaviour.
### Relaxed auctioning
Auctioning is no longer restricted to the master looter. The raid leader can now perform similar functions. Should also allow for bidding from outside of guild raiders.
        

# Classic Loot Manager v0.9.3

1. You will now see an alert when:
  *  Receiving DKP
  *  Item is awarded to you
  *  Your bid is accepted
  *  Your bid is denied
2. Spec sharing will now share proper values from the talen trees.


Classic Loot Manager v0.9.2
===========================

## Fixes
- Fix point miscalculation in some very rare corner cases

Classic Loot Manager v0.9.1
===========================

## Fixes
- Fix point updating issue for some of the users getting Fatal error
- Changelog *do not show* actually works no

Classic Loot Manager v0.9.0
===========================

## Features

### Link your alt to your main character
You can now link an alt character in a roster to your main for the purposes of sharing DKP. For linking to work, characters must exist in the same roster. When you link and alt to a main, the DKP each character currently has is added together. From that point onwards, when one linked character has their DKP changed, the others will also. Loot and point histories are tracked against the alt-linked character they are applied against so in future, if you disconnect a main from an alt, history and point calculations will be retained seperately (and recalculated). To get started, type `/clm link alt main`. You can unlink through `/clm unlink alt`. Removing alt-linked main from a roster will also remove the alt - make sure you unlink before you remove a main! Only trusted players can do that.

### CommunityDKP Migration Support
You can now migrate existing data to CLM. This includes: loot history, point history, and the current DKP standings. Configuration is not migrated. Undertaking a migration should be attempted by a GM with existing data backed up incase of a problem. Best practice is to do it as GM being the only one with CLM installed in the guild. You can trigger one through the command `/clm migrate`. Check out more information on wiki.

### Spec Sharing
Your spec will now be stored and shared numerically in the profile window for others to see.

### Bidding
Base and max buttons are now disabled if the respective limit is set to 0. Your current DKP is now displayed on the bidding window for convenience

### Standings
You can now see information about weekly DKP gains and limits in the standings tooltips."},

### Changelog
There is now ingame changelog 

## Bugfixes
### Raid creation
Fixed an issue where, in the raid window when attempting to create a new raid, if a user didn't re-select the team, CLM would complain.

### Pass on bid
PASS notifciation is now properly being sorted at the end of the list instead of top.

### ElvUI auction from corpse
Now works as expected!
 
## Notes
### WoW DKP Bot integration
[WoW DKP Discord Bot](http://tiny.one/wowdkpbot-discord)Integration is now supported by CLM! To enable it go to Configuration and tick the bot integration box. Experimental. Might have performance impact.

Classic Loot Manager v0.8.0
===========================

Changes
-------

1. Configurable rounding. You can now round to 0, 1 or 2 decimal places. If you want to round current standings you can apply 0% Decay after selecting the appropriate rounding.
2. You can now explicitly pass on bidding. This will show up as PASS in auction window. Passing will overwrite any previous bids.
3. Added profile prunning commands to remove profiles in batch - check Wiki for more information.
4. Last selected rosters are now remembered after relog.
5. Right clicking will no longer unselect selected row in Point / Loot / Raid lists.
6. Fixed sorting of some windows and added coloring to point values.
7. Changed Right-Click menus to use LibDD to prevent any tainting occuring since previous patch.

Classic Loot Manager v0.7.0
===========================

This version is backwards incompatible: everyone using older version must switch to v0.7.0

New features
------------

1. Per roster hard point cap - maximum DKP points that a player can accumulate at all
2. Weekly point cap - maximum DKP points that a player can get in a weekly reset. The reset day is configurable as either EU or US weekly raid reset day
3. Version control - You can now check what version player is using. This will be refreshed whenever player is online or Raid Ready Check is performed
4. Recovery option to ignore invalid entries - currently this is a GM only command and requires contact with the CLM dev team to execute it properly

Fixes
-----

1. Windows and Icon will now remember their locations when closed
2. Right-clicking on entry in Raid, Point history or Loot history will, in addition to opening menu, select the clicked entry
3. Default value for some tier tokens wasn't properly taken from non-equipable type

Wiki
----
CLM now has Wiki! Check it out for lots of informations. Big thanks to mattey#9843 for writing most of it!

Classic Loot Manager v0.6.4 - Hotfix
===========================

1. Hotfix for old data sync from eventsourcing lib
2. Hotfix for mutator for old loot data

Classic Loot Manager v0.6.3
==================

1. Fix issue which made selection winner for awarding impossible when after second consecutive auction, player to whom awarded originally was still selected during starting of auction

Classic Loot Manager v0.6.2
==================

1. Update lua-eventsourcing v1.4.0 to fix double data send on repeating requests.
2. Set compression level to more sane value

Overall those changes will limit CPU usage during comms.

Classic Loot Manager v0.6.1
==================

Fixes:
1. Hide remove and management menus for untrusted players

Classic Loot Manager v0.6.0
===========================

New features:
1. Add Open Bid system support
2. Add configuration for posting loot award to Guild channel
3. Add posting loot (configurable) to raid after opening corpse
4. Add auctioning from corpse (should work in both WoW UI and Elv UI)
5. Add removal of entries for: Loot History, Point History and Raid Manager

Bugfixes:
1. Fix adding profiles for specific rank in guilds after TBC changes
2. Update lua-eventsourcing to fix a sync issue skipping first week of data for people starting with no entries

Classic Loot Manager v0.5.0 Alpha Milestone
===========================================
This version is backwards incompatible: everyone using version v0.4.x should switch to v0.5.0



MULTIPLE RAID MANAGEMENT
========================
Added multi Raid Management in CLM. This allows creating and managing CLM raids through raid GUI. This functionality is dedicated to trusted players only.

Basic concepts:
Player can only be part of a single raid.
1) Trusted players create raid through raid manager. This corelates the raid with a roster during creation and allows raid naiming for readability. By default each raid uses settings provided by the roster but they can be changed on per-raid basis (not all options are enabled at this point). When creating a CLM raid, player becomes part of that raid.

2) When in ingame raid, one of the trusted players becomes Raid Owner. Raid Owner is a trusted person that is Master Looter in master loot mode or Raid Leader else.

3) Raid Owner should start the raid when the group is ready. All players in current ingame raid will be added to the CLM raid. When enabled On-Time bonus will be applied on start (functionality not yet implemented) Additionaly at this moment auctioning becomes available to Raid Owner and loot awards will be related to this raid. All Roster changes will be handled automatically by Raid Owner.

4) At the end Raid Owner should End the raid. This will lock the raid as finished and assign any End bonusses (functionality not yet implemented).


It is imperative that there is a trusted person in raid that is the Raid Owner (ML/RL) for the addon to function properly.

In case there will be no trusted peron in an ingame raid (disconnect, quit etc) there is an option for trusted person to joina CLM raid. After becoming ML/RL (Raid Owner) that person will be handling all the funcionalities.

GUI was reworked to incorporate the changes.



AWARD WITHOUT AUCTION
=====================
Added slash command to award items without auctioning with the syntax:
1) Award linked item to player in named roster for value:
   /clm award Item Link/Value/Roster/Player
   Example: /clm award [Hearthstone]/15/Mighty Geese/Bluntlighter

2) Award linked item to currently targeted player in named roster for value:
   /clm award Item Link/Value/Roster
   Example: /clm award [Hearthstone]/15/Mighty Geese

3) While being in active raid award linked item to targeted player for value:
   /clm award Item Link/Value
   Example: /clm award [Hearthstone]/15

4) While being in active raid award linked item to targeted player for 0:
   /clm award Item Link
   Example: /clm award [Hearthstone]