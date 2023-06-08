-- ------------------------------- --
local _, PRIV = ...
local CLM = LibStub("ClassicLootManager").CLM
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local UTILS     = CLM.UTILS
-- ------------------------------- --

local ColorCodeText = UTILS.ColorCodeText
local GetClassColor = UTILS.GetClassColor

local CLM_ICON_DARK = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-dark-128.tga"

local cache = {}

local function generateTooltipLines(rosterName, roster, perRosterData, requiresRebuild)
    if requiresRebuild or (cache[roster:UID()] == nil) then
        local lines = {}
        for _, data in ipairs(perRosterData) do
            if data.count > 0 then
                lines[#lines+1] = "  " .. ColorCodeText(data.profile:Name(), GetClassColor(data.profile:Class()).hex)
            end
        end
        if #lines > 0 then
            table.insert(lines, 1, rosterName)
            cache[roster:UID()] = lines
        else
            cache[roster:UID()] = nil
        end
    end
    return cache[roster:UID()] or {}
end

local function addItemReceiversToTooltip(tooltip)
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
    local raid = CLM.MODULES.RaidManager:GetRaid()
    local rosters = raid and {
        [CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID())] = raid:Roster()
    } or CLM.MODULES.RosterManager:GetRosters()
    if not raid and not PRIV.Core:GetAlwaysEnable() then return end
    for rosterName, roster in pairs(rosters) do
        local perRosterData = {}
        local requiresRebuild = false
        for _, profile in ipairs(roster:Profiles()) do
            local count, isFresh = PRIV.MODULES.Tracker:GetCount(roster, itemId, profile:Name())
            perRosterData[#perRosterData+1] = { profile = profile, count = count }
            if not isFresh then requiresRebuild = true end
        end
        local lines = generateTooltipLines(rosterName, roster, perRosterData, requiresRebuild)
        for _, line in ipairs(lines) do
            tooltip:AddLine(line)
        end
    end
end

if CLM.WoW10 then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, addItemReceiversToTooltip)
else
    LibStub("AceConfigDialog-3.0").tooltip:HookScript("OnTooltipSetItem", addItemReceiversToTooltip)
    GameTooltip:HookScript("OnTooltipSetItem", addItemReceiversToTooltip)
    ItemRefTooltip:HookScript("OnTooltipSetItem", addItemReceiversToTooltip)
end