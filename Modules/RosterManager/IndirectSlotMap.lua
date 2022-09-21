local _, CLM = ...
local IndirectMap = {
    slot = {
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
    },
    ilvl = {
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

        -- Chestguard of the Wayward Vanquisher
        [45637] = 219,
        -- Helm of the Wayward Vanquisher
        [45649] = 219,
        -- Gloves of the Wayward Vanquisher
        [45646] = 219,
        -- Leggings of the Wayward Vanquisher
        [45652] = 219,
        -- Spaulders of the Wayward Vanquisher
        [45661] = 219,

        -- Gloves of the Wayward Protector
        [45645] = 219,
        -- Helm of the Wayward Protector
        [45648] = 219,
        -- Leggings of the Wayward Protector
        [45651] = 219,
        -- Spaulders of the Wayward Protector
        [45660] = 219,
        -- Chestguard of the Wayward Protector
        [45636] = 219,

        -- Gloves of the Wayward Conqueror
        [45644] = 219,
        -- Leggings of the Wayward Conqueror
        [45650] = 219,
        -- Helm of the Wayward Conqueror
        [45647] = 219,
        -- Spaulders of the Wayward Conqueror
        [45659] = 219,
        -- Chestguard of the Wayward Conqueror
        [45635] = 219,

        -- Breastplate of the Wayward Vanquisher
        [45634] = 226,
        -- Gauntlets of the Wayward Vanquisher
        [45643] = 226,
        -- Crown of the Wayward Vanquisher
        [45640] = 226,
        -- Legplates of the Wayward Vanquisher
        [45655] = 226,
        -- Mantle of the Wayward Vanquisher
        [45658] = 226,

        -- Gauntlets of the Wayward Conqueror
        [45641] = 226,
        -- Mantle of the Wayward Conqueror
        [45656] = 226,
        -- Breastplate of the Wayward Conqueror
        [45632] = 226,
        -- Legplates of the Wayward Conqueror
        [45653] = 226,
        -- Crown of the Wayward Conqueror
        [45638] = 226,

        -- Breastplate of the Wayward Protector
        [45633] = 226,
        -- Gauntlets of the Wayward Protector
        [45642] = 226,
        -- Crown of the Wayward Protector
        [45639] = 226,
        -- Legplates of the Wayward Protector
        [45654] = 226,
        -- Mantle of the Wayward Protector
        [45657] = 226,
    }
}
CLM.IndirectMap = IndirectMap