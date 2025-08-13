local _, CLM = ...

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

CLM.EncounterIDs[LE_EXPANSION_MISTS_OF_PANDARIA] = {
    {
        name = EJ_GetInstanceInfo(317) or "Mogu'shan Vaults,
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
        name = EJ_GetInstanceInfo(330) or "Heart of Fear",
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
        name = EJ_GetInstanceInfo(320) or "Terrace of Endless Spring",
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1409, name = CLM.EncounterIDsMap[1409] },
            { id = 1505, name = CLM.EncounterIDsMap[1505] },
            { id = 1506, name = CLM.EncounterIDsMap[1506] },
            { id = 1431, name = CLM.EncounterIDsMap[1431] },
        },
    },
    {
        name = EJ_GetInstanceInfo(362) or "Throne of Thunder",
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1577, name = CLM.EncounterIDsMap[1577] }, --Jin'rokh the Breaker
            { id = 1575, name = CLM.EncounterIDsMap[1575] }, --Horridon
            { id = 1570, name = CLM.EncounterIDsMap[1570] }, --Council of Elders
            { id = 1565, name = CLM.EncounterIDsMap[1565] }, --Tortos
            { id = 1578, name = CLM.EncounterIDsMap[1578] }, --Megaera
            { id = 1573, name = CLM.EncounterIDsMap[1573] }, --Ji-Kun
            { id = 1572, name = CLM.EncounterIDsMap[1572] }, --Durumu the Forgotten
            { id = 1574, name = CLM.EncounterIDsMap[1574] }, --Primordius
            { id = 1576, name = CLM.EncounterIDsMap[1576] }, --Dark Animus
            { id = 1559, name = CLM.EncounterIDsMap[1559] }, --Iron Qon
            { id = 1560, name = CLM.EncounterIDsMap[1560] }, --Twin Empyreans
            { id = 1579, name = CLM.EncounterIDsMap[1579] }, --Lei Shen
            { id = 1580, name = CLM.EncounterIDsMap[1580] }, --Ra-den
        },
    },
    {
        name = EJ_GetInstanceInfo(369) or "Siege of Orgrimmar",
        difficulty = {CLM.DifficultyID.NORMAL, CLM.DifficultyID.HEROIC, CLM.DifficultyID.MYTHIC},
        data = {
            { id = 1602, name = CLM.EncounterIDsMap[1602] }, --Immerseus
            { id = 1598, name = CLM.EncounterIDsMap[1598] }, --The Fallen Protectors
            { id = 1624, name = CLM.EncounterIDsMap[1624] }, --Norushen
            { id = 1604, name = CLM.EncounterIDsMap[1604] }, --Sha of Pride
            { id = 1622, name = CLM.EncounterIDsMap[1622] }, --Galakras
            { id = 1622, name = CLM.EncounterIDsMap[1622] }, --Galakras
            { id = 1600, name = CLM.EncounterIDsMap[1600] }, --Iron Juggernaut
            { id = 1606, name = CLM.EncounterIDsMap[1606] }, --Kor'kron Dark Shaman
            { id = 1603, name = CLM.EncounterIDsMap[1603] }, --General Nazgrim
            { id = 1595, name = CLM.EncounterIDsMap[1595] }, --Malkorok
            { id = 1594, name = CLM.EncounterIDsMap[1594] }, --Spoils of Pandaria
            { id = 1599, name = CLM.EncounterIDsMap[1599] }, --Thok the Bloodthirsty
            { id = 1601, name = CLM.EncounterIDsMap[1601] }, --Siegecrafter Blackfuse
            { id = 1593, name = CLM.EncounterIDsMap[1593] }, --Paragons of the Klaxxi
            { id = 1623, name = CLM.EncounterIDsMap[1623] }, --Garrosh Hellscream
        },
    },
}
