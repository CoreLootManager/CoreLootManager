local _, CLM = ...

CLM.DifficultyID = {}

CLM.DifficultyID.NONE       = -1
CLM.DifficultyID.P10        = 3
CLM.DifficultyID.P25        = 4

CLM.DifficultyIDsMap = {
    [CLM.DifficultyID.NONE]         = "Fake", -- Trick for handling easily not-supported encounter ids
    [CLM.DifficultyID.P10]	        = CLM.L["10 Player"],
    [CLM.DifficultyID.P25]	        = CLM.L["25 Player"],
}

CLM.EncounterIDsMap = {
    -- TBC
    -- ZG (level 60 raids available in TBC)
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
    -- AQ20
    [718] = CLM.L["Kurinnaxx"],
    [719] = CLM.L["General Rajaxx"],
    [720] = CLM.L["Moam"],
    [721] = CLM.L["Buru the Gorger"],
    [722] = CLM.L["Ayamiss the Hunter"],
    [723] = CLM.L["Ossirian the Unscarred"],
    -- Karazhan
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
    -- Gruul's Lair
    [649] = CLM.L["High King Maulgar"],
    [650] = CLM.L["Gruul the Dragonkiller"],
    -- Magtheridon
    [651] = CLM.L["Magtheridon"],
    -- Serpentshrine Cavern
    [623] = CLM.L["Hydross the Unstable"],
    [624] = CLM.L["The Lurker Below"],
    [625] = CLM.L["Leotheras the Blind"],
    [626] = CLM.L["Fathom-Lord Karathress"],
    [627] = CLM.L["Morogrim Tidewalker"],
    [628] = CLM.L["Lady Vashj"],
    -- Tempest Keep
    [730] = CLM.L["Al'ar"],
    [731] = CLM.L["Void Reaver"],
    [732] = CLM.L["High Astromancer Solarian"],
    [733] = CLM.L["Kael'thas Sunstrider"],
    -- Black Temple
    [601] = CLM.L["High Warlord Naj'entus"],
    [602] = CLM.L["Supremus"],
    [603] = CLM.L["Shade of Akama"],
    [604] = CLM.L["Teron Gorefiend"],
    [605] = CLM.L["Gurtogg Bloodboil"],
    [606] = CLM.L["Reliquary of Souls"],
    [607] = CLM.L["Mother Shahraz"],
    [608] = CLM.L["The Illidari Council"],
    [609] = CLM.L["Illidan Stormrage"],
    -- Hyjal Summit
    [618] = CLM.L["Rage Winterchill"],
    [619] = CLM.L["Anetheron"],
    [620] = CLM.L["Kaz'rogal"],
    [621] = CLM.L["Azgalor"],
    [622] = CLM.L["Archimonde"],
    -- Zul'Aman
    [1189] = CLM.L["Akil'zon"],
    [1190] = CLM.L["Nalorakk"],
    [1191] = CLM.L["Jan'alai"],
    [1192] = CLM.L["Halazzi"],
    [1193] = CLM.L["Hex Lord Malacrass"],
    [1194] = CLM.L["Zul'jin"],
    -- Sunwell Plateau
    [724] = CLM.L["Kalecgos"],
    [725] = CLM.L["Brutallus"],
    [726] = CLM.L["Felmyst"],
    [727] = CLM.L["Eredar Twins"],
    [728] = CLM.L["M'uru"],
    [729] = CLM.L["Kil'jaeden"],
}

CLM.EncounterHasHardMode = {}

CLM.EncounterIDs = {}
