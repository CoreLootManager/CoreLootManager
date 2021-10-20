local  _, CLM = ...

CLM.ChangelogData = {
    {
        name = "Developers note",
        data = {
            {header = "Full release of the AddOn", body = "Thank you everyone for contributions, feedback and patience during the last 10 months of |cff00cc00Classic Loot Manager|r development. This AddOn started as a hobby project for single guild, but scaled up very fast. Thank you for using it. All your support is welcome!"},
        }
    },
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