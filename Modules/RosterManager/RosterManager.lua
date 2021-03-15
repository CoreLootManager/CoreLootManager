local _, CLM = ...

-- Local upvalues
local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODULE = CLM.MODULE


local Roster = { } -- Roster information
local RosterConfiguration = { } -- Roster Configuration
local RosterManager = { } -- Roster Manager Module

local function GenerateName()
    local prefix = CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX[math.random(0, #CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX - 1)]
    local suffix = CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX[math.random(0, #CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX - 1)]
    return prefix:sub(1,1):upper()..prefix:sub(2).. " " .. suffix:sub(1,1):upper()..suffix:sub(2)
end

-- Controller Roster Manger
function RosterManager:Initialize()
    LOG:Info("RosterManager:Initialize()")
    -- Initialize DB
    self.db = MODULE.Database:Roster()
    if type(self.db.metadata) ~= "table" then
        self.db.metadata = {
            next_roster_uid = 0
        }
    end

    if type(self.db.rosters) ~= "table" then
        self.db.rosters = {}
    end
    -- Initialize Cache
    self.cache = {
        rostersUidMap = {},
        rosters = {}
    }

    self:LoadCache()
end

function RosterManager:LoadCache()
    LOG:Info("RosterManager:LoadCache()")
    local max_uid = 0
    for name, _ in pairs(self.db.rosters) do
        local roster = Roster:Restore(self.db.rosters[name])
        local uid = roster:UID()
        -- Duplication issue check
        if self.cache.rosters[uid] ~= nil then
            LOG:Fatal("Duplicate roster uid: " .. uid .. ".  Please report this issue to authors and attach SavedVariable file.")
        end

        -- Restore Roster
        self.cache.rosters[name] = roster
        self.cache.rostersUidMap[uid] = name

        -- Contol uid
        if uid > max_uid then
            max_uid = uid
        end
    end
    -- Update uid in case it is needed
    if max_uid >= self.db.metadata.next_roster_uid then
        self.db.metadata.next_roster_uid = max_uid + 1
    end
end

function RosterManager:GetRosters()
    return self.cache.rosters
end

function RosterManager:GetRosterByName(name)
    return self.cache.rosters[name]
end

function RosterManager:NewRoster()
    LOG:Info("RosterManager:NewRoster()")

    local name = GenerateName()
    while self.db.rosters[name] ~= nil do
        name = GenerateName()
    end

    self.db.rosters[name] = {}
    local roster = Roster:New(self.db.rosters[name], self.db.metadata.next_roster_uid)
    self.cache.rosters[name] = roster
    self.cache.rostersUidMap[self.db.metadata.next_roster_uid] = name

    self.db.metadata.next_roster_uid = self.db.metadata.next_roster_uid + 1
end

function RosterManager:DeleteRosterByName(name)
    LOG:Info("RosterManager:DeleteRosterByName()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return end
    self.cache.rostersUidMap[roster:UID()] = nil
    self.cache.rosters[name] = nil
    self.db.rosters[name] = nil
    -- Remove from options
end

function RosterManager:RenameRoster(old, new)
    LOG:Info("RosterManager:RenameRoster()")
    local o = RosterManager:GetRosterByName(old)
    if o == nil then return end
    local n = RosterManager:GetRosterByName(new)
    if n ~= nil then return end

    self.db.rosters[new] = self.db.rosters[old]
    self.cache.rosters[new] = self.cache.rosters[old]
    self.cache.rostersUidMap[self.cache.rosters[new]:UID()] = new

    self:DeleteRosterByName(old)
end

-- Model
function Roster:New(storage, uid)
    local o = UTILS.NewStorageQualifiedObject(storage, self)

    o.persistent.uid  = tonumber(uid)
    o.persistent.description = ""
    o.persistent.configuration  = RosterConfiguration:New()
    o.persistent.profiles = {}
    o.persistent.defaultSlotValues = {}
    o.persistent.itemValueOverrides = {}

    return o
end

function Roster:Restore(storage)
    local o = UTILS.NewStorageQualifiedObject(storage, self)
    o.persistent.configuration = RosterConfiguration:New(o.persistent.configuration)
    return o
end

function Roster:AddProfileByGUID(GUID)
    self.persistent.profiles[GUID] = true
end

function Roster:RemoveProfileByGUID(GUID)
    self.persistent.profiles[GUID] = nil
end

function Roster:IsProfileInRoster(GUID)
    return self.persistent.profiles[GUID]
end

function Roster:UID()
    return self.persistent.uid
end

function Roster:Description(description)
    if type(description) == "string" then
        self.persistent.description = description
    end
    return self.persistent.description
end

function Roster:SetDefaultSlotValue(itemEquipLoc, minimum, maximum)
    self.persistent.defaultSlotValues[itemEquipLoc] = { 
        min = tonumber(minimum) or 0, 
        max = tonumber(maximum) or 0
    }
end

function Roster:GetDefaultSlotValue(itemEquipLoc)
    local s = self.persistent.defaultSlotValues[itemEquipLoc]
    return s or {min = 0, max = 0}
end

function Roster:OverrideItemValue(itemId, itemName, minimum, maximum)
    self.persistent.itemValueOverrides[itemId] = {
        name = itemName or "",
        min = tonumber(minimum) or 0,
        max = tonumber(maximum) or 0
    }
end

function Roster:GetItemValue(itemId)
    local itemValue = self.persistent.itemValueOverrides[itemId]
    if itemValue == nil then
        _, _, _, itemEquipLoc = GetItemInfoInstant(itemId)
        local minimum, maximum = self:GetDefaultSlotValue(itemEquipLoc)
        itemValue = { name = "", min = minimum, max = maximum }
    end
    return itemValue
end

function Roster:GetConfiguration(option)
    return self.persistent.configuration:Get(option)
end

function Roster:SetConfiguration(option, value)
    self.persistent.configuration:Set(option, value)
end

-- Configuration
function RosterConfiguration:New(i)
    local o = i or {}

    setmetatable(o, self)
    self.__index = self

    if i then return o end

    -- Point type: DKP / EPGP
    o.pointType = CONSTANTS.POINT_TYPE.DKP
    -- Auction type: Open / Sealed / Vickrey
    o.auctionType = CONSTANTS.AUCTION_TYPE.SEALED
    -- Item Value mode: Single-Priced / Ascending
    o.itemValueMode = CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED
    -- Zero-Sum Bank
    o.zeroSumBank = false
    -- Allow negative standings
    o.allowNegativeStandings = false
    -- Allow negative bidders
    o.allowNegativeBidders = false
    -- Simultaneous Auctions
    o.simultaneousAuctions = false
    -- Default Item Values
    return o
end

function RosterConfiguration:Get(option)
    if option ~= nil then
        return self[option]
    end
    return nil
end

function RosterConfiguration:Set(option, value)
    if option == nil then return end
    if self[option] ~= nil then
        if self:Validate(option, value) then
            print("setting ".. tostring(option) .. " to " .. tostring(value))
            self[option] = value
        end
    end
end

function RosterConfiguration:Validate(option, value)
    if type(self[callback]) == "function" then
        return self[callback](value)
    end

    return true -- TODO: true or false?
end

local function IsBoolean(value) return type(value) == "boolean" end
function RosterConfiguration:_validate_pointType(value) return CONSTANTS.POINT_TYPES[value] ~= nil end
function RosterConfiguration:_validate_auctionType(value) return CONSTANTS.AUCTION_TYPES[value] ~= nil end
function RosterConfiguration:_validate_itemValueMode(value) return CONSTANTS.ITEM_VALUE_MODES[value] ~= nil end
function RosterConfiguration:_validate_zeroSumBank(value) return IsBoolean(value) end
function RosterConfiguration:_validate_allowNegativeStandings(value) return IsBoolean(value) end
function RosterConfiguration:_validate_allowNegativeBidders(value) return IsBoolean(value) end
function RosterConfiguration:_validate_simultaneousAuctions(value) return IsBoolean(value) end

-- -- Publish API
MODULE.RosterManager = RosterManager

-- Constants
CONSTANTS.POINT_TYPES = {
    0, -- DKP
    1  -- EPGP
}
CONSTANTS.POINT_TYPE = {
    DKP = 0,
    EPGP = 1
}
CONSTANTS.AUCTION_TYPES = {
    0, -- OPEN
    1, -- SEALED
    2  -- VICKREY
}

CONSTANTS.AUCTION_TYPE = {
    OPEN = 0,
    SEALED = 1,
    VICKREY = 2
}

CONSTANTS.ITEM_VALUE_MODES = {
    0, -- SINGLE_PRICED
    1  -- ASCENDING
}

CONSTANTS.ITEM_VALUE_MODE = {
    SINGLE_PRICED = 0,
    ASCENDING = 1
}

CONSTANTS.INVENTORY_TYPES = {
    INVTYPE_NON_EQUIP,
    INVTYPE_HEAD,
    INVTYPE_NECK,
    INVTYPE_SHOULDER,
    INVTYPE_BODY,
    INVTYPE_CHEST,
    INVTYPE_WAIST,
    INVTYPE_LEGS,
    INVTYPE_FEET,
    INVTYPE_WRIST,
    INVTYPE_HAND,
    INVTYPE_FINGER,
    INVTYPE_TRINKET,
    INVTYPE_WEAPON,
    INVTYPE_SHIELD,
    INVTYPE_RANGED,
    INVTYPE_CLOAK,
    INVTYPE_2HWEAPON,
    INVTYPE_BAG,
    INVTYPE_TABARD,
    INVTYPE_ROBE,
    INVTYPE_WEAPONMAINHAND,
    INVTYPE_WEAPONOFFHAND,
    INVTYPE_HOLDABLE,
    INVTYPE_AMMO,
    INVTYPE_THROWN,
    INVTYPE_RANGEDRIGHT,
    INVTYPE_QUIVER,
    INVTYPE_RELIC
}


local PAPERDOLL = "Interface\\AddOns\\ClassicLootManager\\Media\\Paperdoll\\"
CONSTANTS.INVENTORY_TYPES_SORTED = {
    { type = "INVTYPE_HEAD",            name = "Head",              icon = PAPERDOLL .. "Ui-paperdoll-slot-head.blp" },
    { type = "INVTYPE_NECK",            name = "Neck",              icon = PAPERDOLL .. "Ui-paperdoll-slot-neck.blp" },
    { type = "INVTYPE_SHOULDER",        name = "Shoulder",          icon = PAPERDOLL .. "Ui-paperdoll-slot-shoulder.blp" },
    { type = "INVTYPE_BODY",            name = "Shirt",             icon = PAPERDOLL .. "Ui-paperdoll-slot-shirt.blp" },
    { type = "INVTYPE_CLOAK",           name = "Back",              icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_CHEST",           name = "Chest",             icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_ROBE",            name = "Chest (robes)",     icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_TABARD",          name = "Tabard",            icon = PAPERDOLL .. "Ui-paperdoll-slot-tabard.blp" },
    { type = "INVTYPE_WRIST",           name = "Wrist",             icon = PAPERDOLL .. "Ui-paperdoll-slot-wrists.blp" },
    { type = "INVTYPE_HAND",            name = "Hands",             icon = PAPERDOLL .. "Ui-paperdoll-slot-hands.blp" },
    { type = "INVTYPE_WAIST",           name = "Waist",             icon = PAPERDOLL .. "Ui-paperdoll-slot-waist.blp" },
    { type = "INVTYPE_LEGS",            name = "Legs",              icon = PAPERDOLL .. "Ui-paperdoll-slot-legs.blp" },
    { type = "INVTYPE_FEET",            name = "Feet",              icon = PAPERDOLL .. "Ui-paperdoll-slot-feet.blp" },
    { type = "INVTYPE_FINGER",          name = "Finger",            icon = PAPERDOLL .. "Ui-paperdoll-slot-finger.blp" },
    { type = "INVTYPE_TRINKET",         name = "Trinket",           icon = PAPERDOLL .. "Ui-paperdoll-slot-trinket.blp" },
    { type = "INVTYPE_WEAPON",          name = "One-Hand",          icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_WEAPONMAINHAND",  name = "Main Hand",         icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_WEAPONOFFHAND",   name = "Off Hand",          icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_HOLDABLE",        name = "Held In Off-hand",  icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_2HWEAPON",        name = "Two-Hand",          icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_SHIELD",          name = "Shield",            icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_RANGED",          name = "Ranged",            icon = PAPERDOLL .. "Ui-paperdoll-slot-ranged.blp" },
    { type = "INVTYPE_RANGEDRIGHT",     name = "Ranged (wands)",    icon = PAPERDOLL .. "Ui-paperdoll-slot-ranged.blp" },
    { type = "INVTYPE_NON_EQUIP",       name = "Non-equippable",    icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_BAG",             name = "Bag",               icon = PAPERDOLL .. "Ui-paperdoll-slot-bag.blp" },
    { type = "INVTYPE_AMMO",            name = "Ammo",              icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_THROWN",          name = "Thrown",            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_QUIVER",          name = "Quiver",            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_RELIC",           name = "Relic",             icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" }
}

CONSTANTS.ROSTER_NAME_GENERATOR = {
    PREFIX = {
        "adorable",
        "adventurous",
        "aggressive",
        "agreeable",
        "alert",
        "alive",
        "amused",
        "angry",
        "annoyed",
        "annoying",
        "anxious",
        "arrogant",
        "ashamed",
        "attractive",
        "average",
        "awful",
        "bad",
        "beautiful",
        "better",
        "bewildered",
        "black",
        "bloody",
        "blue",
        "blue-eyed",
        "blushing",
        "bored",
        "brainy",
        "brave",
        "breakable",
        "bright",
        "busy",
        "calm",
        "careful",
        "cautious",
        "charming",
        "cheerful",
        "clean",
        "clear",
        "clever",
        "cloudy",
        "clumsy",
        "colorful",
        "combative",
        "comfortable",
        "concerned",
        "condemned",
        "confused",
        "cooperative",
        "courageous",
        "crazy",
        "creepy",
        "crowded",
        "cruel",
        "curious",
        "cute",
        "dangerous",
        "dark",
        "dead",
        "defeated",
        "defiant",
        "delightful",
        "depressed",
        "determined",
        "different",
        "difficult",
        "disgusted",
        "distinct",
        "disturbed",
        "dizzy",
        "doubtful",
        "drab",
        "dull",
        "eager",
        "easy",
        "elated",
        "elegant",
        "embarrassed",
        "enchanting",
        "encouraging",
        "energetic",
        "enthusiastic",
        "envious",
        "evil",
        "excited",
        "expensive",
        "exuberant",
        "fair",
        "faithful",
        "famous",
        "fancy",
        "fantastic",
        "fierce",
        "filthy",
        "fine",
        "foolish",
        "fragile",
        "frail",
        "frantic",
        "friendly",
        "frightened",
        "funny",
        "gentle",
        "gifted",
        "glamorous",
        "gleaming",
        "glorious",
        "good",
        "gorgeous",
        "graceful",
        "grieving",
        "grotesque",
        "grumpy",
        "handsome",
        "happy",
        "healthy",
        "helpful",
        "helpless",
        "hilarious",
        "homeless",
        "homely",
        "horrible",
        "hungry",
        "hurt",
        "ill",
        "important",
        "impossible",
        "inexpensive",
        "innocent",
        "inquisitive",
        "itchy",
        "jealous",
        "jittery",
        "jolly",
        "joyous",
        "kind",
        "lazy",
        "light",
        "lively",
        "lonely",
        "long",
        "lovely",
        "lucky",
        "magnificent",
        "misty",
        "modern",
        "motionless",
        "muddy",
        "mushy",
        "mysterious",
        "nasty",
        "naughty",
        "nervous",
        "nice",
        "nutty",
        "obedient",
        "obnoxious",
        "odd",
        "old-fashioned",
        "open",
        "outrageous",
        "outstanding",
        "panicky",
        "perfect",
        "plain",
        "pleasant",
        "poised",
        "poor",
        "powerful",
        "precious",
        "prickly",
        "proud",
        "putrid",
        "puzzled",
        "quaint",
        "real",
        "relieved",
        "repulsive",
        "rich",
        "scary",
        "selfish",
        "shiny",
        "shy",
        "silly",
        "sleepy",
        "smiling",
        "smoggy",
        "sore",
        "sparkling",
        "splendid",
        "spotless",
        "stormy",
        "strange",
        "stupid",
        "successful",
        "super",
        "talented",
        "tame",
        "tasty",
        "tender",
        "tense",
        "terrible",
        "thankful",
        "thoughtful",
        "thoughtless",
        "tired",
        "tough",
        "troubled",
        "ugliest",
        "ugly",
        "uninterested",
        "unsightly",
        "unusual",
        "upset",
        "uptight",
        "vast",
        "victorious",
        "vivacious",
        "wandering",
        "wear",
        "wicked",
        "wide-eyed",
        "wild",
        "witty",
        "worried",
        "worrisome",
        "wrong",
        "zany",
        "zealous",
        },
    SUFFIX = {
        "ants",
        "bats",
        "bears",
        "bees",
        "birds",
        "buffalloes",
        "cats",
        "chickens",
        "cattle",
        "dogs",
        "dolphins",
        "ducks",
        "elephants",
        "fishes",
        "foxes",
        "frogs",
        "geese",
        "goats",
        "horses",
        "kangaroos",
        "lions",
        "monkeys",
        "owls",
        "oxen",
        "penguins",
        "people",
        "pigs",
        "rabbits",
        "sheep",
        "tigers",
        "whales",
        "wolves",
        "zebras"
    }
}