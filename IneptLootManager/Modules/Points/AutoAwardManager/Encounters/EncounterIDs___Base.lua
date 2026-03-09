local _, ILM = ...

ILM.DifficultyID = {}

ILM.DifficultyID.NONE       = -1
ILM.DifficultyID.P10        = 3
ILM.DifficultyID.P25        = 4

ILM.DifficultyIDsMap = {
    [ILM.DifficultyID.NONE]         = "Fake", -- Trick for handling easily not-supported encounter ids
    [ILM.DifficultyID.P10]	        = ILM.L["10 Player"],
    [ILM.DifficultyID.P25]	        = ILM.L["25 Player"],
}

ILM.EncounterIDsMap = {
    -- TBC
    -- ZG (level 60 raids available in TBC)
    [789] = ILM.L["High Priest Thekal"],
    [784] = ILM.L["High Priest Venoxis"],
    [791] = ILM.L["High Priestess Arlokk"],
    [785] = ILM.L["High Priestess Jeklik"],
    [786] = ILM.L["High Priestess Mar'li"],
    [787] = ILM.L["Bloodlord Mandokir"],
    [792] = ILM.L["Jin'do the Hexxer"],
    [793] = ILM.L["Hakkar"],
    [788] = ILM.L["Edge of Madness"],
    [790] = ILM.L["Gahz'ranka"],
    -- AQ20
    [718] = ILM.L["Kurinnaxx"],
    [719] = ILM.L["General Rajaxx"],
    [720] = ILM.L["Moam"],
    [721] = ILM.L["Buru the Gorger"],
    [722] = ILM.L["Ayamiss the Hunter"],
    [723] = ILM.L["Ossirian the Unscarred"],
    -- Karazhan
    [652] = ILM.L["Attumen the Huntsman"],
    [653] = ILM.L["Moroes"],
    [654] = ILM.L["Maiden of Virtue"],
    [655] = ILM.L["Opera Hall"],
    [656] = ILM.L["The Curator"],
    [657] = ILM.L["Terestian Illhoof"],
    [658] = ILM.L["Shade of Aran"],
    [659] = ILM.L["Netherspite"],
    [660] = ILM.L["Chess Event"],
    [661] = ILM.L["Prince Malchezaar"],
    [662] = ILM.L["Nightbane"],
    -- Gruul's Lair
    [649] = ILM.L["High King Maulgar"],
    [650] = ILM.L["Gruul the Dragonkiller"],
    -- Magtheridon
    [651] = ILM.L["Magtheridon"],
    -- Serpentshrine Cavern
    [623] = ILM.L["Hydross the Unstable"],
    [624] = ILM.L["The Lurker Below"],
    [625] = ILM.L["Leotheras the Blind"],
    [626] = ILM.L["Fathom-Lord Karathress"],
    [627] = ILM.L["Morogrim Tidewalker"],
    [628] = ILM.L["Lady Vashj"],
    -- Tempest Keep
    [730] = ILM.L["Al'ar"],
    [731] = ILM.L["Void Reaver"],
    [732] = ILM.L["High Astromancer Solarian"],
    [733] = ILM.L["Kael'thas Sunstrider"],
    -- Black Temple
    [601] = ILM.L["High Warlord Naj'entus"],
    [602] = ILM.L["Supremus"],
    [603] = ILM.L["Shade of Akama"],
    [604] = ILM.L["Teron Gorefiend"],
    [605] = ILM.L["Gurtogg Bloodboil"],
    [606] = ILM.L["Reliquary of Souls"],
    [607] = ILM.L["Mother Shahraz"],
    [608] = ILM.L["The Illidari Council"],
    [609] = ILM.L["Illidan Stormrage"],
    -- Hyjal Summit
    [618] = ILM.L["Rage Winterchill"],
    [619] = ILM.L["Anetheron"],
    [620] = ILM.L["Kaz'rogal"],
    [621] = ILM.L["Azgalor"],
    [622] = ILM.L["Archimonde"],
    -- Zul'Aman
    [1189] = ILM.L["Akil'zon"],
    [1190] = ILM.L["Nalorakk"],
    [1191] = ILM.L["Jan'alai"],
    [1192] = ILM.L["Halazzi"],
    [1193] = ILM.L["Hex Lord Malacrass"],
    [1194] = ILM.L["Zul'jin"],
    -- Sunwell Plateau
    [724] = ILM.L["Kalecgos"],
    [725] = ILM.L["Brutallus"],
    [726] = ILM.L["Felmyst"],
    [727] = ILM.L["Eredar Twins"],
    [728] = ILM.L["M'uru"],
    [729] = ILM.L["Kil'jaeden"],
}

ILM.EncounterHasHardMode = {}

ILM.EncounterIDs = {}
