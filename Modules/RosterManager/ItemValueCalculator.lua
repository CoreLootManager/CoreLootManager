-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --


local ItemValueCalculator = {}
function ItemValueCalculator:New()
    local o = {}

    setmetatable(o, self)
    self.__index = self



    return o
end

CONSTANTS.ITEM_VALUE_EQUATION = {
    EPGPWEB = 1,
    WOWPEDIA = 2
}

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


CLM.MODELS.ItemValueCalculator = ItemValueCalculator
