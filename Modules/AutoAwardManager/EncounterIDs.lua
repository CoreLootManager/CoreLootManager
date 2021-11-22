local _, CLM = ...
-----------
--- ALL ---
-----------
CLM.EncounterIDsMap = {
    [1084] = "Onyxia",
    [663] = "Lucifron",
    [664] = "Magmadar",
    [665] = "Gehennas",
    [666] = "Garr",
    [668] = "Baron Geddon",
    [667] = "Shazzrah",
    [669] = "Sulfuron Harbinger",
    [670] = "Golemagg the Incinerator",
    [671] = "Majordomo Executus",
    [672] = "Ragnaros",
    [610] = "Razorgore the Untamed",
    [611] = "Vaelastrasz the Corrupt",
    [612] = "Broodlord Lashlayer",
    [613] = "Firemaw",
    [614] = "Ebonroc",
    [615] = "Flamegor",
    [616] = "Chromaggus",
    [617] = "Nefarian",
    [709] = "The Prophet Skeram",
    [710] = "Silithid Royalty",
    [711] = "Battleguard Sartura",
    [712] = "Fankriss the Unyielding",
    [713] = "Viscidus",
    [714] = "Princess Huhuran",
    [715] = "Twin Emperors",
    [716] = "Ouro",
    [717] = "C'Thun",
    [1107] = "Anub'Rekhan",
    [1110] = "Grand Widow Faerlina",
    [1116] = "Maexxna",
    [1118] = "Patchwerk",
    [1111] = "Grobbulus",
    [1108] = "Gluth",
    [1120] = "Thaddius",
    [1117] = "Noth the Plaguebringer",
    [1112] = "Heigan the Unclean",
    [1115] = "Loatheb",
    [1113] = "Instructor Razuvious",
    [1109] = "Gothik the Harvester",
    [1121] = "The Four Horsemen",
    [1119] = "Sapphiron",
    [1114] = "Kel'Thuzad",
    [789] = "High Priest Thekal",
    [784] = "High Priest Venoxis",
    [791] = "High Priestess Arlokk",
    [785] = "High Priestess Jeklik",
    [786] = "High Priestess Mar'li",
    [787] = "Bloodlord Mandokir",
    [792] = "Jin'do the Hexxer",
    [793] = "Hakkar",
    [788] = "Edge of Madness",
    [790] = "Gahz'ranka",
    [718] = "Kurinnaxx",
    [719] = "General Rajaxx",
    [720] = "Moam",
    [721] = "Buru the Gorger",
    [722] = "Ayamiss the Hunter",
    [723] = "Ossirian the Unscarred",
    [652] = "Attumen the Huntsman", -- "Attumen the Huntsman",
    [653] = "Moroes", -- "Moroes",
    [654] = "Maiden of Virtue", -- "Maiden of Virtue",
    [655] = "Opera Hall", -- "Opera Hall",
    [656] = "The Curator", -- "The Curator",
    [657] = "Terestian Illhoof", -- "Terestian Illhoof",
    [658] = "Shade of Aran", -- "Shade of Aran",
    [659] = "Netherspite", -- "Netherspite",
    [660] = "Chess Event", -- "Chess Event",
    [661] = "Prince Malchezaar", -- "Prince Malchezaar",
    [662] = "Nightbane", -- "Nightbane"
    [649] = "High King Maulgar", -- "High King Maulgar",
    [650] = "Gruul the Dragonkiller", -- "Gruul the Dragonkiller"
    [651] = "Magtheridon", -- "Magtheridon"
    [623] = "Hydross the Unstable", -- "Hydross the Unstable",
    [624] = "The Lurker Below", -- "The Lurker Below",
    [625] = "Leotheras the Blind", -- "Leotheras the Blind",
    [626] = "Fathom-Lord Karathress", -- "Fathom-Lord Karathress",
    [627] = "Morogrim Tidewalker", -- "Morogrim Tidewalker",
    [628] = "Lady Vashj", -- "Lady Vashj"
    [730] = "Al'ar", -- "Al'ar",
    [731] = "Void Reaver", -- "Void Reaver",
    [732] = "High Astromancer Solarian", -- "High Astromancer Solarian",
    [733] = "Kael'thas Sunstrider", -- "Kael'thas Sunstrider"
    [601] = "High Warlord Naj'entus", -- High Warlord Naj'entus,
    [602] = "Supremus", -- Supremus
    [603] = "Shade of Akama", -- Shade of Akama
    [604] = "Teron Gorefiend", -- Teron Gorefiend,
    [605] = "Gurtogg Bloodboil", -- Gurtogg Bloodboil
    [606] = "Reliquary of Souls", -- Reliquary of Souls
    [607] = "Mother Shahraz", -- Mother Shahraz
    [608] = "The Illidari Council", -- The Illidari Council
    [609] = "Illidan Stormrage", -- Illidan Stormrage
    [618] = "Rage Winterchill", -- High Warlord Naj'entus,
    [619] = "Anetheron", -- Supremus
    [620] = "Kaz'rogal", -- Shade of Akama
    [621] = "Azgalor", -- Teron Gorefiend,
    [622] = "Archimonde", -- Gurtogg Bloodboil
    [1189] = "Akil'zon", -- "Akil'zon"
    [1190] = "Nalorakk", -- Nalorakk
    [1191] = "Jan'alai", -- Jan'alai
    [1192] = "Halazzi", -- Halazzi,
    [1193] = "Hex Lord Malacrass", -- Hex Lord Malacrass
    [1194] = "Daakara", -- Daakara
    [724] = "Kalecgos", -- "Kalecgos",
    [725] = "Brutallus", -- "Brutallus",
    [726] = "Felmyst", -- "Felmyst",
    [727] = "Eredar Twins", -- "Eredar Twins",
    [728] = "M'uru", -- "M'uru",
    [729] = "Kil'jaeden", -- "Kil'jaeden"
}
CLM.EncounterIDs = {}
CLM.EncounterIDs.Classic = {
    -- Onyxia
    {
        name = "Onyxia's Lair",
        data = {
	        { id = 1084, order =  1, name = CLM.EncounterIDsMap[1084] },
        },
    },
    -- MC
    {
        name = "Molten Core",
        data = {
            [663] = CLM.EncounterIDsMap[663],
            [664] = CLM.EncounterIDsMap[664],
            [665] = CLM.EncounterIDsMap[665],
            [666] = CLM.EncounterIDsMap[666],
            [668] = CLM.EncounterIDsMap[668],
            [667] = CLM.EncounterIDsMap[667],
            [669] = CLM.EncounterIDsMap[669],
            [670] = CLM.EncounterIDsMap[670],
            [671] = CLM.EncounterIDsMap[671],
            [672] = CLM.EncounterIDsMap[672],
        },
    },
    -- BWL
    {
        name = "Blackwing Lair",
        data = {
            [610] = CLM.EncounterIDsMap[610],
            [611] = CLM.EncounterIDsMap[611],
            [612] = CLM.EncounterIDsMap[612],
            [613] = CLM.EncounterIDsMap[613],
            [614] = CLM.EncounterIDsMap[614],
            [615] = CLM.EncounterIDsMap[615],
            [616] = CLM.EncounterIDsMap[616],
            [617] = CLM.EncounterIDsMap[617],
        },
    },
    -- AQ40
    {
        name = "Temple of Ahn'Qiraj",
        data = {
            [709] = CLM.EncounterIDsMap[709],
            [710] = CLM.EncounterIDsMap[710],
            [711] = CLM.EncounterIDsMap[711],
            [712] = CLM.EncounterIDsMap[712],
            [713] = CLM.EncounterIDsMap[713],
            [714] = CLM.EncounterIDsMap[714],
            [715] = CLM.EncounterIDsMap[715],
            [716] = CLM.EncounterIDsMap[716],
            [717] = CLM.EncounterIDsMap[717],
        },
    },
    -- Naxx
    {
        name = "Naxxramas",
        data = {
            [1107] = CLM.EncounterIDsMap[1107],
            [1110] = CLM.EncounterIDsMap[1110],
            [1116] = CLM.EncounterIDsMap[1116],
            [1118] = CLM.EncounterIDsMap[1118],
            [1111] = CLM.EncounterIDsMap[1111],
            [1108] = CLM.EncounterIDsMap[1108],
            [1120] = CLM.EncounterIDsMap[1120],
            [1117] = CLM.EncounterIDsMap[1117],
            [1112] = CLM.EncounterIDsMap[1112],
            [1115] = CLM.EncounterIDsMap[1115],
            [1113] = CLM.EncounterIDsMap[1113],
            [1109] = CLM.EncounterIDsMap[1109],
            [1121] = CLM.EncounterIDsMap[1121],
            [1119] = CLM.EncounterIDsMap[1119],
            [1114] = CLM.EncounterIDsMap[1114],
        },
    },
    -- ZG
    {
        name = "Zul'Gurub",
        data = {
            [789] = CLM.EncounterIDsMap[789],
            [784] = CLM.EncounterIDsMap[784],
            [791] = CLM.EncounterIDsMap[791],
            [785] = CLM.EncounterIDsMap[785],
            [786] = CLM.EncounterIDsMap[786],
            [787] = CLM.EncounterIDsMap[787],
            [792] = CLM.EncounterIDsMap[792],
            [793] = CLM.EncounterIDsMap[793],
            [788] = CLM.EncounterIDsMap[788],
            [790] = CLM.EncounterIDsMap[790],
        },
    },
    -- AQ20
    {
        name = "Ruins of Ahn'Qiraj",
        data = {
            [718] = CLM.EncounterIDsMap[718],
            [719] = CLM.EncounterIDsMap[719],
            [720] = CLM.EncounterIDsMap[720],
            [721] = CLM.EncounterIDsMap[721],
            [722] = CLM.EncounterIDsMap[722],
            [723] = CLM.EncounterIDsMap[723],
        },
    },
}

CLM.EncounterIDs.TBC = {
    -- Karazhan
    {
        name = "Karazhan",
        data = {
            [652] = CLM.EncounterIDsMap[652], -- "Attumen the Huntsman",
            [653] = CLM.EncounterIDsMap[653], -- "Moroes",
            [654] = CLM.EncounterIDsMap[654], -- "Maiden of Virtue",
            [655] = CLM.EncounterIDsMap[655], -- "Opera Hall",
            [656] = CLM.EncounterIDsMap[656], -- "The Curator",
            [657] = CLM.EncounterIDsMap[657], -- "Terestian Illhoof",
            [658] = CLM.EncounterIDsMap[658], -- "Shade of Aran",
            [659] = CLM.EncounterIDsMap[659], -- "Netherspite",
            [660] = CLM.EncounterIDsMap[660], -- "Chess Event",
            [661] = CLM.EncounterIDsMap[661], -- "Prince Malchezaar",
            [662] = CLM.EncounterIDsMap[662], -- "Nightbane"
        }
    },
    -- Gruul's Lair
    {
        name = "Gruul's Lair",
        data = {
            [649] = CLM.EncounterIDsMap[649], -- "High King Maulgar",
            [650] = CLM.EncounterIDsMap[650], -- "Gruul the Dragonkiller"
        }
    },
    --  Magtheridon
    {
        name = "Magtheridon",
        data = {
            [651] = CLM.EncounterIDsMap[651], -- "Magtheridon"
        }
    },
    -- SSC
    {
        name = "Serpentshrine Cavern",
        data = {
            [623] = CLM.EncounterIDsMap[623], -- "Hydross the Unstable",
            [624] = CLM.EncounterIDsMap[624], -- "The Lurker Below",
            [625] = CLM.EncounterIDsMap[625], -- "Leotheras the Blind",
            [626] = CLM.EncounterIDsMap[626], -- "Fathom-Lord Karathress",
            [627] = CLM.EncounterIDsMap[627], -- "Morogrim Tidewalker",
            [628] = CLM.EncounterIDsMap[628], -- "Lady Vashj"
        }
    },
    -- TK
    {
        name = "Tempest Keep",
        data = {
            [730] = CLM.EncounterIDsMap[730], -- "Al'ar",
            [731] = CLM.EncounterIDsMap[731], -- "Void Reaver",
            [732] = CLM.EncounterIDsMap[732], -- "High Astromancer Solarian",
            [733] = CLM.EncounterIDsMap[733], -- "Kael'thas Sunstrider"
        }
    },
    -- Black Temple
    {
        name = "Black Temple",
        data = {
            [601] = CLM.EncounterIDsMap[601], -- High Warlord Naj'entus,
            [602] = CLM.EncounterIDsMap[602], -- Supremus
            [603] = CLM.EncounterIDsMap[603], -- Shade of Akama
            [604] = CLM.EncounterIDsMap[604], -- Teron Gorefiend,
            [605] = CLM.EncounterIDsMap[605], -- Gurtogg Bloodboil
            [606] = CLM.EncounterIDsMap[606], -- Reliquary of Souls
            [607] = CLM.EncounterIDsMap[607], -- Mother Shahraz
            [608] = CLM.EncounterIDsMap[608], -- The Illidari Council
            [609] = CLM.EncounterIDsMap[609], -- Illidan Stormrage
        }
    },
    -- Hyjal Summit
    {
        name = "Hyjal Summit",
        data = {
            [618] = CLM.EncounterIDsMap[618], -- High Warlord Naj'entus,
            [619] = CLM.EncounterIDsMap[619], -- Supremus
            [620] = CLM.EncounterIDsMap[620], -- Shade of Akama
            [621] = CLM.EncounterIDsMap[621], -- Teron Gorefiend,
            [622] = CLM.EncounterIDsMap[622], -- Gurtogg Bloodboil
        }
    },
    -- Zul'Aman
    {
        name = "Zul'Aman",
        data = {
            [1189] = CLM.EncounterIDsMap[1189], -- "Akil'zon"
            [1190] = CLM.EncounterIDsMap[1190], -- Nalorakk
            [1191] = CLM.EncounterIDsMap[1191], -- Jan'alai
            [1192] = CLM.EncounterIDsMap[1192], -- Halazzi,
            [1193] = CLM.EncounterIDsMap[1193], -- Hex Lord Malacrass
            [1194] = CLM.EncounterIDsMap[1194], -- Daakara
        }
    },
    -- Sunwell
    {
        name = "Sunwell Plateau",
        data = {
            [724] = CLM.EncounterIDsMap[724], -- "Kalecgos",
            [725] = CLM.EncounterIDsMap[725], -- "Brutallus",
            [726] = CLM.EncounterIDsMap[726], -- "Felmyst",
            [727] = CLM.EncounterIDsMap[727], -- "Eredar Twins",
            [728] = CLM.EncounterIDsMap[728], -- "M'uru",
            [729] = CLM.EncounterIDsMap[729], -- "Kil'jaeden"
        }
    }
}