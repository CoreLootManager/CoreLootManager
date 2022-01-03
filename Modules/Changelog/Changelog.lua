local  _, CLM = ...

CLM.ChangelogData = {
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