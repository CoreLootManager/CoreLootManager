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
   /clm award Item Link/Value/Roster Name/Player
   Example: /clm award [Hearthstone]/15/Mighty Geese/Bluntlighter

2) Award linked item to currently targeted player in named roster for value:
   /clm award Item Link/Value/Roster Name
   Example: /clm award [Hearthstone]/15/Mighty Geese

3) While being in active raid award linked item to targeted player for value:
   /clm award Item Link/Value
   Example: /clm award [Hearthstone]/15

4) While being in active raid award linked item to targeted player for 0:
   /clm award Item Link
   Example: /clm award [Hearthstone]