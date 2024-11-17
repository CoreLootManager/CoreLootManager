local _, CLM = ...

local EJ_GetInstanceInfo = EJ_GetInstanceInfo or (function() return nil end)

if true then return end

if not CLM.WoW10 then return end

local diffMapGenerator = {
    { name = "n", difficulty = CLM.DifficultyID.NORMAL},
    { name = "h", difficulty = CLM.DifficultyID.HEROIC},
    { name = "m", difficulty = CLM.DifficultyID.MYTHIC},
}

local instanceMapGenerator = {
    {
        prefix = "tww",
        data = {
            {
                name = EJ_GetInstanceInfo(1273) or "Nerub-ar Palace",
                data = {
                    { id = 2902, name = CLM.EncounterIDsMap[2902] },
                    { id = 2917, name = CLM.EncounterIDsMap[2917] },
                    { id = 2898, name = CLM.EncounterIDsMap[2898] },
                    { id = 2918, name = CLM.EncounterIDsMap[2918] },
                    { id = 2919, name = CLM.EncounterIDsMap[2919] },
                    { id = 2920, name = CLM.EncounterIDsMap[2920] },
                    { id = 2921, name = CLM.EncounterIDsMap[2921] },
                    { id = 2922, name = CLM.EncounterIDsMap[2922] },
                }
            },
        },
    },
    {
        prefix = "df",
        data = {
            {
                name = EJ_GetInstanceInfo(1200) or "Vault of the Incarnates",
                data = {
                    { id = 2587, name = CLM.EncounterIDsMap[2587] },
                    { id = 2639, name = CLM.EncounterIDsMap[2639] },
                    { id = 2590, name = CLM.EncounterIDsMap[2590] },
                    { id = 2592, name = CLM.EncounterIDsMap[2592] },
                    { id = 2635, name = CLM.EncounterIDsMap[2635] },
                    { id = 2605, name = CLM.EncounterIDsMap[2605] },
                    { id = 2614, name = CLM.EncounterIDsMap[2614] },
                    { id = 2607, name = CLM.EncounterIDsMap[2607] },
                }
            },
            {
                name = EJ_GetInstanceInfo(1208) or "Aberrus, the Shadowed Crucible",
                data = {
                    { id = 2688, name = CLM.EncounterIDsMap[2688] },
                    { id = 2687, name = CLM.EncounterIDsMap[2687] },
                    { id = 2693, name = CLM.EncounterIDsMap[2693] },
                    { id = 2682, name = CLM.EncounterIDsMap[2682] },
                    { id = 2680, name = CLM.EncounterIDsMap[2680] },
                    { id = 2689, name = CLM.EncounterIDsMap[2689] },
                    { id = 2683, name = CLM.EncounterIDsMap[2683] },
                    { id = 2684, name = CLM.EncounterIDsMap[2684] },
                    { id = 2685, name = CLM.EncounterIDsMap[2685] },
                }
            },
            {
                name = EJ_GetInstanceInfo(1207) or "Amirdrassil, the Dream's Hope",
                data = {
                    { id = 2820, name = CLM.EncounterIDsMap[2820] },
                    { id = 2709, name = CLM.EncounterIDsMap[2709] },
                    { id = 2737, name = CLM.EncounterIDsMap[2737] },
                    { id = 2728, name = CLM.EncounterIDsMap[2728] },
                    { id = 2731, name = CLM.EncounterIDsMap[2731] },
                    { id = 2708, name = CLM.EncounterIDsMap[2708] },
                    { id = 2824, name = CLM.EncounterIDsMap[2824] },
                    { id = 2786, name = CLM.EncounterIDsMap[2786] },
                    { id = 2677, name = CLM.EncounterIDsMap[2677] },
                }
            },
        },
    },
}


for _, difficulty in ipairs(diffMapGenerator) do
    for _, exp in ipairs(instanceMapGenerator) do
        local expansion = exp.prefix .. difficulty.name
        CLM.EncounterIDs[expansion] = {}
        for _, instance in  ipairs(exp.data) do
            CLM.EncounterIDs[expansion][#CLM.EncounterIDs[expansion]+1] = {
                name = instance.name,
                difficulty = { difficulty.difficulty },
                data = instance.data
            }
        end
    end
end