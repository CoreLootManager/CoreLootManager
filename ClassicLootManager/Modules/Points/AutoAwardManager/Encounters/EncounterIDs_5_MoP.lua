local _, CLM = ...

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

CLM.EncounterIDs[LE_EXPANSION_MISTS_OF_PANDARIA] = {
    {
        name = CLM.L["Mogu'shan Vaults"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1395, name = CLM.EncounterIDsMap[1395] },
            { id = 1390, name = CLM.EncounterIDsMap[1390] },
            { id = 1434, name = CLM.EncounterIDsMap[1434] },
            { id = 1436, name = CLM.EncounterIDsMap[1436] },
            { id = 1500, name = CLM.EncounterIDsMap[1500] },
            { id = 1407, name = CLM.EncounterIDsMap[1407] },
        },
    },
    {
        name = CLM.L["Heart of Fear"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1507, name = CLM.EncounterIDsMap[1507] },
            { id = 1504, name = CLM.EncounterIDsMap[1504] },
            { id = 1463, name = CLM.EncounterIDsMap[1463] },
            { id = 1498, name = CLM.EncounterIDsMap[1498] },
            { id = 1499, name = CLM.EncounterIDsMap[1499] },
            { id = 1501, name = CLM.EncounterIDsMap[1501] },
        },
    },
    {
        name = CLM.L["Terrace of Endless Spring"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1409, name = CLM.EncounterIDsMap[1409] },
            { id = 1505, name = CLM.EncounterIDsMap[1505] },
            { id = 1506, name = CLM.EncounterIDsMap[1506] },
            { id = 1431, name = CLM.EncounterIDsMap[1431] },
        },
    },
}