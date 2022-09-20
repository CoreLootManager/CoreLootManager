-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local function formatPriceText(values, auctionType, itemValueMode)
    local text = ""
    for _, tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
        text = text .. tostring(values[tier]) .. ", "
    end
    return UTILS.Trim(text)
end

local function addItemPriceToTooltip(tooltip)
    -- Sanity Check
    local _, itemLink = GameTooltip:GetItem()
    if not itemLink then return end
    local itemId = UTILS.GetItemIdFromLink(itemLink)
    if itemId == 0 then return end
    if not CLM.GlobalConfigs:GetPriceTooltip() then return end
    local defaultRoster = CLM.MODULES.RosterManager:GetRosterByUid(CLM.GlobalConfigs:GetPriceTooltipDefaultRoster())
    local raid = CLM.MODULES.RaidManager:GetRaid()
    local roster = raid and raid:Roster() or defaultRoster
    if not roster then return end
    -- Gather
    local values = roster:GetItemValues(itemId)
    local isEPGP = roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP
    local auctionType = roster:GetConfiguration("auctionType")
    local itemValueMode = roster:GetConfiguration("itemValueMode")
    -- Format
    local priceText = formatPriceText(values, auctionType, itemValueMode)
    -- Set tooltip
    if strlen(priceText) > 0 then
        tooltip:AddDoubleLine(isEPGP and CLM.L["GP"] or CLM.L["DKP"] .. " " .. CLM.L["Value"], UTILS.ColorCodeText(priceText, "ffffff"))
        tooltip:AddTexture("Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-dark-128.tga") --, { width = 32, height = 32 })
    end
end

GameTooltip:HookScript("OnTooltipSetItem", addItemPriceToTooltip)
ItemRefTooltip:HookScript("OnTooltipSetItem", addItemPriceToTooltip)
