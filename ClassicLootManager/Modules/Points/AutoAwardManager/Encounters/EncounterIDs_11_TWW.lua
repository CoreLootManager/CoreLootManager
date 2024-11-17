local _, CLM = ...

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
}