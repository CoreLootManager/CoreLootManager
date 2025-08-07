local _, CLM = ...

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

local EJ_GetInstanceInfo = EJ_GetInstanceInfo or (function() return nil end)

CLM.EncounterIDs[LE_EXPANSION_WAR_WITHIN] = {
    {
        name = EJ_GetInstanceInfo(1273) or "Nerub-ar Palace",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
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
    {
        name = EJ_GetInstanceInfo(1296) or "Liberation of Undermine",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3009, name = CLM.EncounterIDsMap[3009] },
            { id = 3010, name = CLM.EncounterIDsMap[3010] },
            { id = 3011, name = CLM.EncounterIDsMap[3011] },
            { id = 3012, name = CLM.EncounterIDsMap[3012] },
            { id = 3013, name = CLM.EncounterIDsMap[3013] },
            { id = 3014, name = CLM.EncounterIDsMap[3014] },
            { id = 3015, name = CLM.EncounterIDsMap[3015] },
            { id = 3016, name = CLM.EncounterIDsMap[3016] },
        }
    },
    {
        name = EJ_GetInstanceInfo(1302) or "Manaforge Omega",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3129, name = CLM.EncounterIDsMap[3129] },
            { id = 3131, name = CLM.EncounterIDsMap[3131] },
            { id = 3130, name = CLM.EncounterIDsMap[3130] },
            { id = 3132, name = CLM.EncounterIDsMap[3132] },
            { id = 3122, name = CLM.EncounterIDsMap[3122] },
            { id = 3133, name = CLM.EncounterIDsMap[3133] },
            { id = 3134, name = CLM.EncounterIDsMap[3134] },
            { id = 3135, name = CLM.EncounterIDsMap[3135] },
        }
    },
}
