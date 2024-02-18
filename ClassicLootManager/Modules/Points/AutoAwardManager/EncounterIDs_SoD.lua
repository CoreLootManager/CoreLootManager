local _, CLM = ...

if not CLM.WoWSoD then return end
-- Append to existing ones
CLM.EncounterIDsMap[2694] = CLM.L["Baron Aquanis"]
CLM.EncounterIDsMap[2697] = CLM.L["Ghamoo-ra"]
CLM.EncounterIDsMap[2699] = CLM.L["Lady Sarevess"]
CLM.EncounterIDsMap[2704] = CLM.L["Gelihast"]
CLM.EncounterIDsMap[2710] = CLM.L["Lorgus Jett"]
CLM.EncounterIDsMap[2825] = CLM.L["Twilight Lord Kelris"]
CLM.EncounterIDsMap[2891] = CLM.L["Aku'mai"]
-- Gnomeregan
CLM.EncounterIDsMap[217280] = CLM.L["Grubbis"]
CLM.EncounterIDsMap[220007] = CLM.L["Viscous Fallout"]
CLM.EncounterIDsMap[220072] = CLM.L["Electrocutioner 6000"]
CLM.EncounterIDsMap[215728] = CLM.L["Crowd Pummeler 9-60"]
CLM.EncounterIDsMap[218242] = CLM.L["The Mechanical Menagerie"]
CLM.EncounterIDsMap[218537] = CLM.L["Mekgineer Thermaplugg"]


CLM.EncounterIDs.SoD = {
    {
        name = CLM.L["Blackfathom Deeps"],
        difficulty = {3},
        data = {
            { id = 2694, name = CLM.EncounterIDsMap[2694] },
            { id = 2697, name = CLM.EncounterIDsMap[2697] },
            { id = 2699, name = CLM.EncounterIDsMap[2699] },
            { id = 2704, name = CLM.EncounterIDsMap[2704] },
            { id = 2710, name = CLM.EncounterIDsMap[2710] },
            { id = 2825, name = CLM.EncounterIDsMap[2825] },
            { id = 2891, name = CLM.EncounterIDsMap[2891] },
        }
    },
	    {
        name = CLM.L["Gnomeregan"],
        difficulty = {3},
        data = {
            { id = 217280, name = CLM.EncounterIDsMap[217280] },
            { id = 220007, name = CLM.EncounterIDsMap[220007] },
            { id = 220072, name = CLM.EncounterIDsMap[220072] },
            { id = 215728, name = CLM.EncounterIDsMap[215728] },
            { id = 218242, name = CLM.EncounterIDsMap[218242] },
            { id = 218537, name = CLM.EncounterIDsMap[218537] },
        }
    },
}