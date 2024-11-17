local _, CLM = ...

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

local EJ_GetInstanceInfo = EJ_GetInstanceInfo or (function() return nil end)

CLM.EncounterIDs[LE_EXPANSION_DRAGONFLIGHT] = {
    {
        name = EJ_GetInstanceInfo(1200) or "Vault of the Incarnates",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
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
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
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
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
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
    }
}