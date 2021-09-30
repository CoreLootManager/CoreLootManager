local  _, CLM = ...

CLM.ChangelogData = {
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
}