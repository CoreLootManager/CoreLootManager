local  _, CLM = ...

CLM.ChangelogData = {
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
}