local _, CLM = ...

local LOG = CLM.LOG
local UTILS =  CLM.UTILS
local CONSTANTS =  CLM.CONSTANTS
-- local MODELS = CLM.MODELS

local DeepCopy = UTILS.DeepCopy
local ShallowCopy = UTILS.ShallowCopy

-- local whoami = UTILS.WhoAmI
-- local typeof = UTILS.typeof
local keys = UTILS.keys

local Roster = { } -- Roster information
local RosterConfiguration = { } -- Roster Configuration

function Roster:New(uid)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Roster Management
    o.uid  = tonumber(uid)
    o.configuration  = RosterConfiguration:New()
    o.defaultSlotValues = {}
    o.itemValues = {}

    -- Roster data
    -- Profiles in roster (list)
    o.profiles = {}
    -- Profile standing in roster (dict)
    o.standings = {}
    -- Point changes in  roster (list)
    o.pointHistory = {}
    -- Point changes in to players in roster (dict of lists)
    o.profilePointHistory = {}
    -- Loot received in the roster (list). Time descending
    o.raidLoot = {}
    -- Loot received by players (dict of lists). Time descending per player
    o.profileLoot = {}

    return o
end

function Roster:AddProfileByGUID(GUID)
    LOG:Debug("Add profile [%s] to roster [%s]", GUID, self:UID())
    self.standings[GUID] = 0
    self.profiles = keys(self.standings)
    self.profileLoot[GUID] = {}
    self.profilePointHistory[GUID] = {}
end

function Roster:RemoveProfileByGUID(GUID)
    LOG:Debug("Remove profile [%s] from roster [%s]", GUID, self:UID())
    self.standings[GUID] = nil
    self.profiles = keys(self.standings)
    self.profileLoot[GUID] = nil
    self.profilePointHistory[GUID] = nil
    -- TODO remove raidloot history for the person? how?
end

function Roster:IsProfileInRoster(GUID)
    return self.standings[GUID]
end

function Roster:UID()
    return self.uid
end

function Roster:Profiles()
    return self.profiles or {}
end

function Roster:Standings()
    return self.standings or {}
end

function Roster:SetDefaultSlotValue(itemEquipLoc, minimum, maximum)
    LOG:Debug("Set Default Slot Value: [%s]: [%s] [%s] for roster [%s]", itemEquipLoc, minimum, maximum, self:UID())
    self.defaultSlotValues[itemEquipLoc] = {
        min = tonumber(minimum) or 0,
        max = tonumber(maximum) or 0
    }
end

function Roster:GetDefaultSlotValue(itemEquipLoc)
    local s = self.defaultSlotValues[itemEquipLoc]
    return s or {min = 0, max = 0}
end

function Roster:SetItemValue(itemId, itemName, minimum, maximum)
    LOG:Debug("Set Item Value: [%s]: [%s] [%s] for roster [%s]", itemId, itemName, minimum, maximum, self:UID())
    self.itemValues[itemId] = {
        name = itemName or "",
        min = tonumber(minimum) or 0,
        max = tonumber(maximum) or 0
    }
end

function Roster:GetItemValue(itemId)
    local itemValue = self.itemValues[itemId]
    if itemValue == nil then
        local _, _, _, itemEquipLoc = GetItemInfoInstant(itemId)
        local minimum, maximum = self:GetDefaultSlotValue(itemEquipLoc)
        itemValue = { name = "", min = minimum, max = maximum }
    end
    return itemValue
end

function Roster:GetConfiguration(option)
    return self.configuration:Get(option)
end

function Roster:SetConfiguration(option, value)
    self.configuration:Set(option, value)
end

function Roster:WipeStandings()
    LOG:Info("Wipe Standings for roster [%s]", self:UID())
    for GUID,_ in pairs(self.standings) do
        self.standings[GUID] = 0
    end
end

function Roster:WipeLoot()
    LOG:Info("Wipe Loot for roster [%s]", self:UID())
    for GUID,_ in pairs(self.standings) do
        self.profileLoot[GUID] = {}
    end
    self.raidLoot = {}
end

function Roster:AddLoot(loot, profile)
    table.insert(self.profileLoot[profile:GUID()], 1,loot)
    table.insert(self.raidLoot, 1, loot)
end

function Roster:GetRaidLoot()
    return self.raidLoot or {}
end

function Roster:GetProfileLootByGUID(GUID)
    return self.profileLoot[GUID] or {}
end

function Roster:WipeHistory()
    LOG:Info("Wipe Standings for roster [%s]", self:UID())
    for GUID,_ in pairs(self.standings) do
        self.profilePointHistory[GUID] = {}
    end
    self.pointHistory = {}
end

function Roster:AddProfilePointHistory(history, profile)
    table.insert(self.profilePointHistory[profile:GUID()], 1, history)
end

function Roster:AddRosterPointHistory(history)
    table.insert(self.pointHistory, 1, history)
end


function Roster:GetRaidPointHistory()
    return self.pointHistory or {}
end

function Roster:GetProfilePointHistoryByGUID(GUID)
    return self.profilePointHistory[GUID] or {}
end

-- Copies. Hope I didn't fk it up

function Roster:CopyItemValues(s)
    self.itemValues = DeepCopy(s.itemValues)
end

function Roster:CopyDefaultSlotValues(s)
    self.defaultSlotValues = DeepCopy(s.defaultSlotValues)
end

function Roster:CopyConfiguration(s)
    self.configuration = RosterConfiguration:New(DeepCopy(s.configuration))
end

function Roster:CopyProfiles(s)
    for _, GUID in ipairs(s:Profiles()) do
        if not self:IsProfileInRoster(GUID) then
            self:AddProfileByGUID(GUID)
        end
    end
end
-- ------------------- --
-- RosterConfiguration --
-- ------------------- --
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

function RosterConfiguration:fields()
    return {
        "pointType",
        "auctionType",
        "itemValueMode",
        "zeroSumBank",
        "allowNegativeStandings",
        "allowNegativeBidders",
        "simultaneousAuctions"
    }
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
            self[option] = value
        end
    end
end

function RosterConfiguration:Validate(option, value)
    local callback = "_validate_" .. option
    if type(self[callback]) == "function" then
        local r = self[callback](value)
        return r
    end

    return true -- TODO: true or false?
end

local function IsBoolean(value) return type(value) == "boolean" end
function RosterConfiguration._validate_pointType(value) return CONSTANTS.POINT_TYPES[value] ~= nil end
function RosterConfiguration._validate_auctionType(value) return CONSTANTS.AUCTION_TYPES[value] ~= nil end
function RosterConfiguration._validate_itemValueMode(value) return CONSTANTS.ITEM_VALUE_MODES[value] ~= nil end
function RosterConfiguration._validate_zeroSumBank(value) return IsBoolean(value) end
function RosterConfiguration._validate_allowNegativeStandings(value) return IsBoolean(value) end
function RosterConfiguration._validate_allowNegativeBidders(value) return IsBoolean(value) end
function RosterConfiguration._validate_simultaneousAuctions(value) return IsBoolean(value) end

CLM.MODELS.Roster = Roster
CLM.MODELS.RosterConfiguration = RosterConfiguration

-- Constants
CONSTANTS.POINT_TYPES = UTILS.Set({
    0, -- DKP
    1  -- EPGP
})

CONSTANTS.POINT_TYPE = {
    DKP = 0,
    EPGP = 1
}
CONSTANTS.AUCTION_TYPES = UTILS.Set({
    0, -- OPEN
    1, -- SEALED
    2  -- VICKREY
})

CONSTANTS.AUCTION_TYPE = {
    OPEN = 0,
    SEALED = 1,
    VICKREY = 2
}

CONSTANTS.ITEM_VALUE_MODES = UTILS.Set({
    0, -- SINGLE_PRICED
    1  -- ASCENDING
})

CONSTANTS.ITEM_VALUE_MODE = {
    SINGLE_PRICED = 0,
    ASCENDING = 1
}

CONSTANTS.INVENTORY_TYPES = {
    "INVTYPE_NON_EQUIP",
    "INVTYPE_HEAD",
    "INVTYPE_NECK",
    "INVTYPE_SHOULDER",
    "INVTYPE_BODY",
    "INVTYPE_CHEST",
    "INVTYPE_WAIST",
    "INVTYPE_LEGS",
    "INVTYPE_FEET",
    "INVTYPE_WRIST",
    "INVTYPE_HAND",
    "INVTYPE_FINGER",
    "INVTYPE_TRINKET",
    "INVTYPE_WEAPON",
    "INVTYPE_SHIELD",
    "INVTYPE_RANGED",
    "INVTYPE_CLOAK",
    "INVTYPE_2HWEAPON",
    "INVTYPE_BAG",
    "INVTYPE_TABARD",
    "INVTYPE_ROBE",
    "INVTYPE_WEAPONMAINHAND",
    "INVTYPE_WEAPONOFFHAND",
    "INVTYPE_HOLDABLE",
    "INVTYPE_AMMO",
    "INVTYPE_THROWN",
    "INVTYPE_RANGEDRIGHT",
    "INVTYPE_QUIVER",
    "INVTYPE_RELIC",
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