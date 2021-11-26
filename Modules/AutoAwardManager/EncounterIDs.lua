local _, CLM = ...
local EncounterIDsMap = {
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
CLM.EncounterIDsMap = EncounterIDsMap

CLM.EncounterIDs = {}
CLM.EncounterIDs.Classic = {
    -- Onyxia
    {
        name = "Onyxia's Lair",
        data = {
	        { id = 1084, order =  1, name = EncounterIDsMap[1084] },
        },
    },
    -- MC
    {
        name = "Molten Core",
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
    -- BWL
    {
        name = "Blackwing Lair",
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
    -- AQ40
    {
        name = "Temple of Ahn'Qiraj",
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
    -- Naxx
    {
        name = "Naxxramas",
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
    -- ZG
    {
        name = "Zul'Gurub",
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
    -- AQ20
    {
        name = "Ruins of Ahn'Qiraj",
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

CLM.EncounterIDs.TBC = {
    -- Karazhan
    {
        name = "Karazhan",
        data = {
            { id = 652, name = EncounterIDsMap[652] }, -- "Attumen the Huntsman",
            { id = 653, name = EncounterIDsMap[653] }, -- "Moroes",
            { id = 654, name = EncounterIDsMap[654] }, -- "Maiden of Virtue",
            { id = 655, name = EncounterIDsMap[655] }, -- "Opera Hall",
            { id = 656, name = EncounterIDsMap[656] }, -- "The Curator",
            { id = 657, name = EncounterIDsMap[657] }, -- "Terestian Illhoof",
            { id = 658, name = EncounterIDsMap[658] }, -- "Shade of Aran",
            { id = 659, name = EncounterIDsMap[659] }, -- "Netherspite",
            { id = 660, name = EncounterIDsMap[660] }, -- "Chess Event",
            { id = 661, name = EncounterIDsMap[661] }, -- "Prince Malchezaar",
            { id = 662, name = EncounterIDsMap[662] }, -- "Nightbane"
        }
    },
    -- Gruul's Lair
    {
        name = "Gruul's Lair",
        data = {
            { id = 649, name = EncounterIDsMap[649] }, -- "High King Maulgar",
            { id = 650, name = EncounterIDsMap[650] }, -- "Gruul the Dragonkiller"
        }
    },
    --  Magtheridon
    {
        name = "Magtheridon",
        data = {
            { id = 651, name = EncounterIDsMap[651] }, -- "Magtheridon"
        }
    },
    -- SSC
    {
        name = "Serpentshrine Cavern",
        data = {
            { id = 623, name = EncounterIDsMap[623] }, -- "Hydross the Unstable",
            { id = 624, name = EncounterIDsMap[624] }, -- "The Lurker Below",
            { id = 625, name = EncounterIDsMap[625] }, -- "Leotheras the Blind",
            { id = 626, name = EncounterIDsMap[626] }, -- "Fathom-Lord Karathress",
            { id = 627, name = EncounterIDsMap[627] }, -- "Morogrim Tidewalker",
            { id = 628, name = EncounterIDsMap[628] }, -- "Lady Vashj"
        }
    },
    -- TK
    {
        name = "Tempest Keep",
        data = {
            { id = 730, name = EncounterIDsMap[730] }, -- "Al'ar",
            { id = 731, name = EncounterIDsMap[731] }, -- "Void Reaver",
            { id = 732, name = EncounterIDsMap[732] }, -- "High Astromancer Solarian",
            { id = 733, name = EncounterIDsMap[733] }, -- "Kael'thas Sunstrider"
        }
    },
    -- Black Temple
    {
        name = "Black Temple",
        data = {
            { id = 601, name = EncounterIDsMap[601] }, -- High Warlord Naj'entus,
            { id = 602, name = EncounterIDsMap[602] }, -- Supremus
            { id = 603, name = EncounterIDsMap[603] }, -- Shade of Akama
            { id = 604, name = EncounterIDsMap[604] }, -- Teron Gorefiend,
            { id = 605, name = EncounterIDsMap[605] }, -- Gurtogg Bloodboil
            { id = 606, name = EncounterIDsMap[606] }, -- Reliquary of Souls
            { id = 607, name = EncounterIDsMap[607] }, -- Mother Shahraz
            { id = 608, name = EncounterIDsMap[608] }, -- The Illidari Council
            { id = 609, name = EncounterIDsMap[609] }, -- Illidan Stormrage
        }
    },
    -- Hyjal Summit
    {
        name = "Hyjal Summit",
        data = {
            { id = 618, name = EncounterIDsMap[618] }, -- High Warlord Naj'entus,
            { id = 619, name = EncounterIDsMap[619] }, -- Supremus
            { id = 620, name = EncounterIDsMap[620] }, -- Shade of Akama
            { id = 621, name = EncounterIDsMap[621] }, -- Teron Gorefiend,
            { id = 622, name = EncounterIDsMap[622] }, -- Gurtogg Bloodboil
        }
    },
    -- Zul'Aman
    {
        name = "Zul'Aman",
        data = {
            { id = 1189, name = EncounterIDsMap[1189] }, -- "Akil'zon"
            { id = 1190, name = EncounterIDsMap[1190] }, -- Nalorakk
            { id = 1191, name = EncounterIDsMap[1191] }, -- Jan'alai
            { id = 1192, name = EncounterIDsMap[1192] }, -- Halazzi,
            { id = 1193, name = EncounterIDsMap[1193] }, -- Hex Lord Malacrass
            { id = 1194, name = EncounterIDsMap[1194] }, -- Daakara
        }
    },
    -- Sunwell
    {
        name = "Sunwell Plateau",
        data = {
            { id = 724, name = EncounterIDsMap[724] }, -- "Kalecgos",
            { id = 725, name = EncounterIDsMap[725] }, -- "Brutallus",
            { id = 726, name = EncounterIDsMap[726] }, -- "Felmyst",
            { id = 727, name = EncounterIDsMap[727] }, -- "Eredar Twins",
            { id = 728, name = EncounterIDsMap[728] }, -- "M'uru",
            { id = 729, name = EncounterIDsMap[729] } -- "Kil'jaeden"
        }
    }
}