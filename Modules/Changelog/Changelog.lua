local  _, CLM = ...
CLM.ChangelogData = {
    {
        version = "v2.4.0",
        data = {
            {
                name = "Features",
                data = {
                    { header = "Manual GP Awarding", body = "You can now manually award Gear Points to players, by checking the |cff44ee44Gear Points|r checkbox in Standings UI." },
                    { header = "That's My BiS exporting", body = "You can now export your loot in TMB-accepted format." },
                },
            },
            {
                name = "Fixes",
                data = {
                    { header = "Auction History", body = "Auction history tooltips are now handled properly in non-named button mode." },
                    { header = "Gear Points cleanup", body = "In various UIs information related to GP (and to some extent EP) is now more readable." },
                    { header = "Named button conditional display", body = "Named buttons will now only display if their related value is greater than 0. This allows for conditional display of them based on different Items." },
                    { header = "Locale", body = "Multiple locale fixes" },
                },
            },
        },
    },
    {
        version = "v2.3.0",
        data = {
            {
                name = "Features",
                data = {
                    { header = "Price display in tooltip", body = "CLM will now display item prices in tooltips. You can disable this in configuration." },
                    { header = "Upgraded item info", body = "During auction players using the newset CLM version will now inform ML what items they are upgrading. This info is available when hovering over bids. This data is also stored in Auction History." },
                    { header = "RCLootCouncil Integration", body = "CLM can now allows for integration with RCLC. When enabled, on RCLC item award, CLM can award item to the player and charge with DKP/GP based on settings." },
                    { header = "Token prices", body = "Tier Tokens (T7/T8) will now reflect price of the items they are changing into." },
                },
            },
            {
                name = "Fixes",
                data = {
                    { header = "Named buttons", body = "Named buttons now are ordered in descending way." },
                    { header = "Standby", body = "Fixed bug blocking players from subscribing to standby list." },
                    { header = "EPGP / DKP Naming", body = "Fixed DKP showing in few places in EPGP mode. Added missing button names not showing in same places when expected. This data is also stored in Auction History." },
                    { header = "Locale", body = "Various locale fixes thanks to the great community work!" },
                },
            },
        },
    },
    {
        version = "v2.2.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Item Value override CSV Import", body = "You can now import Item value overrides using CSV format through ui |cff44ee44/clm importcsv|r. Expected CSV format: |cff44ee44itemId,base,small,medium,large,max|r."}
                }
            },
            {
                name = "Fixes",
                data = {
                    {header = "All-In button", body = "All-In button is now available in every ascending types of auction and will bid players current DKP/EP."},
                    {header = "Auction UI award value", body = "Logic for award value has been refined for both regular and Vickrey auctions in value and named button modes."},
                }
            }
        }
    },
    {
        version = "v2.1.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Dynamic value equations support", body = "Dedicated to EPGP but works with DKP also - dynamic item value calculation allows to get get dynamic item prices based on their |cff44ee44ilvl|r, |cff44ee44quality|r and |cff44ee44equip slot|r. You can choose one of the commonly used (by different addons and websites) equations (WoWpedia or EPGP WEB) and configure your multipliers (or use the provided default ones)."}
                }
            },
            {
                name = "Fixes",
                data = {
                    {header = "Streamlined Bidding UI", body = "Bidding UI now is streamlined between value-based and named button bidding mode. This should also make it behave better on very low UI scales and different locales."},
                    {header = "Auction UI", body = "OS Bids should now be more readable with color changed from yellow to turquoise."},
                    {header = "Tooltip addons integration", body = "Item Tooltips will now support multitude of addons editing them, including, but not limited to, Pawn, Atlas Loot, Gargul etc."},
                }
            }
        }
    },
    {
        version = "v2.0.0",
        data = {
            {
                name = "Wrath of the Lich King!",
                data = {
                    {header = "", body = "Are you ready for Wrath of the Lich King? Classic Loot Manager is! Read about major overhaul and new features coming in this version!"},
                    {header = "Wrath of the Lich King support", body = "New Bosses and difficulties, new API and dual spec is now properly supported! \n|cffdcb749CLM 2.0 is not backwards compatible and starts with a clean database for your best experience in new expansion!|r"},
                    {header = "Import current standings for prepatch", body = "If you wish to use your current standings during prepatch, you can now import the data from version |cff00ee001.9.x|r. This will however import only your profiles (without linking), standings and rosters (without history and configuration)." },
                    {header = "Thank you supporters!", body = "Thank you to all  that support us, either by contributing or donating through patreon: https://www.patreon.com/classiclootmanager. \nSpecial thank you to legendary patrons: **naimious**"},
                },
            },
            {
                name = "New: Simplified User Interface",
                data = {
                    {header = "No more bulky windows!", body = "Main CLM windows: Standings, Point History, Loot History, Raids and Profiles are now combined in single window with tabs for ease of use. Additionaly Loot and Point History are now combined into common list."},
                    {header = "No more accidental selection clear!", body = "Selection now works as expected:\n- Single click to select a single row,\n- Alt-click to select any row,\n- Shift-click to select a range of rows."},
                    {header = "Filtering and search!", body = "You can now search through data with ease."},
                    {header = "Visibility and QoL changes!", body = "- You are now highlighted in standings,\n- Minimap Icon can now be toggled on and off,\n- Sounds can now be toggled on and off,"},
                    {header = "Configurable keybinds!", body = "You can now configure your own click-keybinds for auctioning and way more in the Bindings section of configuration."},
                },
            },
            {
                name = "New: Auction and Bidding UI overhaul",
                data = {
                    {header = "Auction window now highlights players roles", body = "- blue for Tank\n- green for Healer\n- red for DPS"},
                    {header = "Bidding window received general overhaul and is more compact than ever.", body = "- Supports MS/OS bidding which is displayed in the Auction window. Original - MS bids are green, new OS bids are yellow.\n- It can now be toggled by clicking on the timer bar\n- Tooltips will now properly display also when hovering over the item Icon"},
                },
            },
            {
                name = "New: Action Context mechanism",
                data = {
                    {header = "", body = "Previously CLM automatically selected every player in the UI. This is no more happening. With the new selection system there has been introduced a new concept: context. Your point awards will be based on this - either Roster, Raid or selection. By default context is Roster, when you select someone it's changed to selection, and if you're in raid it will default to Raid. Be sure to be aware of the context when working on the points."},
                },
            },
            {
                name = "New: EPGP support",
                data = {
                    {header = "Effort Points / Gear Points support is here!", body = "You can now run simultaneously multiple DKP and EPGP raids and rosters at the same time, using all the great mechanisms CLM provides."},
                },
            },
            {
                name = "New: Tiered bidding mode",
                data = {
                    {header = "", body = "Dedicated to EPGP but works great for DKP also - this system is a type of ascending bid system, where you can set up to 5 tiers of values which people will pay for an item, for example: 0, 30, 50, 70, 100 - no other values will be accepted by aucioneer. This comes with full UI support."},
                },
            },
            {
                name = "New: Named buttons bidding mode",
                data = {
                    {header = "", body = "Dedicated to Tiered bidding mode - this allows you to name tiered bid buttons and use them instead of values (although the underlying values are still there). Both players bidding and auctioneer will see the text instead of value, while awarding will still result in the proper point deduction (DKP) or award (GP)."},
                },
            },
            {
                name = "New: Profile locking",
                data = {
                    {header = "", body = "You can now lock (and unlock) profiles. Now any point, either DKP, EP or GP, operations on those profiles, in any roster, will be ignored as long as profiles are locked. Locked players are displayed with red tint."}
                },
            },
            {
                name = "Gargul by @Zh0rax integration",
                data = {
                    {header = "", body = "Gargul and CLM are coming with new integration for TMB/LC + DKP/EPGP use for more loot systems flexibilty!"},
                },
            },
        }
    },
    {
        version = "v1.9.2",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Death Knight support", body = "Add support to Death Knights in prepatch."},
                },
            },
        }
    },
    {
        version = "v1.9.1",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "German Locale", body = "Fixes to German locale. Big thank you to Saysor for the contribution."},
                },
            },
        }
    },
    {
        version = "v1.9.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "German Locale", body = "German locale is now available to use. Big thank you to Snickles, floha90 and Charadrass for the contribution."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Error during disenchanting", body = "Disenchanting no longer will cause an error when tracking |cff1eff00Uncommon|r loot or above."},
                    {header = "BoJ in Loot Queue", body = "BoJ will no longer be tracked by Loot Queue alongside with Splinter of Atiesh."},
                },
            },
        }
    },
    {
        version = "v1.8.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Spanish Locale", body = "Spanish locale is now available to use. Big thank you to |cffAA151BSto|r|cffF1BF00ytovis|r|cffAA151Biao|r for the contribution."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "CommunityDKP Migration", body = "CommunityDKP migration for multiple teams in TBC should now properly set the DKP values."},
                    {header = "Weekly gains", body = "Weekly gains should now be properly calculated if there is now weekly cap."},
                    {header = "Alerts", body = "Alerts should now better display small, fractional values."},
                },
            },
        }
    },
    {
        version = "v1.7.1",
        data = {
            {
                name = "Hotfix",
                data = {
                    {header = "Weekly cap", body = "Hotfix script errors for weekly cap."},
                },
            },
        }
    },
    {
        version = "v1.7.0",
        data = {
            {
                name = "Notes",
                data = {
                    {header = "April's Fools", body = "Thank you all for having fun with us in first CLM |cff44ee44April Fools'|r raid week! Hear you next year for more cattle auction! ;)"},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Exports", body = "You can now export |cff4444eeStandings|r, |cff4444eePoint History|r and |cff4444ee Loot History|r to XML and JSON formats for integration with external tools. Check it through |cff44ee44/clm export|r (or minimap icon if you're a Manager). Be aware that XML export for full database can be very heavy and timeout. This happens due to point history size. If this happens for you (e.g. game freezes and no output is produced) try reloading and limiting the export size. New optimizations coming soon!"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Rounding", body = "Fixed missing value rounding for zero-sum bank without caps."},
                },
            },
        }
    },
    {
        version = "v1.6.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Bindings", body = "You can now keybind various CLM related actions: bidding (base, max, current), auctioning when hovering over item (start, quick auction), awarding when hovering over item (base, free) and toggling (all GUIs)."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Various", body = "Various internal fixes related to upcoming patch."},
                },
            },
        }
    },
    {
        version = "v1.5.5",
        data = {
            {
                name = "Changes",
                data = {
                    {header = "Zul'Aman & Ahn'Qiraj", body = "Update in preparation for Zul'Aman and Ahn'Qiraj (SoM) releases."},
                },
            },
        }
    },
    {
        version = "v1.5.4",
        data = {
            {
                name = "Fixes & Changes",
                data = {
                    {header = "Bid posting", body = "Bids will now be posted only after a successful (timed) auction."},
                    {header = "Alt-click auction", body = "Alt-click will now work only during CLM raid."},
                    {header = "Loot posting", body = "Fixed posted loot numbering. Message should now appear only once per mob. You can now configure to post it only when being ML/RL."},
                    {header = "Auto-trade", body = "Addon should now properly add all items to the trade window. Removed loot should not get traded."},
                    {header = "Player recent information", body = "When hovering you will now see player DKP statistics in addition to recent point and loot changes"},
                },
            },
        }
    },
    {
        version = "v1.5.3",
        data = {
            {
                name = "Notes",
                data = {
                    {header = "Retroactive Fix", body = "|cff44ee44v1.5.2|r release was a retroactive fix, which means that |cffee4444all existing standby auto-awards should be calculated properly|r. Please double check your DKP standings and awards and fix them accordingly."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Standby notes", body = "Standby will now have related bonus information displayed in notes."},
                    {header = "Standby point history", body = "Standby will now be properly displayed only in history of players on standby."},
                    {header = "Standby signup message", body = "Players requesting or revoking signup will get message that the message was sent. All trusted players will get information when new standby request or revoke was received."},
                },
            },
        }
    },
    {
        version = "v1.5.2",
        data = {
            {
                name = "Notes",
                data = {
                    {header = "Retroactive Fix", body = "This release is a retroactive fix, which means that |cffee4444all existing standby auto-awards should be calculated properly|r. Please double check your DKP standings and awards and fix them accordingly."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Bench reporting", body = "Bench should now be properly reported during raid."},
                    {header = "Adding to bench", body = "Player adding to bench should now be properly handled during raid |cffeeee00In Progress|r."},
                    {header = "Zero-Sum and bench", body = "DKP will now be split between players and bench if it's configured to be included. In addition, if alt and main are in same raid (on bench and in raid), only the one participating in raid will be included in the division and award calculation."},
                    {header = "Empty history entries", body = "Empty history entries will no longer be created."},
                },
            },
        }
    },
    {
        version = "v1.5.1",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Decay", body = "Assistants should no longer see decay options."},
                    {header = "Raid UI", body = "You should now be able to override standby options through Raid UI."},
                    {header = "Loot Queue", body = "There is now option to filter out specific item classes. Find out more about the classes at https://wowpedia.fandom.com/wiki/ItemType"},
                    {header = "Audit", body = "Missing options should now be visible in Audit UI"},
                },
            },
        }
    },
    {
        version = "v1.5.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Bench (aka standby) support", body = "AddOn now supports automatic bench handling. Player can be benched only in one raid. Linked alts can be benched either in the same raid (no additional DKP gained) or in another (additional DKP is gained). Trusted people can add players to the bench manually. If enabled players can signup for bench while raid is |cff44cc44created|r but not |cffeeee00In Progress|r. Players leaving raid can be benched automatically (disabled by default). Find out more in configuration!"},
                    {header = "Auction History", body = "Auction and bid history is now stored locally (not synced between players). They can be viewed in new UI or if item was awarded then bids will be also displayed in the loot tooltip. Additionally system will now be able to post all bids (enabled by default) to a channel of players choice (defaults to |cff44cc44Officer|r chat)."},
                    {header = "Taxation", body = "Additional cost (tax) can be now automatically added to price when awarding after auction. Defaults to 0."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "GUI changes", body = "Multiple GUI windows should now be more compact than earlier. Multiple tooltips have been extended. Selcted player count is now displayed in the Standings window."},
                    {header = "Attendance tracking", body = "Attendance tracking is now properly updated after configuration has been changed. Stil requires reload."},
                    {header = "Auto Trade", body = "Manually awarded items should now be properly auto-traded."},
                    {header = "Minimap icon menu", body = "Minimap icon menu has been slightly reordered to fit new features."},
                    {header = "Chat commands", body = "Chat commands are no longer case sensitive."},
                },
            },
        }
    },
    {
        version = "v1.4.2",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                    {header = "Mount Hyjal and Black Temple Raids", body = "Good luck everyone with your progress, and may the loot ever be in your favor."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Shade of Akama Boss kill bonus", body = "AddOn will no longer give double DKP for the kill."},
                    {header = "Chat command responses", body = "You can now suppress incoming and outgoing whispers related to chat commands."},
                    {header = "DKP & Loot Alerts", body = "You can now disable DKP & Loot alerts if you are experiencing a lag when they are displayed for the first time."},
                },
            },
        }
    },
    {
        version = "v1.4.1",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                    {header = "Mount Hyjal and Black Temple Raids", body = "Good luck everyone with your progress, and may the loot ever be in your favor."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Shade of Akama Boss kill bonus", body = "AddOn should now properly detect Shade of Akama kill and award Boss kill bonus."},
                    {header = "PvP", body = "Joining Battleground / Arena as trusted player in CLM raid should no longer interfere."},
                },
            },
        }
    },
    {
        version = "v1.4.0",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                    {header = "Mount Hyjal and Black Temple Raids", body = "Good luck everyone with your progress, and may the loot ever be in your favor."},
                },
            },
            {
                name = "Translations",
                data = {
                    {header = "French", body = "First version of French translation available thanks to |cff44cc44Paracétamole|r."},
                    {header = "Russian", body = "Minor updates as always thanks to |cff44cc44Cyber|r."},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Raid Messages", body = "You can now disable specific messages so they won't be displayed in Raid Warnings or Raid chat. Thank you |cff44cc44grecaun|r."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Auctioning", body = "You are no longer able to bid base value if you already bid in Open Ascending auction."},
                    {header = "Loot announcement", body = "Fixed announcement of dropped loot from corpse. Thank you |cff44cc44grecaun|r."},
                    {header = "Auto trade", body = "Auto trade for soulbound items with trade timer not exipred should now work properly."},
                },
            },
        }
    },
    {
        version = "v1.3.1",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                    {header = "Happy new Year!", body = "It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to |cff44cc44support us|r!"},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Attendance tracking", body = "CLM now tracks and reports attendance based on local configuration. You can set 2 parameters: |cffcccc00Max raids per week|r and |cffcccc00Week window size|r. First one defines the amount of raiders a player must join to have |cffcccc00100%|r attendance. The latter determines the number of weeks take into account."},
                    {header = "Auto Item Award and Auto Trade", body = "CLM will now auto-give items if awarding them when corpse is open, or will try to auto-trade them otherwise. Both behaviors can be disabled in configuration."},
                    {header = "Extended auction information", body = "Addon tracks now various additional bidder behavior: If they did pass, can't use item, closed window without any action or let the timer expire. You can now get those various informations by hovering over |cffcccc00Info|r icon. |cff44cc44PASS|r has been removed from main bid display. No action might also mean player has not received bid command (was during reload) or has no or outdated addon installed."},
                    {header = "Open auction alignment", body = "Players can no longer |cffcc0000cancel|r bids in Open Auctions or |cffcccc00pass|r if they already bid. Players can now always bid minimum in those auctions. This allows for handling both English and Swedish House Auctions."},
                    {header = "Item notes", body = "Item notes are now stored locally per item (they are never synced)."},
                    {header = "New filtering options", body = "New filters are available in various UIs: Mains only; In Guild only; External (outside of guild) only"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Bid sorting", body = "Bids will now properly sort in the order of Highest Bid 1st > Total DKP 2nd (on equal bids)."},
                    {header = "Class sorting", body = "Classess in various UIs will now properly sort alphabetically."},
                    {header = "Icon fixes", body = "Missing CLM Icons should now be visible again."},
                    {header = "Localisation enhancements", body = "Multiple localisation enhancements added."},
                },
            },
        }
    },
    {
        version = "v1.3.0",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                    {header = "Happy new Year!", body = "It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to |cff44cc44support us|r!"},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Attendance tracking", body = "CLM now tracks and reports attendance based on local configuration. You can set 2 parameters: |cffcccc00Max raids per week|r and |cffcccc00Week window size|r. First one defines the amount of raiders a player must join to have |cffcccc00100%|r attendance. The latter determines the number of weeks take into account."},
                    {header = "Auto Item Award and Auto Trade", body = "CLM will now auto-give items if awarding them when corpse is open, or will try to auto-trade them otherwise. Both behaviors can be disabled in configuration."},
                    {header = "Extended auction information", body = "Addon tracks now various additional bidder behavior: If they did pass, can't use item, closed window without any action or let the timer expire. You can now get those various informations by hovering over |cffcccc00Info|r icon. |cff44cc44PASS|r has been removed from main bid display. No action might also mean player has not received bid command (was during reload) or has no or outdated addon installed."},
                    {header = "Open auction alignment", body = "Players can no longer |cffcc0000cancel|r bids in Open Auctions or |cffcccc00pass|r if they already bid. Players can now always bid minimum in those auctions. This allows for handling both English and Swedish House Auctions."},
                    {header = "Item notes", body = "Item notes are now stored locally per item (they are never synced)."},
                    {header = "New filtering options", body = "New filters are available in various UIs: Mains only; In Guild only; External (outside of guild) only"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Bid sorting", body = "Bids will now properly sort in the order of Highest Bid 1st > Total DKP 2nd (on equal bids)."},
                    {header = "Class sorting", body = "Classess in various UIs will now properly sort alphabetically."},
                    {header = "Icon fixes", body = "Missing CLM Icons should now be visible again."},
                    {header = "Localisation enhancements", body = "Multiple localisation enhancements added."},
                },
            },
        }
    },
    {
        version = "v1.2.0",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                    {header = "Happy new Year!", body = "It has been a year. Our journey with CLM began in January 2021. Thank you all and don't hesitate to |cff44cc44support us|r!"},
                    {header = "DKP-backwards incompatible changes", body = "|cffcc4444This version alters how DKP was calculated|r. When migrating to it please check the changelong notes and correct values accordingly."},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Localization", body = "CLM supports now localization. First one to come is |cff44cc44russian|r. If you are interesting in adding other ones please contact us on discord!"},
                    {header = "Anonymous Open Auction", body = "New auction type - Anonymous Open. In this mode bidder name will not get posted."},
                    {header = "Relaxed auctioning", body = "Auctioning is no longer limited to RL and ML, but is also allowed for Raid Assists (as long as they are trusted in guild)."},
                    {header = "Cross-guild bidding", body = "You can now bid through UI even if you are not in the same guild as auctioneer"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Multiple linked alts standings", body = "When linking multiple alts to a main, there was an error that resulted in artificially increasing the standings of linked characters. This is fixed now. |cff44cc44If you have multiple alts linked, their standings will now be incorrect. You are required to manually correct it.|r"},
                    {header = "Linking display in Point history", body = "Alt-main linking will now display in point history as |cff44cc44Linking override|r."},
                    {header = "Loot GUI stuck", body = "Loot GUI should no longer get stuck on |cff44cc44Loading...|r if there was an entry with non-existent item. Those entries should also no longer be allowed to be created."},
                    {header = "Anti-Snipe limits", body = "Anti-Snipe will be now semi-unlimited (100 times instead of 3) for all Open auction modes."},
                    {header = "State ID", body = "State ID (data hash) is now visible on the tooltip for easy comparison of data sets between users."},
                    {header = "Reworked color signaling", body = "During syncing icon will now turn |cffc0c000yellow|r. |cff990000Red|r icon means error in internal state of the AddOn."},
                },
            },
        }
    },
    {
        version = "v1.1.3",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Migration", body = "CommunityDKP migration should now properly add players to multiple teams."},
                    {header = "Loot award with multiple linked alts", body = "Points should now be properly distributed when awarding loot to alt, whose main has multiple alts."},
                    {header = "Profile creation", body = "You can now create profiles from guild by name through |cff44cc44/clm addprofile NAME|r."}
                },
            },
        }
    },
    {
        version = "v1.1.2",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Migration", body = "First sync after migration should now take significantly shorter time for new migrations but in worst case it can still take around 15 min."},
                    {header = "Chat commands", body = "Chat commands should now work properly through raid channel."},
                    {header = "Changelog", body = "You can now disable changelog pop-up permanently in Configuration."},
                },
            },
        }
    },
    {
        version = "v1.1.1",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Auto Awarding", body = "Auto awarding should now work properly again."},
                },
            },
        }
    },
    {
        version = "v1.1.0",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM Discord", body = "Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Per-raid config overrides", body = "You can now override configuration on raid basis, when creating it, without altering global roster settings. This way roster settings become default ones."},
                    {header = "DKP award notes", body = "You can now add a visible note to any DKP award. It will be displayed in point history."},
                    {header = "Boss Kill Bonus info", body = "Boss kill bonus should now have boss name displayed in the note. You can also add it when adding points manually by specifying encounter id in the note field. Addon will take care of the rest."},
                    {header = "Custom bid button", body = "You can now enable an additional bidding button, that is configurable. You can set it to an All-In (all of your DKP), Custom value (1 - 10000) or disable it (default)."},
                    {header = "Automated bid value increase", body = "Automated bid value increase is an opt-in feature for Open Bidding mode that will increase your bid by min. increment automatically. Disabled by default."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Script errors on zoning", body = "Fixed sporadic script errors related to zoning and guild cache."},
                    {header = "Lib-ST collision", body = "There should be no more collision with other addons using older version of Lib-ST. This includes Classic Loot Assistant, Gargul, MizusRaidTracker and many more."},
                },
            },
        }
    },
    {
        version = "v1.0.4",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM is now fully complete!", body = "Thanks everyone for supporting us through this journey! Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Bidding popup", body = "Bidding UI should now properly popup based on item data received, and in case of missing info popup by default."},
                    {header = "In Raid tick", body = "In Raid filter tick should now be properly checked when in ingame raid thus not requiring clicking twice to remove it."},
                    {header = "Search filter", body = "Search should now properly ignore any additional commas or spaces."},
                },
            },
        }
    },
    {
        version = "v1.0.3",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM is now fully complete!", body = "Thanks everyone for supporting us through this journey! Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Chat bidding", body = "Chat bidding will no longer result in an error if non-numeric (other than |cff44cc44pass|r or |cff44cc44cancel|r) value is used."},
                    {header = "First week sync issues", body = "Updated sync library to fix problems with syncing of first week after migration. It should take now around 15 minutes for full sync after using |cff44cc44/clm migrate|r."},
                    {header = "ElvUI search issues", body = "Fixed loot search location issue for ElvUI users."},
                    {header = "GUI position reset", body = "You can now reset GUI position by typing |cff44cc44/clm guireset|r."},
                },
            },
        }
    },
    {
        version = "v1.0.2",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM is now fully complete!", body = "Thanks everyone for supporting us through this journey! Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Loot search", body = "Loot history is now searchable."},
                    {header = "Unusable items ignoring", body = "Bidding window will no longer auto open if item is not usable by player."},
                },
            },
        }
    },
    {
        version = "v1.0.1",
        data = {
            {
                name = "Developers note",
                data = {
                    {header = "CLM is now fully complete!", body = "Thanks everyone for supporting us through this journey! Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Roster creation", body = "Creating roster with provided name now works properly."},
                    {header = "Version notification", body = "You will no longer get notification about new version available if the major part is lower than your current, while minor being bigger."},
                },
            },
        }
    },
    {
        version = "v1.0.0",
        data =
        {
            {
                name = "Developers note",
                data = {
                    {header = "CLM is now fully complete!", body = "Thanks everyone for supporting us through this journey! Join our discord for more info: |cff44cc44https://tiny.one/clm-discord|r"},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Time Travel", body = "Have you ever awarded some DKP only a few days later, to realise it was in error? The thought of fixing it is such a hassle since you did a bunch of other stuff since then (eg, decay) and instead of the audit table looking clean now, it's full of manual corrections? Then this feature is for you! With |cff44cc44Time Travel|r mode, you can now jump back to a point in time in your audit log and add/remove entries to make corrections / additions in certain point in time! Simply activate time travel through audit GUI and make your changes. They are applied instantly. AddOn management is almost fully available during time traveling. Raid management is disabled during time travel."},
                    {header = "Sandbox", body = "|cff44cc44Sandbox|r mode allows you to place the addon in a state where you are disconnected from others. While disconnected, you are free to do whatever you want without the worry of a change affecting your DKP setup. What might this be useful for? Say you bring a new officer into your team and you'd like to assign them the task of managing DKP. With this mode, they can train themselves doing all the normal DKP operations in isolation. If you make a set of changes, you can either choose to apply them or discard them once you are done."},
                },
            },
        },
    },
    {
        version = "v0.13.1",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "ElvUI compatibility", body = "Fix for ElvUI users which, after patch 2.19, handles UI differently, thus resulting in very weird button placements."},
                },
            },
        }
    },
    {
        version = "v0.13.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Loot Queue", body = "You can now track items that you have looted into the inventory and auction them from a convenient list. Toggle it through |cff00cc00/clm queue|r. Tracked loot quality can be changed in configuration."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Alt-Main linking points fix", body = "When alt-main linking in case of alt missing in roster, when that alt was added to roster, there was an error that did set both main and alts standings to 0 instead of keeping current. |cffeeccccPlease double check point values if using alt-main linking when moving to this version.|r"},
                    {header = "Untrusted window display", body = "Profiles, Raid and Audit window are now read-only accessible to all users through |cff00cc00/clm commands|r"},
                    {header = "Window location storing", body = "Window location is now properly stored and restored when window is moved to the right side of the screen."}
                },
            },
            {
                name = "Notes",
                data = {
                    {header = "Event based communication", body = "Auction Manager now uses events to communication. This is a needed step to allow further AddOn / WeakAuras integration."},
                },
            },
        }
    },
    {
        version = "v0.12.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Auditing", body = "Introducing new auditing UI for managers. You can now check every entry created by ledger and restore already ignored entries by ignoring (removing) the original ignore."},
                }
            },
            {
                name = "Fixes",
                data = {
                    {header = "Migration", body = "Migration is now executed with comms disabled and is reversible by wiping entries."},
                    {header = "Hydross DKP award", body = "Hydross DKP boss kill bonus award workaround is now fixed."},
                    {header = "Weekly gains display", body = "Weekly gains are now tracked and displayed even if there is no weekly cap."},
                    {header = "Roster Decay", body = "Roster decay should now use proper, optimised entries. While this is a backwards compatible fix there is marginal chance to lead to DKP difference if profile that had DKP in multiple rosters was removed and then added again. Please double check the values when upgrading to this version."},
                }
            },
        }
    },
    {
        version = "v0.11.0",
        data = {
            {
                name = "Features - auto awards",
                data = {
                    {header = "Raid bonuses", body = "On-time bonus - awarded when starting raid and Raid completion bonus - awarded when ending raid"},
                    {header = "Interval bonus", body = "Bonus is awarded every configured interval [minutes]"},
                    {header = "Boss kill bonus", body = "Configurable per boss and through global value"},
                }
            },
            {
                name = "Fixes",
                data = {
                    {header = "!dkp response", body = "|cff00cc00!dkp|r without parameters should now return requester standings"},
                    {header = "!bid response", body = "Removed odd alerts when using |cff00cc00!bid|r chat command while CLM was enabled (still not recommended)."},
                }
            },
        }
    },
    {
        version = "v0.10.1",
        data = {
            {
                name = "Hotfix",
                data = {
                    {header = "Version check", body = "Hotfix version check for lower patch version in bigger minor."},
                }
            },
        }
    },
    {
        version = "v0.10.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Zero-Sum DKP", body = "CLM now support Zero-Sum DKP. If you aren't aware of how Zero-Sum works, it's a DKP system where, at a rosters inception, an amount of DKP is awarded to each player and from that point onwards, no new DKP is awarded (although addon does not restrict it). When a player spends DKP (loot is awarded), that DKP is awarded evenly to the rest of the roster."},
                    {header = "Chat commands", body = "You can now use the |cff00cc00!bid X|r function to bid (even if you don't have CLM installed). It's not recommended though if you have CLM. Values supported include: value / pass / cancel. You can also get information about your standings through |cff00cc00!dkp|r. This function needs to be enabled per trusted person."},
                    {header = "Player search", body = "For convenience, you can now search for players by name on the standings screen. This is particularly helpful to those guilds with large rosters."},
                    {header = "Minimum bid increment", body = "You can now configure minimum bid increment to be used in open auction mode."},
                }
            },
            {
                name = "Quality of Life",
                data = {
                    {header = "Smart DKP award", body = "When applying DKP, CLM is now more context aware depending on filter settings. If you are in a raid, DKP will be assigned to raid members. If you aren't, it'll consider the roster, otherwise it will fall back onto the individual player selection. Alternately, selecting a player (or players) in a raid will override this new behaviour."},
                    {header = "Relaxed auctioning", body = "Auctioning is no longer restricted to the master looter. The raid leader can now perform similar functions. Should also allow for bidding from outside of guild raiders."},
                }
            },
        }
    },
    {
        version = "v0.9.3",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Alerts!", body = "You will now see an alert when: receiving DKP; item is awarded to you; your bid is accepted; your bid is denied."},
                }
            },
            {
                name = "Bugfixes",
                data = {
                    {header = "Spec Sharing", body = "Proper talent information will now be shared."},
                }
            },
        }
    },
    {
        version = "v0.9.2",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Invalid point value", body = "Fix for invalid point value due to alt-main linking introduction."},
                },
            },
        }
    },
    {
        version = "v0.9.1",
        data = {
            {
                name = "Hotfix",
                data = {
                    {header = "Fatal", body = "Hotfix fatal code error in some corner cases."},
                },
            },
        }
    },
    {
        version = "v0.9.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Link your alt to your main character", body = "You can now link an alt character in a roster to your main for the purposes of sharing DKP. For linking to work, characters must exist in the same roster. When you link and alt to a main, the DKP each character currently has is added together. From that point onwards, when one linked character has their DKP changed, the others will also. Loot and point histories are tracked against the alt-linked character they are applied against so in future, if you disconnect a main from an alt, history and point calculations will be retained seperately (and recalculated). To get started, type: |cff00cc00/clm link alt main|r. You can unlink through |cff00cc00/clm unlink alt|r. Removing alt-linked main from a roster will also remove the alt - make sure you unlink before you remove a main! Only trusted players can do that."},
                    {header = "CommunityDKP Migration Support", body = "You can now migrate existing data to CLM. This includes: loot history, point history, and the current DKP standings. Configuration is not migrated. Undertaking a migration should be attempted by a GM with existing data backed up incase of a problem. Best practice is to do it as GM being the only one with CLM installed in the guild. You can trigger one through the command |cff00cc00/clm migrate|r. Check out more information on wiki."},
                    {header = "Spec Sharing", body = "Your spec will now be stored and shared numerically in the profile window for others to see."},
                    {header = "Bidding", body = "Base and max buttons are now disabled if the respective limit is set to 0. Your current DKP is now displayed on the bidding window for convenience"},
                    {header = "Standings", body = "You can now see information about weekly DKP gains and limits in the standings tooltips."},
                    {header = "Changelog", body = "You are reading it right now =)"},
                }
            },
            {
                name = "Bugfixes",
                data = {
                    {header = "Raid creation", body = "Fixed an issue where, in the raid window when attempting to create a new raid, if a user didn't re-select the team, CLM would complain."},
                    {header = "Pass on bid", body = "PASS notifciation is now properly being sorted at the end of the list instead of top."},
                    {header = "ElvUI auction from corpse", body = "Now works as expected!"},
                }
            },
            {
                name = "Notes",
                data = {
                    {header = "WoW DKP Bot integration", body = "Integration is now supported by CLM! To enable it go to Configuration and tick the bot integration box. Experimental. Might have performance impact."},
                }
            },
        },
    },
    {
        version = "v0.8.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Configurable rounding", body = "You can now round to 0, 1 or 2 decimal places. If you want to round current standings you can apply 0% Decay after selecting the appropriate rounding."},
                    {header = "Excplicit pass", body = "You can now explicitly pass on bidding. This will show up as PASS in auction window. Passing will overwrite any previous bids."},
                    {header = "Profile prunning", body = "Added profile prunning commands to remove profiles in batch - check Wiki for more information."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Selection storage", body = "Last selected rosters are now remembered after relog."},
                    {header = "Selection fix", body = "Right clicking will no longer unselect selected row in Point / Loot / Raid lists."},
                    {header = "Sorting", body = "Fixed sorting of some windows and added coloring to point values."},
                    {header = "LibDD", body = "Changed Right-Click menus to use LibDD to prevent any tainting occuring since previous patch."},
                },
            },
        }
    },
    {
        version = "v0.7.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Hard point cap", body = "Per roster hard point cap - maximum DKP points that a player can accumulate at all."},
                    {header = "Weekly point cap", body = "Weekly point cap - maximum DKP points that a player can get in a weekly reset. The reset day is configurable as either EU or US weekly raid reset day."},
                    {header = "Version checks", body = "Version control - You can now check what version player is using. This will be refreshed whenever player is online or Raid Ready Check is performed."},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Position storage", body = "Windows and Icon will now remember their locations when closed."},
                    {header = "Selection", body = "Right-clicking on entry in Raid, Point history or Loot history will, in addition to opening menu, select the clicked entry."},
                    {header = "Tier tokens", body = "Default value for some tier tokens wasn't properly taken from non-equipable type"},
                },
            },
        }
    },
    {
        version = "v0.6.4",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Old data sync", body = "Hotfix for old data sync from eventsourcing lib."},
                    {header = "Old data handling", body = "Hotfix for mutator for old loot data."},
                },
            },
        }
    },
    {
        version = "v0.6.3",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Awarding selection", body = "Fix issue which made selection winner for awarding impossible when after second consecutive auction, player to whom awarded originally was still selected during starting of auction."},
                },
            },
        }
    },
    {
        version = "v0.6.2",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Double data sending", body = "Update lua-eventsourcing v1.4.0 to fix double data send on repeating requests."},
                    {header = "Compression", body = "Set compression level to more sane value."},
                },
            },
        }
    },
    {
        version = "v0.6.1",
        data = {
            {
                name = "Fixes",
                data = {
                    {header = "Menu visibility", body = "Hide remove and management menus for untrusted players."},
                },
            },
        }
    },
    {
        version = "v0.6.0",
        data = {
            {
                name = "Features",
                data = {
                    {header = "Open bid", body = "Open Bid system support."},
                    {header = "Posting loot to raid", body = "Added posting loot (configurable) to raid after opening corpse."},
                    {header = "Auctioning from corpse", body = "Added auctioning from corpse (should work in both WoW UI and Elv UI)"},
                    {header = "Entry removal", body = "Add removal of entries for: Loot History, Point History and Raid Manager"},
                },
            },
            {
                name = "Fixes",
                data = {
                    {header = "Guild announcement", body = "Add configuration for posting loot award to Guild channel."},
                    {header = "Guild rank fix", body = "Fix adding profiles for specific rank in guilds after TBC changes."},
                    {header = "Lib fix", body = "Update lua-eventsourcing to fix a sync issue skipping first week of data for people starting with no entries."},
                },
            },
        }
    },
    {
        version = "v0.5.0",
        data = {
            {
                name = "Notes",
                data = {
                    {header = "Public alpha", body = "This is first public release of Classic Loot Manager."},
                },
            },
            {
                name = "Features",
                data = {
                    {header = "Multiple raids management", body = "You can now run and manage multiple raids at the same time."},
                    {header = "Manual item awarding", body = "You can now award items manually through command line: |cff44cc44/clm award [item]/value/roster/name|r."},
                },
            },
        }
    },
}