# Classic Loot Manager v2.4.0
## Features
### Manual GP Awarding
You can now manually award Gear Points to players, by checking the `Gear Points` checkbox in Standings UI.

### That's My BiS exporting
You can now export your loot in TMB-accepted format.

## Fixes
### Auction History
Auction history tooltips are now handled properly in non-named button mode.

### Gear Points cleanup
In various UIs information related to GP (and to some extent EP) is now more readable.

### Named button conditional display
Named buttons will now only display if their related value is greater than 0. This allows for conditional display of them based on different Items.

### Locale
Multiple locale fixes

# Classic Loot Manager v2.3.1
## Fixes
### Tooltips
Tooltips will now properly display only on items that a player can equip or tier tokens. They will also display properly when in CLM raid now.
### Script errors
Script errors occuring in rare cases for the tooltips should now be fixed.
# Classic Loot Manager v2.3.0
## Features
### Price display in tooltip
CLM will now display item prices in tooltips. You can disable this in configuration.
### Upgraded item info
During auction players using the newset CLM version will now inform ML what items they are upgrading. This info is available when hovering over bids. This data is also stored in Auction History.
### RCLootCouncil Integration
CLM can now allows for integration with RCLC. When enabled, on RCLC item award, CLM can award item to the player and charge with DKP/GP based on settings.
### Token prices
Tier Tokens (T7/T8) will now reflect price of the items they are changing into.
## Fixes
### Named buttons
Named buttons now are ordered in descending way.
### Standby
Fixed bug blocking players from subscribing to standby list.
### EPGP / DKP Naming
Fixed DKP showing in few places in EPGP mode. Added missing button names not showing in same places when expected. This data is also stored in Auction History.
### Locale
Various locale fixes thanks to the great community work!
# Classic Loot Manager v2.2.0
## Features
### Item Value override CSV Import
You can now import Item value overrides using CSV format through ui `/clm importcsv`.
Expected CSV format: `itemId,base,small,medium,large,max`.
## Fixes
### All-In button
All-In button is now available in every ascending types of auction and will bid players current DKP/EP.
### Auction UI award value
Logic for award value has been refined for both regular and Vickrey auctions in value and named button modes.

# Classic Loot Manager v2.1.0
## Features
### Dynamic value equations support
Dedicated to EPGP but works with DKP also - dynamic item value calculation allows to get get dynamic item prices based on their `ilvl`, `quality` and `equip slot`. You can choose one of the commonly used (by different addons and websites) equations (**WoWpedia** or **EPGP WEB**) and configure your multipliers (or use the provided default ones).
## Fixes
### Streamlined Bidding UI
Bidding UI now is streamlined between value-based and named button bidding mode. This should also make it behave better on very low UI scales and different locales.
### Auction UI
OS Bids should now be more readable with color changed from yellow to turquoise.
### Tooltip addons integration
Item Tooltips will now support multitude of addons editing them, including, but not limited to, Pawn, Atlas Loot, Gargul etc.
# Classic Loot Manager v2.0.3
Ascending auction multiple bugs fix.
# Classic Loot Manager v2.0.2
Fix Event spam and multiple other minor events.
# Classic Loot Manager v2.0.1
Fix Multiple baby-age issues.
# Classic Loot Manager v2.0.0
<img src="https://cdn.discordapp.com/attachments/843129642298376252/1016670248646230026/CLM-wotlk.png" alt="CLM" width="128"/>

## Wrath of the Lich King!
Are you ready for Wrath of the Lich King? Classic Loot Manager is! Read about major overhaul and new features coming in this version!
### Wrath of the Lich King support
New Bosses and difficulties, new API and dual spec is now properly supported!  
**CLM 2.0 is not backwards compatible and starts with a clean database for your best experience in new expansion!**
### Thank you supporters!
Thank you to all  that support us, either by contributing or donating through patreon: https://www.patreon.com/classiclootmanager.
Special thank you to legendary patrons: **naimious**
## New: Simplified User Interface
### No more bulky windows!
Main CLM windows: Standings, Point History, Loot History, Raids and Profiles are now combined in single window with tabs for ease of use. Additionaly Loot and Point History are now combined into common list.
### No more accidental selection clear!
Selection now works as expected:
- Single click to select a single row,
- Alt-click to select any row,
- Shift-click to select a range of rows.
### Filtering and search!
You can now search through data with ease.
### Visibility and QoL changes!
- You are now highlighted in standings,
- Minimap Icon can now be toggled on and off,
- Sounds can now be toggled on and off,
### Configurable keybinds!
You can now configure your own click-keybinds for auctioning and way more in the Bindings section of configuration.
## New: Auction and Bidding UI overhaul
### Auction window now highlights players roles
- blue for Tank
- green for Healer
- red for DPS
### Bidding window received general overhaul and is more compact than ever.
- Supports MS/OS bidding which is displayed in the Auction window. Original - MS bids are green, new OS bids are yellow.
- It can now be toggled by clicking on the timer bar\n- Tooltips will now properly display also when hovering over the item Icon
## New: Action Context mechanism
Previously CLM automatically selected every player in the UI. This is no more happening. With the new selection system there has been introduced a new concept: context. Your point awards will be based on this - either Roster, Raid or selection. By default context is Roster, when you select someone it's changed to selection, and if you're in raid it will default to Raid. Be sure to be aware of the context when working on the points.
## New: EPGP support
### Effort Points / Gear Points support is here!
You can now run simultaneously multiple DKP and EPGP raids and rosters at the same time, using all the great mechanisms CLM provides.
## New: Tiered bidding mode
Dedicated to EPGP but works great for DKP also - this system is a type of ascending bid system, where you can set up to 5 tiers of values which people will pay for an item, for example: 0, 30, 50, 70, 100 - no other values will be accepted by aucioneer. This comes with full UI support.
## New: Named buttons bidding mode
Dedicated to Tiered bidding mode - this allows you to name tiered bid buttons and use them instead of values (although the underlying values are still there). Both players bidding and auctioneer will see the text instead of value, while awarding will still result in the proper point deduction (DKP) or award (GP).
## New: Profile locking
You can now lock (and unlock) profiles. Now any point, either DKP, EP or GP, operations on those profiles, in any roster, will be ignored as long as profiles are locked. Locked players are displayed with red tint.
## Gargul by @Zh0rax integration
Gargul and CLM are coming with new integration for TMB/LC + DKP/EPGP use for more loot systems flexibilty!

# Classic Loot Manager v1.9.2
## Fixes
Support for Death Knights in prepatch.
# Classic Loot Manager v1.9.1
## Fixes
### German Locale
Fixes to German locale. Big thank you to Saysor for the contribution.
# Classic Loot Manager v1.9.0
## Features
### German Locale
German locale is now available to use. Big thank you to Snickles, floha90 and Charadrass for the contribution.
## Fixes
### Error during disenchanting
Disenchanting no longer will cause an error when tracking `Uncommon` loot or above.
### BoJ in Loot Queu
BoJ will no longer be tracked by Loot Queue alongside with Splinter of Atiesh.
# Classic Loot Manager v1.8.0
## Features
### Spanish Locale
Spanish locale is now available to use. Big thank you to `Stoytovisiao` for the contribution.
## Fixes
### CommunityDKP Migration
CommunityDKP migration for multiple teams in TBC should now properly set the DKP values.
### Weekly gains
Weekly gains should now be properly calculated if there is now weekly cap.
### Alerts
Alerts should now better display small, fractional values.
# Classic Loot Manager v1.7.1
## Hotfix
### Weekly cap
Hotfix script errors for weekly cap.
# Classic Loot Manager v1.7.0
## Notes
### April's Fools
Thank you all for having fun with us in first CLM `April Fools'` raid week! Hear you next year for more cattle auction! ;)
## Features
### Exports
You can now export `Standings`, `Point History` and ` Loot History` to XML and JSON formats for integration with external tools. Check it through `/clm export` (or minimap icon if you're a Manager). Be aware that XML export for full database can be very heavy and timeout. This happens due to point history size. If this happens for you (e.g. game freezes and no output is produced) try reloading and limiting the export size. New optimizations coming soon!
## Fixes
### Rounding
Fixed missing value rounding for zero-sum bank without caps.
# Classic Loot Manager v1.6.0
## Features
### Bindings
You can now keybind various CLM related actions: bidding (base, max, current), auctioning when hovering over item (start, quick auction), awarding when hovering over item (base, free) and toggling (all GUIs).
## Fixes
### Various
Various internal fixes related to upcoming patch.
# Classic Loot Manager v1.5.5
## Changes
### Zul'Aman & Ahn'Qiraj
Update in preparation for Zul'Aman and Ahn'Qiraj (SoM) releases.
# Classic Loot Manager v1.5.4
## Fixes & Changes
### Bid posting
Bids will now be posted only after a successful (timed) auction.
### Alt-click auction
Alt-click will now work only during CLM raid.
### Loot posting
Fixed posted loot numbering. Message should now appear only once per mob. You can now configure to post it only when being ML/RL.
### Auto-trade
Addon should now properly add all items to the trade window. Removed loot should not get traded.
### Player recent information
When hovering you will now see player DKP statistics in addition to recent point and loot changes
# Classic Loot Manager v1.5.3
## Notes
### Retroactive Fix
`v1.5.2` release was a retroactive fix, which means that `all existing standby auto-awards should be calculated properly`. Please double check your DKP standings and awards and fix them accordingly.
## Fixes
### Standby notes
Standby will now have related bonus information displayed in notes.
### Standby point history
Standby will now be properly displayed only in history of players on standby.
### Standby signup message
Players requesting or revoking signup will get message that the message was sent. All trusted players will get information when new standby request or revoke was received.
# Classic Loot Manager v1.5.2
## Notes
### Retroactive Fix
This release is a retroactive fix, which means that `all existing standby auto-awards should be calculated properly`. Please double check your DKP standings and awards and fix them accordingly.
## Fixes
### Bench reporting
Bench should now be properly reported during raid.
### Adding to bench
Player adding to bench should now be properly handled during raid `In Progress`.
### Zero-Sum and bench
DKP will now be split between players and bench if it's configured to be included. In addition, if alt and main are in same raid (on bench and in raid), only the one participating in raid will be included in the division and award calculation.
### Empty history entries
Empty history entries will no longer be created.
# Classic Loot Manager v1.5.1
## Fixes
### Decay
Assistants should no longer see decay options.
### Raid UI
You should now be able to override standby options through Raid UI.
### Loot Queue
There is now option to filter out specific item classes. Find out more about the classes at https://wowpedia.fandom.com/wiki/ItemType
### Audit
Missing options should now be visible in Audit UI
# Classic Loot Manager v1.5.0
## Features
### Bench (aka standby) support
AddOn now supports automatic bench handling. Player can be benched only in one raid. Linked alts can be benched either in the same raid (no additional DKP gained) or in another (additional DKP is gained). Trusted people can add players to the bench manually. If enabled players can signup for bench while raid is `created` but not `In Progress`. Players leaving raid can be benched automatically (disabled by default). Find out more in configuration!
### Auction History
Auction and bid history is now stored locally (not synced between players). They can be viewed in new UI or if item was awarded then bids will be also displayed in the loot tooltip. Additionally system will now be able to post all bids (enabled by default) to a channel of players choice (defaults to `Officer` chat).
### Taxation
Additional cost (tax) can be now automatically added to price when awarding after auction. Defaults to 0.
## Fixes
### GUI changes
Multiple GUI windows should now be more compact than earlier. Multiple tooltips have been extended. Selcted player count is now displayed in the Standings window.
### Attendance tracking
Attendance tracking is now properly updated after configuration has been changed. Stil requires reload.
### Auto Trade
Manually awarded items should now be properly auto-traded.
### Minimap icon menu
Minimap icon menu has been slightly reordered to fit new features.
### Chat commands
Chat commands are no longer case sensitive.
# Classic Loot Manager v1.4.2
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
### Mount Hyjal and Black Temple Raids
Good luck everyone with your progress, and may the loot ever be in your favor.
## Fixes
### Shade of Akama Boss kill bonus
AddOn will no longer give double DKP for the kill.
### Chat command responses
You can now suppress incoming and outgoing whispers related to chat commands.
### DKP & Loot Alerts
You can now disable DKP & Loot alerts if you are experiencing a lag when they are displayed for the first time.
# Classic Loot Manager v1.4.1
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
### Mount Hyjal and Black Temple Raids
Good luck everyone with your progress, and may the loot ever be in your favor.
## Fixes
### Shade of Akama Boss kill bonus
AddOn should now properly detect Shade of Akama kill and award Boss kill bonus.
### PvP
Joining Battleground / Arena as trusted player in CLM raid should no longer interfere.
# Classic Loot Manager v1.4.0
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
### Mount Hyjal and Black Temple Raids
Good luck everyone with your progress, and may the loot ever be in your favor.
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
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
### Happy new Year!
It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to `support us`!
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
New filters are available in various UIs: Mains only; In Guild only; External (outside of guild) only
## Fixes
### Bid sorting
Bids will now properly sort in the order of Highest Bid 1st > Total DKP 2nd (on equal bids).
### Class sorting
Classess in various UIs will now properly sort alphabetically.
### Icon fixes
Missing CLM Icons should now be visible again.
### Localisation enhancements
Multiple localisation enhancements added.
# Classic Loot Manager v1.3.0
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
### Happy new Year!
It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to `support us`!
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
New filters are available in various UIs: Mains only; In Guild only; External (outside of guild) only
## Fixes
### Bid sorting
Bids will now properly sort in the order of Highest Bid 1st > Total DKP 2nd (on equal bids).
### Class sorting
Classess in various UIs will now properly sort alphabetically.
### Icon fixes
Missing CLM Icons should now be visible again.
### Localisation enhancements
Multiple localisation enhancements added.
# Classic Loot Manager v1.2.0
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
### Happy new Year!
It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to `support us`!
### DKP-backwards incompatible changes
`This version alters how DKP was calculated`. When migrating to it please check the changelong notes and correct values accordingly.
## Features
### Localization
CLM supports now localization. First one to come is `russian`. If you are interesting in adding other ones please contact us on discord!
### Anonymous Open Auction
New auction type - Anonymous Open. In this mode bidder name will not get posted.
### Relaxed auctioning
Auctioning is no longer limited to RL and ML, but is also allowed for Raid Assists (as long as they are trusted in guild).
### Cross-guild bidding
You can now bid through UI even if you are not in the same guild as auctioneer
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
During syncing icon will now turn `yellow`. `Red` icon means error in internal state of the AddOn.
# Classic Loot Manager v1.1.3
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Migration
CommunityDKP migration should now properly add players to multiple teams.
### Loot award with multiple linked alts
Points should now be properly distributed when awarding loot to alt, whose main has multiple alts.
### Profile creation
You can now create profiles from guild by name through `/clm addprofile NAME`.
# Classic Loot Manager v1.1.2
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Migration
First sync after migration should now take significantly shorter time for new migrations but in worst case it can still take around 15 min.
### Chat commands
Chat commands should now work properly through raid channel.
### Changelog
You can now disable changelog pop-up permanently in Configuration.
# Classic Loot Manager v1.1.1
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Auto Awarding
Auto awarding should now work properly again.
# Classic Loot Manager v1.1.0
## Developers note
### CLM Discord
Join our discord for more info: `https://tiny.one/clm-discord`
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
## Developers note
### CLM is now fully complete!
Thanks everyone for supporting us through this journey! Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Bidding popup
Bidding UI should now properly popup based on item data received, and in case of missing info popup by default.
### In Raid tick
In Raid filter tick should now be properly checked when in ingame raid thus not requiring clicking twice to remove it.
### Search filter
Search should now properly ignore any additional commas or spaces.
# Classic Loot Manager v1.0.3
## Developers note
### CLM is now fully complete!
Thanks everyone for supporting us through this journey! Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Chat bidding
Chat bidding will no longer result in an error if non-numeric (other than `pass` or `cancel`) value is used.
### First week sync issues
Updated sync library to fix problems with syncing of first week after migration. It should take now around 15 minutes for full sync after using `/clm migrate`.
### ElvUI search issues
Fixed loot search location issue for ElvUI users.
### GUI position reset
You can now reset GUI position by typing `/clm guireset`.
# Classic Loot Manager v1.0.2
## Developers note
### CLM is now fully complete!
Thanks everyone for supporting us through this journey! Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Loot search
Loot history is now searchable.
### Unusable items ignoring
Bidding window will no longer auto open if item is not usable by player.
# Classic Loot Manager v1.0.1
## Developers note
### CLM is now fully complete!
Thanks everyone for supporting us through this journey! Join our discord for more info: `https://tiny.one/clm-discord`
## Fixes
### Roster creation
Creating roster with provided name now works properly.
### Version notification
You will no longer get notification about new version available if the major part is lower than your current, while minor being bigger.
# Classic Loot Manager v1.0.0
## Developers note
### CLM is now fully complete!
Thanks everyone for supporting us through this journey! Join our discord for more info: `https://tiny.one/clm-discord`
## Features
### Time Travel
Have you ever awarded some DKP only a few days later, to realise it was in error? The thought of fixing it is such a hassle since you did a bunch of other stuff since then (eg, decay) and instead of the audit table looking clean now, it's full of manual corrections? Then this feature is for you! With `Time Travel` mode, you can now jump back to a point in time in your audit log and add/remove entries to make corrections / additions in certain point in time! Simply activate time travel through audit GUI and make your changes. They are applied instantly. AddOn management is almost fully available during time traveling. Raid management is disabled during time travel.
### Sandbox
`Sandbox` mode allows you to place the addon in a state where you are disconnected from others. While disconnected, you are free to do whatever you want without the worry of a change affecting your DKP setup. What might this be useful for? Say you bring a new officer into your team and you'd like to assign them the task of managing DKP. With this mode, they can train themselves doing all the normal DKP operations in isolation. If you make a set of changes, you can either choose to apply them or discard them once you are done.
# Classic Loot Manager v0.13.1
## Fixes
### ElvUI compatibility
Fix for ElvUI users which, after patch 2.19, handles UI differently, thus resulting in very weird button placements.
# Classic Loot Manager v0.13.0
## Features
### Loot Queue
You can now track items that you have looted into the inventory and auction them from a convenient list. Toggle it through `/clm queue`. Tracked loot quality can be changed in configuration.
## Fixes
### Alt-Main linking points fix
When alt-main linking in case of alt missing in roster, when that alt was added to roster, there was an error that did set both main and alts standings to 0 instead of keeping current. `Please double check point values if using alt-main linking when moving to this version.`
### Untrusted window display
Profiles, Raid and Audit window are now read-only accessible to all users through `/clm commands`
### Window location storing
Window location is now properly stored and restored when window is moved to the right side of the screen.
## Notes
### Event based communication
Auction Manager now uses events to communication. This is a needed step to allow further AddOn / WeakAuras integration.
# Classic Loot Manager v0.12.0
## Features
### Auditing
Introducing new auditing UI for managers. You can now check every entry created by ledger and restore already ignored entries by ignoring (removing) the original ignore.
## Fixes
### Migration
Migration is now executed with comms disabled and is reversible by wiping entries.
### Hydross DKP award
Hydross DKP boss kill bonus award workaround is now fixed.
### Weekly gains display
Weekly gains are now tracked and displayed even if there is no weekly cap.
### Roster Decay
Roster decay should now use proper, optimised entries. While this is a backwards compatible fix there is marginal chance to lead to DKP difference if profile that had DKP in multiple rosters was removed and then added again. Please double check the values when upgrading to this version.
# Classic Loot Manager v0.11.0
## Features - auto awards
### Raid bonuses
On-time bonus - awarded when starting raid and Raid completion bonus - awarded when ending raid
### Interval bonus
Bonus is awarded every configured interval [minutes]
### Boss kill bonus
Configurable per boss and through global value
## Fixes
### !dkp response
`!dkp` without parameters should now return requester standings
### !bid response
Removed odd alerts when using `!bid` chat command while CLM was enabled (still not recommended).
# Classic Loot Manager v0.10.1
## Hotfix
### Version check
Hotfix version check for lower patch version in bigger minor.
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
## Features
### Alerts!
You will now see an alert when: receiving DKP; item is awarded to you; your bid is accepted; your bid is denied.
## Bugfixes
### Spec Sharing
Proper talent information will now be shared.
# Classic Loot Manager v0.9.2
## Fixes
### Invalid point value
Fix for invalid point value due to alt-main linking introduction.
# Classic Loot Manager v0.9.1
## Hotfix
### Fatal
Hotfix fatal code error in some corner cases.
# Classic Loot Manager v0.9.0
## Features
### Link your alt to your main character
You can now link an alt character in a roster to your main for the purposes of sharing DKP. For linking to work, characters must exist in the same roster. When you link and alt to a main, the DKP each character currently has is added together. From that point onwards, when one linked character has their DKP changed, the others will also. Loot and point histories are tracked against the alt-linked character they are applied against so in future, if you disconnect a main from an alt, history and point calculations will be retained seperately (and recalculated). To get started, type: `/clm link alt main`. You can unlink through `/clm unlink alt`. Removing alt-linked main from a roster will also remove the alt - make sure you unlink before you remove a main! Only trusted players can do that.
### CommunityDKP Migration Support
You can now migrate existing data to CLM. This includes: loot history, point history, and the current DKP standings. Configuration is not migrated. Undertaking a migration should be attempted by a GM with existing data backed up incase of a problem. Best practice is to do it as GM being the only one with CLM installed in the guild. You can trigger one through the command `/clm migrate`. Check out more information on wiki.
### Spec Sharing
Your spec will now be stored and shared numerically in the profile window for others to see.
### Bidding
Base and max buttons are now disabled if the respective limit is set to 0. Your current DKP is now displayed on the bidding window for convenience
### Standings
You can now see information about weekly DKP gains and limits in the standings tooltips.
### Changelog
You are reading it right now =)
## Bugfixes
### Raid creation
Fixed an issue where, in the raid window when attempting to create a new raid, if a user didn't re-select the team, CLM would complain.
### Pass on bid
PASS notifciation is now properly being sorted at the end of the list instead of top.
### ElvUI auction from corpse
Now works as expected!
## Notes
### WoW DKP Bot integration
Integration is now supported by CLM! To enable it go to Configuration and tick the bot integration box. Experimental. Might have performance impact.
# Classic Loot Manager v0.8.0
## Features
### Configurable rounding
You can now round to 0, 1 or 2 decimal places. If you want to round current standings you can apply 0% Decay after selecting the appropriate rounding.
### Excplicit pass
You can now explicitly pass on bidding. This will show up as PASS in auction window. Passing will overwrite any previous bids.
### Profile prunning
Added profile prunning commands to remove profiles in batch - check Wiki for more information.
## Fixes
### Selection storage
Last selected rosters are now remembered after relog.
### Selection fix
Right clicking will no longer unselect selected row in Point / Loot / Raid lists.
### Sorting
Fixed sorting of some windows and added coloring to point values.
### LibDD
Changed Right-Click menus to use LibDD to prevent any tainting occuring since previous patch.
# Classic Loot Manager v0.7.0
## Features
### Hard point cap
Per roster hard point cap - maximum DKP points that a player can accumulate at all.
### Weekly point cap
Weekly point cap - maximum DKP points that a player can get in a weekly reset. The reset day is configurable as either EU or US weekly raid reset day.
### Version checks
Version control - You can now check what version player is using. This will be refreshed whenever player is online or Raid Ready Check is performed.
## Fixes
### Position storage
Windows and Icon will now remember their locations when closed.
### Selection
Right-clicking on entry in Raid, Point history or Loot history will, in addition to opening menu, select the clicked entry.
### Tier tokens
Default value for some tier tokens wasn't properly taken from non-equipable type
# Classic Loot Manager v0.6.4
## Fixes
### Old data sync
Hotfix for old data sync from eventsourcing lib.
### Old data handling
Hotfix for mutator for old loot data.
# Classic Loot Manager v0.6.3
## Fixes
### Awarding selection
Fix issue which made selection winner for awarding impossible when after second consecutive auction, player to whom awarded originally was still selected during starting of auction.
# Classic Loot Manager v0.6.2
## Fixes
### Double data sending
Update lua-eventsourcing v1.4.0 to fix double data send on repeating requests.
### Compression
Set compression level to more sane value.
# Classic Loot Manager v0.6.1
## Fixes
### Menu visibility
Hide remove and management menus for untrusted players.
# Classic Loot Manager v0.6.0
## Features
### Open bid
Open Bid system support.
### Posting loot to raid
Added posting loot (configurable) to raid after opening corpse.
### Auctioning from corpse
Added auctioning from corpse (should work in both WoW UI and Elv UI)
### Entry removal
Add removal of entries for: Loot History, Point History and Raid Manager
## Fixes
### Guild announcement
Add configuration for posting loot award to Guild channel.
### Guild rank fix
Fix adding profiles for specific rank in guilds after TBC changes.
### Lib fix
Update lua-eventsourcing to fix a sync issue skipping first week of data for people starting with no entries.
# Classic Loot Manager v0.5.0
## Notes
### Public alpha
This is first public release of Classic Loot Manager.
## Features
### Multiple raids management
You can now run and manage multiple raids at the same time.
### Manual item awarding
You can now award items manually through command line: `/clm award [item]/value/roster/name`.
