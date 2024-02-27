# Core Loot Manager v4.9.0
## Features
### Branding
CLM Icon branding will now display instead of CLM prefix in multiple places. New cool icons were added to the UI. More to come!
# Core Loot Manager v4.8.2
## Features
### Season of Discovery
CLM Now properly supports Season of Discovery Phase 2 (Gnomeregan) Boss Kill Bonus awards
# Core Loot Manager v4.8.1
## Hotfix
### Retail
Fix invalid check on retail API
# Core Loot Manager v4.8.0
## Features
### Season of Discovery
CLM Now properly supports Season of Discovery Boss Kill Bonus awards
## Translations
### Chinese Translations
Chinese Translation fixes contributed by @Gateswong
# Core Loot Manager v4.7.1
## Hotfix
### Communication
Remove leftover debug code leading to comms happening only within party.
# Core Loot Manager v4.7.0
## Communication changes
### Cross-realm comms
Cross-realm comms for unconnected realms should now behave properly if both users have version v4.7.0 or above.
# Core Loot Manager v4.6.1
## Fixes
### Toys
Hearthstone of the Flame is now ignored by the auto-roll.
### Adding item from received loot
Items automatically added to the auction through received loot will now have proper item level.
### Locale
Updated locales. Thanks to all translators.
# Core Loot Manager v4.6.0
## Features
### Auto-rolling
CLM now supports auto-rolling on items while in CLM raid. You can choose the appropriate action in your local settings. Special items (like Precious' Ribbon) are not handled this way.
### Amirdrassil
Retail 10.2 Amirdrassil, the Dream's Hope bosses have been added to Boss Kill Bonus support.
## Fixes
### Dynamic item value calculation
Dynamic item value calculation based on item level will now work properly. This will however disable automatic Item Value Override creation when using dynamic value calculations.
# Core Loot Manager v4.5.0
## Features
### Multiple item copies tracking
CLM will now track the amount of copies of an item that was staged to be auctioned. This is done only for informational purposes. Thank you @dukeofphilberg for contribution.
## Fixes
### Renames
Character renames to previously used name should now be handled properly.
### Tooltips
Tooltips should now display properly for ICC tier marks.
# Core Loot Manager v4.4.4
## Fixes
### ICC Boss Kill Bonus
Fixed Boss Kill Bonus IDs for ICC.
### Cross-realm ML award
ML Awards on cross-realm servers should now be fixed.
### Cross-faction sync
Cross-faction sync should now be workarounded using `RAID` channel for retail.
### GUI
Item value override GUI should now be properly aligned again.
# Core Loot Manager v4.4.3
## Fixes
### ICC Items
Add missing ICC items.
### Classic Era award from bag
Fix award from bag error on Classic Era version.
# Core Loot Manager v4.4.2
## Changes
### ToC update
Updated ToC for ICC (3.4.3), Fury Incarnate (10.1.7) and Hardcore (1.14.4)
### Fixes
Fix auction item removal clearing.
# Core Loot Manager v4.4.1
## Fixes
### Fixes
Fix multiple unintended bugs.
# Core Loot Manager v4.4.0
## Features
### Starting points
You can now configure non-zero starting DKP/EP/GP. Those points will be awarded when player is joining roster by normal means (not related to alt-main linking).
## Fixes
### Refresh
Fixed issues that might have lead to lua error when refreshing standings tab.
### Point history
Fixed wrong history display for some cases of GP awards.
# Core Loot Manager v4.3.7
## Auctioning
### Remove on award
Remove on award checkbox behavior is now configurable and it's state will be now restored to default when toggling the window.
# Core Loot Manager v4.3.6
## Integrations
### Auction Info Export
Added accumulated auction info to loot history export.
# Core Loot Manager v4.3.5
## GUI
### Tooltips handling
Streamlined and fixed tooltip handling in various places after recent patches.
# Core Loot Manager v4.3.4
## Fixes
### Database loading
Fixed potential datbase timing and loading issue which could lead to unwanted database mixing if user on the same machine is logging in to trusted characters in more than 1 guild.
# Core Loot Manager v4.3.3
## Fixes
### Auctioning
Auction can no longer be started if Raid is not In Progress.
### Raid Management
Raids will now be properly marked as Stale after 24 hours, disabling all automatic functionalities.
### Migration
You can now also migrate from EPGP-Classic properly.
# Core Loot Manager v4.3.2
## Hotfix
### Untrusted players
Fix lua error happening on load for untrusted players.
# Core Loot Manager v4.3.1
## Hotfix
### Skinning issues
Fix skinning issues when using certain UI scales.
# Core Loot Manager v4.3.0
## Features
### Item Tracker
New sub-addon has been added (and enabled by default). This adds new auctioning column and tooltip information to each item, about who and how many has already. You can disable that in configuration or disable the addon at all.
### Auction time increasing
You can now enable automatic auction time increasing which will lineary multiply provided auction time by the number of items.
### Trial of the Grand Crusader
CLM is now ready for ToGC. Trophy and Regalia will now be classified as `Non-equippable` for default and dynamic item value classification. Their ilvl is now adjusted internally (245/258). ToGC bosses have now their respective encounter ids mapped since old ones are used same as for Ulduar.
### Auction and Bidding UI slight refresh
With trophies and regalia fitting  5 slots, up to 5 upgraded items will now be displayed when bidding on item. This required slight UI rework and resulted in `Pass` being moved and `Next` button added (to skip bidding on the current item without sending information to auctioneer).
## Fix
### Tooltip
Fixed timing issues with tooltip requests happening before CLM was ready.
# Core Loot Manager v4.2.3
## Fix
### Raid handling
Preemptively try fixing raid update handling timing issue.
# Core Loot Manager v4.2.2
## Fix
### Auto-awards
Fix auto-awards regression after v4.2.0 release
### Profile overridding
Fixed critical issue with profile overriding happening on Classic Era and Retail. If you have previously noticed points zeroing and then fixed it manually `this fix will retroactively correct it`. Be sure to verify standings before and after installing this version.
# Core Loot Manager v4.2.1
## Hotfix
### Classic Era
Hotfix namespace check
# Core Loot Manager v4.2.0
## Features
### EP/GP customizable Decay
You can now customize decay in EP/GP to be either EP/GP, EP or GP. It is still recommended to keep EP/GP decay as default.
### Integrations
Gargul and RCLC Integrations now support Disenchanting as award option.
## Bugfixes
### Classic Era trade
Fix another round of API issues for Classic Era auto-trade.
### Integrations
Gargul and RCLC Integrations should now support award multipliers properly.
### Settings copy
Hard Mode boss kill bonuses, multipliers and field names will now get copied also.
# Core Loot Manager v4.1.1
## Bugfixes
### Classic Era trade
Fix Classic Era trade fatal error
### Retail RCLC integration
Fix RCLC Integration in Retail
# Core Loot Manager v4.1.0
## Classic Era
### Classic Era support
CLM Now supports Classic Era with the exception of Alerts which are disabled by default due to performance concerns.
## Retail
### Missing functionalities restored
Tooltip value display and tooltip scanning for eligibility is now available in Retail.
# Core Loot Manager v4.0.2
## Bugfixes
### Unlinking
Fixed Critical unlinking handling error leading to erroneous DKP/EPGP standings display.
### ToC bump
Bumped Retail ToC version
# Core Loot Manager v4.0.1
## Bugfixes
### Upgrades
Upgraded items tooltip will no longer error out.
### Auto-trade
Auto-trade will now properly remove items from the list.
### Sync
Instant sync and entry removal should now work properly in Retail.
# Core Loot Manager v4.0.0
Classic Loot Manager is now Core Loot Manager. This rebranding marks our move towards Retail support.
## First release
This is a First release for Retail users so there might be some baby-age issues still. Be sure to report them on our discord https://tiny.one/clm-discord.
## Retail Support Limitations
### Tooltips
Item values are not displayed on tooltips at this point of time.
### Eligibility
Item eligibility check is not yet supported.
### Value calculation
Due to amount of items in Retail it was not possible to throughtly test all item lvl / slot value combinations. Please be sure to check those against your loot systems!
### Item link display
Item link display might still be off in some places.
### Cross-guild sync
Same as for Classic - cross-guild sync is not supported however cross-guild bidding should be possible.
# Classic Loot Manager v3.3.5
## Changes
### Award UI
Award UI will now respect being in raid and correlate the loot to it. This also means zero-sum will now work properly.
### Auctioning UI
You can now enable auto-removing unauctioned items from auction list. Optionally you can automatically mark those items as disenchanted.
### EPGP Auction Types
You can now use Vickrey and Anonymous open modes with EPGP.
### Vickrey handling
Vickrey is now properly handled when using named buttons mode.
### Field Names
If using named buttons mode, field names now will be used in configuration and auctioning also for consistency.
# Classic Loot Manager v3.3.4
## Cleanup
### AddOn footprint
Remove unused assets that were missed in previous releases to lower AddOn footprint.
# Classic Loot Manager v3.3.3
## Fixes
### Import
Import should no longer sync improperly due to missing note.
### Raid
Raid names are now limited to 128 characters. Zalán.
### Multipliers
Multipliers configuration will now work using any Locale.
# Classic Loot Manager v3.3.2
## Fixes
### Roster configuration
Assistants no longer can modify roster options.
### Bidding UI
Fixed timer bar bug blocking auctions display.
# Classic Loot Manager v3.3.0
## Features
### Rolling
You can now allow players in your raid to `/roll` for an item as a separte or additional step in your auctioning process. This is a very simple mechanism to enhance the existing built-in rolling.
## Fixes
### Dynamic Item value mode
Dynamic ilvl value calculation is now fixed for Tier 8 tokens. You should notice increase in the value.
### History
Disenchanted item sorting should no longer error out.
### Bidding UI
* Currently selected item is now tinted turquoise.
* Values after bid are retained when going back to item.
* Chat message is more descriptive now.
* Bids should no longer start from 2nd item.
* Bid timer should no longer error out.
# Classic Loot Manager v3.2.0
## Features
### Disenchant tracking
You can now track disenchanted items! They will show up in your loot history. There is a new disenchant button available in auction UI to mark item as disenchanted. You can also set players as disenchanters and addon will automatically trade it to one of them currently in raid.
### Multipliers
You can now configure per class and per slot multipliers for item awarding value. This makes item awarding easier for different classes!
### Trade List
Currently pending trades are now viewable in new Trade List UI.
## Fixes
### ElvUI
ElvUI MS/OS buttons should no longer be stacked.
# Classic Loot Manager v3.1.4
## Changes
### Generic Import
You can now export data through `/clm export` using `Standings` option and import it through `/clm importgeneric` when moving servers or changing guilds. This will retain rosters together with generic and auction configs. Iitem, slot and dynamic values are not retained. History is also lost. Profiles are recreated with new GUIDs (without links) and standings are retained.
### Global cleanup
Big cleanup in global codespace was done. If you enconter any lua errors be sure to report them!
# Classic Loot Manager v3.1.3
## Changes
### Hide in combat
Bidding UI will now automatically hide in combat and show when out of combat. You can disable this behavior in configuration.
### Bidding UI Config reset
Auto update bid values and close on bid settings were reset due to database restructure needed for hiding in combat. Be sure to re-check your settings!
### Auction
Another batch of auction bugs fixes.
### Rounding
Fixed missing rounding in point statistics.
# Classic Loot Manager v3.1.2
## Fixes
### Tax
Tax is now properly applied.
### Invalid bid
Invalid bid marking after award should now work properly.
### History UI
You can now link history entry in chat. You can't select multiple entries anymore.
### Auctioning UI
Auctioning UI won't open anymore outside UI when modifier-clicking on link or items.
# Classic Loot Manager v3.1.1
## Hotfix
### Bidding UI
Bidding UI shouldn't error out on laggy servers anymore.
# Classic Loot Manager v3.1.0
## Notes
### Apache License 2.0
Classic Loot Manager has been relicensed from MIT to Apache2.
That means CLM is still fully FOSS but now when reusing the code you not only need to attribute ownership to the CLM creators but you also have to explicitly state which parts are reused and modified.
### v3.0.0
Be sure to read v3.0.0 release note if you haven't yet!
## Changes
### Moving items to the pending queue
Auctioner UI behavior was modified slightly. When right clicking on items they are moved to the pending queue (the additonal queue that is hidden and populated automatically when current auction is in progress) instead of being removed. This means that after current auction is completed and cleared those will still show up. This allows players to easily utilize tracking if not auctioning all the items at the same time. You can still completely remove item from the queue through `Ctrl + Right click`.
## Fixes
### Missing items
Multi Item Auction should no longer have missing items or errors. You will notice that sometimes items might load with a slight delay which is expected on laggy realms.
### Boss Kill Bonus
Ulduar boss encounter IDs are updated now per Blizzard changes and should work properly.
# Classic Loot Manager v3.0.4
## Notes
### v3.0.0
Be sure to read v3.0.0 release note if you haven't yet!
## Fixes
### Auto-Trade
Auto trade should work now as expected. Third time's the charm!
### Auction UI drag and drop
You can now drag and drop items to the Auction UI even when it's empty.
# Classic Loot Manager v3.0.3
## Notes
### v3.0.0
Be sure to read v3.0.0 release note if you haven't yet!
## Fixes
### Auto-Trade
Auto trade should work now as expected. This time really. I hope.
### Bidding item display
Preemptively try to refresh item list for bidders in case they load with significant delay.
# Classic  Loot Manager v3.0.2
Hotfix to not loading v3.0.1
# Classic Loot Manager v3.0.1
## Notes
### v3.0.0
Be sure to read v3.0.0 release note if you haven't yet!
## Fixes
### Out of Guild bidding
Players not in guild can now again participate in auctions. Both ML and player require at least this version of CLM.
### Lingering invisible bars
There should be no more invisible bars lingering during auctioning.
### Auto-Trade
Auto trade should work now as expected.
### Unusable detection
Detection of unusable items should be working agian.
### Award slash command
Award slash command has returned in old form as `/clm aw`.
### ElvUI
Open Auction list should be visible now.
# Classic Loot Manager v3.0.0
## Notes
With CLM v3 There comes a big mentality shift in the auctioning system towards becoming a more robust, point-based loot management framework. Notion of "English" or "Swedish" auction has been dropped towards bigger flexibility. This is a major change and as a consequence CLM v2 communication is not compatible with CLM v3 (but the database is preserved unlike when migrating from v1 to v2). Be aware that CLM does not allow multiple MAJOR versions to be used in one guild thus all v2 users will have their CLM disabled once someone starts to use v3.
This wouldn't be possible without all the contributors, translators and patrons, especially: `Allcoast, BigSpoon, naimious, Nosirrahdrof`.
## Multi Item Auction
### Notes
Classic Loot Manager now allows you to auction virtually any amount of items simultaneously. There are however some quirks that need to be looked into by officers for this to work as expected.
### Configuration
This rework brings some changes to auctioning configuration. **Be sure to review them to ensure your auction is working as expected.** Most significant changes are related to minimum, all-in and equal bids in Open Auction Mode.
### Invalid Bids
Bids are validated during auction. However the correctness might not apply anymore after items were awarded.
To solve this, after every item award, CLM re-calculates if the bids would be accepted and marks invalid bid with red color. This way the bids are not lost and it's up to Loot Master to decide how to handle it.
### Rolling
CLM includes internal rolling system (random) that appends a new random value to players bid whenever a bid comes in for the first time. This value is guarnateed to be unique and is meant for the ML to help with solving ties. However it does not come from `/random` server-side call thus is not visible in the chat.
### Handling items in the auction
Items can be added to the auction same as previously through alt-click (configurable). In addition to that, the previous Loot Queue has been merged with Auctioning into auto-fill auction feature. CLM can automatically add looted (received) items and items seen on corpse to the current auction. This can be configured per Master Looter prefference. Important! If items are added to auction during existing auction (manually or automatically) then CLM will remember it in a pending auction and display them when current auction is cleared of all items.
Auctioneer can manually remove items from auction by right clicking item icon on the list.
### Bidding GUI
Bidding GUI was reworked and now is more flexible. You can move the bar separately (and even test it through `/clm testbar` or through configuration button) and modify it's width. You should now more verbosely see if your bid was accepted, denied, or you passed or cancelled.
### Chat bidding
Chat bidding is currently disabled.
## Refinements
### Hard Mode support
Ulduar hard mode is now supported through configuration. If Boss Kill Bonus is enabled with normal and hardmode bonuses set to different (non-zero) values, after the kill a popup will show to decide if it was a normal or hard mode kill.
### History
Loot history now shows simple history when hovering over items but more extensive if hovering while holding `CTRL` modifier.
### Migration
Migration should now be slightly more resilient when executed multiple times by accident.
### Renames
Several options were renamed
### Multi AddOn
Classic Loot Manager is now split into multiple smaller addons. This is a first step towards even greater modularity. If you are using external `Integration` you will need to enable that module first! Export is currently only accessible through `/clm export` slash command.
## Feedback
### Please post your feedback
Be sure to post feedback about the changes, suggestions and bug reports on our discord (link can be found in the configuration, README and github).
## Fixes
### All-in
All-in should no longer be denied unexpectedly.
### History error
History should no longer get stuck on `Loading...` or generate lua-error when handling old historical data.
### Alerts
Alerts should now display proper currency.
### B.E.T.A.
Fixed all bugs found during B.E.T.A. testing. Thank you all for participating!
## Known issues
### Multi Item Auction
Award value Multiplier is not stored nor configurable.
### Scaling
Bidding GUI cannot be scaled at this time.
### GUI
Bidding GUI still needs some refinements and might change anytime.
### ElvUI skins
ElvUI bidding UI reskin might not be ideal. Best way to ensure the bidding UI looks properly you should not open the UI manually before first auction, otherwise `/reload` will be required for the UI to get fixed. Another option is to disable Ace3 reskin.
# Classic Loot Manager v2.7.0
## Notes
Thank you to all the patrons, especially: `Allcoast, BigSpoon, Cyber, naimious, Nosirrahdrof`
## Features
### Award GUI
No more tedious typing in slash commands! You can now award items through this new UI.
You can access it through minimap icon or `/clm award`. Award slash command accepts also item link as a parameter to directly fill `/clm award [item link]`. By default also `ALT+SHIFT click` in bags or corpse will open this window. Supports auto-trade and auto-assign.
### Configurable equations
You can now configure base / exponent of your dynamic item value equations. This was possible thanks to `psiven`. Use of this feature requires everyone in raid to have installed at least this version.
## Fixes
### Alt-Main linking
Re-linking alt will no longer prevent the alts previous main to be marked as alt itself. Improved messages in the linking flow.
# Classic Loot Manager v2.6.0
## Notes
### Library overhaul
CLM went through huge dependency and library overhaul and many of tooltip-related hacks were removed from CLM.
This also means that integrations with some tooltip-modifying AddOns might require fixes from their respective authors to show up in CLM since they are not based in the CLM itself anymore.
## Features
### CEPGP and BastionLoot Migration
/clm migrate now supports CEPGP and BastionLoot!
### Standby value multiplier
You can now configure multiplier for points received by players on standby (bench).
### PR Rounding
You can now configure PR rounding independently from the rest of the AddOn.
### OS Bid
You can now disable OS bidding support in the roster.
## Fixes
### EPGP Alt-Main Linking
GP value during linking is now calculated properly. This is a backwards-affecting change thus if you are already using this feature, you might be required to update the GP manually.
### Filtering
Death Knights should be now allowed to be filtered out properly.
### Item values in Dynamic mode
Bows and Crossbows should now properly be calculated as ranged weapons in Dynamic item value mode.
# Classic Loot Manager v2.5.6
## Fixes
### Standby
Fix for standby points not being applied if one of the players requesting standby was not in the roster.
Auto-add players to roster if they have requested standby.
### History
If point change affects only 1 player display the name instead of `Multiple`.
If player is missing class (which should not happen when adding characters post pre-patch), do not error out but display empty field.
### Memory usage
CLM v1 database is no longer stored in the AddOn thus lowering effective memory usage for big databases. There is no longer option to migrate from v1.x.x to v2.x.x after installing this version of CLM.
# Classic Loot Manager v2.5.5
## Locale
### Chinese
CLM now supports Chinese locale. Thanks brian#0179 for all the translations.
## Fixes
### Item values
Bows and Crossbows should now properly be calculated as ranged weapons.
### Vickrey award value
Vickrey should now properly calculate second value based on the type of the selected bid.
### Sorting fixes
Sorting by version should now work as expected.

# Classic Loot Manager v2.5.4
## Changes
### GUI
GUI revamp. Thanks brian#0179 for contribution.
### Auctioning
Auctioning and upgraded item info should now work properly for tokens and Sapphiron quest item.
# Classic Loot Manager v2.5.3
## Hotfixes
### Open Auction
Open auction hotfixes.
# Classic Loot Manager v2.5.2
## Hotfixes
### Open Auction
Open auction hotfixes.
# Classic Loot Manager v2.5.1
## Fixes
### Chat command bidding
Chat command bidding should now work.
### Chat command os bid
You can now do OS bid through chat command `!bidos`.
### Auto-update bid values
Auto-update bid values should work with new UI.
### Bidding UI
Bidding UI no longer needs Okay button. This however results in buttons being misplaced with some ElvUI scales.
# Classic Loot Manager v2.5.0
## Features
### Open Auction
Open Auction modes just got overhauled. You will now see list of bidders in bidding UI. Information is limited in anonymous mode. It is strongly recommended for all raiders to upgrade to this version.
### Auctioning UI
Auctioning UI got simplified a bit. Checking player upgrades should now be easier.
### Bid posting
Upgrades will now be posted together with bids.
## Fixes
### Boss kill bonus
Boss kill bonus should work now for EoE/OS/VoA. Additionaly it can be set to negative value. 0 is still ignored.
### Pass in open auctions
In non-ascending auctions pass won't be grayed out anymore after bidding.

# Classic Loot Manager v2.4.1
## Fixes
### RCLC Integration
RCLC Integration now displays PR in the RCLC window.
### UI Scaling
You can now scale UI through slider in the configuration. Bidding UI scales separately by Ctrl + Mouse Wheel.
### Standings display
Points in standings tooltip now are displayed in the proper order.
### Attendance sorting
Sorting by attendance works now as expected.
### Passing
You can now pass in Open Tiered and Static modes.
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
