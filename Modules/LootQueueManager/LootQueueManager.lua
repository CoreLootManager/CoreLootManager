local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local EventManager = MODULES.EventManager

local whoami = UTILS.whoami()

local EVENT_START_AUCTION = "CLM_AUCTION_START"

local LootQueueManager = {}

local function HandleLootMessage(self, addon, event, message, _, _, _, playerName, ...)
    if playerName ~= whoami then return end
    if not message then return end
    local itemId = string.match(message, 'Hitem:(%d*):')
    itemId = tonumber(itemId) or 0
    local _, itemLink, rarity = GetItemInfo(itemId)
    if itemLink and (rarity >= CLM.GlobalConfigs:GetTrackedLootLevel()) then
        table.insert(self.queue, {
            id = itemId,
            link = itemLink
        })
        CLM.GUI.LootQueue:Refresh(true)
    end
end

function LootQueueManager:Initialize()
    LOG:Trace("LootQueueManager:Initialize()")
    local db = MODULES.Database:Personal()
    if not db.lootQueue then
        db.lootQueue = {}
    end
    -- Wipe on login / reload if not in raid
    --[===[@non-debug@
    if not IsInRaid() then
        db.lootQueue = {}
    end
    --@end-non-debug@]===]
    self.queue = db.lootQueue
    self.iterator = 1
    EventManager:RegisterWoWEvent({"CHAT_MSG_LOOT"}, (function(...)
        HandleLootMessage(self, ...)
    end))
    EventManager:RegisterEvent(EVENT_START_AUCTION, function(event, data)
        for i, entry in ipairs(self.queue) do
            if entry.id == data.itemId then
                self:Remove(i)
                return
            end
        end
    end)
    MODULES.ConfigManager:RegisterUniversalExecutor("lq", "Loot Queue", self)
end

function LootQueueManager:Get(id)
    id = tonumber(id) or 0
    if (id <= #self.queue) and (id >= 1) then
        return id, self.queue[id]
    end
    return nil, nil
end

function LootQueueManager:GetNext()
    self.iterator = self.iterator + 1
    if self.iterator > #self.queue then
        self.iterator = 1
    end
    return self.iterator, self.queue[self.iterator]
end

function LootQueueManager:GetQueue()
    return self.queue
end

function LootQueueManager:Remove(id)
    id = tonumber(id) or 0
    if (id <= #self.queue) and (id >= 1) then
        if self.iterator > id then
            self.iterator = self.iterator - 1
        -- elseif self.iterator == id then
        --     -- This makes us automatically point to next
        -- else
        --     -- This doesnt affect us at all
        end
        table.remove(self.queue, id)
        if self.iterator > #self.queue then
            self.iterator = 1
        end
        CLM.GUI.LootQueue:Refresh(true)
    end
end

function LootQueueManager:Wipe()
    while(#self.queue > 0) do
        table.remove(self.queue)
    end
    CLM.GUI.LootQueue:Refresh(true)
    self.iterator = 1
end

MODULES.LootQueueManager = LootQueueManager