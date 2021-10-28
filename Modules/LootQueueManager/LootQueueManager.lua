local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES

local ACL = MODULES.ACL
local EventManager = MODULES.EventManager

local whoami = CLM.UTILS.whoami()

local LootQueueManager = {}

local function HandleLootMessage(self, message, playerName, ...)
    print(message, playerName)
    if playerName ~= whoami then return end

    local itemId = string.match(message, 'Hitem:(%d*):')
    local _, itemLink, rarity = GetItemInfo(itemId);

    if rarity >= CLM.GlobalConfigs:GetTrackedLootLevel() then
        table.insert(self.queue, {
            id = itemId,
            link = itemLink
        })
        CLM.GUI.LootQueue:Refresh(true)
    end
end

function LootQueueManager:Initialize()
    LOG:Trace("LootQueueManager:Initialize()")
    if not ACL:IsTrusted() then return end
    local db = MODULES.Database:Personal()
    if not db.lootQueue then
        db.lootQueue = {}
    end
    self.queue = db.lootQueue
    -- todo wipe queue
    self.iterator = 1
    EventManager:RegisterWoWEvent({"CHAT_MSG_LOOT"}, (function(...)
        HandleLootMessage(self, ...)
    end))
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
    end
end

function LootQueueManager:DebugAddItem(link)
    HandleLootMessage(self, link, whoami)
end

MODULES.LootQueueManager = LootQueueManager