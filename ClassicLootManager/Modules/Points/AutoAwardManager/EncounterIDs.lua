local _, CLM = ...

CLM.DifficultyID = {}

CLM.DifficultyID.NONE       = -1
CLM.DifficultyID.OPEN_WORLD = 0
CLM.DifficultyID.P10        = 3
CLM.DifficultyID.P25        = 4
CLM.DifficultyID.P10HC      = 5
CLM.DifficultyID.P25HC      = 6
CLM.DifficultyID.P40        = 9
CLM.DifficultyID.P20        = 148
CLM.DifficultyID.NORMAL     = 14
CLM.DifficultyID.HEROIC     = 15
CLM.DifficultyID.MYTHIC     = 16
CLM.DifficultyID.LFR        = 17

CLM.DifficultyIDsMap = {
    [CLM.DifficultyID.NONE]         = "Fake", -- Trick for handling easily not-supported encounter ids
    -- Classic
    [CLM.DifficultyID.OPEN_WORLD]   = CLM.L["40 Player"], -- Open World
    [CLM.DifficultyID.P10]	        = CLM.L["10 Player"],
    [CLM.DifficultyID.P25]	        = CLM.L["25 Player"],
    [CLM.DifficultyID.P10HC]	    = CLM.L["10 Player (Heroic)"],
    [CLM.DifficultyID.P25HC]	    = CLM.L["25 Player (Heroic)"],
    [CLM.DifficultyID.P40]          = CLM.L["40 Player"],
    [CLM.DifficultyID.P20]          = CLM.L["20 Player"],
    [CLM.DifficultyID.NORMAL]       = CLM.L["Normal"],
    [CLM.DifficultyID.HEROIC]       = CLM.L["Heroic"],
    [CLM.DifficultyID.MYTHIC]       = CLM.L["Mythic"],
}

if CLM.WoW10 then return end

local EncounterIDsMap = {
    -- Classic
    [1084] = CLM.L["Onyxia"],
    [663] = CLM.L["Lucifron"],
    [664] = CLM.L["Magmadar"],
    [665] = CLM.L["Gehennas"],
    [666] = CLM.L["Garr"],
    [668] = CLM.L["Baron Geddon"],
    [667] = CLM.L["Shazzrah"],
    [669] = CLM.L["Sulfuron Harbinger"],
    [670] = CLM.L["Golemagg the Incinerator"],
    [671] = CLM.L["Majordomo Executus"],
    [672] = CLM.L["Ragnaros"],
    [610] = CLM.L["Razorgore the Untamed"],
    [611] = CLM.L["Vaelastrasz the Corrupt"],
    [612] = CLM.L["Broodlord Lashlayer"],
    [613] = CLM.L["Firemaw"],
    [614] = CLM.L["Ebonroc"],
    [615] = CLM.L["Flamegor"],
    [616] = CLM.L["Chromaggus"],
    [617] = CLM.L["Nefarian"],
    [709] = CLM.L["The Prophet Skeram"],
    [710] = CLM.L["Silithid Royalty"],
    [711] = CLM.L["Battleguard Sartura"],
    [712] = CLM.L["Fankriss the Unyielding"],
    [713] = CLM.L["Viscidus"],
    [714] = CLM.L["Princess Huhuran"],
    [715] = CLM.L["Twin Emperors"],
    [716] = CLM.L["Ouro"],
    [717] = CLM.L["C'Thun"],
    [1107] = CLM.L["Anub'Rekhan"],
    [1110] = CLM.L["Grand Widow Faerlina"],
    [1116] = CLM.L["Maexxna"],
    [1118] = CLM.L["Patchwerk"],
    [1111] = CLM.L["Grobbulus"],
    [1108] = CLM.L["Gluth"],
    [1120] = CLM.L["Thaddius"],
    [1117] = CLM.L["Noth the Plaguebringer"],
    [1112] = CLM.L["Heigan the Unclean"],
    [1115] = CLM.L["Loatheb"],
    [1113] = CLM.L["Instructor Razuvious"],
    [1109] = CLM.L["Gothik the Harvester"],
    [1121] = CLM.L["The Four Horsemen"],
    [1119] = CLM.L["Sapphiron"],
    [1114] = CLM.L["Kel'Thuzad"],
    -- TBC
    [789] = CLM.L["High Priest Thekal"],
    [784] = CLM.L["High Priest Venoxis"],
    [791] = CLM.L["High Priestess Arlokk"],
    [785] = CLM.L["High Priestess Jeklik"],
    [786] = CLM.L["High Priestess Mar'li"],
    [787] = CLM.L["Bloodlord Mandokir"],
    [792] = CLM.L["Jin'do the Hexxer"],
    [793] = CLM.L["Hakkar"],
    [788] = CLM.L["Edge of Madness"],
    [790] = CLM.L["Gahz'ranka"],
    [718] = CLM.L["Kurinnaxx"],
    [719] = CLM.L["General Rajaxx"],
    [720] = CLM.L["Moam"],
    [721] = CLM.L["Buru the Gorger"],
    [722] = CLM.L["Ayamiss the Hunter"],
    [723] = CLM.L["Ossirian the Unscarred"],
    [652] = CLM.L["Attumen the Huntsman"],
    [653] = CLM.L["Moroes"],
    [654] = CLM.L["Maiden of Virtue"],
    [655] = CLM.L["Opera Hall"],
    [656] = CLM.L["The Curator"],
    [657] = CLM.L["Terestian Illhoof"],
    [658] = CLM.L["Shade of Aran"],
    [659] = CLM.L["Netherspite"],
    [660] = CLM.L["Chess Event"],
    [661] = CLM.L["Prince Malchezaar"],
    [662] = CLM.L["Nightbane"],
    [649] = CLM.L["High King Maulgar"],
    [650] = CLM.L["Gruul the Dragonkiller"],
    [651] = CLM.L["Magtheridon"],
    [623] = CLM.L["Hydross the Unstable"],
    [624] = CLM.L["The Lurker Below"],
    [625] = CLM.L["Leotheras the Blind"],
    [626] = CLM.L["Fathom-Lord Karathress"],
    [627] = CLM.L["Morogrim Tidewalker"],
    [628] = CLM.L["Lady Vashj"],
    [730] = CLM.L["Al'ar"],
    [731] = CLM.L["Void Reaver"],
    [732] = CLM.L["High Astromancer Solarian"],
    [733] = CLM.L["Kael'thas Sunstrider"],
    [601] = CLM.L["High Warlord Naj'entus"],
    [602] = CLM.L["Supremus"],
    [603] = CLM.L["Shade of Akama"],
    [604] = CLM.L["Teron Gorefiend"],
    [605] = CLM.L["Gurtogg Bloodboil"],
    [606] = CLM.L["Reliquary of Souls"],
    [607] = CLM.L["Mother Shahraz"],
    [608] = CLM.L["The Illidari Council"],
    [609] = CLM.L["Illidan Stormrage"],
    [618] = CLM.L["Rage Winterchill"],
    [619] = CLM.L["Anetheron"],
    [620] = CLM.L["Kaz'rogal"],
    [621] = CLM.L["Azgalor"],
    [622] = CLM.L["Archimonde"],
    [1189] = CLM.L["Akil'zon"],
    [1190] = CLM.L["Nalorakk"],
    [1191] = CLM.L["Jan'alai"],
    [1192] = CLM.L["Halazzi"],
    [1193] = CLM.L["Hex Lord Malacrass"],
    [1194] = CLM.L["Zul'jin"],
    [724] = CLM.L["Kalecgos"],
    [725] = CLM.L["Brutallus"],
    [726] = CLM.L["Felmyst"],
    [727] = CLM.L["Eredar Twins"],
    [728] = CLM.L["M'uru"],
    [729] = CLM.L["Kil'jaeden"],
    -- WotLK
    -- Naxx fully reused
    [1090] = CLM.L["Sartharion"],
    [1091] = CLM.L["Shadron"],
    [1092] = CLM.L["Tenebron"],
    [1093] = CLM.L["Vesperon"],
    [1094] = CLM.L["Malygos"],
    [1126] = CLM.L["Archavon the Stone Watcher"],
    [1127] = CLM.L["Emalon the Storm Watcher"],
    [1128] = CLM.L["Koralon the Flame Watcher"],
    [1129] = CLM.L["Toravon the Ice Watcher"],
    [1130] = CLM.L["Algalon the Observer"],
    [1131] = CLM.L["Auriaya"],
    [1132] = CLM.L["Flame Leviathan"],
    [1133] = CLM.L["Freya"],
    [1134] = CLM.L["General Vezax"],
    [1135] = CLM.L["Hodir"],
    [1136] = CLM.L["Ignis the Furnace Master"],
    [1137] = CLM.L["Kologarn"],
    [1138] = CLM.L["Mimiron"],
    [1139] = CLM.L["Razorscale"],
    [1140] = CLM.L["The Assembly of Iron"],
    [1141] = CLM.L["Thorim"],
    [1142] = CLM.L["XT-002 Deconstructor"],
    [1143] = CLM.L["Yogg-Saron"],
    [1085] = CLM.L["Anub'arak"],
    [1086] = CLM.L["Faction Champions"],
    [1087] = CLM.L["Lord Jaraxxus"],
    [1088] = CLM.L["Northrend Beasts"],
    [1089] = CLM.L["Val'kyr Twins"],
    [1095] = CLM.L["Blood Council"],
    [1096] = CLM.L["Deathbringer Saurfang"],
    [1097] = CLM.L["Festergut"],
    [1098] = CLM.L["Valithria Dreamwalker"],
    [1099] = CLM.L["Icecrown Gunship Battle"],
    [1100] = CLM.L["Lady Deathwhisper"],
    [1101] = CLM.L["Lord Marrowgar"],
    [1102] = CLM.L["Professor Putricide"],
    [1103] = CLM.L["Queen Lana'thel"],
    [1104] = CLM.L["Rotface"],
    [1105] = CLM.L["Sindragosa"],
    [1106] = CLM.L["The Lich King"],
    [1147] = CLM.L["Baltharus the Warborn"],
    [1148] = CLM.L["General Zarithrian"],
    [1149] = CLM.L["Saviana Ragefire"],
    [1150] = CLM.L["Halion"],
    -- Cataclysm
    -- Baradin Hold
    [1033] = CLM.L["Argaloth"],
    [1250] = CLM.L["Occu'thar"],
    [1332] = CLM.L["Alizabal"],
    -- Blackwing Descent
    [1024] = CLM.L["Magmaw"],
    [1027] = CLM.L["Omnotron Defense System"],
    [1025] = CLM.L["Maloriak"],
    [1022] = CLM.L["Atramedes"],
    [1023] = CLM.L["Chimaeron"],
    [1026] = CLM.L["Nefarian's End"],
    -- The Bastion of Twilight
    [1030] = CLM.L["Halfus Wyrmbreaker"],
    [1032] = CLM.L["Theralion and Valiona"],
    [1028] = CLM.L["Ascendant Council"],
    [1029] = CLM.L["Cho'gall"],
    [1082] = CLM.L["Sinestra"],
    -- Throne of the Four Winds
    [1035] = CLM.L["Conclave of Wind"],
    [1034] = CLM.L["Al'Akir"],
    -- Firelands
    [1205] = CLM.L["Shannox"],
    [1204] = CLM.L["Lord Rhyolith"],
    [1197] = CLM.L["Beth'tilac"],
    [1206] = CLM.L["Alysrazor"],
    [1200] = CLM.L["Baleroc"],
    [1185] = CLM.L["Majordomo Staghelm"],
    [1203] = CLM.L["Ragnaros"],
    -- Dragon Soul
    [1292] = CLM.L["Morchok"],
    [1294] = CLM.L["Warlord Zon'ozz"],
    [1295] = CLM.L["Yor'sahj the Unsleeping"],
    [1296] = CLM.L["Hagara the Stormbinder"],
    [1297] = CLM.L["Ultraxion"],
    [1298] = CLM.L["Warmaster Blackhorn"],
    [1291] = CLM.L["Spine of Deathwing"],
    [1299] = CLM.L["Madness of Deathwing"],
}

CLM.EncounterIDsMap = EncounterIDsMap

CLM.EncounterHasHardMode = CLM.UTILS.Set({
    1132, -- Flame Leviathan
    1133, -- Freya
    1134, -- General Vezax
    1135, -- Hodir
    1138, -- Mimiron
    1140, -- The Assembly of Iron
    1141, -- Thorim
    1142, -- XT-002 Deconstructor
    1143, -- Yogg-Saron
})

CLM.EncounterIDs = {}

if CLM.WoWSoD then return end

CLM.EncounterIDs.Classic = {
    {
        name = CLM.L["Onyxia's Lair"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
	        { id = 1084, order =  1, name = EncounterIDsMap[1084] },
        },
    },
    {
        name = CLM.L["Molten Core"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 663, name = EncounterIDsMap[663] },
            { id = 664, name = EncounterIDsMap[664] },
            { id = 665, name = EncounterIDsMap[665] },
            { id = 666, name = EncounterIDsMap[666] },
            { id = 668, name = EncounterIDsMap[668] },
            { id = 667, name = EncounterIDsMap[667] },
            { id = 669, name = EncounterIDsMap[669] },
            { id = 670, name = EncounterIDsMap[670] },
            { id = 671, name = EncounterIDsMap[671] },
            { id = 672, name = EncounterIDsMap[672] },
        },
    },
    {
        name = CLM.L["Blackwing Lair"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 610, name = EncounterIDsMap[610] },
            { id = 611, name = EncounterIDsMap[611] },
            { id = 612, name = EncounterIDsMap[612] },
            { id = 613, name = EncounterIDsMap[613] },
            { id = 614, name = EncounterIDsMap[614] },
            { id = 615, name = EncounterIDsMap[615] },
            { id = 616, name = EncounterIDsMap[616] },
            { id = 617, name = EncounterIDsMap[617] },
        },
    },
    {
        name = CLM.L["Temple of Ahn'Qiraj"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 709, name = EncounterIDsMap[709] },
            { id = 710, name = EncounterIDsMap[710] },
            { id = 711, name = EncounterIDsMap[711] },
            { id = 712, name = EncounterIDsMap[712] },
            { id = 713, name = EncounterIDsMap[713] },
            { id = 714, name = EncounterIDsMap[714] },
            { id = 715, name = EncounterIDsMap[715] },
            { id = 716, name = EncounterIDsMap[716] },
            { id = 717, name = EncounterIDsMap[717] },
        },
    },
    {
        name = CLM.L["Naxxramas"],
        difficulty = {CLM.DifficultyID.P40},
        data = {
            { id = 1107, name = EncounterIDsMap[1107] },
            { id = 1110, name = EncounterIDsMap[1110] },
            { id = 1116, name = EncounterIDsMap[1116] },
            { id = 1118, name = EncounterIDsMap[1118] },
            { id = 1111, name = EncounterIDsMap[1111] },
            { id = 1108, name = EncounterIDsMap[1108] },
            { id = 1120, name = EncounterIDsMap[1120] },
            { id = 1117, name = EncounterIDsMap[1117] },
            { id = 1112, name = EncounterIDsMap[1112] },
            { id = 1115, name = EncounterIDsMap[1115] },
            { id = 1113, name = EncounterIDsMap[1113] },
            { id = 1109, name = EncounterIDsMap[1109] },
            { id = 1121, name = EncounterIDsMap[1121] },
            { id = 1119, name = EncounterIDsMap[1119] },
            { id = 1114, name = EncounterIDsMap[1114] },
        },
    },
    {
        name = CLM.L["Zul'Gurub"],
        difficulty = {CLM.DifficultyID.P20},
        data = {
            { id = 789, name = EncounterIDsMap[789] },
            { id = 784, name = EncounterIDsMap[784] },
            { id = 791, name = EncounterIDsMap[791] },
            { id = 785, name = EncounterIDsMap[785] },
            { id = 786, name = EncounterIDsMap[786] },
            { id = 787, name = EncounterIDsMap[787] },
            { id = 792, name = EncounterIDsMap[792] },
            { id = 793, name = EncounterIDsMap[793] },
            { id = 788, name = EncounterIDsMap[788] },
            { id = 790, name = EncounterIDsMap[790] },
        },
    },
    {
        name = CLM.L["Ruins of Ahn'Qiraj"],
        difficulty = {CLM.DifficultyID.P20},
        data = {
            { id = 718, name = EncounterIDsMap[718] },
            { id = 719, name = EncounterIDsMap[719] },
            { id = 720, name = EncounterIDsMap[720] },
            { id = 721, name = EncounterIDsMap[721] },
            { id = 722, name = EncounterIDsMap[722] },
            { id = 723, name = EncounterIDsMap[723] },
        },
    },
}

if CLM.WoWSeasonal then return end

CLM.EncounterIDs.TBC = {
    {
        name = CLM.L["Karazhan"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 652, name = EncounterIDsMap[652] },
            { id = 653, name = EncounterIDsMap[653] },
            { id = 654, name = EncounterIDsMap[654] },
            { id = 655, name = EncounterIDsMap[655] },
            { id = 656, name = EncounterIDsMap[656] },
            { id = 657, name = EncounterIDsMap[657] },
            { id = 658, name = EncounterIDsMap[658] },
            { id = 659, name = EncounterIDsMap[659] },
            { id = 660, name = EncounterIDsMap[660] },
            { id = 661, name = EncounterIDsMap[661] },
            { id = 662, name = EncounterIDsMap[662] },
        }
    },
    {
        name = CLM.L["Gruul's Lair"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 649, name = EncounterIDsMap[649] },
            { id = 650, name = EncounterIDsMap[650] },
        }
    },
    {
        name = CLM.L["Magtheridon"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 651, name = EncounterIDsMap[651] },
        }
    },
    {
        name = CLM.L["Serpentshrine Cavern"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 623, name = EncounterIDsMap[623] },
            { id = 624, name = EncounterIDsMap[624] },
            { id = 625, name = EncounterIDsMap[625] },
            { id = 626, name = EncounterIDsMap[626] },
            { id = 627, name = EncounterIDsMap[627] },
            { id = 628, name = EncounterIDsMap[628] },
        }
    },
    {
        name = CLM.L["Tempest Keep"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 730, name = EncounterIDsMap[730] },
            { id = 731, name = EncounterIDsMap[731] },
            { id = 732, name = EncounterIDsMap[732] },
            { id = 733, name = EncounterIDsMap[733] },
        }
    },
    {
        name = CLM.L["Black Temple"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 601, name = EncounterIDsMap[601] },
            { id = 602, name = EncounterIDsMap[602] },
            { id = 603, name = EncounterIDsMap[603] },
            { id = 604, name = EncounterIDsMap[604] },
            { id = 605, name = EncounterIDsMap[605] },
            { id = 606, name = EncounterIDsMap[606] },
            { id = 607, name = EncounterIDsMap[607] },
            { id = 608, name = EncounterIDsMap[608] },
            { id = 609, name = EncounterIDsMap[609] },
        }
    },
    {
        name = CLM.L["Hyjal Summit"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 618, name = EncounterIDsMap[618] },
            { id = 619, name = EncounterIDsMap[619] },
            { id = 620, name = EncounterIDsMap[620] },
            { id = 621, name = EncounterIDsMap[621] },
            { id = 622, name = EncounterIDsMap[622] },
        }
    },
    {
        name = CLM.L["Zul'Aman"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 1189, name = EncounterIDsMap[1189] },
            { id = 1190, name = EncounterIDsMap[1190] },
            { id = 1191, name = EncounterIDsMap[1191] },
            { id = 1192, name = EncounterIDsMap[1192] },
            { id = 1193, name = EncounterIDsMap[1193] },
            { id = 1194, name = EncounterIDsMap[1194] },
        }
    },
    {
        name = CLM.L["Sunwell Plateau"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 724, name = EncounterIDsMap[724] },
            { id = 725, name = EncounterIDsMap[725] },
            { id = 726, name = EncounterIDsMap[726] },
            { id = 727, name = EncounterIDsMap[727] },
            { id = 728, name = EncounterIDsMap[728] },
            { id = 729, name = EncounterIDsMap[729] },
        }
    }
}

CLM.EncounterIDs.WOTLK10 = {
    {
        name = CLM.L["Naxxramas"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 1107, name = EncounterIDsMap[1107] },
            { id = 1110, name = EncounterIDsMap[1110] },
            { id = 1116, name = EncounterIDsMap[1116] },
            { id = 1118, name = EncounterIDsMap[1118] },
            { id = 1111, name = EncounterIDsMap[1111] },
            { id = 1108, name = EncounterIDsMap[1108] },
            { id = 1120, name = EncounterIDsMap[1120] },
            { id = 1117, name = EncounterIDsMap[1117] },
            { id = 1112, name = EncounterIDsMap[1112] },
            { id = 1115, name = EncounterIDsMap[1115] },
            { id = 1113, name = EncounterIDsMap[1113] },
            { id = 1109, name = EncounterIDsMap[1109] },
            { id = 1121, name = EncounterIDsMap[1121] },
            { id = 1119, name = EncounterIDsMap[1119] },
            { id = 1114, name = EncounterIDsMap[1114] },
        },
    },
    {
        name = CLM.L["The Obsidian Sanctum"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 1090, name = EncounterIDsMap[1090] },
            { id = 1091, name = EncounterIDsMap[1091] },
            { id = 1092, name = EncounterIDsMap[1092] },
            { id = 1093, name = EncounterIDsMap[1093] },
        },
    },
    {
        name = CLM.L["The Eye of Eternity"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 1094, name = EncounterIDsMap[1094] },
        },
    },
    {
        name = CLM.L["Vault of Archavon"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 1126, name = EncounterIDsMap[1126] },
            { id = 1127, name = EncounterIDsMap[1127] },
            { id = 1128, name = EncounterIDsMap[1128] },
            { id = 1129, name = EncounterIDsMap[1129] },
        },
    },
    {
        name = CLM.L["Ulduar"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
            { id = 1130, name = EncounterIDsMap[1130] },
            { id = 1131, name = EncounterIDsMap[1131] },
            { id = 1132, name = EncounterIDsMap[1132] },
            { id = 1133, name = EncounterIDsMap[1133] },
            { id = 1134, name = EncounterIDsMap[1134] },
            { id = 1135, name = EncounterIDsMap[1135] },
            { id = 1136, name = EncounterIDsMap[1136] },
            { id = 1137, name = EncounterIDsMap[1137] },
            { id = 1138, name = EncounterIDsMap[1138] },
            { id = 1139, name = EncounterIDsMap[1139] },
            { id = 1140, name = EncounterIDsMap[1140] },
            { id = 1141, name = EncounterIDsMap[1141] },
            { id = 1142, name = EncounterIDsMap[1142] },
            { id = 1143, name = EncounterIDsMap[1143] },
        },
    },
    {
        name = CLM.L["Trial of the Crusader"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1085, name = EncounterIDsMap[1085] },
            { id = 1086, name = EncounterIDsMap[1086] },
            { id = 1087, name = EncounterIDsMap[1087] },
            { id = 1088, name = EncounterIDsMap[1088] },
            { id = 1089, name = EncounterIDsMap[1089] },
        },
    },
    {
        name = CLM.L["Icecrown Citadel"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1095, name = EncounterIDsMap[1095] },
            { id = 1096, name = EncounterIDsMap[1096] },
            { id = 1097, name = EncounterIDsMap[1097] },
            { id = 1098, name = EncounterIDsMap[1098] },
            { id = 1099, name = EncounterIDsMap[1099] },
            { id = 1100, name = EncounterIDsMap[1100] },
            { id = 1101, name = EncounterIDsMap[1101] },
            { id = 1102, name = EncounterIDsMap[1102] },
            { id = 1103, name = EncounterIDsMap[1103] },
            { id = 1104, name = EncounterIDsMap[1104] },
            { id = 1105, name = EncounterIDsMap[1105] },
            { id = 1106, name = EncounterIDsMap[1106] },
        },
    },
    {
        name = CLM.L["Onyxia's Lair"],
        difficulty = {CLM.DifficultyID.P10},
        data = {
	        { id = 1084, order =  1, name = EncounterIDsMap[1084] },
        },
    },
    {
        name = CLM.L["The Ruby Sanctum"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1147, name = EncounterIDsMap[1147] },
            { id = 1148, name = EncounterIDsMap[1148] },
            { id = 1149, name = EncounterIDsMap[1149] },
            { id = 1150, name = EncounterIDsMap[1150] },
        },
    },
}

CLM.EncounterIDs.WOTLK25 = {
    {
        name = CLM.L["Naxxramas"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 1107, name = EncounterIDsMap[1107] },
            { id = 1110, name = EncounterIDsMap[1110] },
            { id = 1116, name = EncounterIDsMap[1116] },
            { id = 1118, name = EncounterIDsMap[1118] },
            { id = 1111, name = EncounterIDsMap[1111] },
            { id = 1108, name = EncounterIDsMap[1108] },
            { id = 1120, name = EncounterIDsMap[1120] },
            { id = 1117, name = EncounterIDsMap[1117] },
            { id = 1112, name = EncounterIDsMap[1112] },
            { id = 1115, name = EncounterIDsMap[1115] },
            { id = 1113, name = EncounterIDsMap[1113] },
            { id = 1109, name = EncounterIDsMap[1109] },
            { id = 1121, name = EncounterIDsMap[1121] },
            { id = 1119, name = EncounterIDsMap[1119] },
            { id = 1114, name = EncounterIDsMap[1114] },
        },
    },
    {
        name = CLM.L["The Obsidian Sanctum"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 1090, name = EncounterIDsMap[1090] },
            { id = 1091, name = EncounterIDsMap[1091] },
            { id = 1092, name = EncounterIDsMap[1092] },
            { id = 1093, name = EncounterIDsMap[1093] },
        },
    },
    {
        name = CLM.L["The Eye of Eternity"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 1094, name = EncounterIDsMap[1094] },
        },
    },
    {
        name = CLM.L["Vault of Archavon"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 1126, name = EncounterIDsMap[1126] },
            { id = 1127, name = EncounterIDsMap[1127] },
            { id = 1128, name = EncounterIDsMap[1128] },
            { id = 1129, name = EncounterIDsMap[1129] },
        },
    },
    {
        name = CLM.L["Ulduar"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
            { id = 1130, name = EncounterIDsMap[1130] },
            { id = 1131, name = EncounterIDsMap[1131] },
            { id = 1132, name = EncounterIDsMap[1132] },
            { id = 1133, name = EncounterIDsMap[1133] },
            { id = 1134, name = EncounterIDsMap[1134] },
            { id = 1135, name = EncounterIDsMap[1135] },
            { id = 1136, name = EncounterIDsMap[1136] },
            { id = 1137, name = EncounterIDsMap[1137] },
            { id = 1138, name = EncounterIDsMap[1138] },
            { id = 1139, name = EncounterIDsMap[1139] },
            { id = 1140, name = EncounterIDsMap[1140] },
            { id = 1141, name = EncounterIDsMap[1141] },
            { id = 1142, name = EncounterIDsMap[1142] },
            { id = 1143, name = EncounterIDsMap[1143] },
        },
    },
    {
        name = CLM.L["Trial of the Crusader"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1085, name = EncounterIDsMap[1085] },
            { id = 1086, name = EncounterIDsMap[1086] },
            { id = 1087, name = EncounterIDsMap[1087] },
            { id = 1088, name = EncounterIDsMap[1088] },
            { id = 1089, name = EncounterIDsMap[1089] },
        },
    },
    {
        name = CLM.L["Icecrown Citadel"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1095, name = EncounterIDsMap[1095] },
            { id = 1096, name = EncounterIDsMap[1096] },
            { id = 1097, name = EncounterIDsMap[1097] },
            { id = 1098, name = EncounterIDsMap[1098] },
            { id = 1099, name = EncounterIDsMap[1099] },
            { id = 1100, name = EncounterIDsMap[1100] },
            { id = 1101, name = EncounterIDsMap[1101] },
            { id = 1102, name = EncounterIDsMap[1102] },
            { id = 1103, name = EncounterIDsMap[1103] },
            { id = 1104, name = EncounterIDsMap[1104] },
            { id = 1105, name = EncounterIDsMap[1105] },
            { id = 1106, name = EncounterIDsMap[1106] },
        },
    },
    {
        name = CLM.L["Onyxia's Lair"],
        difficulty = {CLM.DifficultyID.P25},
        data = {
	        { id = 1084, order =  1, name = EncounterIDsMap[1084] },
        },
    },
    {
        name = CLM.L["The Ruby Sanctum"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1147, name = EncounterIDsMap[1147] },
            { id = 1148, name = EncounterIDsMap[1148] },
            { id = 1149, name = EncounterIDsMap[1149] },
            { id = 1150, name = EncounterIDsMap[1150] },
        },
    },
}

CLM.EncounterIDs.Cata10 = {
    {
        name = CLM.L["Baradin Hold"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1033, name = EncounterIDsMap[1033] },
            { id = 1250, name = EncounterIDsMap[1250] },
            { id = 1332, name = EncounterIDsMap[1332] },
        },
    },
    {
        name = CLM.L["Blackwing Descent"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1024, name = EncounterIDsMap[1024] },
            { id = 1027, name = EncounterIDsMap[1027] },
            { id = 1025, name = EncounterIDsMap[1025] },
            { id = 1022, name = EncounterIDsMap[1022] },
            { id = 1023, name = EncounterIDsMap[1023] },
            { id = 1026, name = EncounterIDsMap[1026] },
        },
    },
    {
        name = CLM.L["The Bastion of Twilight"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1030, name = EncounterIDsMap[1030] },
            { id = 1032, name = EncounterIDsMap[1032] },
            { id = 1028, name = EncounterIDsMap[1028] },
            { id = 1029, name = EncounterIDsMap[1029] },
            { id = 1082, name = EncounterIDsMap[1082] },
        },
    },
    {
        name = CLM.L["Throne of the Four Winds"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1035, name = EncounterIDsMap[1035] },
            { id = 1034, name = EncounterIDsMap[1034] },
        },
    },
    {
        name = CLM.L["Firelands"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1205, name = EncounterIDsMap[1205] },
            { id = 1204, name = EncounterIDsMap[1204] },
            { id = 1197, name = EncounterIDsMap[1197] },
            { id = 1206, name = EncounterIDsMap[1206] },
            { id = 1200, name = EncounterIDsMap[1200] },
            { id = 1185, name = EncounterIDsMap[1185] },
            { id = 1203, name = EncounterIDsMap[1203] },
        },
    },
    {
        name = CLM.L["Dragon Soul"],
        difficulty = {CLM.DifficultyID.P10,CLM.DifficultyID.P10HC},
        data = {
            { id = 1292, name = EncounterIDsMap[1292] },
            { id = 1294, name = EncounterIDsMap[1294] },
            { id = 1295, name = EncounterIDsMap[1295] },
            { id = 1296, name = EncounterIDsMap[1296] },
            { id = 1297, name = EncounterIDsMap[1297] },
            { id = 1298, name = EncounterIDsMap[1298] },
            { id = 1291, name = EncounterIDsMap[1291] },
            { id = 1299, name = EncounterIDsMap[1299] },
        },
    },
}

CLM.EncounterIDs.Cata25 = {
    {
        name = CLM.L["Baradin Hold"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1033, name = EncounterIDsMap[1033] },
            { id = 1250, name = EncounterIDsMap[1250] },
            { id = 1332, name = EncounterIDsMap[1332] },
        },
    },
    {
        name = CLM.L["Blackwing Descent"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1024, name = EncounterIDsMap[1024] },
            { id = 1027, name = EncounterIDsMap[1027] },
            { id = 1025, name = EncounterIDsMap[1025] },
            { id = 1022, name = EncounterIDsMap[1022] },
            { id = 1023, name = EncounterIDsMap[1023] },
            { id = 1026, name = EncounterIDsMap[1026] },
        },
    },
    {
        name = CLM.L["The Bastion of Twilight"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1030, name = EncounterIDsMap[1030] },
            { id = 1032, name = EncounterIDsMap[1032] },
            { id = 1028, name = EncounterIDsMap[1028] },
            { id = 1029, name = EncounterIDsMap[1029] },
            { id = 1082, name = EncounterIDsMap[1082] },
        },
    },
    {
        name = CLM.L["Throne of the Four Winds"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1035, name = EncounterIDsMap[1035] },
            { id = 1034, name = EncounterIDsMap[1034] },
        },
    },
    {
        name = CLM.L["Firelands"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1205, name = EncounterIDsMap[1205] },
            { id = 1204, name = EncounterIDsMap[1204] },
            { id = 1197, name = EncounterIDsMap[1197] },
            { id = 1206, name = EncounterIDsMap[1206] },
            { id = 1200, name = EncounterIDsMap[1200] },
            { id = 1185, name = EncounterIDsMap[1185] },
            { id = 1203, name = EncounterIDsMap[1203] },
        },
    },
    {
        name = CLM.L["Dragon Soul"],
        difficulty = {CLM.DifficultyID.P25,CLM.DifficultyID.P25HC},
        data = {
            { id = 1292, name = EncounterIDsMap[1292] },
            { id = 1294, name = EncounterIDsMap[1294] },
            { id = 1295, name = EncounterIDsMap[1295] },
            { id = 1296, name = EncounterIDsMap[1296] },
            { id = 1297, name = EncounterIDsMap[1297] },
            { id = 1298, name = EncounterIDsMap[1298] },
            { id = 1291, name = EncounterIDsMap[1291] },
            { id = 1299, name = EncounterIDsMap[1299] },
        },
    },
}