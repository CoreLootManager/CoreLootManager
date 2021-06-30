local _, CLM = ...

local LOG = CLM.LOG
local UTILS =  CLM.UTILS
local CONSTANTS =  CLM.CONSTANTS

local DeepCopy = UTILS.DeepCopy

local keys = UTILS.keys

local WeekNumber = UTILS.WeekNumber
local weekOffsetEU = UTILS.GetWeekOffsetEU()
local weekOffsetUS = UTILS.GetWeekOffsetUS()

local Roster = { } -- Roster information
local RosterConfiguration = { } -- Roster Configuration

function Roster:New(uid, pointType)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Roster Management
    o.uid  = tonumber(uid)
    o.pointType = pointType
    o.configuration  = RosterConfiguration:New()
    o.defaultSlotValues = {}
    o.itemValues = {}

    -- Roster data
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
    -- Weekly point gains per player
    o.weeklyGains = {}

    return o
end

function Roster:GetPointType()
    return self.pointType
end

function Roster:AddProfileByGUID(GUID)
    LOG:Debug("Add profile [%s] to roster [%s]", GUID, self:UID())
    if self:IsProfileInRoster(GUID) then return end
    self.standings[GUID] = 0
    self.weeklyGains[GUID] = {}
    self.profileLoot[GUID] = {}
    self.profilePointHistory[GUID] = {}
end

function Roster:RemoveProfileByGUID(GUID)
    LOG:Debug("Remove profile [%s] from roster [%s]", GUID, self:UID())
    self.standings[GUID] = nil
    self.weeklyGains[GUID] = nil
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
    return keys(self.standings)
end

function Roster:Standings(GUID)
    if GUID == nil then
        return self.standings or {}
    else
        return self.standings[GUID] or 0
    end
end

function Roster:WeeklyGains(GUID, week)
    if type(GUID) ~= "string" then
        return self.weeklyGains or {}
    end
    if type(week) ~= "number" then
        return self.weeklyGains[GUID] or {}
    end
    return self.weeklyGains[GUID][week] or 0
end

function Roster:UpdateStandings(GUID, value, timestamp)
    local offset = (self.configuration._.weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS
    local week = WeekNumber(timestamp, offset)
    local hardCap = self.configuration._.hardCap
    local isPositiveChange = (value > 0)
    -- We do not remove points if they are over during newly introduced cap
    if self.configuration.hasHardCap and (self:Standings(GUID) >  hardCap) and isPositiveChange then
        return
    end
    self.standings[GUID] = self:Standings(GUID) + value
    if isPositiveChange then
        -- Weekly Cap
        if self.configuration.hasWeeklyCap and timestamp then
            self.weeklyGains[GUID][week] = self:WeeklyGains(GUID, week) + value
            local overCap = self:WeeklyGains(GUID, week) - self.configuration._.weeklyCap
            if overCap > 0 then
                self.weeklyGains[GUID][week] = self:WeeklyGains(GUID, week) - overCap
                self.standings[GUID] = self:Standings(GUID) - overCap
            end
        end
        -- Hard Cap
        if self.configuration.hasHardCap then
            if self.standings[GUID] > hardCap then
                self.standings[GUID] = hardCap
            end
        end
    end
end

function Roster:SetStandings(GUID, value)
    self.standings[GUID] = value
end

function Roster:DecayStandings(GUID, value)
    self.standings[GUID] = (self:Standings(GUID) * (100 - value)) / 100
end

function Roster:SetDefaultSlotValue(itemEquipLoc, base, maximum)
    LOG:Debug("Set Default Slot Value: [%s]: [%s] [%s] for roster [%s]", itemEquipLoc, base, maximum, self:UID())
    self.defaultSlotValues[itemEquipLoc] = {
        base = tonumber(base) or 0,
        max = tonumber(maximum) or 0
    }
end

function Roster:GetDefaultSlotValue(itemEquipLoc)
    local s = self.defaultSlotValues[itemEquipLoc or "INVTYPE_NON_EQUIP"]
    return s or {base = 0, max = 0}
end

function Roster:GetAllItemValues()
    return self.itemValues or {}
end

function Roster:SetItemValue(itemId, base, maximum)
    LOG:Debug("Set Item Value: [%s]: [%s] [%s] for roster [%s]", itemId, base, maximum, self:UID())
    self.itemValues[itemId] = {
        base = tonumber(base) or 0,
        max = tonumber(maximum) or 0
    }
end

function Roster:ClearItemValue(itemId)
    LOG:Debug("Clear Item Value: [%s] for roster [%s]", itemId, self:UID())
    self.itemValues[itemId] = nil
end

function Roster:GetItemValue(itemId)
    local itemValue = self.itemValues[itemId]
    if itemValue == nil then
        local _, _, _, itemEquipLoc = GetItemInfoInstant(itemId)
        local default = self:GetDefaultSlotValue(itemEquipLoc)
        itemValue = { base = default.base, max = default.max }
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
    -- history store
    table.insert(self.profileLoot[profile:GUID()], loot)
    table.insert(self.raidLoot, loot)
    -- charging for the item
    self.standings[profile:GUID()] = self.standings[profile:GUID()] - loot:Value()
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

    o._ = {}
    -- Auction type: Open / Sealed / Vickrey
    o._.auctionType = CONSTANTS.AUCTION_TYPE.SEALED
    -- Item Value mode: Single-Priced / Ascending
    o._.itemValueMode = CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED
    -- Zero-Sum Bank
    o._.zeroSumBank = false
    -- Zero-Sum Bank inflation value
    o._.zeroSumBankInflation = 0
    -- Auction time seconds
    o._.auctionTime = 30
    -- Anti snipe time seconds (0 = disabled)
    o._.antiSnipe = 0
    -- Allow negative standings
    o._.allowNegativeStandings = false
    -- Allow negative bidders
    o._.allowNegativeBidders = false
    -- TODO:
    -- Max Bid Behavior ?
    -- Boss Kill Bonus
    o._.bossKillBonus = false
    -- On time Bonus
    o._.onTimeBonus = false
    -- On Time Bonus Value
    o._.onTimeBonusValue = 0
    -- Raid Completion Bonus
    o._.raidCompletionBonus = false
    -- raidCompletionBonus Value
    o._.raidCompletionBonusValue = 0
    -- Interval Bonus
    o._.intervalBonus = false
    -- Interval Bonus Time
    o._.intervalBonusTime = 0
    -- Interval Bonus Value
    o._.intervalBonusValue = 0
    -- Hard Point Cap:
    o._.hardCap = 0
    -- Weekly Cap:
    o._.weeklyCap = 0
    -- Weekly reset:
    o._.weeklyReset = CONSTANTS.WEEKLY_RESET.EU

    -- Additional settings
    o.hasHardCap = false
    o.hasWeeklyCap = false

    return o
end

local fields ={
    -- basic options
    "auctionType",
    "itemValueMode",
    "zeroSumBank",
    "zeroSumBankInflation",
    "auctionTime",
    "antiSnipe",
    "allowNegativeStandings",
    "allowNegativeBidders",
    -- bonuses not yet in place
    "bossKillBonus",
    "onTimeBonus",
    "onTimeBonusValue",
    "raidCompletionBonus",
    "raidCompletionBonusValue",
    "intervalBonus",
    "intervalBonusTime",
    "intervalBonusValue",
    -- caps
    "hardCap",
    "weeklyCap",
    "weeklyReset"
}

function RosterConfiguration:inflate(data)
    for i, key in ipairs(fields) do
        self._[key] = data[i]
    end
end

function RosterConfiguration:deflate()
    local result = {}
    for _, key in ipairs(fields) do
        table.insert(result, self._[key])
    end
    return result
end


local function transform_boolean(value) return value and true or false end
local function transform_number(value) return tonumber(value) end

local TRANSFORMS = {
    auctionType = transform_number,
    itemValueMode = transform_number,
    zeroSumBank = transform_boolean,
    zeroSumBankInflation = transform_number,
    auctionTime = transform_number,
    antiSnipe = transform_number,
    allowNegativeStandings = transform_boolean,
    allowNegativeBidders = transform_boolean,
    bossKillBonus = transform_boolean,
    onTimeBonus = transform_boolean,
    onTimeBonusValue = transform_number,
    raidCompletionBonus = transform_boolean,
    raidCompletionBonusValue = transform_number,
    intervalBonus = transform_boolean,
    intervalBonusTime = transform_number,
    intervalBonusValue = transform_number,
    hardCap = transform_number,
    weeklyCap = transform_number,
    weeklyReset = transform_number
}

function RosterConfiguration:Get(option)
    if option ~= nil then
        return self._[option]
    end
    return nil
end

local function IsBoolean(value) return type(value) == "boolean" end
local function IsNumeric(value) return type(value) == "number" end
local function IsPositive(value) return IsNumeric(value) and value >= 0 end
local validators = {
    auctionType = function(value) return CONSTANTS.AUCTION_TYPES[value] ~= nil end,
    itemValueMode = function(value) return CONSTANTS.ITEM_VALUE_MODES[value] ~= nil end,
    zeroSumBank = IsBoolean,
    allowNegativeStandings = IsBoolean,
    allowNegativeBidders = IsBoolean,
    zeroSumBankInflation = IsPositive,
    auctionTime = IsPositive,
    antiSnipe = IsPositive,
    bossKillBonus = IsBoolean,
    onTimeBonus = IsBoolean,
    onTimeBonusValue = IsPositive,
    raidCompletionBonus = IsBoolean,
    raidCompletionBonusValue = IsPositive,
    intervalBonus = IsBoolean,
    intervalBonusTime = IsPositive,
    intervalBonusValue = IsPositive,
    hardCap = IsPositive,
    weeklyCap = IsPositive,
    weeklyReset = function(value) return CONSTANTS.WEEKLY_RESETS[value] ~= nil end

}

local function PostProcess(self, option)
    if option == "hardCap" then
        self.hasHardCap = (self._[option] > 0)
    elseif option == "weeklyCap" then
        self.hasWeeklyCap = (self._[option] > 0)
    end
end

function RosterConfiguration:Set(option, value)
    if option == nil then return end
    if self._[option] ~= nil then
        local validator = validators[option]
        -- No validator means always valid
        if validator == nil or validator(value) then
            self._[option] = TRANSFORMS[option](value)
            PostProcess(self, option)
        end
    end
end




CLM.MODELS.Roster = Roster
CLM.MODELS.RosterConfiguration = RosterConfiguration

-- Constants
CONSTANTS.POINT_TYPE = {
    DKP = 0,
    EPGP = 1,
    ROLL = 2,
    SK = 3
}

CONSTANTS.POINT_TYPES = UTILS.Set({
    CONSTANTS.POINT_TYPE.DKP, -- DKP
    CONSTANTS.POINT_TYPE.EPGP, -- EPGP
    CONSTANTS.POINT_TYPE.ROLL, -- ROLL
    CONSTANTS.POINT_TYPE.SK  -- SK
})

CONSTANTS.POINT_TYPES_GUI = {
    [CONSTANTS.POINT_TYPE.DKP] = "DKP",
    [CONSTANTS.POINT_TYPE.EPGP] = "EPGP",
    [CONSTANTS.POINT_TYPE.ROLL] = "ROLL",
    [CONSTANTS.POINT_TYPE.SK] = "SK"
}

CONSTANTS.AUCTION_TYPE = {
    OPEN = 0,
    SEALED = 1,
    VICKREY = 2
}

CONSTANTS.AUCTION_TYPES = UTILS.Set({
    CONSTANTS.AUCTION_TYPE.OPEN, -- OPEN
    CONSTANTS.AUCTION_TYPE.SEALED, -- SEALED
    CONSTANTS.AUCTION_TYPE.VICKREY  -- VICKREY
})

CONSTANTS.AUCTION_TYPES_GUI = {
    [CONSTANTS.AUCTION_TYPE.OPEN] = "Open",
    [CONSTANTS.AUCTION_TYPE.SEALED] = "Sealed",
    [CONSTANTS.AUCTION_TYPE.VICKREY] = "Vickrey"
}

CONSTANTS.ITEM_VALUE_MODE = {
    SINGLE_PRICED = 0,
    ASCENDING = 1
}

CONSTANTS.ITEM_VALUE_MODES = UTILS.Set({
    CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED, -- SINGLE_PRICED
    CONSTANTS.ITEM_VALUE_MODE.ASCENDING  -- ASCENDING
})

CONSTANTS.ITEM_VALUE_MODES_GUI = {
    [CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED] = "Single-Priced",
    [CONSTANTS.ITEM_VALUE_MODE.ASCENDING] = "Ascending"
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

CONSTANTS.WEEKLY_RESET = {
    EU = 0,
    US = 1
}

CONSTANTS.WEEKLY_RESETS = UTILS.Set({
    CONSTANTS.WEEKLY_RESET.EU,
    CONSTANTS.WEEKLY_RESET.US
})

CONSTANTS.WEEKLY_RESETS_GUI = {
    [CONSTANTS.WEEKLY_RESET.EU] = "Europe",
    [CONSTANTS.WEEKLY_RESET.US] = "Americas"
}