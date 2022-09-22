-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local tinsert, tremove = table.insert, table.remove
local tostring, tonumber = tostring, tonumber
local GetServerTime = GetServerTime

local EVENT_END_AUCTION = "CLM_AUCTION_END" -- TODO CONSTANTS

local CHANNELS = {
    [1] = "SAY",
    [2] = "EMOTE",
    [3] = "PARTY",
    [4] = "GUILD",
    [5] = "OFFICER",
    [6] = "YELL",
    [7] = "RAID",
    [8] = "RAID_WARNING"
}

local AuctionHistoryManager = {}
function AuctionHistoryManager:Initialize()
    LOG:Trace("AuctionHistoryManager:Initialize()")
    self.db = CLM.MODULES.Database:Personal('auctionHistory', {
        stack = {},
        -- config
        enable = true,
        post_bids = true,
        post_bids_channel = 5
    })
    CLM.MODULES.EventManager:RegisterEvent(EVENT_END_AUCTION, function(_, data)
        if not self:GetEnabled() then return end
        tinsert(self.db.stack, 1, {
            link      = data.link,
            id        = data.id,
            bids      = data.bids,
            names     = data.bidNames,
            upgraded  = data.items,
            time      = data.time
        })
        if self:GetPostBids() and data.postToChat then
            local channel = CHANNELS[self:GetPostBidsChannel()] or "OFFICER"
            SendChatMessage(data.link, channel)
            local noBids = true
            for bidder,bid in pairs(data.bids) do
                noBids = false
                local bidName = ""
                if data.bidNames[bidder] then
                    bidName = " - " .. data.bidNames[bidder]
                end

                SendChatMessage(bidder .. ": " .. tostring(bid) .. " " .. (data.isEPGP and CLM.L["GP"] or CLM.L["DKP"]) .. bidName, channel)
            end
            if noBids then
                SendChatMessage(CLM.L["No bids"], channel)
            end
        end
        CLM.GUI.AuctionHistory:Refresh(true)
    end)

    self.uuidCache = {}

    local options = {
        auction_history_header = {
            type = "header",
            name = CLM.L["Auctioning - History"],
            order = 39
        },
        auction_history_store_bids = {
            name = CLM.L["Store bids"],
            desc = CLM.L["Store finished auction bids information."],
            type = "toggle",
            set = function(i, v) self:SetEnabled(v) end,
            get = function(i) return self:GetEnabled() end,
            order = 40
        },
        auction_history_post_bids = {
            name = CLM.L["Post bids"],
            desc = CLM.L["Toggles posting bids in selected channel after auction has ended."],
            type = "toggle",
            set = function(i, v) self:SetPostBids(v) end,
            get = function(i) return self:GetPostBids() end,
            order = 41
        },
        auction_history_post_bids_channel = {
            name = CLM.L["Post channel"],
            desc = CLM.L["Channel for posting bids."],
            type = "select",
            values = CHANNELS,
            set = function(i, v) self:SetPostBidsChannel(v) end,
            get = function(i) return self:GetPostBidsChannel() end,
            order = 42
        }
    }
    CLM.MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.GLOBAL, options)


end

function AuctionHistoryManager:SetEnabled(value)
    self.db.enable = value and true or false
end

function AuctionHistoryManager:GetEnabled()
    return self.db.enable
end

function AuctionHistoryManager:SetPostBids(value)
    self.db.post_bids = value and true or false
end

function AuctionHistoryManager:GetPostBids()
    return self.db.post_bids
end

function AuctionHistoryManager:SetPostBidsChannel(value)
    local channel = CHANNELS[value]
    if channel then
        self.db.post_bids_channel = value
    end
end

function AuctionHistoryManager:GetPostBidsChannel()
    return self.db.post_bids_channel
end

function AuctionHistoryManager:CorrelateWithLoot(time, uuid)
    for _, auction in ipairs(self.db.stack) do
        if auction.time == time then
            if not auction.uuid then
                auction.uuid = {}
            end
            auction.uuid[uuid] = true
        end
    end
end

function AuctionHistoryManager:GetByUUID(uuid)
    if not uuid then return end
    local info = self.uuidCache[uuid]
    if not info then
        for _, auction in ipairs(self.db.stack) do
            if auction.uuid and auction.uuid[uuid] then
                info = auction
                self.uuidCache[uuid] = auction
                break
            end
        end
    end
    return info
end

function AuctionHistoryManager:GetHistory()
    return self.db.stack
end

function AuctionHistoryManager:Remove(id)
    id = tonumber(id) or 0
    if (id <= #self.db.stack) and (id >= 1) then
        tremove(self.db.stack, id)
        CLM.GUI.AuctionHistory:Refresh(true)
    end
end

function AuctionHistoryManager:RemoveOld(time)
    time = tonumber(time) or 2678400 -- 31 days old
    local cutoff = GetServerTime() - time
    UTILS.OnePassRemove(self.db.stack, function(t, i, j)
        return t[i].time > cutoff
    end)
    CLM.GUI.AuctionHistory:Refresh(true)
end

function AuctionHistoryManager:Wipe()
    while(#self.db.stack > 0) do
        tremove(self.db.stack)
    end
    CLM.GUI.AuctionHistory:Refresh(true)
end

CLM.MODULES.AuctionHistoryManager = AuctionHistoryManager