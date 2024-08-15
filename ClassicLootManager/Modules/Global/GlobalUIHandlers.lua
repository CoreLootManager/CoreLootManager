-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local ignoredItems = UTILS.Set({
    50226, -- Festergut's Acidic Blood
    50231, -- Rotface's Acidic Blood
    52019, -- Precious's Ribbon
    22726, -- Splinter of Atiesh
    30183, -- Nether Vortex
    23572, -- Primal Nether
    12662, -- Demonic Rune
    209035, -- Hearthstone of the Flame
})

local handledLootRolls = {}

local function Handler(_, _, rollID, rollTime, lootHandle)
    handledLootRolls[rollID] = nil

    -- Ignore handling in case of master looter being out of range
    if GetLootMethod() == "master" then
        return
    end

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

    -- Do not handle ignored items
    local itemId = UTILS.GetItemIdFromLink(itemLink)
    if ignoredItems[itemId] then
        return
    end

    -- Get specific checks info
    local _, _, itemQuality, _, _, _, _, itemStackCount, _, _, _, classID, _, _ = UTILS.GetItemInfo(itemLink)
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

    -- Handle ordered Any case
    if CLM.GlobalConfigs:GetRollType() == CONSTANTS.LOOT_ROLL_TYPE_ANY then
        local _, _, _, _, _, canNeed, canGreed, canDisenchant, _, _, _, _, canTransmog = GetLootRollItemInfo(rollID)
        local rollValue
        if CLM.WoW10 or CLM.WoWCata then
            if canNeed then
                rollValue = LOOT_ROLL_TYPE_NEED
            elseif canTransmog then
                rollValue = CONSTANTS.LOOT_ROLL_TYPE_TRANSMOG
            elseif canGreed then
                rollValue = LOOT_ROLL_TYPE_GREED
            elseif canDisenchant then
                rollValue = LOOT_ROLL_TYPE_DISENCHANT
            else
                rollValue = LOOT_ROLL_TYPE_PASS
            end
        else
            if canNeed then
                rollValue = LOOT_ROLL_TYPE_NEED
            elseif canGreed then
                rollValue = LOOT_ROLL_TYPE_GREED
            else
                rollValue = LOOT_ROLL_TYPE_PASS
            end
        end
        RollOnLoot(rollID, rollValue)
    else -- Just roll what is selected
        RollOnLoot(rollID, CLM.GlobalConfigs:GetRollType())
    end
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
