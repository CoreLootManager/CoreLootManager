local _, CLM = ...
CLM.EncounterIDs = {}
CLM.EncounterIDs.TBC = {
    -- -- MC
    -- { id = 663, name = "" },
    -- { id = 664, name = "" },
    -- { id = 665, name = "" },
    -- { id = 666, name = "" },
    -- { id = 668, name = "" },
    -- { id = 667, name = "" },
    -- { id = 669, name = "" },
    -- { id = 670, name = "" },
    -- { id = 671, name = "" },
    -- { id = 672, name = "" },
    -- -- BWL
    -- { id = 610, name = "" },
    -- { id = 611, name = "" },
    -- { id = 612, name = "" },
    -- { id = 613, name = "" },
    -- { id = 614, name = "" },
    -- { id = 615, name = "" },
    -- { id = 616, name = "" },
    -- { id = 617, name = "" },
    -- -- AQ40
    -- { id = 709, name = "" },
    -- { id = 711, name = "" },
    -- { id = 712, name = "" },
    -- { id = 714, name = "" },
    -- { id = 715, name = "" },
    -- { id = 717, name = "" },
    -- { id = 710, name = "" },
    -- { id = 713, name = "" },
    -- { id = 716, name = "" },
    -- -- Naxx
    -- { id = 1107, name = "" },
    -- { id = 1110, name = "" },
    -- { id = 1116, name = "" },
    -- { id = 1117, name = "" },
    -- { id = 1112, name = "" },
    -- { id = 1115, name = "" },
    -- { id = 1113, name = "" },
    -- { id = 1109, name = "" },
    -- { id = 1121, name = "" },
    -- { id = 1118, name = "" },
    -- { id = 1111, name = "" },
    -- { id = 1108, name = "" },
    -- { id = 1120, name = "" },
    -- { id = 1119, name = "" },
    -- { id = 1114, name = "" },
    -- -- ZG
    -- { id = 787, name = "" },
    -- { id = 790, name = "" },
    -- { id = 793, name = "" },
    -- { id = 789, name = "" },
    -- { id = 784, name = "" },
    -- { id = 791, name = "" },
    -- { id = 785, name = "" },
    -- { id = 792, name = "" },
    -- { id = 786, name = "" },
    -- { id = 788, name = "" },
    -- -- AQ20
    -- { id = 722, name = "" },
    -- { id = 721, name = "" },
    -- { id = 719, name = "" },
    -- { id = 718, name = "" },
    -- { id = 720, name = "" },
    -- { id = 723, name = "" },
    -- -- Onyxia
	-- { id = 1084, order =  1, name = "" },
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