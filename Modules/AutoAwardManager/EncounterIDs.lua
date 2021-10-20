local _, CLM = ...
CLM.EncounterIDs = {}
CLM.EncounterIDs.Classic = {
    -- Onyxia
    {
        name = "Onyxia's Lair",
        data = {
	        { id = 1084, order =  1, name = "Onyxia" },
        },
    },
    -- MC
    {
        name = "Molten Core",
        data = {
            { id = 663, name = "Lucifron" },
            { id = 664, name = "Magmadar" },
            { id = 665, name = "Gehennas" },
            { id = 666, name = "Garr" },
            { id = 668, name = "Baron Geddon" },
            { id = 667, name = "Shazzrah" },
            { id = 669, name = "Sulfuron Harbinger" },
            { id = 670, name = "Golemagg the Incinerator" },
            { id = 671, name = "Majordomo Executus" },
            { id = 672, name = "Ragnaros" },
        },
    },
    -- BWL
    {
        name = "Blackwing Lair",
        data = {
            { id = 610, name = "Razorgore the Untamed" },
            { id = 611, name = "Vaelastrasz the Corrupt" },
            { id = 612, name = "Broodlord Lashlayer" },
            { id = 613, name = "Firemaw" },
            { id = 614, name = "Ebonroc" },
            { id = 615, name = "Flamegor" },
            { id = 616, name = "Chromaggus" },
            { id = 617, name = "Nefarian" },
        },
    },
    -- AQ40
    {
        name = "Temple of Ahn'Qiraj",
        data = {
            { id = 709, name = "The Prophet Skeram" },
            { id = 710, name = "Silithid Royalty" },
            { id = 711, name = "Battleguard Sartura" },
            { id = 712, name = "Fankriss the Unyielding" },
            { id = 713, name = "Viscidus" },
            { id = 714, name = "Princess Huhuran" },
            { id = 715, name = "Twin Emperors" },
            { id = 716, name = "Ouro" },
            { id = 717, name = "C'Thun" },
        },
    },
    -- Naxx
    {
        name = "Naxxramas",
        data = {
            { id = 1107, name = "Anub'Rekhan" },
            { id = 1110, name = "Grand Widow Faerlina" },
            { id = 1116, name = "Maexxna" },
            { id = 1118, name = "Patchwerk" },
            { id = 1111, name = "Grobbulus" },
            { id = 1108, name = "Gluth" },
            { id = 1120, name = "Thaddius" },
            { id = 1117, name = "Noth the Plaguebringer" },
            { id = 1112, name = "Heigan the Unclean" },
            { id = 1115, name = "Loatheb" },
            { id = 1113, name = "Instructor Razuvious" },
            { id = 1109, name = "Gothik the Harvester" },
            { id = 1121, name = "The Four Horsemen" },
            { id = 1119, name = "Sapphiron" },
            { id = 1114, name = "Kel'Thuzad" },
        },
    },
    -- ZG
    {
        name = "Zul'Gurub",
        data = {
            { id = 789, name = "High Priest Thekal" },
            { id = 784, name = "High Priest Venoxis" },
            { id = 791, name = "High Priestess Arlokk" },
            { id = 785, name = "High Priestess Jeklik" },
            { id = 786, name = "High Priestess Mar'li" },
            { id = 787, name = "Bloodlord Mandokir" },
            { id = 792, name = "Jin'do the Hexxer" },
            { id = 793, name = "Hakkar" },
            { id = 788, name = "Edge of Madness" },
            { id = 790, name = "Gahz'ranka" },
        },
    },
    -- AQ20
    {
        name = "Ruins of Ahn'Qiraj",
        data = {
            { id = 718, name = "Kurinnaxx" },
            { id = 719, name = "General Rajaxx" },
            { id = 720, name = "Moam" },
            { id = 721, name = "Buru the Gorger" },
            { id = 722, name = "Ayamiss the Hunter" },
            { id = 723, name = "Ossirian the Unscarred" },
        },
    },
}

CLM.EncounterIDs.TBC = {
    -- Karazhan
    {
        name = "Karazhan",
        data = {
            { id = 652, name = "Attumen the Huntsman" }, -- "Attumen the Huntsman",
            { id = 653, name = "Moroes" }, -- "Moroes",
            { id = 654, name = "Maiden of Virtue" }, -- "Maiden of Virtue",
            { id = 655, name = "Opera Hall" }, -- "Opera Hall",
            { id = 656, name = "The Curator" }, -- "The Curator",
            { id = 657, name = "Terestian Illhoof" }, -- "Terestian Illhoof",
            { id = 658, name = "Shade of Aran" }, -- "Shade of Aran",
            { id = 659, name = "Netherspite" }, -- "Netherspite",
            { id = 660, name = "Chess Event" }, -- "Chess Event",
            { id = 661, name = "Prince Malchezaar" }, -- "Prince Malchezaar",
            { id = 662, name = "Nightbane" }, -- "Nightbane"
        }
    },
    -- Gruul's Lair
    {
        name = "Gruul's Lair",
        data = {
            { id = 649, name = "High King Maulgar" }, -- "High King Maulgar",
            { id = 650, name = "Gruul the Dragonkiller" }, -- "Gruul the Dragonkiller"
        }
    },
    --  Magtheridon
    {
        name = "Magtheridon",
        data = {
            { id = 651, name = "Magtheridon" }, -- "Magtheridon"
        }
    },
    -- SSC
    {
        name = "Serpentshrine Cavern",
        data = {
            { id = 623, name = "Hydross the Unstable" }, -- "Hydross the Unstable",
            { id = 624, name = "The Lurker Below" }, -- "The Lurker Below",
            { id = 625, name = "Leotheras the Blind" }, -- "Leotheras the Blind",
            { id = 626, name = "Fathom-Lord Karathress" }, -- "Fathom-Lord Karathress",
            { id = 627, name = "Morogrim Tidewalker" }, -- "Morogrim Tidewalker",
            { id = 628, name = "Lady Vashj" }, -- "Lady Vashj"
        }
    },
    -- TK
    {
        name = "Tempest Keep",
        data = {
            { id = 730, name = "Al'ar" }, -- "Al'ar",
            { id = 731, name = "Void Reaver" }, -- "Void Reaver",
            { id = 732, name = "High Astromancer Solarian" }, -- "High Astromancer Solarian",
            { id = 733, name = "Kael'thas Sunstrider" }, -- "Kael'thas Sunstrider"
        }
    },
    -- Black Temple
    {
        name = "Black Temple",
        data = {
            { id = 601, name = "High Warlord Naj'entus" }, -- High Warlord Naj'entus,
            { id = 602, name = "Supremus" }, -- Supremus
            { id = 603, name = "Shade of Akama" }, -- Shade of Akama
            { id = 604, name = "Teron Gorefiend" }, -- Teron Gorefiend,
            { id = 605, name = "Gurtogg Bloodboil" }, -- Gurtogg Bloodboil
            { id = 606, name = "Reliquary of Souls" }, -- Reliquary of Souls
            { id = 607, name = "Mother Shahraz" }, -- Mother Shahraz
            { id = 608, name = "The Illidari Council" }, -- The Illidari Council
            { id = 609, name = "Illidan Stormrage" }, -- Illidan Stormrage
        }
    },
    -- Hyjal Summit
    {
        name = "Hyjal Summit",
        data = {
            { id = 618, name = "Rage Winterchill" }, -- High Warlord Naj'entus,
            { id = 619, name = "Anetheron" }, -- Supremus
            { id = 620, name = "Kaz'rogal" }, -- Shade of Akama
            { id = 621, name = "Azgalor" }, -- Teron Gorefiend,
            { id = 622, name = "Archimonde" }, -- Gurtogg Bloodboil
        }
    },
    -- Zul'Aman
    {
        name = "Zul'Aman",
        data = {
            { id = 1189, name = "Akil'zon" }, -- "Akil'zon"
            { id = 1190, name = "Nalorakk" }, -- Nalorakk
            { id = 1191, name = "Jan'alai" }, -- Jan'alai
            { id = 1192, name = "Halazzi" }, -- Halazzi,
            { id = 1193, name = "Hex Lord Malacrass" }, -- Hex Lord Malacrass
            { id = 1194, name = "Daakara" }, -- Daakara
        }
    },
    -- Sunwell
    {
        name = "Sunwell Plateau",
        data = {
            { id = 724, name = "Kalecgos" }, -- "Kalecgos",
            { id = 725, name = "Brutallus" }, -- "Brutallus",
            { id = 726, name = "Felmyst" }, -- "Felmyst",
            { id = 727, name = "Eredar Twins" }, -- "Eredar Twins",
            { id = 728, name = "M'uru" }, -- "M'uru",
            { id = 729, name = "Kil'jaeden" } -- "Kil'jaeden"
        }
    }
}