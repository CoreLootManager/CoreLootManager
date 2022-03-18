local _, CLM = ...
local EncounterIDsMap = {
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
}
CLM.EncounterIDsMap = EncounterIDsMap

CLM.EncounterIDs = {}
CLM.EncounterIDs.Classic = {

    {
        name = CLM.L["Onyxia's Lair"],
        data = {
	        { id = 1084, order =  1, name = EncounterIDsMap[1084] },
        },
    },

    {
        name = CLM.L["Molten Core"],
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

    {
        name = CLM.L["Karazhan"],
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
        data = {
            { id = 649, name = EncounterIDsMap[649] },
            { id = 650, name = EncounterIDsMap[650] },
        }
    },

    {
        name = CLM.L["Magtheridon"],
        data = {
            { id = 651, name = EncounterIDsMap[651] },
        }
    },

    {
        name = CLM.L["Serpentshrine Cavern"],
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
        data = {
            { id = 730, name = EncounterIDsMap[730] },
            { id = 731, name = EncounterIDsMap[731] },
            { id = 732, name = EncounterIDsMap[732] },
            { id = 733, name = EncounterIDsMap[733] },
        }
    },

    {
        name = CLM.L["Black Temple"],
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
        data = {
            { id = 724, name = EncounterIDsMap[724] },
            { id = 725, name = EncounterIDsMap[725] },
            { id = 726, name = EncounterIDsMap[726] },
            { id = 727, name = EncounterIDsMap[727] },
            { id = 728, name = EncounterIDsMap[728] },
            { id = 729, name = EncounterIDsMap[729] }
        }
    }
}