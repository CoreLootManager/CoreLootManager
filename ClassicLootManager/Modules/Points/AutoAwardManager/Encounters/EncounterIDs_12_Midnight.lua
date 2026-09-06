local _, CLM = ...
---@cast CLM CLMNamespace

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

local EJ_GetInstanceInfo = EJ_GetInstanceInfo or (function() return nil end)

CLM.EncounterIDs[LE_EXPANSION_MIDNIGHT or 11] = {
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
    {
        name = EJ_GetInstanceInfo(1320) or "The Venomous Abyss",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3470, name = CLM.EncounterIDsMap[3470] },
            { id = 3445, name = CLM.EncounterIDsMap[3445] },
            { id = 3455, name = CLM.EncounterIDsMap[3455] },
            { id = 3497, name = CLM.EncounterIDsMap[3497] },
            { id = 3420, name = CLM.EncounterIDsMap[3420] },
            { id = 3421, name = CLM.EncounterIDsMap[3421] },
            { id = 3429, name = CLM.EncounterIDsMap[3429] },
            { id = 3492, name = CLM.EncounterIDsMap[3492] },
        }
    },
    {
        name = EJ_GetInstanceInfo(1305) or "Sporefall",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3159, name = CLM.EncounterIDsMap[3159] },
        }
    },
    {
        name = EJ_GetInstanceInfo(1317) or "Tidebound Grotto",
        difficulty = { CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC },
        data = {
            { id = 3379, name = CLM.EncounterIDsMap[3379] },
        }
    }
}
