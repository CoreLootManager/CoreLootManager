local define = LibDependencyInjection.createContext(...)

define.module("LootQueueManager", {"Utils", "ConfigManager",  "L"}, function(resolve, UTILS, ConfigManager, L)

local tremove, tinsert, smatch = table.remove, table.insert, string.match
local GetItemInfo, tonumber = GetItemInfo, tonumber
--[===[@non-debug@
local IsInRaid = IsInRaid
--@end-non-debug@]===]

local whoami = UTILS.whoami()

local EVENT_START_AUCTION = "CLM_AUCTION_START"

local ItemClasses = {}
do
    local ignoredClasses = {
        [8] = true,
        [10] = true,
        [14] = true,
    }
    for _, id in pairs(Enum.ItemClass) do
        if not ignoredClasses[id] then
            ItemClasses[id] = GetItemClassInfo(id)
        end
    end
end

local ignoredItems = UTILS.Set({
    22726, -- Splinter of Atiesh
    30183, -- Nether Vortex
    29434, -- Badge of Justice
    23572, -- Primal Nether
    40752, -- Emblem of Heroism
    40753, -- Emblem of Valor
    45038, -- Fragment of Val'anyr
})

local LootQueueManager = {}

local function HandleLootMessage(self, addon, event, message, _, _, _, playerName, ...)
    if playerName ~= whoami then return end
    if not message then return end
    local itemId = smatch(message, 'Hitem:(%d*):')
    itemId = tonumber(itemId) or 0
    local _, itemLink, rarity, _, _, _, _, _, _, _, _, classId = GetItemInfo(itemId)
    if itemLink
        and (rarity >= self:GetTrackedLootLevel())
        and not (self.db.ignoredClasses[classId])
        and not (ignoredItems[itemId]) then
        tinsert(self.db.queue, {
            id = itemId,
            link = itemLink
        })
        LootQueue:Refresh(true)
    end
end

function LootQueueManager:Initialize()
    LOG:Trace("LootQueueManager:Initialize()")
    self.db = Database:Personal('lootQueue', {
        queue = {},
        tracked_loot_level = 4,
        ignoredClasses = {}
    })
    -- Wipe on login / reload if not in raid
    --[===[@non-debug@
    if not IsInRaid() then
        self.db.queue = {}
    end
    --@end-non-debug@]===]
    self.iterator = 1
    EventManager:RegisterWoWEvent({"CHAT_MSG_LOOT"}, (function(...)
        HandleLootMessage(self, ...)
    end))
    EventManager:RegisterEvent(EVENT_START_AUCTION, function(event, data)
        for i, entry in ipairs(self.db.queue) do
            if entry.id == data.itemId then
                self:Remove(i)
                return
            end
        end
    end)
    local options = {
        loot_queue_header = {
            type = "header",
            name = L["Loot Queue"],
            order = 110
        },
        loot_queue_tracked_loot_level = {
            name = L["Tracked loot rarity"],
            desc = L["Select loot rarity for the tracking unauctioned loot."],
            type = "select",
            values = CONSTANTS.ITEM_QUALITY,
            set = function(i, v) self:SetTrackedLootLevel(v) end,
            get = function(i) return self:GetTrackedLootLevel() end,
            order = 111
        },
        loot_queue_ignore_classes = {
            name = L["Ignore"],
            type = "multiselect",
            set = function(i, k, v)
                local n = tonumber(k) or 0
                self.db.ignoredClasses[n] = v
            end,
            get = function(i, v) return self.db.ignoredClasses[tonumber(v)] end,
            values = ItemClasses,
            order = 112
        },
    }
    ConfigManager:RegisterGlobal(options)

end

function LootQueueManager:SetTrackedLootLevel(value)
    self.db.tracked_loot_level = tonumber(value)
end

function LootQueueManager:GetTrackedLootLevel()
    return self.db.tracked_loot_level or 4
end

function LootQueueManager:Get(id)
    id = tonumber(id) or 0
    if (id <= #self.db.queue) and (id >= 1) then
        return id, self.db.queue[id]
    end
    return nil, nil
end

function LootQueueManager:GetNext()
    self.iterator = self.iterator + 1
    if self.iterator > #self.db.queue then
        self.iterator = 1
    end
    return self.iterator, self.db.queue[self.iterator]
end

function LootQueueManager:GetQueue()
    return self.db.queue
end

function LootQueueManager:Remove(id)
    id = tonumber(id) or 0
    if (id <= #self.db.queue) and (id >= 1) then
        if self.iterator > id then
            self.iterator = self.iterator - 1
        -- elseif self.iterator == id then
        --     -- This makes us automatically point to next
        -- else
        --     -- This doesnt affect us at all
        end
        tremove(self.db.queue, id)
        if self.iterator > #self.db.queue then
            self.iterator = 1
        end
        LootQueue:Refresh(true)
    end
end

function LootQueueManager:Wipe()
    while(#self.db.queue > 0) do
        tremove(self.db.queue)
    end
    LootQueue:Refresh(true)
    self.iterator = 1
end

resolve(LootQueueManager)
end)