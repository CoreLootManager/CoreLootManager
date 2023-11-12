-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local handledLootRolls = {}

local function Handler(_, _, rollID, rollTime, lootHandle)
    handledLootRolls[rollID] = nil
    -- CLM Raid status check
    if not CLM.MODULES.RaidManager:IsInProgressingRaid() then
        return
    end

    -- Is In raid instance check
    local inInstance, instanceType = IsInInstance()
    if not inInstance or (instanceType ~= "raid") then
        return
    end

    -- Early exit on ignore
    if CLM.GlobalConfigs:GetRollType() == CONSTANTS.LOOT_ROLL_TYPE_IGNORE then
        return
    end

    -- Per item checks
    local itemLink = GetLootRollItemLink(rollID)
    if not itemLink then
        return
    end
    local _, _, itemQuality, _, _, _, _, itemStackCount, _, _, _, classID, _, _ = GetItemInfo(itemLink)

    local isLegendary = ((itemQuality or 0) >= 5)
    local isStacking  = ((itemStackCount or 0) > 1)
    local isPattern   = (classID == LE_ITEM_CLASS_RECIPE)
    local isQuestItem = (classID == LE_ITEM_CLASS_QUESTITEM)

    -- Ignore all quest items
    if isQuestItem then
        return
    end

    -- Check specific item infos
    if isLegendary and not CLM.GlobalConfigs:GetLootRollIncludeLegendary() then
        return
    end

    if isStacking and not CLM.GlobalConfigs:GetLootRollIncludeStacking() then
        return
    end

    if isPattern and not CLM.GlobalConfigs:GetLootRollIncludePatterns() then
        return
    end

    -- Roll
    RollOnLoot(rollID, CLM.GlobalConfigs:GetRollType())
    handledLootRolls[rollID] = true
end

local function AutoConfirm(_, _, rollID, roll)
    -- AutoConfirm only auto handled rolls
    if not handledLootRolls[rollID] then return end
    ConfirmLootRoll(rollID, roll)
    StaticPopup_Hide("CONFIRM_LOOT_ROLL")
end

local GlobalUIHandlers = {}
function GlobalUIHandlers:Initialize()
    CLM.MODULES.EventManager:RegisterWoWEvent({"START_LOOT_ROLL"}, Handler)
    CLM.MODULES.EventManager:RegisterWoWEvent({"CONFIRM_LOOT_ROLL"}, AutoConfirm)
end
CLM.GlobalUIHandlers = GlobalUIHandlers
