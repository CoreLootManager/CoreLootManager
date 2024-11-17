local _, CLM = ...

if CLM.IsSoD() then return end
if CLM.IsClassicEra() then return end

CLM.EncounterIDs[LE_EXPANSION_WRATH_OF_THE_LICH_KING] = {
    {
        name = CLM.L["Naxxramas"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P25},
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
    {
        name = CLM.L["The Obsidian Sanctum"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P25},
        data = {
            { id = 1090, name = CLM.EncounterIDsMap[1090] },
            { id = 1091, name = CLM.EncounterIDsMap[1091] },
            { id = 1092, name = CLM.EncounterIDsMap[1092] },
            { id = 1093, name = CLM.EncounterIDsMap[1093] },
        },
    },
    {
        name = CLM.L["The Eye of Eternity"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P25},
        data = {
            { id = 1094, name = CLM.EncounterIDsMap[1094] },
        },
    },
    {
        name = CLM.L["Vault of Archavon"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P25},
        data = {
            { id = 1126, name = CLM.EncounterIDsMap[1126] },
            { id = 1127, name = CLM.EncounterIDsMap[1127] },
            { id = 1128, name = CLM.EncounterIDsMap[1128] },
            { id = 1129, name = CLM.EncounterIDsMap[1129] },
        },
    },
    {
        name = CLM.L["Ulduar"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P25},
        data = {
            { id = 1130, name = CLM.EncounterIDsMap[1130] },
            { id = 1131, name = CLM.EncounterIDsMap[1131] },
            { id = 1132, name = CLM.EncounterIDsMap[1132] },
            { id = 1133, name = CLM.EncounterIDsMap[1133] },
            { id = 1134, name = CLM.EncounterIDsMap[1134] },
            { id = 1135, name = CLM.EncounterIDsMap[1135] },
            { id = 1136, name = CLM.EncounterIDsMap[1136] },
            { id = 1137, name = CLM.EncounterIDsMap[1137] },
            { id = 1138, name = CLM.EncounterIDsMap[1138] },
            { id = 1139, name = CLM.EncounterIDsMap[1139] },
            { id = 1140, name = CLM.EncounterIDsMap[1140] },
            { id = 1141, name = CLM.EncounterIDsMap[1141] },
            { id = 1142, name = CLM.EncounterIDsMap[1142] },
            { id = 1143, name = CLM.EncounterIDsMap[1143] },
        },
    },
    {
        name = CLM.L["Trial of the Crusader"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1085, name = CLM.EncounterIDsMap[1085] },
            { id = 1086, name = CLM.EncounterIDsMap[1086] },
            { id = 1087, name = CLM.EncounterIDsMap[1087] },
            { id = 1088, name = CLM.EncounterIDsMap[1088] },
            { id = 1089, name = CLM.EncounterIDsMap[1089] },
        },
    },
    {
        name = CLM.L["Icecrown Citadel"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC, CLM.DifficultyID.P25, CLM.DifficultyID.P25HC},
        data = {
            { id = 1095, name = CLM.EncounterIDsMap[1095] },
            { id = 1096, name = CLM.EncounterIDsMap[1096] },
            { id = 1097, name = CLM.EncounterIDsMap[1097] },
            { id = 1098, name = CLM.EncounterIDsMap[1098] },
            { id = 1099, name = CLM.EncounterIDsMap[1099] },
            { id = 1100, name = CLM.EncounterIDsMap[1100] },
            { id = 1101, name = CLM.EncounterIDsMap[1101] },
            { id = 1102, name = CLM.EncounterIDsMap[1102] },
            { id = 1103, name = CLM.EncounterIDsMap[1103] },
            { id = 1104, name = CLM.EncounterIDsMap[1104] },
            { id = 1105, name = CLM.EncounterIDsMap[1105] },
            { id = 1106, name = CLM.EncounterIDsMap[1106] },
        },
    },
    {
        name = CLM.L["Onyxia's Lair"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P25},
        data = {
	        { id = 1084, order =  1, name = CLM.EncounterIDsMap[1084] },
        },
    },
    {
        name = CLM.L["The Ruby Sanctum"],
        difficulty = {CLM.DifficultyID.P10, CLM.DifficultyID.P10HC, CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1147, name = CLM.EncounterIDsMap[1147] },
            { id = 1148, name = CLM.EncounterIDsMap[1148] },
            { id = 1149, name = CLM.EncounterIDsMap[1149] },
            { id = 1150, name = CLM.EncounterIDsMap[1150] },
        },
    }
}