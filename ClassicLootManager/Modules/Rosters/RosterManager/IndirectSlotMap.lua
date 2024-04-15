local _, CLM = ...
local IndirectMap = {
    slot = {
        -- -- --
        -- P1 --
        -- -- --
        -- Heroic Key to the Focusing Iris
        [44577] = "INVTYPE_NECK",

        -- Helm of the Lost Vanquisher
        [40618] = "INVTYPE_HEAD",
        -- Chestguard of the Lost Vanquisher
        [40612] = "INVTYPE_CHEST",
        -- Leggings of the Lost Vanquisher
        [40621] = "INVTYPE_LEGS",
        -- Spaulders of the Lost Vanquisher
        [40624] = "INVTYPE_SHOULDER",
        -- Gloves of the Lost Vanquisher
        [40615] = "INVTYPE_HAND",

        -- Helm of the Lost Conqueror
        [40616] = "INVTYPE_HEAD",
        -- Chestguard of the Lost Conqueror
        [40610] = "INVTYPE_CHEST",
        -- Leggings of the Lost Conqueror
        [40619] = "INVTYPE_LEGS",
        -- Spaulders of the Lost Conqueror
        [40622] = "INVTYPE_SHOULDER",
        -- Gloves of the Lost Conqueror
        [40613] = "INVTYPE_HAND",

        -- Helm of the Lost Protector
        [40617] = "INVTYPE_HEAD",
        -- Chestguard of the Lost Protector
        [40611] = "INVTYPE_CHEST",
        -- Leggings of the Lost Protector
        [40620] = "INVTYPE_LEGS",
        -- Spaulders of the Lost Protector
        [40623] = "INVTYPE_SHOULDER",
        -- Gloves of the Lost Protector
        [40614] = "INVTYPE_HAND",

        -- Gauntlets of the Lost Vanquisher
        [40630] = "INVTYPE_HAND",
        -- Crown of the Lost Vanquisher
        [40633] = "INVTYPE_HEAD",
        -- Legplates of the Lost Vanquisher
        [40636] = "INVTYPE_LEGS",
        -- Breastplate of the Lost Vanquisher
        [40627] = "INVTYPE_CHEST",
        -- Mantle of the Lost Vanquisher
        [40639] = "INVTYPE_SHOULDER",

        -- Gauntlets of the Lost Conqueror
        [40628] = "INVTYPE_HAND",
        -- Crown of the Lost Conqueror
        [40631] = "INVTYPE_HEAD",
        -- Legplates of the Lost Conqueror
        [40634] = "INVTYPE_LEGS",
        -- Breastplate of the Lost Conqueror
        [40625] = "INVTYPE_CHEST",
        -- Mantle of the Lost Conqueror
        [40637] = "INVTYPE_SHOULDER",

        -- Breastplate of the Lost Protector
        [40626] = "INVTYPE_CHEST",
        -- Gauntlets of the Lost Protector
        [40629] = "INVTYPE_HAND",
        -- Crown of the Lost Protector
        [40632] = "INVTYPE_HEAD",
        -- Legplates of the Lost Protector
        [40635] = "INVTYPE_LEGS",
        -- Mantle of the Lost Protector
        [40638] = "INVTYPE_SHOULDER",

        -- -- --
        -- P2 --
        -- -- --
        -- Chestguard of the Wayward Vanquisher
        [45637] = "INVTYPE_CHEST",
        -- Helm of the Wayward Vanquisher
        [45649] = "INVTYPE_HEAD",
        -- Gloves of the Wayward Vanquisher
        [45646] = "INVTYPE_HAND",
        -- Leggings of the Wayward Vanquisher
        [45652] = "INVTYPE_LEGS",
        -- Spaulders of the Wayward Vanquisher
        [45661] = "INVTYPE_SHOULDER",

        -- Gloves of the Wayward Protector
        [45645] = "INVTYPE_HAND",
        -- Helm of the Wayward Protector
        [45648] = "INVTYPE_HEAD",
        -- Leggings of the Wayward Protector
        [45651] = "INVTYPE_LEGS",
        -- Spaulders of the Wayward Protector
        [45660] = "INVTYPE_SHOULDER",
        -- Chestguard of the Wayward Protector
        [45636] = "INVTYPE_CHEST",

        -- Gloves of the Wayward Conqueror
        [45644] = "INVTYPE_HAND",
        -- Leggings of the Wayward Conqueror
        [45650] = "INVTYPE_LEGS",
        -- Helm of the Wayward Conqueror
        [45647] = "INVTYPE_HEAD",
        -- Spaulders of the Wayward Conqueror
        [45659] = "INVTYPE_SHOULDER",
        -- Chestguard of the Wayward Conqueror
        [45635] = "INVTYPE_CHEST",

        -- Breastplate of the Wayward Vanquisher
        [45634] = "INVTYPE_CHEST",
        -- Gauntlets of the Wayward Vanquisher
        [45643] = "INVTYPE_HAND",
        -- Crown of the Wayward Vanquisher
        [45640] = "INVTYPE_HEAD",
        -- Legplates of the Wayward Vanquisher
        [45655] = "INVTYPE_LEGS",
        -- Mantle of the Wayward Vanquisher
        [45658] = "INVTYPE_SHOULDER",

        -- Gauntlets of the Wayward Conqueror
        [45641] = "INVTYPE_HAND",
        -- Mantle of the Wayward Conqueror
        [45656] = "INVTYPE_SHOULDER",
        -- Breastplate of the Wayward Conqueror
        [45632] = "INVTYPE_CHEST",
        -- Legplates of the Wayward Conqueror
        [45653] = "INVTYPE_LEGS",
        -- Crown of the Wayward Conqueror
        [45638] = "INVTYPE_HEAD",

        -- Breastplate of the Wayward Protector
        [45633] = "INVTYPE_CHEST",
        -- Gauntlets of the Wayward Protector
        [45642] = "INVTYPE_HAND",
        -- Crown of the Wayward Protector
        [45639] = "INVTYPE_HEAD",
        -- Legplates of the Wayward Protector
        [45654] = "INVTYPE_LEGS",
        -- Mantle of the Wayward Protector
        [45657] = "INVTYPE_SHOULDER",

        -- -- --
        -- P3 --
        -- -- --
        -- Trophy of the Crusade
        [47242] = "INVTYPE_NON_EQUIP",
        -- Regalia of the Grand Conqueror
        [47557] = "INVTYPE_NON_EQUIP",
        -- Regalia of the Grand Protector
        [47558] = "INVTYPE_NON_EQUIP",
        -- Regalia of the Grand Vanquisher
        [47559] = "INVTYPE_NON_EQUIP",

        -- -- --
        -- P3 --
        -- -- --
        -- Vanquisher's Mark of Sanctification
        [52025] = "INVTYPE_NON_EQUIP",
        -- Protector's Mark of Sanctification
        [52026] = "INVTYPE_NON_EQUIP",
        -- Conqueror's Mark of Sanctification
        [52027] = "INVTYPE_NON_EQUIP",
        -- Vanquisher's Mark of Sanctification (Heroic)
        [52028] = "INVTYPE_NON_EQUIP",
        -- Protector's Mark of Sanctification (Heroic)
        [52029] = "INVTYPE_NON_EQUIP",
        -- Conqueror's Mark of Sanctification (Heroic)
        [52030] = "INVTYPE_NON_EQUIP",

        -----------
        --- SOD ---
        -----------
        -- Atal'ai Blood Icon
        [220636] = "INVTYPE_NON_EQUIP",
        -- Atal'ai Ritual Token
        [220637] = "INVTYPE_NON_EQUIP",
    },
    ilvl = {
        -- -- --
        -- P1 --
        -- -- --
        -- Heroic Key to the Focusing Iris
        [44577] = 226,

        -- Helm of the Lost Vanquisher
        [40618] = 200,
        -- Chestguard of the Lost Vanquisher
        [40612] = 200,
        -- Leggings of the Lost Vanquisher
        [40621] = 200,
        -- Spaulders of the Lost Vanquisher
        [40624] = 200,
        -- Gloves of the Lost Vanquisher
        [40615] = 200,

        -- Helm of the Lost Conqueror
        [40616] = 200,
        -- Chestguard of the Lost Conqueror
        [40610] = 200,
        -- Leggings of the Lost Conqueror
        [40619] = 200,
        -- Spaulders of the Lost Conqueror
        [40622] = 200,
        -- Gloves of the Lost Conqueror
        [40613] = 200,

        -- Helm of the Lost Protector
        [40617] = 200,
        -- Chestguard of the Lost Protector
        [40611] = 200,
        -- Leggings of the Lost Protector
        [40620] = 200,
        -- Spaulders of the Lost Protector
        [40623] = 200,
        -- Gloves of the Lost Protector
        [40614] = 200,

        -- Gauntlets of the Lost Vanquisher
        [40630] = 213,
        -- Crown of the Lost Vanquisher
        [40633] = 213,
        -- Legplates of the Lost Vanquisher
        [40636] = 213,
        -- Breastplate of the Lost Vanquisher
        [40627] = 213,
        -- Mantle of the Lost Vanquisher
        [40639] = 213,

        -- Gauntlets of the Lost Conqueror
        [40628] = 213,
        -- Crown of the Lost Conqueror
        [40631] = 213,
        -- Legplates of the Lost Conqueror
        [40634] = 213,
        -- Breastplate of the Lost Conqueror
        [40625] = 213,
        -- Mantle of the Lost Conqueror
        [40637] = 213,

        -- Breastplate of the Lost Protector
        [40626] = 213,
        -- Gauntlets of the Lost Protector
        [40629] = 213,
        -- Crown of the Lost Protector
        [40632] = 213,
        -- Legplates of the Lost Protector
        [40635] = 213,
        -- Mantle of the Lost Protector
        [40638] = 213,

        -- -- --
        -- P2 --
        -- -- --
        -- Chestguard of the Wayward Vanquisher
        [45637] = 225,
        -- Helm of the Wayward Vanquisher
        [45649] = 225,
        -- Gloves of the Wayward Vanquisher
        [45646] = 225,
        -- Leggings of the Wayward Vanquisher
        [45652] = 225,
        -- Spaulders of the Wayward Vanquisher
        [45661] = 225,

        -- Gloves of the Wayward Protector
        [45645] = 225,
        -- Helm of the Wayward Protector
        [45648] = 225,
        -- Leggings of the Wayward Protector
        [45651] = 225,
        -- Spaulders of the Wayward Protector
        [45660] = 225,
        -- Chestguard of the Wayward Protector
        [45636] = 225,

        -- Gloves of the Wayward Conqueror
        [45644] = 225,
        -- Leggings of the Wayward Conqueror
        [45650] = 225,
        -- Helm of the Wayward Conqueror
        [45647] = 225,
        -- Spaulders of the Wayward Conqueror
        [45659] = 225,
        -- Chestguard of the Wayward Conqueror
        [45635] = 225,

        -- Breastplate of the Wayward Vanquisher
        [45634] = 232,
        -- Gauntlets of the Wayward Vanquisher
        [45643] = 232,
        -- Crown of the Wayward Vanquisher
        [45640] = 232,
        -- Legplates of the Wayward Vanquisher
        [45655] = 232,
        -- Mantle of the Wayward Vanquisher
        [45658] = 232,

        -- Gauntlets of the Wayward Conqueror
        [45641] = 232,
        -- Mantle of the Wayward Conqueror
        [45656] = 232,
        -- Breastplate of the Wayward Conqueror
        [45632] = 232,
        -- Legplates of the Wayward Conqueror
        [45653] = 232,
        -- Crown of the Wayward Conqueror
        [45638] = 232,

        -- Breastplate of the Wayward Protector
        [45633] = 232,
        -- Gauntlets of the Wayward Protector
        [45642] = 232,
        -- Crown of the Wayward Protector
        [45639] = 232,
        -- Legplates of the Wayward Protector
        [45654] = 232,
        -- Mantle of the Wayward Protector
        [45657] = 232,

        -- -- --
        -- P3 --
        -- -- --
        -- Trophy of the Crusade
        [47242] = 245,
        -- Regalia of the Grand Conqueror
        [47557] = 258,
        -- Regalia of the Grand Protector
        [47558] = 258,
        -- Regalia of the Grand Vanquisher
        [47559] = 258,

        -- -- --
        -- P4 --
        -- -- --
        -- Vanquisher's Mark of Sanctification
        [52025] = 264,
        -- Protector's Mark of Sanctification
        [52026] = 264,
        -- Conqueror's Mark of Sanctification
        [52027] = 264,
        -- Vanquisher's Mark of Sanctification (Heroic)
        [52028] = 277,
        -- Protector's Mark of Sanctification (Heroic)
        [52029] = 277,
        -- Conqueror's Mark of Sanctification (Heroic)
        [52030] = 277,

        -----------
        --- SOD ---
        -----------
        -- Atal'ai Blood Icon
        [220636] = 55,
        -- Atal'ai Ritual Token
        [220637] = 55,
    }
}
CLM.IndirectMap = IndirectMap