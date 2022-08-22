--[[
    Lots of thanks to Zh0rax (https://github.com/papa-smurf) for sharing
    all the corner cases of trade handling and solutions to them
]]--

-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local ipairs = ipairs
local BIND_TRADE_TIME_REMAINING, ITEM_SOULBOUND, ERR_TRADE_COMPLETE  = BIND_TRADE_TIME_REMAINING, ITEM_SOULBOUND, ERR_TRADE_COMPLETE
local sgsub, sfind = string.gsub, string.find
local tinsert, tremove = table.insert, table.remove
local C_TimerAfter, UseContainerItem, GetTradePlayerItemLink = C_Timer.After, UseContainerItem, GetTradePlayerItemLink
local GetNumLootItems, GetLootSlotInfo, GetItemInfoInstant, GetLootSlotLink, GetNumGroupMembers, GetMasterLootCandidate, GiveMasterLoot = GetNumLootItems, GetLootSlotInfo, GetItemInfoInstant, GetLootSlotLink, GetNumGroupMembers, GetMasterLootCandidate, GiveMasterLoot
local UnitName = UnitName

local function ScanTooltip(self)
    local query = sgsub(BIND_TRADE_TIME_REMAINING, "%%s", ".*")
    local lineWithTimer
    for i = 1, self.fakeTooltip:NumLines() do
        local line = _G["CLMAutoAwardBagItemCheckerFakeTooltipTextLeft" .. i]
        if line then
            line = line:GetText() or ""
            if line == ITEM_SOULBOUND then
                self.itemInfo.soulbound = true
            end
            if sfind(line, query) then
                lineWithTimer = line
                break
            end
        end
    end
    if lineWithTimer then
        self.itemInfo.tradeTimerExpired = false
    end
end

local BagItemChecker = {}
function BagItemChecker:Initialize()
    self.fakeTooltip = CreateFrame("GameTooltip", "CLMAutoAwardBagItemCheckerFakeTooltip", UIParent, "GameTooltipTemplate")
    self.fakeTooltip:SetOwner(UIParent, "ANCHOR_NONE");
    self:Clear()
end

function BagItemChecker:Clear()
    self.bag = -1
    self.slot = -1

    self.itemInfo = {
        id = -1,
        link = "",
        locked = true,
        soulbound = false,
        tradeTimerExpired = true
    }
end

local function BagItemCheck(self)
    local _, _, locked, _, _, _, itemLink, _, _, itemId = GetContainerItemInfo(self.bag, self.slot)
    self.itemInfo.locked = locked or false
    self.itemInfo.id = itemId or -1
    self.itemInfo.soulbound = false
    self.itemInfo.link = itemLink or ""
    ScanTooltip(self)
end

function BagItemChecker:Set(bag, slot)
    self.bag = bag
    self.slot = slot

    self.fakeTooltip:ClearLines()
    self.fakeTooltip:SetBagItem(self.bag, self.slot)

    BagItemCheck(self)
end

function BagItemChecker:GetItemId()
    return self.itemInfo.id
end

function BagItemChecker:GetItemLink()
    return self.itemInfo.link
end

function BagItemChecker:IsLocked()
    return self.itemInfo.locked
end

function BagItemChecker:IsSoulbound()
    return self.itemInfo.soulbound
end

function BagItemChecker:TradeTimerExpired()
    return self.itemInfo.tradeTimerExpired
end

function BagItemChecker:IsTradeable()
    return not self:TradeTimerExpired() or not self:IsSoulbound()
end

local function ScanBagsForItem(itemId, tradeableOnly)
    local found = {}
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            BagItemChecker:Set(bag, slot)
            if not BagItemChecker:IsLocked() and (BagItemChecker:GetItemId() == itemId) then
                local isTradeable = true
                if tradeableOnly then
                    isTradeable = BagItemChecker:IsTradeable()
                end
                if isTradeable then
                    tinsert(found, {bag = bag, slot = slot} )
                end
            end
        end
    end
    return found
end

local function FindLastTradeTargetItems(self)
    local foundItems = {}
    for _, itemId in ipairs(self.tracking[self.lastTradeTarget]) do
        if not foundItems[itemId] then
            local found = ScanBagsForItem(itemId, true)
            if #found > 0 then
                foundItems[itemId] = found
            end
        end
    end
    return foundItems
end

----
----
----

local function Clear(self)
    self.lastTradedItems = {}
    self.lastTradeTarget = nil
end

local function HandleTradeShow(self)
    if self.tracking[self.lastTradeTarget] then
        -- Find all items tracked for the requester
        local foundItems = FindLastTradeTargetItems(self)
        -- Add up to 6 to the trade window
        local totalQueued = 0
        for _, itemId in ipairs(self.tracking[self.lastTradeTarget]) do
            if foundItems[itemId] and #foundItems[itemId] > 0 then
                local loc = tremove(foundItems[itemId])
                totalQueued = totalQueued + 1
                C_TimerAfter(0.25*totalQueued, function()
                    UseContainerItem(loc.bag, loc.slot)
                end)
                if totalQueued == 6 then
                    break
                end
            end
        end
    end
end

local function HandleTradeAcceptUpdate(self)
    self.lastTradedItems = {}
    for tradeSlot = 1, 6 do
        local itemLink = GetTradePlayerItemLink(tradeSlot)
        if itemLink then
            tinsert(self.lastTradedItems, UTILS.GetItemIdFromLink(itemLink))
        end
    end
end

local function HandleTradeSuccess(self)
    for _,itemId in ipairs(self.lastTradedItems) do
        self:Remove(itemId, self.lastTradeTarget)
    end
end


local AutoAward = {}
function AutoAward:Initialize()
    LOG:Trace("AutoAward:Initialize()")
    self.tracking = {}
    Clear(self)

    BagItemChecker:Initialize()

    CLM.MODULES.EventManager:RegisterWoWEvent({"TRADE_SHOW"}, (function()
        Clear(self)
        pcall(function()
            self.lastTradeTarget = _G.TradeFrameRecipientNameText:GetText()
        end)
        if not self.lastTradeTarget then
             -- NPC Because that's how the engine holds the trade peer
            self.lastTradeTarget = UnitName("NPC")
        end
        if not self.lastTradeTarget then return end
        HandleTradeShow(self)
    end))
    CLM.MODULES.EventManager:RegisterWoWEvent({"TRADE_ACCEPT_UPDATE"}, (function()
        if not self.lastTradeTarget then return end
        HandleTradeAcceptUpdate(self)
    end))
    CLM.MODULES.EventManager:RegisterWoWEvent({"UI_INFO_MESSAGE"}, (function(_, _, _, message)
        if not self.lastTradeTarget then return end
        if message == ERR_TRADE_COMPLETE then
            HandleTradeSuccess(self)
        end
        self.lastTradeTarget = nil
    end))
    CLM.MODULES.EventManager:RegisterEvent(CLM.CONSTANTS.EVENTS.GLOBAL_LOOT_REMOVED, function(_, data)
        AutoAward:Remove(data.id, data.name)
    end)
end

local autoAwardIgnores = UTILS.Set({
    22726, -- Splinter of Atiesh
    30183, -- Nether Vortex
    29434, -- Badge of Justice
    23572, -- Primal Nether
    40752, -- Emblem of Heroism
    40753, -- Emblem of Valor
    45038, -- Fragment of Val'anyr
})
function AutoAward:IsIgnored(itemId)
    return autoAwardIgnores[itemId]
end

function AutoAward:GiveMasterLooterItem(itemId, player)
    LOG:Trace("AutoAward:GiveMasterLooterItem()")
    if self:IsIgnored(itemId) then return end
    for itemIndex = 1, GetNumLootItems() do
        local _, _, _, _, _, locked = GetLootSlotInfo(itemIndex)
        if not locked then
            local slotItemId = GetItemInfoInstant(GetLootSlotLink(itemIndex))
            if slotItemId == itemId then
                for playerIndex = 1, GetNumGroupMembers() do
                    if (GetMasterLootCandidate(itemIndex, playerIndex) == player) then
                        GiveMasterLoot(itemIndex, playerIndex)
                        return
                    end
                end
            end
        end
    end
end

function AutoAward:Track(itemId, player)
    if self:IsIgnored(itemId) then return end
    -- Lazy start tracking player
    if not self.tracking[player] then
        self.tracking[player] = {}
    end
    -- Update
    tinsert(self.tracking[player], itemId)
end

function AutoAward:Remove(itemId, player)
    if self:IsIgnored(itemId) then return end
    -- Sanity check: If we don't track player then return
    if not self.tracking[player] then
        return
    end
    -- Update
    for id, _itemId in ipairs(self.tracking[player]) do
        if itemId == _itemId then
            tremove(self.tracking[player], id)
            break
        end
    end
end

CLM.MODULES.AutoAward = AutoAward