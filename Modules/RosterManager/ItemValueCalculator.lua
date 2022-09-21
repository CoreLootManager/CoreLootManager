-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pow = math.pow
local GetItemInfo = GetItemInfo

local DEFAULT_MULTIPLIER = {
    epgpweb = 0.483,
    wowpedia = 0.04
}

CONSTANTS.ITEM_VALUE_EQUATION = {
    EPGPWEB = 1,
    WOWPEDIA = 2
}

local equationIDtoParam = {
    [CONSTANTS.ITEM_VALUE_EQUATION.EPGPWEB] = "epgpweb",
    [CONSTANTS.ITEM_VALUE_EQUATION.WOWPEDIA] = "wowpedia",
}

local rarityModifier = {
    [2] = (function(ilvl) return ((ilvl - 4) / 2) end),
    [3] = (function(ilvl) return ((ilvl - 1.84) / 1.6) end),
    [4] = (function(ilvl) return ((ilvl - 1.3) / 1.3) end),
}

local defaultRarityModifier = (function(ilvl) return ilvl end)

local function getItemValue(rarity, ilvl)
    local modifier = rarityModifier[rarity] or defaultRarityModifier
    return modifier(ilvl)
end

local calculators = {
    [CONSTANTS.ITEM_VALUE_EQUATION.EPGPWEB] = (function(ilvl, rarity, multiplier, slot_multiplier)
        return multiplier * pow(2, (ilvl/26) + (rarity - 4)) * slot_multiplier
    end),
    [CONSTANTS.ITEM_VALUE_EQUATION.WOWPEDIA] = (function(ilvl, rarity, multiplier, slot_multiplier)
        return pow(getItemValue(rarity, ilvl), 2) * multiplier * slot_multiplier
    end),
}

local function getParamFromEquationID(id)
    return equationIDtoParam[id] or 0
end

local function GetDefaultMultiplier(equation)
    return DEFAULT_MULTIPLIER[getParamFromEquationID(equation)] or 1.0
end

local function SetDefaultMultiplier(self)
    self.multiplier = GetDefaultMultiplier(self.equation)
end

local function GetDefaultSlotMultiplier(equation, slot)
    local param = getParamFromEquationID(equation)
    local slotValues = CONSTANTS.ITEM_SLOT_MULTIPLIERS[slot] or {}
    return slotValues[param] or 1.0
end

local function SetDefaultSlotMultipliers(self)
    local param = getParamFromEquationID(self.equation)
    for name, values in pairs(CONSTANTS.ITEM_SLOT_MULTIPLIERS) do
        self.slotMultipliers[name] = values[param]
    end
end

local function SetDefaultTierMultipliers(self)
    for _, tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
        self.tierMultipliers[tier] = 1.0
    end
end

local function SetCalculator(self)
    self.calculator = calculators[self.equation]
end

local ItemValueCalculator = {}
function ItemValueCalculator:New()
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.equation = CONSTANTS.ITEM_VALUE_EQUATION.EPGPWEB

    o.multiplier = 1.0
    SetDefaultMultiplier(o)
    o.slotMultipliers = {}
    SetDefaultSlotMultipliers(o)
    o.tierMultipliers = {}
    SetDefaultTierMultipliers(o)

    SetCalculator(o)

    return o
end

function ItemValueCalculator:GetEquation()
    return self.equation
end

function ItemValueCalculator:SetEquation(equation)
    if not CONSTANTS.ITEM_VALUE_EQUATIONS[equation] then
        LOG:Fatal("Unknown equation type")
        return
    end
    if self.equation == equation then return end
    self.equation = equation
    SetDefaultMultiplier(self)
    SetDefaultSlotMultipliers(self)
    SetCalculator(self)
end

function ItemValueCalculator:GetMultiplier()
    return self.multiplier
end

function ItemValueCalculator:SetMultiplier(multiplier)
    self.multiplier = tonumber(multiplier) or GetDefaultMultiplier(self.equation)
end

function ItemValueCalculator:GetSlotMultiplier(slot)
    return self.slotMultipliers[slot] or 1.0
end

function ItemValueCalculator:SetSlotMultiplier(slot, multiplier)
    if not CONSTANTS.ITEM_SLOT_MULTIPLIERS[slot] then return end
    self.slotMultipliers[slot] = tonumber(multiplier) or GetDefaultSlotMultiplier(self.equation, slot)
end

function ItemValueCalculator:GetTierMultiplier(tier)
    return self.tierMultipliers[tier] or 1.0
end

function ItemValueCalculator:SetTierMultiplier(tier, multiplier)
    if not CONSTANTS.SLOT_VALUE_TIERS[tier] then return end
    self.tierMultipliers[tier] = tonumber(multiplier) or 1.0
end

function ItemValueCalculator:Calculate(itemId, rounding)
    local values = {}

    local _, _, itemQuality, itemLevel, _, _, _,_, itemEquipLoc = GetItemInfo(itemId)
    if not itemQuality or not itemLevel or not itemEquipLoc then
        LOG:Warning(CLM.L["Unable to get item info from server. Please try auctioning again"])
        return nil
    end

    local baseValue = self.calculator(
        CLM.IndirectMap.ilvl[itemId] or itemLevel, itemQuality,
        self.multiplier, self:GetSlotMultiplier(CLM.IndirectMap.slot[itemId] or itemEquipLoc))
    for tier, tierMultiplier in pairs(self.tierMultipliers) do
        values[tier] = UTILS.round(baseValue * tierMultiplier, rounding)
    end

    return values
end

CONSTANTS.ITEM_VALUE_EQUATIONS = UTILS.Set({
    CONSTANTS.ITEM_VALUE_EQUATION.EPGPWEB,
    CONSTANTS.ITEM_VALUE_EQUATION.WOWPEDIA,
})

CONSTANTS.ITEM_VALUE_EQUATIONS_ORDERED = {
    CONSTANTS.ITEM_VALUE_EQUATION.EPGPWEB,
    CONSTANTS.ITEM_VALUE_EQUATION.WOWPEDIA,
}

CONSTANTS.ITEM_VALUE_EQUATIONS_GUI = {
    [CONSTANTS.ITEM_VALUE_EQUATION.EPGPWEB] = CLM.L["EPGP WEB"],
    [CONSTANTS.ITEM_VALUE_EQUATION.WOWPEDIA] = CLM.L["Wowpedia"],
}

CONSTANTS.ITEM_SLOT_MULTIPLIERS = {
    ["INVTYPE_HEAD"] = {            epgpweb = 1.0,  wowpedia = 1.0},
    ["INVTYPE_NECK"] = {            epgpweb = 0.5,  wowpedia = 0.55},
    ["INVTYPE_SHOULDER"] = {        epgpweb = 0.75,  wowpedia = 0.777},
    ["INVTYPE_BODY"] = {            epgpweb = 0.0,  wowpedia = 0.0},
    ["INVTYPE_CLOAK"] = {           epgpweb = 0.5,  wowpedia = 0.55},
    ["INVTYPE_CHEST"] = {           epgpweb = 1.0,  wowpedia = 1.0},
    ["INVTYPE_ROBE"] = {            epgpweb = 1.0,  wowpedia = 1.0},
    ["INVTYPE_TABARD"] = {          epgpweb = 0.0,  wowpedia = 0.0},
    ["INVTYPE_WRIST"] = {           epgpweb = 0.75,  wowpedia = 0.55},
    ["INVTYPE_HAND"] = {            epgpweb = 0.75,  wowpedia = 0.777},
    ["INVTYPE_WAIST"] = {           epgpweb = 1.0,  wowpedia = 0.777},
    ["INVTYPE_LEGS"] = {            epgpweb = 1.0,  wowpedia = 1.0},
    ["INVTYPE_FEET"] = {            epgpweb = 0.75,  wowpedia = 0.777},
    ["INVTYPE_FINGER"] = {          epgpweb = 0.5,  wowpedia = 0.55},
    ["INVTYPE_TRINKET"] = {         epgpweb = 0.75,  wowpedia = 0.7},
    ["INVTYPE_WEAPON"] = {          epgpweb = 1.0,  wowpedia = 1.0},
    ["INVTYPE_WEAPONMAINHAND"] = {  epgpweb = 1.5,  wowpedia = 0.42},
    ["INVTYPE_WEAPONOFFHAND"] = {   epgpweb = 1.5,  wowpedia = 0.42},
    ["INVTYPE_HOLDABLE"] = {        epgpweb = 0.5,  wowpedia = 0.55},
    ["INVTYPE_2HWEAPON"] = {        epgpweb = 2.0,  wowpedia = 1.0},
    ["INVTYPE_SHIELD"] = {          epgpweb = 0.5,  wowpedia = 0.55},
    ["INVTYPE_RANGED"] = {          epgpweb = 0.5,  wowpedia = 0.42},
    ["INVTYPE_RANGEDRIGHT"] = {     epgpweb = 0.5,  wowpedia = 0.42},
    ["INVTYPE_NON_EQUIP"] = {       epgpweb = 0.0,  wowpedia = 0.0},
    ["INVTYPE_BAG"] = {             epgpweb = 0.0,  wowpedia = 0.0},
    ["INVTYPE_AMMO"] = {            epgpweb = 0.0,  wowpedia = 0.0},
    ["INVTYPE_THROWN"] = {          epgpweb = 0.5,  wowpedia = 0.42},
    ["INVTYPE_QUIVER"] = {          epgpweb = 0.5,  wowpedia = 0.42},
    ["INVTYPE_RELIC"] = {           epgpweb = 0.5,  wowpedia = 0.42}
}

CLM.MODELS.ItemValueCalculator = ItemValueCalculator
