-- ------------------------------- --
local _, PRIV = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local UTILS     = CLM.UTILS
-- ------------------------------- --

local ColorCodeText = UTILS.ColorCodeText
local GetClassColor = UTILS.GetClassColor

local CLM_ICON_DARK = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-dark-32.png"

local cache = {}

local function generateTooltipLines(roster, itemId, perRosterData, requiresRebuild)
    if cache[roster:UID()] == nil then
        cache[roster:UID()] = {}
    end
    if requiresRebuild or (cache[roster:UID()][itemId] == nil) then
        local lines = {}
        for _, data in ipairs(perRosterData) do
            if data.count > 0 then
                --local newLine = "  " .. ColorCodeText(data.profile:Name(), GetClassColor(data.profile:Class()).hex)
                local newLine = ColorCodeText(data.profile:ShortName(), GetClassColor(data.profile:Class()).hex)
                if data.count > 1 then
                    newLine = newLine .. ColorCodeText(" (" .. data.count .. ")", "9d9d9d")
                end
                lines[#lines+1] = newLine
            end
        end
        if #lines > 0 then
            cache[roster:UID()][itemId] = lines
        else
            cache[roster:UID()][itemId] = nil
        end
    end
    return cache[roster:UID()][itemId] or {}
end

local function addItemReceiversToTooltip(tooltip)
    -- Sanity Check
    local itemLink
    if not tooltip then return end
    if not PRIV.Core:IsInitialized() then return end
    if not PRIV.Core:GetEnableTooltip() then return end
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
        for _, playerGUID in ipairs(roster:Profiles()) do
            local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(playerGUID)
            if profile then
                local count, isFresh = PRIV.MODULES.Tracker:GetCount(roster, itemId, profile:Name())
                perRosterData[#perRosterData+1] = { profile = profile, count = count }
                if not isFresh then requiresRebuild = true end
            end
        end
        local lines = generateTooltipLines(roster, itemId, perRosterData, requiresRebuild)
        if #lines > 0 then
            tooltip:AddLine(rosterName)
            tooltip:AddTexture(CLM_ICON_DARK)
            UTILS.putListInTooltip(lines, tooltip, 100, 100, nil, true)
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