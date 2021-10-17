local  _, CLM = ...

CLM.ChangelogData = {
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
    -- {
    --     name = "Notes",
    --     data = {
    --     }
    -- },
}