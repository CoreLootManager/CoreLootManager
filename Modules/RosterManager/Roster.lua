-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs, tonumber = pairs, ipairs, tonumber
local mmax = math.max

local weekOffsetEU = UTILS.GetWeekOffsetEU()
local weekOffsetUS = UTILS.GetWeekOffsetUS()


local GLOBAL_FAKE_INVENTORY_SLOT = "_GLOBAL"

local function fillSlotsArray(array)
    for key,_ in pairs(CONSTANTS.SLOT_VALUE_TIERS) do
        array[key] = 0
    end
end

local function lazyCreateSlot(self, itemEquipLoc)
    if self.defaultSlotValues[itemEquipLoc] then return end
    self.defaultSlotValues[itemEquipLoc] = {}
    for key,_ in pairs(CONSTANTS.SLOT_VALUE_TIERS) do
        self.defaultSlotValues[itemEquipLoc][key] = self.defaultSlotValues[GLOBAL_FAKE_INVENTORY_SLOT][key]
    end
end

local function lazyCreateItem(self, itemId)
    if self.itemValues[itemId] then return end
    self.itemValues[itemId] = {}
    fillSlotsArray(self.itemValues[itemId])
end

local Roster = {} -- Roster information
function Roster:New(uid, pointType, raidsForFullAttendance, attendanceWeeksWindow)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- CONFIGURATION --
    o.uid  = tonumber(uid)
    o.pointType = pointType
    o.configuration  = CLM.MODELS.RosterConfiguration:New()
    o.defaultSlotValues = { [GLOBAL_FAKE_INVENTORY_SLOT] = {} }
    fillSlotsArray(o.defaultSlotValues[GLOBAL_FAKE_INVENTORY_SLOT])
    o.fieldNames = {}
    o.itemValues = {}
    -- Boss Kill Bonus values
    o.bossKillBonusValues = {}
    for id,_ in pairs(CLM.DifficultyIDsMap) do
        o.bossKillBonusValues[id] = {}
    end
    -- END CONFIGURATION --

    -- ROSTER STATE --
    o.inRoster = {}             -- Profile is at all in roster
    o.standings = {}            -- Profile standing in roster (dict)
    o.pointInfo = {}            -- Profile point info
    o.attendanceTracker = CLM.MODELS.AttendanceTracker:New(
       raidsForFullAttendance, attendanceWeeksWindow) -- Profile attendance in roster (dict)
    o.pointHistory = {}         -- Point changes in  roster (list)
    o.profilePointHistory = {}  -- Point changes in to players in roster (dict of lists)
    o.raidLoot = {}             -- Loot received in the roster (list). Time descending
    o.profileLoot = {}          -- Loot received by players (dict of lists). Time descending per player
    o.weeklyGains = {}          -- Weekly point gains per player
    o.calculator = CLM.MODELS.ItemValueCalculator:New() -- Dynamic item value calculator
    -- END ROSTER STATE --

    return o
end

function Roster:GetPointType()
    return self.pointType
end

function Roster:GetCalculator()
    return self.calculator
end

function Roster:AddProfileByGUID(GUID)
    LOG:Debug("Add profile [%s] to roster [%s]", GUID, self:UID())
    if self:IsProfileInRoster(GUID) then return end
    self.standings[GUID] = 0
    self.weeklyGains[GUID] = {}
    self.profileLoot[GUID] = {}
    self.profilePointHistory[GUID] = {}
    self.inRoster[GUID] = true
    self.pointInfo[GUID] = CLM.MODELS.PointInfo:New()
    if self:GetPointType() == CONSTANTS.POINT_TYPE.EPGP then
        self.pointInfo[GUID].spent = self.configuration._.minGP
    end
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
    return UTILS.keys(self.inRoster)
end

function Roster:Standings(GUID)
    if GUID == nil then
        return self.standings or {}
    else
        return self.standings[GUID] or 0
    end
end

function Roster:GP(GUID)
    local pointInfo = self.pointInfo[GUID]
    if not pointInfo then return -1 end
    -- return mmax(pointInfo.spent, self.configuration._.minGP)
    return pointInfo.spent
end

function Roster:Priority(GUID)
    if GUID == nil then
        return 0
    else
        return UTILS.round((self.standings[GUID] or 0) / self:GP(GUID), self.configuration._.roundDecimals)
    end
end

--[[
 *****************
 * Weekly Values *
 *****************
]]--

function Roster:GetAllWeeklyGains()
    return self.weeklyGains or {}
end


function Roster:GetWeeklyGainsForPlayer(GUID)
    return self.weeklyGains[GUID] or {}
end

function Roster:GetCurrentGainsForPlayer(GUID)
    local week = UTILS.WeekNumber(GetServerTime(), (self.configuration._.weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS)
    return self:GetWeeklyGainsForPlayerWeek(GUID, week)
end

function Roster:GetPointInfoForPlayer(GUID)
    return self.pointInfo[GUID] or CLM.MODELS.PointInfo:New()
end

function Roster:GetWeeklyGainsForPlayerWeek(GUID, week)
    local weeklyGains = self.weeklyGains[GUID]
    if not weeklyGains then
        self.weeklyGains[GUID] = {}
    end
    return self.weeklyGains[GUID][week] or 0
end

--[[
 **************************
 * Standings manipulation *
 **************************
]]--

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
        week = UTILS.WeekNumber(timestamp, (self.configuration._.weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS)
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
    value = UTILS.round(value, self.configuration._.roundDecimals)
    if isPointGain then
        self.weeklyGains[GUID][week] = self:GetWeeklyGainsForPlayerWeek(GUID, week) + value
    end
    self.standings[GUID] = standings + value
    self.pointInfo[GUID]:AddReceived(value)
    self.pointInfo[GUID]:AddBlocked(originalValue - value)
end

function Roster:UpdateSpent(GUID, value)
    LOG:Debug("Roster:UpdateSpent(%s, %s, %s)", GUID, self.uid, value)
    local new = UTILS.round(self.pointInfo[GUID].spent + value, self.configuration._.roundDecimals)
    -- Handle the spent update
    self.pointInfo[GUID].spent = mmax(new, self.configuration._.minGP)
end

function Roster:SetStandings(GUID, value)
    self.standings[GUID] = UTILS.round(value, self.configuration._.roundDecimals)
end

function Roster:SetSpent(GUID, value)
    self.pointInfo[GUID].spent = UTILS.round(value, self.configuration._.roundDecimals)
end

function Roster:DecayStandings(GUID, value)
    local new = UTILS.round(((self:Standings(GUID) * (100 - value)) / 100), self.configuration._.roundDecimals)
    self.pointInfo[GUID]:AddDecayed(self.standings[GUID] - new)
    self.standings[GUID] = new

    -- Spent in EPGP = GP -> thus needs to be decayed also
    if self:GetPointType() == CONSTANTS.POINT_TYPE.EPGP then
        new = UTILS.round(((self.pointInfo[GUID].spent * (100 - value)) / 100), self.configuration._.roundDecimals)
        self.pointInfo[GUID].spent = mmax(new, self.configuration._.minGP)
    end

end

--[[
 *************
 * Mirroring *
 *************
]]--

local function mirrorStandings(self, source, target)
    if source == target then return end -- to prevent circular updates
    if not self.standings[target] then return end
    self.standings[target] = self.standings[source]
    self.pointInfo[target].spent = self.pointInfo[source].spent
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

--[[
 ***************
 * Slot Values *
 ***************
]]--

function Roster:SetDefaultSlotTierValue(itemEquipLoc, tier, value)
    LOG:Debug("Set Default Slot Tier Value: [%s]: [%s] [%s] for roster [%s]", itemEquipLoc, tier, value, self:UID())
    if not itemEquipLoc or not CONSTANTS.INVENTORY_TYPES_SET[itemEquipLoc] then return end
    if not tier or not CONSTANTS.SLOT_VALUE_TIERS[tier] then return end
    lazyCreateSlot(self, itemEquipLoc)

    if itemEquipLoc ~= GLOBAL_FAKE_INVENTORY_SLOT then
        local new = UTILS.ShallowCopy(self:GetDefaultSlotValues(itemEquipLoc))
        new[tier] = value
        local allSame = true
        for key,val in pairs(self:GetDefaultSlotValues(GLOBAL_FAKE_INVENTORY_SLOT)) do
            if val ~= new[key] then
                allSame = false
            end
        end
        if allSame then
            self:ClearDefaultSlotValue(itemEquipLoc)
            return
        end
    end

    self.defaultSlotValues[itemEquipLoc][tier] = tonumber(value) or 0
end

function Roster:GetDefaultSlotTierValue(itemEquipLoc, tier)
    if not itemEquipLoc or not CONSTANTS.INVENTORY_TYPES_SET[itemEquipLoc] then
        itemEquipLoc = GLOBAL_FAKE_INVENTORY_SLOT
    end
    if not tier or not CONSTANTS.SLOT_VALUE_TIERS[tier] then return 0 end
    local values = self.defaultSlotValues[itemEquipLoc] or self.defaultSlotValues[GLOBAL_FAKE_INVENTORY_SLOT]
    return values[tier]
end

function Roster:GetDefaultSlotValues(itemEquipLoc)
    if not itemEquipLoc or not CONSTANTS.INVENTORY_TYPES_SET[itemEquipLoc] then
        itemEquipLoc = GLOBAL_FAKE_INVENTORY_SLOT
    end
    return self.defaultSlotValues[itemEquipLoc] or self.defaultSlotValues[GLOBAL_FAKE_INVENTORY_SLOT]
end

function Roster:ClearDefaultSlotValue(itemEquipLoc)
    LOG:Debug("Clear Default Slot Value: [%s] for roster [%s]", itemEquipLoc, self:UID())
    self.defaultSlotValues[itemEquipLoc] = nil
end

--[[
 ***************
 * Item Values *
 ***************
]]--

function Roster:GetAllItemValues()
    return self.itemValues or {}
end

function Roster:SetItemTierValue(itemId, tier, value)
    LOG:Debug("Set Item Tier Value: [%s]: [%s] [%s] for roster [%s]", itemId, tier, value, self:UID())
    lazyCreateItem(self, itemId)
    self.itemValues[itemId][tier] = tonumber(value) or 0
    self:SetItemValues(itemId, self.itemValues[itemId])
end

function Roster:SetItemValues(itemId, values)
    LOG:Debug("Set Item Tier Values: [%s]: for roster [%s]", itemId, self:UID())
    lazyCreateItem(self, itemId)

    local _, _, _, itemEquipLoc = GetItemInfoInstant(itemId)

    local allSame = true
    for key,value in pairs(self:GetDefaultSlotValues(itemEquipLoc)) do
        if value ~= values[key] then
            allSame = false
        end
    end
    if allSame then
        self:ClearItemValues(itemId)
    else
        for key,_ in pairs(CONSTANTS.SLOT_VALUE_TIERS) do
            self.itemValues[itemId][key] = values[key] or 0
        end
    end
end

function Roster:ClearItemValues(itemId)
    LOG:Debug("Clear Item Value: [%s] for roster [%s]", itemId, self:UID())
    self.itemValues[itemId] = nil
end

local invtypeWorkaround = {
    [2] = {
        [3] = "INVTYPE_RANGED", -- Weapon Guns
        [18] = "INVTYPE_RANGED",-- Weapon Crossbow
    }
}

local function GetInvType(class, subclass)
    local classTable = invtypeWorkaround[class] or {}
    return classTable[subclass]
end

function Roster:GetItemValues(itemId)
    local itemValues = self.itemValues[itemId]
    if itemValues == nil then
        local _, _, _, itemEquipLoc, _, classID, subclassID = GetItemInfoInstant(itemId)
        local equipLoc = GetInvType(classID, subclassID) or itemEquipLoc
        if self.configuration._.dynamicValue then
            local dynamicValues = self.calculator:Calculate(itemId, self.configuration._.roundDecimals)
            if dynamicValues then return dynamicValues end
        end
        return self:GetDefaultSlotValues(CLM.IndirectMap.slot[itemId] or equipLoc)
    end
    return itemValues
end

--[[
 *****************
 * Configuration *
 *****************
]]--

function Roster:GetConfiguration(option)
    return self.configuration:Get(option)
end

function Roster:SetConfiguration(option, value)
    self.configuration:Set(option, value)
    if option == "weeklyReset" then
        self.attendanceTracker:UpdateWeeklyReset(value)
    elseif option == "minGP" then
        for GUID, pointInfo in pairs(self.pointInfo) do
            self.pointInfo[GUID].spent = mmax(pointInfo.spent, self.configuration._.minGP)
        end
    end
end

function Roster:GetFieldName(field)
    if not CONSTANTS.SLOT_VALUE_TIERS[field] then
        LOG:Debug("Roster:GetFieldName(): Unknown field %s", field)
    end
    return self.fieldNames[field] or ""
end

function Roster:SetFieldName(field, name)
    if not CONSTANTS.SLOT_VALUE_TIERS[field] then
        LOG:Error("Roster:SetFieldName(): Unknown field %s", field)
        return
    end

    self.fieldNames[field] = name
end

--[[
 ********
 * Wipe *
 ********
]]--

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

function Roster:WipeHistory()
    LOG:Info("Wipe Standings for roster [%s]", self:UID())
    for GUID,_ in pairs(self.standings) do
        self.profilePointHistory[GUID] = {}
    end
    self.pointHistory = {}
end

--[[
 ****************************
 * History (Point and Loot) *
 ****************************
]]--

function Roster:AddLoot(loot, profile)
    -- History store
    local GUID = profile:GUID()
    self.profileLoot[GUID][#self.profileLoot[GUID]+1] = loot
    self.raidLoot[#self.raidLoot+1] = loot
    if profile:IsLocked() then return end
    self.pointInfo[GUID]:AddSpent(loot:Value())
    if self:GetPointType() == CONSTANTS.POINT_TYPE.DKP then
        -- Charging for the item
        self:UpdateStandings(GUID, -loot:Value(), 0)
        -- Correct for the spending since it will be subtracted in update standings
        self.pointInfo[GUID]:AddReceived(loot:Value())
    end
end

function Roster:GetRaidLoot()
    return self.raidLoot or {}
end

function Roster:GetProfileLootByGUID(GUID)
    return self.profileLoot[GUID] or {}
end

function Roster:AddProfilePointHistory(history, profile)
    self.profilePointHistory[profile:GUID()][#self.profilePointHistory[profile:GUID()]+1] = history
end

function Roster:AddRosterPointHistory(history)
    self.pointHistory[#self.pointHistory+1] = history
end

function Roster:GetRaidPointHistory()
    return self.pointHistory or {}
end

function Roster:GetProfilePointHistoryByGUID(GUID)
    return self.profilePointHistory[GUID] or {}
end

--[[
 *******************
 * Boss kill Bonus *
 *******************
]]--

function Roster:SetBossKillBonusValue(encounterId, difficultyId, value)
    LOG:Debug("Roster:SetBossKillBonusValue() Trying to set encounterId: %s difficultyId: %s value: %s", encounterId, difficultyId, value)
    self.bossKillBonusValues[difficultyId][encounterId] = tonumber(value)
end

function Roster:GetBossKillBonusValue(encounterId, difficultyId)
    return self.bossKillBonusValues[difficultyId or -1][encounterId] or self.configuration._.bossKillBonusValue
end

--[[
 ***********
 * Copying *
 ***********
]]--

function Roster:CopyItemValues(s)
    self.itemValues = UTILS.DeepCopy(s.itemValues)
end

function Roster:CopyDefaultSlotValues(s)
    self.defaultSlotValues = UTILS.DeepCopy(s.defaultSlotValues)
end

function Roster:CopyConfiguration(s)
    self.configuration = CLM.MODELS.RosterConfiguration:New(UTILS.DeepCopy(s.configuration))
    self.bossKillBonusValues = UTILS.DeepCopy(s.bossKillBonusValues)
    -- TODO: calculator coefficients copy?
end

function Roster:CopyProfiles(s)
    for _, GUID in ipairs(s:Profiles()) do
        if not self:IsProfileInRoster(GUID) then
            self:AddProfileByGUID(GUID)
        end
    end
end

--[[
 **************
 * Attendance *
 **************
]]--

function Roster:UpdateAttendance(GUID, raidId, timestamp)
    self.attendanceTracker:Update(GUID, raidId, timestamp)
end

function Roster:GetAttendance(GUID)
    return self.attendanceTracker:Get(GUID)
end

CLM.MODELS.Roster = Roster

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

CONSTANTS.AUCTION_TYPES_EPGP_GUI = {
    [CONSTANTS.AUCTION_TYPE.OPEN] = CLM.L["Open"],
    [CONSTANTS.AUCTION_TYPE.SEALED] = CLM.L["Sealed"],
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

CONSTANTS.ITEM_VALUE_MODES_EPGP_GUI = {
    [CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED] = CLM.L["Single-Priced"],
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
    { type = GLOBAL_FAKE_INVENTORY_SLOT,    name = CLM.L["Global"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_HEAD",                name = CLM.L["Head"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-head.blp" },
    { type = "INVTYPE_NECK",                name = CLM.L["Neck"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-neck.blp" },
    { type = "INVTYPE_SHOULDER",            name = CLM.L["Shoulder"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-shoulder.blp" },
    { type = "INVTYPE_BODY",                name = CLM.L["Shirt"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-shirt.blp" },
    { type = "INVTYPE_CLOAK",               name = CLM.L["Back"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_CHEST",               name = CLM.L["Chest"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_ROBE",                name = CLM.L["Chest (robes)"],     icon = PAPERDOLL .. "Ui-paperdoll-slot-chest.blp" },
    { type = "INVTYPE_TABARD",              name = CLM.L["Tabard"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-tabard.blp" },
    { type = "INVTYPE_WRIST",               name = CLM.L["Wrist"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-wrists.blp" },
    { type = "INVTYPE_HAND",                name = CLM.L["Hands"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-hands.blp" },
    { type = "INVTYPE_WAIST",               name = CLM.L["Waist"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-waist.blp" },
    { type = "INVTYPE_LEGS",                name = CLM.L["Legs"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-legs.blp" },
    { type = "INVTYPE_FEET",                name = CLM.L["Feet"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-feet.blp" },
    { type = "INVTYPE_FINGER",              name = CLM.L["Finger"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-finger.blp" },
    { type = "INVTYPE_TRINKET",             name = CLM.L["Trinket"],           icon = PAPERDOLL .. "Ui-paperdoll-slot-trinket.blp" },
    { type = "INVTYPE_WEAPON",              name = CLM.L["One-Hand"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_WEAPONMAINHAND",      name = CLM.L["Main Hand"],         icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_WEAPONOFFHAND",       name = CLM.L["Off Hand"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_HOLDABLE",            name = CLM.L["Held In Off-hand"],  icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_2HWEAPON",            name = CLM.L["Two-Hand"],          icon = PAPERDOLL .. "Ui-paperdoll-slot-mainhand.blp" },
    { type = "INVTYPE_SHIELD",              name = CLM.L["Shield"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-secondaryhand.blp" },
    { type = "INVTYPE_RANGED",              name = CLM.L["Ranged"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-ranged.blp" },
    { type = "INVTYPE_RANGEDRIGHT",         name = CLM.L["Ranged (wands)"],    icon = PAPERDOLL .. "Ui-paperdoll-slot-ranged.blp" },
    { type = "INVTYPE_NON_EQUIP",           name = CLM.L["Non-equippable"],    icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_BAG",                 name = CLM.L["Bag"],               icon = PAPERDOLL .. "Ui-paperdoll-slot-bag.blp" },
    { type = "INVTYPE_AMMO",                name = CLM.L["Ammo"],              icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_THROWN",              name = CLM.L["Thrown"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_QUIVER",              name = CLM.L["Quiver"],            icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" },
    { type = "INVTYPE_RELIC",               name = CLM.L["Relic"],             icon = PAPERDOLL .. "Ui-paperdoll-slot-relic.blp" }
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
    ["x"] = CLM.L["Max"],
}

CONSTANTS.SLOT_VALUE_TIERS_ORDERED = {
    CONSTANTS.SLOT_VALUE_TIER.BASE,
    CONSTANTS.SLOT_VALUE_TIER.SMALL,
    CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
    CONSTANTS.SLOT_VALUE_TIER.LARGE,
    CONSTANTS.SLOT_VALUE_TIER.MAX
}

CONSTANTS.SLOT_VALUE_TIERS_ORDERED_REVERSED = {
    CONSTANTS.SLOT_VALUE_TIER.MAX,
    CONSTANTS.SLOT_VALUE_TIER.LARGE,
    CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
    CONSTANTS.SLOT_VALUE_TIER.SMALL,
    CONSTANTS.SLOT_VALUE_TIER.BASE
}