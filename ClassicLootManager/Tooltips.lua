-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local CLM_ICON_DARK = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-dark-32.png"

local function formatPriceText(values, itemValueMode)
    local text = ""
    if itemValueMode == CONSTANTS.ITEM_VALUE_MODE.TIERED then
        local valueAlreadyShowed = {}
        for _, tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
            local value = values[tier]
            if not valueAlreadyShowed[value] then
                text = text .. tostring(values[tier]) .. ", "
                valueAlreadyShowed[value] = true
            end
        end
    elseif itemValueMode == CONSTANTS.ITEM_VALUE_MODE.SINGLE_PRICED then
        text = tostring(values[CONSTANTS.SLOT_VALUE_TIER.BASE])
    elseif  itemValueMode == CONSTANTS.ITEM_VALUE_MODE.ASCENDING then
        local base = values[CONSTANTS.SLOT_VALUE_TIER.BASE]
        local max = values[CONSTANTS.SLOT_VALUE_TIER.MAX]

        local hasBase = (base > 0)
        local hasMax = (max > 0)
        if hasBase and hasMax then
            text = tostring(base) .. " - " .. tostring(max)
        elseif hasBase then
            text = ">= " .. tostring(base)
        elseif hasMax then
            text = "<= " .. tostring(max)
        else
            text = CLM.L["Any"]
        end
    end
    return UTILS.Trim(text)
end

local isEquipable = UTILS.Set({
    "INVTYPE_HEAD",
    "INVTYPE_NECK",
    "INVTYPE_SHOULDER",
    "INVTYPE_CLOAK",
    "INVTYPE_CHEST",
    "INVTYPE_ROBE",
    "INVTYPE_WRIST",
    "INVTYPE_HAND",
    "INVTYPE_WAIST",
    "INVTYPE_LEGS",
    "INVTYPE_FEET",
    "INVTYPE_FINGER",
    "INVTYPE_TRINKET",
    "INVTYPE_WEAPON",
    "INVTYPE_WEAPONMAINHAND",
    "INVTYPE_WEAPONOFFHAND",
    "INVTYPE_HOLDABLE",
    "INVTYPE_2HWEAPON",
    "INVTYPE_SHIELD",
    "INVTYPE_RANGED",
    "INVTYPE_RANGEDRIGHT",
    "INVTYPE_THROWN",
    "INVTYPE_RELIC",
})

local isSpecial = UTILS.Set({
    -- ToGC tokens have no equiploc
    -- We are faking them as Non-equippable INVTYPE
    -- and we want to display data for them
    47242, 47557, 47558, 47559,
    -- ICC items
    52025, 52026, 52027, 52028, 52029, 52030,
    -- SoD
    220636, 220637,
    -- Cata
    66998,
})

local function addItemPriceToTooltip(tooltip)
    -- Sanity Check
    local itemLink
    if not tooltip then return end
    if tooltip.GetItem then
        _, itemLink = tooltip:GetItem()
    else
        _,itemLink = TooltipUtil.GetDisplayedItem(tooltip)
    end
    if not itemLink then return end
    local itemId = UTILS.GetItemIdFromLink(itemLink)
    if itemId == 0 then return end
    if not isSpecial[itemId] then
        local _, _, _, itemEquipLoc, _, class, subclass = GetItemInfoInstant(itemId)
        itemEquipLoc = UTILS.WorkaroundEquipLoc(class, subclass, itemEquipLoc)
        if not isEquipable[CLM.IndirectMap.slot[itemId] or itemEquipLoc] then
            return
        end
    end
    if not CLM.MODULES.RaidManager:IsInitialized() then return end
    local raid = CLM.MODULES.RaidManager:GetRaid()
    local rosters = raid and {
        [CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID())] = raid:Roster()
    } or CLM.MODULES.RosterManager:GetRosters()
    if not raid and not CLM.GlobalConfigs:GetPriceTooltip() then return end
    for name, roster in pairs(rosters) do
        -- Gather
        local display = raid and true or CLM.MODULES.RosterManager:GetDisplayTooltip(roster:UID())
        if display then
            local values = roster:GetItemValuesFromItemLink(itemLink)
            local isEPGP = roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP
            local itemValueMode = roster:GetConfiguration("itemValueMode")
            -- Format
            local priceText = formatPriceText(values, itemValueMode)
            -- Set tooltip
            if strlen(priceText) > 0 then
                local rosterName = name
                tooltip:AddDoubleLine(rosterName, UTILS.ColorCodeText(priceText, "ffffff") .. " " .. (isEPGP and CLM.L["GP"] or CLM.L["DKP"]))
                tooltip:AddTexture(CLM_ICON_DARK)
            end
        end
    end
end

if CLM.WoW10 then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, addItemPriceToTooltip)
else
    LibStub("AceConfigDialog-3.0").tooltip:HookScript("OnTooltipSetItem", addItemPriceToTooltip)
    GameTooltip:HookScript("OnTooltipSetItem", addItemPriceToTooltip)
    ItemRefTooltip:HookScript("OnTooltipSetItem", addItemPriceToTooltip)
end