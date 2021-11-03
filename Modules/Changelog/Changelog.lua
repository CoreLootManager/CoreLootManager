local  _, CLM = ...

CLM.ChangelogData = {
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