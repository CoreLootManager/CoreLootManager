local  _, CLM = ...

CLM.ChangelogData = {
    -- {
    --     name = "Developers note",
    --     data = {
    --         {header = "Full release of the AddOn", body = "Thank you everyone for contributions, feedback and patience during the last 10 months of |cff00cc00Classic Loot Manager|r development. This AddOn started as a hobby project for single guild, but scaled up very fast. Thank you for using it. All your support is welcome!"},
    --     }
    -- },
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