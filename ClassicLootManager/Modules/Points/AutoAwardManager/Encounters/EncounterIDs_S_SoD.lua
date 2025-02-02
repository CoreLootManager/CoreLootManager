local _, CLM = ...

if not CLM.IsSoD() then return end

CLM.EncounterIDs["SOD"] = {
    {
        name = CLM.L["Blackfathom Deeps"],
        difficulty = {CLM.DifficultyID.P10},
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
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 2925, name = CLM.EncounterIDsMap[2925] },
            { id = 2928, name = CLM.EncounterIDsMap[2928] },
            { id = 2927, name = CLM.EncounterIDsMap[2927] },
            { id = 2899, name = CLM.EncounterIDsMap[2899] },
            { id = 2935, name = CLM.EncounterIDsMap[2935] },
            { id = 2940, name = CLM.EncounterIDsMap[2940] },
        }
    },
    {
        name = CLM.L["Sunken Temple"],
        difficulty = {CLM.DifficultyID.P20},
        data = {
            { id = 2952, name = CLM.EncounterIDsMap[2952] },
            { id = 2953, name = CLM.EncounterIDsMap[2953] },
            { id = 2955, name = CLM.EncounterIDsMap[2955] },
            { id = 2954, name = CLM.EncounterIDsMap[2954] },
            { id = 2957, name = CLM.EncounterIDsMap[2957] },
            { id = 2958, name = CLM.EncounterIDsMap[2958] },
            { id = 2959, name = CLM.EncounterIDsMap[2959] },
            { id = 2956, name = CLM.EncounterIDsMap[2956] },
        }
    },
    {
        name = CLM.L["Onyxia's Lair"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
	        { id = 1084, order =  1, name = CLM.EncounterIDsMap[1084] },
        },
    },
    {
        name = CLM.L["Molten Core"],
        difficulty = {CLM.DifficultyID.P20},
        data = {
            { id = 663, name = CLM.EncounterIDsMap[663] },
            { id = 664, name = CLM.EncounterIDsMap[664] },
            { id = 665, name = CLM.EncounterIDsMap[665] },
            { id = 666, name = CLM.EncounterIDsMap[666] },
            { id = 668, name = CLM.EncounterIDsMap[668] },
            { id = 667, name = CLM.EncounterIDsMap[667] },
            { id = 669, name = CLM.EncounterIDsMap[669] },
            { id = 670, name = CLM.EncounterIDsMap[670] },
            { id = 671, name = CLM.EncounterIDsMap[671] },
            { id = 672, name = CLM.EncounterIDsMap[672] },
            { id = 3018, name = CLM.EncounterIDsMap[3018] },
        },
    },
    {
        name = CLM.L["World Bosses"],
        difficulty = {CLM.DifficultyID.OPEN_WORLD},
        data = {
            { id = 3027, name = CLM.EncounterIDsMap[3027] },
            { id = 3026, name = CLM.EncounterIDsMap[3026] },
        }
    },
    {
        name = CLM.L["Zul'Gurub"],
        difficulty = {CLM.DifficultyID.P20},
        data = {
            { id = 789, name = CLM.EncounterIDsMap[789] },
            { id = 784, name = CLM.EncounterIDsMap[784] },
            { id = 791, name = CLM.EncounterIDsMap[791] },
            { id = 785, name = CLM.EncounterIDsMap[785] },
            { id = 786, name = CLM.EncounterIDsMap[786] },
            { id = 787, name = CLM.EncounterIDsMap[787] },
            { id = 792, name = CLM.EncounterIDsMap[792] },
            { id = 793, name = CLM.EncounterIDsMap[793] },
            { id = 788, name = CLM.EncounterIDsMap[788] },
            { id = 790, name = CLM.EncounterIDsMap[790] },
        },
    },
    {
        name = CLM.L["Blackwing Lair"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 610, name = CLM.EncounterIDsMap[610] },
            { id = 611, name = CLM.EncounterIDsMap[611] },
            { id = 612, name = CLM.EncounterIDsMap[612] },
            { id = 613, name = CLM.EncounterIDsMap[613] },
            { id = 614, name = CLM.EncounterIDsMap[614] },
            { id = 615, name = CLM.EncounterIDsMap[615] },
            { id = 616, name = CLM.EncounterIDsMap[616] },
            { id = 617, name = CLM.EncounterIDsMap[617] },
        },
    },
    {
        name = CLM.L["The Crystal Vale"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 3079, name = CLM.EncounterIDsMap[3079] },
        },
    },
    {
        name = CLM.L["Temple of Ahn'Qiraj"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 709, name = CLM.EncounterIDsMap[709] },
            { id = 710, name = CLM.EncounterIDsMap[710] },
            { id = 711, name = CLM.EncounterIDsMap[711] },
            { id = 712, name = CLM.EncounterIDsMap[712] },
            { id = 713, name = CLM.EncounterIDsMap[713] },
            { id = 714, name = CLM.EncounterIDsMap[714] },
            { id = 715, name = CLM.EncounterIDsMap[715] },
            { id = 716, name = CLM.EncounterIDsMap[716] },
            { id = 717, name = CLM.EncounterIDsMap[717] },
        },
    },
    {
        name = CLM.L["Naxxramas"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 1107, name = CLM.EncounterIDsMap[1107] },
            { id = 1110, name = CLM.EncounterIDsMap[1110] },
            { id = 1116, name = CLM.EncounterIDsMap[1116] },
            { id = 1118, name = CLM.EncounterIDsMap[1118] },
            { id = 1111, name = CLM.EncounterIDsMap[1111] },
            { id = 1108, name = CLM.EncounterIDsMap[1108] },
            { id = 1120, name = CLM.EncounterIDsMap[1120] },
            { id = 1117, name = CLM.EncounterIDsMap[1117] },
            { id = 1112, name = CLM.EncounterIDsMap[1112] },
            { id = 1115, name = CLM.EncounterIDsMap[1115] },
            { id = 1113, name = CLM.EncounterIDsMap[1113] },
            { id = 1109, name = CLM.EncounterIDsMap[1109] },
            { id = 1121, name = CLM.EncounterIDsMap[1121] },
            { id = 1119, name = CLM.EncounterIDsMap[1119] },
            { id = 1114, name = CLM.EncounterIDsMap[1114] },
        },
    },
}