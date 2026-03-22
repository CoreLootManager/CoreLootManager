local _, CLM = ...

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

local EJ_GetInstanceInfo = EJ_GetInstanceInfo or (function() return nil end)

CLM.EncounterIDs[LE_EXPANSION_MIDNIGHT] = {
    {
        name = EJ_GetInstanceInfo(1307) or "The Voidspire",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3176, name = CLM.EncounterIDsMap[3176] },
            { id = 3177, name = CLM.EncounterIDsMap[3177] },
            { id = 3179, name = CLM.EncounterIDsMap[3179] },
            { id = 3178, name = CLM.EncounterIDsMap[3178] },
            { id = 3180, name = CLM.EncounterIDsMap[3180] },
            { id = 3181, name = CLM.EncounterIDsMap[3181] },
        }
    },
    {
        name = EJ_GetInstanceInfo(1314) or "The Dreamrift",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3306, name = CLM.EncounterIDsMap[3306] },
        }
    },
    {
        name = EJ_GetInstanceInfo(1308) or "March on Quel'Danas",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3182, name = CLM.EncounterIDsMap[3182] },
            { id = 3183, name = CLM.EncounterIDsMap[3183] },
        }
    },
}
