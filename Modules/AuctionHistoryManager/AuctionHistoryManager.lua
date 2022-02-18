local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local EventManager = MODULES.EventManager

local whoami = UTILS.whoami()

local EVENT_END_AUCTION = "CLM_AUCTION_END"

local AuctionHistoryManager = {}

function AuctionHistoryManager:Initialize()
    LOG:Trace("AuctionHistoryManager:Initialize()")
    self.db = MODULES.Database:Personal('auctionHistory', { stack = {} })
    self.iterator = 1
    EventManager:RegisterEvent(EVENT_END_AUCTION, function(_, data)
        table.insert(self.db.stack, 1, {
            id   = data.id,
            bids = data.bids,
            time = GetServerTime()
        })
    end)
    MODULES.ConfigManager:RegisterUniversalExecutor("ah", "Auction History", self)
end

function AuctionHistoryManager:Get(id)
    id = tonumber(id) or 0
    if (id <= #self.db.stack) and (id >= 1) then
        return id, self.db.stack[id]
    end
    return nil, nil
end

function AuctionHistoryManager:GetNext()
    self.iterator = self.iterator + 1
    if self.iterator > #self.db.stack then
        self.iterator = 1
    end
    return self.iterator, self.db.stack[self.iterator]
end

function AuctionHistoryManager:GetHistory()
    return self.db.stack
end

function AuctionHistoryManager:Remove(id)
    id = tonumber(id) or 0
    if (id <= #self.db.stack) and (id >= 1) then
        if self.iterator > id then
            self.iterator = self.iterator - 1
        -- elseif self.iterator == id then
        --     -- This makes us automatically point to next
        -- else
        --     -- This doesnt affect us at all
        end
        table.remove(self.db.stack, id)
        if self.iterator > #self.db.stack then
            self.iterator = 1
        end
        CLM.GUI.AuctionHistory:Refresh(true)
    end
end

function AuctionHistoryManager:Wipe()
    while(#self.db.stack > 0) do
        table.remove(self.db.stack)
    end
    CLM.GUI.AuctionHistory:Refresh(true)
    self.iterator = 1
end

MODULES.AuctionHistoryManager = AuctionHistoryManager