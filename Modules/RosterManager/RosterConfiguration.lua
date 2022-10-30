-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable = setmetatable

local RosterConfiguration = {} -- Roster Configuration
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
    -- Allow going below minimum standings after bidding
    o._.allowBelowMinStandings = false
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
    -- Minimum points to be allowed to bid. >=0 covers Allow Negative Bidders
    o._.minimumPoints = 0
    -- Minimum GP used in calculations when player has less
    o._.minGP = 1
    -- Named Buttons Mode
    o._.namedButtons = false
    -- Dynamic item value
    o._.dynamicValue = false

    return o
end

-- ----------------------- --
-- ADD NEW ONLY AT THE END --
-- ----------------------- --
local function fields()
    return {
        "auctionType",
        "itemValueMode",
        "zeroSumBank",
        "zeroSumBankInflation",
        "auctionTime",
        "antiSnipe",
        "allowBelowMinStandings",
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
        "minimumPoints",
        "minGP",
        "namedButtons",
        "dynamicValue"
    }
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
    allowBelowMinStandings = transform_boolean,
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
    minimumPoints = transform_number,
    minGP = transform_number,
    namedButtons = transform_boolean,
    dynamicValue = transform_boolean
}

function RosterConfiguration:inflate(data)
    for i, key in ipairs(fields()) do
        self._[key] = TRANSFORMS[key](data[i])
    end
end

local validators = {}

local function IsBoolean(value) return type(value) == "boolean" end
local function IsNumeric(value) return type(value) == "number" end
local function IsPositive(value) return value >= 0 end
function validators.auctionType(value) return CONSTANTS.AUCTION_TYPES[value] ~= nil end
function validators.itemValueMode(value) return CONSTANTS.ITEM_VALUE_MODES[value] ~= nil end
function validators.zeroSumBank(value) return IsBoolean(value) end
function validators.allowBelowMinStandings(value) return IsBoolean(value) end
function validators.zeroSumBankInflation(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.auctionTime(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.antiSnipe(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.bossKillBonus(value) return IsBoolean(value) end
function validators.onTimeBonus(value) return IsBoolean(value) end
function validators.onTimeBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.bossKillBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.raidCompletionBonus(value) return IsBoolean(value) end
function validators.raidCompletionBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.intervalBonus(value) return IsBoolean(value) end
function validators.intervalBonusTime(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.intervalBonusValue(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.hardCap(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.weeklyCap(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.weeklyReset(value) return CONSTANTS.WEEKLY_RESETS[value] ~= nil end
function validators.roundDecimals(value) return CONSTANTS.ALLOWED_ROUNDINGS[value] ~= nil end
function validators.minimalIncrement(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.autoBenchLeavers(value) return IsBoolean(value) end
function validators.autoAwardIncludeBench(value) return IsBoolean(value) end
function validators.autoAwardOnlineOnly(value) return IsBoolean(value) end
function validators.autoAwardSameZoneOnly(value) return IsBoolean(value) end
function validators.selfBenchSubscribe(value) return IsBoolean(value) end
function validators.tax(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.minimumPoints(value) return IsNumeric(tonumber(value)) end
function validators.minGP(value) value = tonumber(value); return IsNumeric(value) and IsPositive(value) end
function validators.namedButtons(value) return IsBoolean(value) end
function validators.dynamicValue(value) return IsBoolean(value) end

local function validate(option, value)
    if type(validators[option]) == "function" then
        return validators[option](value)
    end

    return true -- TODO: true or false?
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
        if validate(option, value) then
            self._[option] = TRANSFORMS[option](value)
        end
    end
end



CLM.MODELS.RosterConfiguration = RosterConfiguration
