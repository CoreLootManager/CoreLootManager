local WoW10 = select(4, GetBuildInfo()) >= 100000
if not WoW10 then return end

local _, CLM = ...
local EncounterIDsMap = {
    -- VoI
    [2587] = EJ_GetEncounterInfo(2480),
    [2592] = EJ_GetEncounterInfo(2482),
    [2590] = EJ_GetEncounterInfo(2486),
    [2605] = EJ_GetEncounterInfo(2491),
    [2614] = EJ_GetEncounterInfo(2493),
    [2607] = EJ_GetEncounterInfo(2499),
    [2639] = EJ_GetEncounterInfo(2500),
    [2635] = EJ_GetEncounterInfo(2502),
    -- Aberrus
    [2688] = EJ_GetEncounterInfo(2522) or "Kazzara", -- Kazzara
    [2687] = EJ_GetEncounterInfo(2529) or "Molgoth", -- Molgoth
    [2693] = EJ_GetEncounterInfo(2530) or "Experimentation of the Dracthyr", -- Experimentation of the Dracthyr
    [2682] = EJ_GetEncounterInfo(2524) or "Zaqali Invasion", -- Zaqali Invasion
    [2680] = EJ_GetEncounterInfo(2525) or "Rashok", -- Rashok
    [2689] = EJ_GetEncounterInfo(2532) or "Zskarn", -- Zskarn
    [2683] = EJ_GetEncounterInfo(2527) or "Magmorax", -- Magmorax
    [2684] = EJ_GetEncounterInfo(2523) or "Neltharion", -- Neltharion
    [2685] = EJ_GetEncounterInfo(2520) or "Scalecommander Sarkareth", -- Scalecommander Sarkareth
}

local DifficultyIDsMap = {
    [-1]    = "Fake", -- Trick for handling easily not-supported encounter ids
    -- Retail
    [14]   = CLM.L["Normal"],
    [15]   = CLM.L["Heroic"],
    [16]   = CLM.L["Mythic"],
}

CLM.EncounterIDsMap = EncounterIDsMap
CLM.DifficultyIDsMap = DifficultyIDsMap

CLM.EncounterHasHardMode = CLM.UTILS.Set({})

CLM.EncounterIDs = {}

local diffMapGenerator = {
    { name = "n", difficulty = 14},
    { name = "h", difficulty = 15},
    { name = "m", difficulty = 16},
}

local instanceMapGenerator = {
    {
        name = EJ_GetInstanceInfo(1200),
        data = {
            { id = 2587, name = EncounterIDsMap[2587] },
            { id = 2639, name = EncounterIDsMap[2639] },
            { id = 2590, name = EncounterIDsMap[2590] },
            { id = 2592, name = EncounterIDsMap[2592] },
            { id = 2635, name = EncounterIDsMap[2635] },
            { id = 2605, name = EncounterIDsMap[2605] },
            { id = 2614, name = EncounterIDsMap[2614] },
            { id = 2607, name = EncounterIDsMap[2607] },
        }
    },
    {
        name = "Aberrus",
        -- name = EJ_GetInstanceInfo(1200), -- TODO Aberrus instance name
        data = {
            { id = 2688, name = EncounterIDsMap[2688] },
            { id = 2687, name = EncounterIDsMap[2687] },
            { id = 2693, name = EncounterIDsMap[2693] },
            { id = 2682, name = EncounterIDsMap[2682] },
            { id = 2680, name = EncounterIDsMap[2680] },
            { id = 2689, name = EncounterIDsMap[2689] },
            { id = 2683, name = EncounterIDsMap[2683] },
            { id = 2684, name = EncounterIDsMap[2684] },
            { id = 2685, name = EncounterIDsMap[2685] },
        }
    },
}

for _, difficulty in ipairs(diffMapGenerator) do
    local expansion = "df" .. difficulty.name
    CLM.EncounterIDs[expansion] = {}
    for _, instance in  ipairs(instanceMapGenerator) do
        CLM.EncounterIDs[expansion][#CLM.EncounterIDs[expansion]+1] = {
            name = instance.name,
            difficulty = { difficulty.difficulty },
            data = instance.data
        }
    end
end