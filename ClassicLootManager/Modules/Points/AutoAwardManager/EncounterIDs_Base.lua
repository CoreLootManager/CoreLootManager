local _, CLM = ...

local EJ_GetEncounterInfo = EJ_GetEncounterInfo or (function() return nil end)

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
    [CLM.DifficultyID.OPEN_WORLD]   = CLM.L["40 Player"], -- Open World
    [CLM.DifficultyID.P40]          = CLM.L["40 Player"],
    [CLM.DifficultyID.P10]	        = CLM.L["10 Player"],
    [CLM.DifficultyID.P10HC]	    = CLM.L["10 Player (Heroic)"],
    [CLM.DifficultyID.P25]	        = CLM.L["25 Player"],
    [CLM.DifficultyID.P25HC]	    = CLM.L["25 Player (Heroic)"],
    [CLM.DifficultyID.NORMAL]       = CLM.L["Normal"],
    [CLM.DifficultyID.HEROIC]       = CLM.L["Heroic"],
    [CLM.DifficultyID.MYTHIC]       = CLM.L["Mythic"],
}

CLM.EncounterIDsMap = {
    -- Season of Discovery
    [2694] = CLM.L["Baron Aquanis"],
    [2697] = CLM.L["Ghamoo-ra"],
    [2699] = CLM.L["Lady Sarevess"],
    [2704] = CLM.L["Gelihast"],
    [2710] = CLM.L["Lorgus Jett"],
    [2825] = CLM.L["Twilight Lord Kelris"],
    [2891] = CLM.L["Aku'mai"],
    -- Gnomeregan
    [2925] = CLM.L["Grubbis"],
    [2928] = CLM.L["Viscous Fallout"],
    [2927] = CLM.L["Electrocutioner 6000"],
    [2899] = CLM.L["Crowd Pummeler 9-60"],
    [2935] = CLM.L["Mechanical Menagerie"],
    [2940] = CLM.L["Mekgineer Thermaplugg"],
    -- Sunken Temple
    [2952] = CLM.L["Atal'alarion"],
    [2953] = CLM.L["Festering Rotslime"],
    [2955] = CLM.L["Dreamscythe and Weaver"],
    [2954] = CLM.L["Atal'ai Defenders"],
    [2957] = CLM.L["Jammal'an and Ogom"],
    [2958] = CLM.L["Morphaz and Hazzas"],
    [2959] = CLM.L["Shade of Eranikus"],
    [2956] = CLM.L["Avatar of Hakkar"],
    -- Molten Core
    [3018] = CLM.L["Molten Core"],
    -- World Bosses
    [3027] = CLM.L["Azuregos"],
    [3026] = CLM.L["Lord Kazzak"],
    -- The Crystal Vale
    [3079] = CLM.L["Prince Thunderaan"],
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
    -- DF
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
    -- Amirdrassil
    [2820] = EJ_GetEncounterInfo(2564) or "Gnarlroot", -- Gnarlroot
    [2709] = EJ_GetEncounterInfo(2554) or "Igira the Cruel", -- Igira the Cruel
    [2737] = EJ_GetEncounterInfo(2557) or "Volcoross", -- Volcoross
    [2728] = EJ_GetEncounterInfo(2555) or "Council of Dreams", -- Council of Dreams
    [2731] = EJ_GetEncounterInfo(2553) or "Larodar, Keeper of the Flame", -- Larodar, Keeper of the Flame
    [2708] = EJ_GetEncounterInfo(2556) or "Nymue, Weaver of the Cycle", -- Nymue, Weaver of the Cycle
    [2824] = EJ_GetEncounterInfo(2563) or "Smolderon", -- Smolderon
    [2786] = EJ_GetEncounterInfo(2565) or "Tindral Sageswift, Seer of the Flame", -- Tindral Sageswift, Seer of the Flame
    [2677] = EJ_GetEncounterInfo(2519) or "Fyrakk the Blazing", -- Fyrakk the Blazing
    -- TWW
    -- Nerub-ar Palace
    [2902] = EJ_GetEncounterInfo(2607) or "Ulgrax the Devourer",
    [2917] = EJ_GetEncounterInfo(2611) or "The Bloodbound Horror",
    [2898] = EJ_GetEncounterInfo(2599) or "Sikran, Captain of the Sureki",
    [2918] = EJ_GetEncounterInfo(2609) or "Rasha'nan",
    [2919] = EJ_GetEncounterInfo(2612) or "Broodtwister Ovi'nax",
    [2920] = EJ_GetEncounterInfo(2601) or "Nexus-Princess Ky'veza",
    [2921] = EJ_GetEncounterInfo(2608) or "The Silken Court",
    [2922] = EJ_GetEncounterInfo(2602) or "Queen Ansurek",
}

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