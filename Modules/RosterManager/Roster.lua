local _, CLM = ...

local LOG = CLM.LOG
local UTILS =  CLM.UTILS
local CONSTANTS =  CLM.CONSTANTS

local DeepCopy = UTILS.DeepCopy

local keys = UTILS.keys

local WeekNumber = UTILS.WeekNumber
local weekOffsetEU = UTILS.GetWeekOffsetEU()
local weekOffsetUS = UTILS.GetWeekOffsetUS()
local round = UTILS.round

local PointInfo = CLM.MODELS.PointInfo

local Roster = { } -- Roster information
local RosterConfiguration = { } -- Roster Configuration

local GLOBAL_FAKE_INVENTORY_SLOT = "_GLOBAL"

local function lazyCreateSlot(self, itemEquipLoc)
    self.defaultSlotValues[itemEquipLoc] = { }
    for key,_ in pairs(CONSTANTS.SLOT_VALUE_TIER) do
        self.defaultSlotValues[itemEquipLoc][key] = 0
    end
end


function Roster:New(uid, pointType, raidsForFullAttendance, attendanceWeeksWindow)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Roster Management
    o.uid  = tonumber(uid)
    o.pointType = pointType
    o.configuration  = RosterConfiguration:New()
    o.defaultSlotValues = {}
    lazyCreateSlot(self, GLOBAL_FAKE_INVENTORY_SLOT)
    o.itemValues = {}

    -- Roster data
    -- Profile is at all in roster
    o.inRoster = {}
    -- Profile standing in roster (dict)
    o.standings = {}
    -- Profile point info
    o.pointInfo = {}
    -- Profile attendance in roster (dict)
    o.attendanceTracker = CLM.MODELS.AttendanceTracker:New(raidsForFullAttendance, attendanceWeeksWindow)
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
    -- Boss Kill Bonus values
    o.bossKillBonusValues = {}
    for id,_ in pairs(CLM.DifficultyIDsMap) do
        o.bossKillBonusValues[id] = {}
    end

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
    self.inRoster[GUID] = true
    self.pointInfo[GUID] = PointInfo:New()
end

function Roster:RemoveProfileByGUID(GUID)
    LOG:Debug("Remove profile [%s] from roster [%s]", GUID, self:UID())
    self.standings[GUID] = nil
    self.weeklyGains[GUID] = nil
    self.profileLoot[GUID] = nil
    self.profilePointHistory[GUID] = nil
    self.inRoster[GUID] = nil
end

function Roster:MarkAsConditionallyRemoved(GUID)
    -- Used for backwards compatibility in profiles - marks as removed but doesnt remove any data
    self.inRoster[GUID] = nil
end

function Roster:RestoreConditionallyRemoved(GUID)
    -- Used for backwards compatibility in profiles - marks as removed but doesnt remove any data
    self.inRoster[GUID] = true
end

function Roster:IsConditinallyRemoved(GUID)
    return self.standings[GUID] and not self.inRoster[GUID]
end

function Roster:IsProfileInRoster(GUID)
    return (self.inRoster[GUID] ~= nil)
end

function Roster:UID()
    return self.uid
end

function Roster:Profiles()
    return keys(self.inRoster)
end

function Roster:Standings(GUID)
    if GUID == nil then
        return self.standings or {}
    else
        return self.standings[GUID] or 0
    end
end

function Roster:GetAllWeeklyGains()
    return self.weeklyGains or {}
end


function Roster:GetWeeklyGainsForPlayer(GUID)
    return self.weeklyGains[GUID] or {}
end

function Roster:GetCurrentGainsForPlayer(GUID)
    local week = WeekNumber(GetServerTime(), (self.configuration._.weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS)
    return self:GetWeeklyGainsForPlayerWeek(GUID, week)
end

function Roster:GetPointInfoForPlayer(GUID)
    return self.pointInfo[GUID] or PointInfo:New()
end

function Roster:GetWeeklyGainsForPlayerWeek(GUID, week)
    local weeklyGains = self.weeklyGains[GUID]
    if not weeklyGains then
        self.weeklyGains[GUID] = {}
    end
    return self.weeklyGains[GUID][week] or 0
end

function Roster:UpdateStandings(GUID, value, timestamp)
    timestamp = timestamp or 0
    LOG:Debug("Roster:UpdateStandings(%s, %s, %s)", GUID, self.uid, value)
    local originalValue = value
    local isPointGain = (value > 0)
    local week = 0
    local standings = self:Standings(GUID)
    if isPointGain then
        -- Handle the caps if the update was a positive (gain)
        -- Hard Cap
        if self.configuration.hasHardCap then
            local hardCap = self.configuration._.hardCap
            -- We do not modify points if they are already exceeded during newly introduced cap
            if (standings >= hardCap) then
                return
            end
            local maxGain = hardCap - standings
            if maxGain <= 0 then -- sanity check (here it shouldn't be be 0 due to above check)
                LOG:Debug("Roster:UpdateStandings(): maxGain %d for %s(%s) is lower than 0 for hard cap", maxGain, GUID, self.uid)
                return
            end
            -- Saturate the initial value
            if value > maxGain then value = maxGain end
        end
        -- Weekly Cap
        week = WeekNumber(timestamp, (self.configuration._.weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS)
        if self.configuration.hasWeeklyCap then
            local maxGain = self.configuration._.weeklyCap - self:GetWeeklyGainsForPlayerWeek(GUID, week)
            if maxGain < 0 then -- sanity check (here it can be 0 and this can happen if cap was lowered before awarding dkp)
                LOG:Debug("Roster:UpdateStandings(): maxGain %d for %s(%s) is lower than 0 for weekly cap", maxGain, GUID, self.uid)
                return
            end
            if value > maxGain then value = maxGain end
        end
    end
    -- Handle the standings update
    value = round(value, self.configuration._.roundDecimals)
    if isPointGain then
        self.weeklyGains[GUID][week] = self:GetWeeklyGainsForPlayerWeek(GUID, week) + value
    end
    self.standings[GUID] = standings + value
    self.pointInfo[GUID]:AddReceived(value)
    self.pointInfo[GUID]:AddBlocked(originalValue - value)
end

function Roster:SetStandings(GUID, value)
    self.standings[GUID] = round(value, self.configuration._.roundDecimals)
end

function Roster:DecayStandings(GUID, value)
    local new = round(((self:Standings(GUID) * (100 - value)) / 100), self.configuration._.roundDecimals)
    self.pointInfo[GUID]:AddDecayed(self.standings[GUID] - new)
    self.standings[GUID] = new
end

local function mirrorStandings(self, source, target)
    if source == target then return end -- to prevent circular updates
    if not self.standings[target] then return end
    self.standings[target] = self.standings[source]
end

function Roster:MirrorStandings(source, targets, isArray)
    if isArray then
        for target, _ in pairs(targets) do
            mirrorStandings(self, source, target)
        end
    else
        for _, target in ipairs(targets) do
            mirrorStandings(self, source, target)
        end
    end
end

local function mirrorWeeklyGains(self, source, target)
    if source == target then return end -- to prevent circular updates
    if not self.standings[target] then return end
    local gains = self:GetWeeklyGainsForPlayer(source)
    if self.weeklyGains[target] then
        for week, gain in ipairs(gains) do
            self:GetWeeklyGainsForPlayerWeek(target, week)
            self.weeklyGains[target][week] = gain
        end
    end
end

function Roster:MirrorWeeklyGains(source, targets, isArray)
    if isArray then
        for target, _ in pairs(targets) do
            mirrorWeeklyGains(self, source, target)
        end
    else
        for _, target in ipairs(targets) do
            mirrorWeeklyGains(self, source, target)
        end
    end
end

function Roster:SetDefaultSlotTierValue(itemEquipLoc, tier, value)
    LOG:Debug("Set Default Slot Value: [%s]: [%s] [%s] for roster [%s]", itemEquipLoc, tier, value, self:UID())
    if not itemEquipLoc or not CONSTANTS.INVENTORY_TYPES_SET[itemEquipLoc] then return end
    if not tier or not CONSTANTS.SLOT_VALUE_TIERS[tier] then return end
    if not self.defaultSlotValues[itemEquipLoc] then
        lazyCreateSlot(self, itemEquipLoc)
    end
    self.defaultSlotValues[itemEquipLoc][tier] = tonumber(value) or 0
end

function Roster:GetDefaultSlotValue(itemEquipLoc)
    if not itemEquipLoc or not CONSTANTS.INVENTORY_TYPES_SET[itemEquipLoc] then
        itemEquipLoc = GLOBAL_FAKE_INVENTORY_SLOT
    end
    return self.defaultSlotValues[itemEquipLoc] or self.defaultSlotValues[GLOBAL_FAKE_INVENTORY_SLOT]
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
    if option == "weeklyReset" then
        self.attendanceTracker:UpdateWeeklyReset(value)
    end
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
    -- History store
    local GUID = profile:GUID()
    table.insert(self.profileLoot[GUID], loot)
    table.insert(self.raidLoot, loot)
    -- Charging for the item
    self:UpdateStandings(GUID, -loot:Value(), 0)
    self.pointInfo[GUID]:AddSpent(loot:Value())
    -- Correct for the spending since it will be subtracted in update standings
    self.pointInfo[GUID]:AddReceived(loot:Value())
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

function Roster:SetBossKillBonusValue(encounterId, difficultyId, value)
    LOG:Debug("Roster:SetBossKillBonusValue() Trying to set encounterId: %s difficultyId: %s value: %s", encounterId, difficultyId, value)
    self.bossKillBonusValues[difficultyId][encounterId] = tonumber(value)
end

function Roster:GetBossKillBonusValue(encounterId, difficultyId)
    return self.bossKillBonusValues[difficultyId or -1][encounterId] or self.configuration._.bossKillBonusValue
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
    self.bossKillBonusValues = DeepCopy(s.bossKillBonusValues)
end

function Roster:CopyProfiles(s)
    for _, GUID in ipairs(s:Profiles()) do
        if not self:IsProfileInRoster(GUID) then
            self:AddProfileByGUID(GUID)
        end
    end
end

-- todo change EU/US weekly reset
-- function Roster:ChangeAttendance()

function Roster:UpdateAttendance(GUID, raidId, timestamp)
    self.attendanceTracker:Update(GUID, raidId, timestamp)
end

function Roster:GetAttendance(GUID)
    return self.attendanceTracker:Get(GUID)
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
    -- Boss Kill Bonus
    o._.bossKillBonus = false
    -- Default Boss Kill Bonus value
    o._.bossKillBonusValue = 0
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
    -- Round Decimals
    o._.roundDecimals = 10
    -- Minimal bid increment for open auction
    o._.minimalIncrement = 1
    -- Bench players leaving raid
    o._.autoBenchLeavers = false
    -- Include bench in auto-awards
    o._.autoAwardIncludeBench = true
    -- Include only online players in auto-awards
    o._.autoAwardOnlineOnly = false
    -- Include only players in same zone in auto-awards
    o._.autoAwardSameZoneOnly = false
    -- Enable self-subscribe
    o._.selfBenchSubscribe = false
    -- Additional tax to pay
    o._.tax = 0

    -- Additional settings
    o.hasHardCap = false
    o.hasWeeklyCap = false

    return o
end

-- ----------------------- --
-- ADD NEW ONLY AT THE END --
-- ----------------------- --
function RosterConfiguration:fields()
    return {
        "auctionType",
        "itemValueMode",
        "zeroSumBank",
        "zeroSumBankInflation",
        "auctionTime",
        "antiSnipe",
        "allowNegativeStandings",
        "allowNegativeBidders",
        "bossKillBonus",
        "bossKillBonusValue",
        "onTimeBonus",
        "onTimeBonusValue",
        "raidCompletionBonus",
        "raidCompletionBonusValue",
        "intervalBonus",
        "intervalBonusTime",
        "intervalBonusValue",
        "hardCap",
        "weeklyCap",
        "weeklyReset",
        "roundDecimals",
        "minimalIncrement",
        "autoBenchLeavers",
        "autoAwardIncludeBench",
        "autoAwardOnlineOnly",
        "autoAwardSameZoneOnly",
        "selfBenchSubscribe",
        "tax",
    }
end

function RosterConfiguration:Storage()
    return self._
end

local function transform_boolean(value) return value and true or false end
local function transform_number(value) return tonumber(value) or 0 end

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
    bossKillBonusValue = transform_number,
    raidCompletionBonus = transform_boolean,
    raidCompletionBonusValue = transform_number,
    intervalBonus = transform_boolean,
    intervalBonusTime = transform_number,
    intervalBonusValue = transform_number,
    hardCap = transform_number,
    weeklyCap = transform_number,
    weeklyReset = transform_number,
    roundDecimals = transform_number,
    minimalIncrement = transform_number,
    autoBenchLeavers = transform_boolean,
    autoAwardIncludeBench = transform_boolean,
    autoAwardOnlineOnly = transform_boolean,
    autoAwardSameZoneOnly = transform_boolean,
    selfBenchSubscribe = transform_boolean,
    tax = transform_number,
}

function RosterConfiguration:inflate(data)
    --  Fix for bossKillBonusValue fuckup with adding in between
    if #data < 22 then
        table.insert(data, 10, 0)
    end
    for i, key in ipairs(self:fields()) do
        -- self._[key] = data[i]
        self._[key] = TRANSFORMS[key](data[i])
    end
end

function RosterConfiguration:deflate()
    local result = {}
    for _, key in ipairs(self:fields()) do
        table.insert(result, self._[key])
    end

    return result
end

function RosterConfiguration:Copy(o)
    for k,v in pairs(o._) do
        self._[k] = v
    end
end

function RosterConfiguration:Get(option)
    if option ~= nil then
        return self._[option]
    end
    return nil
end

function RosterConfiguration:Set(option, value)
    if option == nil then return end
    if self._[option] ~= nil then
        if self:Validate(option, value) then
            self._[option] = TRANSFORMS[option](value)
            self:PostProcess(option)
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

function RosterConfiguration:PostProcess(option)
    if option == "hardCap" then
        self.hasHardCap = (self._[option] > 0)
    elseif option == "weeklyCap" then
        self.hasWeeklyCap = (self._[option] > 0)
    end
end

local function IsBoolean(value) return type(value) == "boolean" end
local function IsNumeric(value) return type(value) == "number" end
local function IsPositive(value) return value >= 0 end
function RosterConfiguration._validate_auctionType(value) return CONSTANTS.AUCTION_TYPES[value] ~= nil end
function RosterConfiguration._validate_itemValueMode(value) return CONSTANTS.ITEM_VALUE_MODES[value] ~= nil end
function RosterConfiguration._validate_zeroSumBank(value) return IsBoolean(value) end
function RosterConfiguration._validate_allowNegativeStandings(value) return IsBoolean(value) end
function RosterConfiguration._validate_allowNegativeBidders(value) return IsBoolean(value) end
function RosterConfiguration._validate_zeroSumBankInflation(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_auctionTime(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_antiSnipe(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_bossKillBonus(value) return IsBoolean(value) end
function RosterConfiguration._validate_onTimeBonus(value) return IsBoolean(value) end
function RosterConfiguration._validate_onTimeBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_bossKillBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_raidCompletionBonus(value) return IsBoolean(value) end
function RosterConfiguration._validate_raidCompletionBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_intervalBonus(value) return IsBoolean(value) end
function RosterConfiguration._validate_intervalBonusTime(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_intervalBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_hardCap(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_weeklyCap(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_weeklyReset(value) return CONSTANTS.WEEKLY_RESETS[value] ~= nil end
function RosterConfiguration._validate_roundDecimals(value) return CONSTANTS.ALLOWED_ROUNDINGS[value] ~= nil end
function RosterConfiguration._validate_minimalIncrement(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function RosterConfiguration._validate_autoBenchLeavers(value) return IsBoolean(value) end
function RosterConfiguration._validate_autoAwardIncludeBench(value) return IsBoolean(value) end
function RosterConfiguration._validate_autoAwardOnlineOnly(value) return IsBoolean(value) end
function RosterConfiguration._validate_autoAwardSameZoneOnly(value) return IsBoolean(value) end
function RosterConfiguration._validate_selfBenchSubscribe(value) return IsBoolean(value) end
function RosterConfiguration._validate_tax(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end

CLM.MODELS.Roster = Roster
CLM.MODELS.RosterConfiguration = RosterConfiguration

-- Constants
CONSTANTS.POINT_TYPE = {
    DKP = 0,
    EPGP = 1,
    -- ROLL = 2,
    -- SK = 3
}

CONSTANTS.POINT_TYPES = UTILS.Set({
    CONSTANTS.POINT_TYPE.DKP, -- DKP
    CONSTANTS.POINT_TYPE.EPGP, -- EPGP
    -- CONSTANTS.POINT_TYPE.ROLL, -- ROLL
    -- CONSTANTS.POINT_TYPE.SK  -- SK
})

CONSTANTS.POINT_TYPES_GUI = {
    [CONSTANTS.POINT_TYPE.DKP] = CLM.L["DKP"],
    [CONSTANTS.POINT_TYPE.EPGP] = CLM.L["EPGP"],
    -- [CONSTANTS.POINT_TYPE.ROLL] = CLM.L["ROLL"],
    -- [CONSTANTS.POINT_TYPE.SK] = CLM.L["SK"]
}

CONSTANTS.AUCTION_TYPE = {
    OPEN = 0,
    SEALED = 1,
    VICKREY = 2,
    ANONYMOUS_OPEN = 3
}

CONSTANTS.AUCTION_TYPES = UTILS.Set({
    CONSTANTS.AUCTION_TYPE.OPEN,
    CONSTANTS.AUCTION_TYPE.SEALED,
    CONSTANTS.AUCTION_TYPE.VICKREY,
    CONSTANTS.AUCTION_TYPE.ANONYMOUS_OPEN
})

CONSTANTS.AUCTION_TYPES_GUI = {
    [CONSTANTS.AUCTION_TYPE.OPEN] = CLM.L["Open"],
    [CONSTANTS.AUCTION_TYPE.SEALED] = CLM.L["Sealed"],
    [CONSTANTS.AUCTION_TYPE.VICKREY] = CLM.L["Vickrey"],
    [CONSTANTS.AUCTION_TYPE.ANONYMOUS_OPEN] = CLM.L["Anonymous Open"]
}

CONSTANTS.AUCTION_TYPES_OPEN = UTILS.Set({
    CONSTANTS.AUCTION_TYPE.OPEN,
    CONSTANTS.AUCTION_TYPE.ANONYMOUS_OPEN
})

CONSTANTS.ITEM_VALUE_MODE = {
    SINGLE_PRICED = 0,
    ASCENDING = 1,
    TIERED = 2,
}

CONSTANTS.ITEM_VALUE_MODES = UTILS.Set({
    CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED,
    CONSTANTS.ITEM_VALUE_MODE.ASCENDING,
    CONSTANTS.ITEM_VALUE_MODE.TIERED,
})

CONSTANTS.ITEM_VALUE_MODES_GUI = {
    [CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED] = CLM.L["Single-Priced"],
    [CONSTANTS.ITEM_VALUE_MODE.ASCENDING] = CLM.L["Ascending"],
    [CONSTANTS.ITEM_VALUE_MODE.TIERED] = CLM.L["Tiered"],
}


CONSTANTS.INVENTORY_TYPES = {
    GLOBAL_FAKE_INVENTORY_SLOT,
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

CONSTANTS.INVENTORY_TYPES_SET = UTILS.Set(CONSTANTS.INVENTORY_TYPES)


local PAPERDOLL = "Interface\\AddOns\\ClassicLootManager\\Media\\Paperdoll\\"
CONSTANTS.INVENTORY_TYPES_SORTED = {
    { type = GLOBAL_FAKE_INVENTORY_SLOT,                name = CLM.L["Global"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_HEAD",            name = CLM.L["Head"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-head.blp" },
    { type = "INVTYPE_NECK",            name = CLM.L["Neck"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-neck.blp" },
    { type = "INVTYPE_SHOULDER",        name = CLM.L["Shoulder"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-shoulder.blp" },
    { type = "INVTYPE_BODY",            name = CLM.L["Shirt"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-shirt.blp" },
    { type = "INVTYPE_CLOAK",           name = CLM.L["Back"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_CHEST",           name = CLM.L["Chest"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_ROBE",            name = CLM.L["Chest (robes)"],     icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_TABARD",          name = CLM.L["Tabard"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-tabard.blp" },
    { type = "INVTYPE_WRIST",           name = CLM.L["Wrist"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-wrists.blp" },
    { type = "INVTYPE_HAND",            name = CLM.L["Hands"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-hands.blp" },
    { type = "INVTYPE_WAIST",           name = CLM.L["Waist"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-waist.blp" },
    { type = "INVTYPE_LEGS",            name = CLM.L["Legs"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-legs.blp" },
    { type = "INVTYPE_FEET",            name = CLM.L["Feet"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-feet.blp" },
    { type = "INVTYPE_FINGER",          name = CLM.L["Finger"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-finger.blp" },
    { type = "INVTYPE_TRINKET",         name = CLM.L["Trinket"],           icon = PAPERDOLL .. "Ui-paperdoll-slot-trinket.blp" },
    { type = "INVTYPE_WEAPON",          name = CLM.L["One-Hand"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_WEAPONMAINHAND",  name = CLM.L["Main Hand"],         icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_WEAPONOFFHAND",   name = CLM.L["Off Hand"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_HOLDABLE",        name = CLM.L["Held In Off-hand"],  icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_2HWEAPON",        name = CLM.L["Two-Hand"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_SHIELD",          name = CLM.L["Shield"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_RANGED",          name = CLM.L["Ranged"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-ranged.blp" },
    { type = "INVTYPE_RANGEDRIGHT",     name = CLM.L["Ranged (wands)"],    icon = PAPERDOLL .. "Ui-paperdoll-slot-ranged.blp" },
    { type = "INVTYPE_NON_EQUIP",       name = CLM.L["Non-equippable"],    icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_BAG",             name = CLM.L["Bag"],               icon = PAPERDOLL .. "Ui-paperdoll-slot-bag.blp" },
    { type = "INVTYPE_AMMO",            name = CLM.L["Ammo"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_THROWN",          name = CLM.L["Thrown"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_QUIVER",          name = CLM.L["Quiver"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_RELIC",           name = CLM.L["Relic"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" }
}

CONSTANTS.INVENTORY_TYPES_GUI = {
    [GLOBAL_FAKE_INVENTORY_SLOT] = CLM.L["Global"],
    ["INVTYPE_HEAD"] = CLM.L["Head"],
    ["INVTYPE_NECK"] = CLM.L["Neck"],
    ["INVTYPE_SHOULDER"] = CLM.L["Shoulder"],
    ["INVTYPE_BODY"] = CLM.L["Shirt"],
    ["INVTYPE_CLOAK"] = CLM.L["Back"],
    ["INVTYPE_CHEST"] = CLM.L["Chest"],
    ["INVTYPE_ROBE"] = CLM.L["Chest (robes)"],
    ["INVTYPE_TABARD"] = CLM.L["Tabard"],
    ["INVTYPE_WRIST"] = CLM.L["Wrist"],
    ["INVTYPE_HAND"] = CLM.L["Hands"],
    ["INVTYPE_WAIST"] = CLM.L["Waist"],
    ["INVTYPE_LEGS"] = CLM.L["Legs"],
    ["INVTYPE_FEET"] = CLM.L["Feet"],
    ["INVTYPE_FINGER"] = CLM.L["Finger"],
    ["INVTYPE_TRINKET"] = CLM.L["Trinket"],
    ["INVTYPE_WEAPON"] = CLM.L["One-Hand"],
    ["INVTYPE_WEAPONMAINHAND"] = CLM.L["Main Hand"],
    ["INVTYPE_WEAPONOFFHAND"] = CLM.L["Off Hand"],
    ["INVTYPE_HOLDABLE"] = CLM.L["Held In Off-hand"],
    ["INVTYPE_2HWEAPON"] = CLM.L["Two-Hand"],
    ["INVTYPE_SHIELD"] = CLM.L["Shield"],
    ["INVTYPE_RANGED"] = CLM.L["Ranged"],
    ["INVTYPE_RANGEDRIGHT"] = CLM.L["Ranged (wands)"],
    ["INVTYPE_NON_EQUIP"] = CLM.L["Non-equippable"],
    ["INVTYPE_BAG"] = CLM.L["Bag"],
    ["INVTYPE_AMMO"] = CLM.L["Ammo"],
    ["INVTYPE_THROWN"] = CLM.L["Thrown"],
    ["INVTYPE_QUIVER"] = CLM.L["Quiver"],
    ["INVTYPE_RELIC"] = CLM.L["Relic"]
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
    [CONSTANTS.WEEKLY_RESET.EU] = CLM.L["Europe"],
    [CONSTANTS.WEEKLY_RESET.US] = CLM.L["Americas"]
}

CONSTANTS.ALLOWED_ROUNDINGS = UTILS.Set({
    0, 1, 2
})

CONSTANTS.ALLOWED_ROUNDINGS_GUI = {
    [0] = "1",
    [1] = "0.1",
    [2] = "0.01",
}

CONSTANTS.SLOT_VALUE_TIER = {
    BASE   = "b",
    SMALL  = "s",
    MEDIUM = "m",
    LARGE  = "l",
    MAX    = "x"
}

CONSTANTS.SLOT_VALUE_TIERS = UTILS.Set({
    CONSTANTS.SLOT_VALUE_TIER.BASE,
    CONSTANTS.SLOT_VALUE_TIER.SMALL,
    CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
    CONSTANTS.SLOT_VALUE_TIER.LARGE,
    CONSTANTS.SLOT_VALUE_TIER.MAX
})

CONSTANTS.SLOT_VALUE_TIERS_GUI = {
    ["b"] = CLM.L["Base"],
    ["s"] = CLM.L["Small"],
    ["m"] = CLM.L["Medium"],
    ["l"] = CLM.L["Large"],
    ["x"] = CLM.L["Maximum"],
}