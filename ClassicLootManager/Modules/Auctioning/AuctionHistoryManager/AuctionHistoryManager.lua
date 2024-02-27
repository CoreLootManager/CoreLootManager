-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

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


local function SetEnabled(self, value)
    self.db.enable = value and true or false
end

local function GetEnabled(self)
    return self.db.enable
end

local function SetPostBidsChannel(self, value)
    local channel = CHANNELS[value]
    if channel then
        self.db.post_bids_channel = value
    end
end

local function GetPostBidsChannel(self)
    return self.db.post_bids_channel
end

local AuctionHistoryManager = {}
function AuctionHistoryManager:Initialize()
    LOG:Trace("AuctionHistoryManager:Initialize()")
    self.db = CLM.MODULES.Database:Personal('auctionHistory2', {
        stack = {},
        -- config
        enable = true,
        post_bids_channel = 5
    })

    self.uuidCache = {}

    local options = {
        auction_history_header = {
            type = "header",
            name = CLM.L["Auctioning - History"],
            order = 50
        },
        auction_history_store_bids = {
            name = CLM.L["Store bids"],
            desc = CLM.L["Store finished auction bids information."],
            type = "toggle",
            set = function(i, v) SetEnabled(self, v) end,
            get = function(i) return GetEnabled(self) end,
            order = 51
        },
        auction_history_post_bids_channel = {
            name = CLM.L["Post channel"],
            desc = CLM.L["Channel for posting bids."],
            type = "select",
            values = CHANNELS,
            set = function(i, v) SetPostBidsChannel(self, v) end,
            get = function(i) return GetPostBidsChannel(self) end,
            order = 52
        }
    }
    CLM.MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

function AuctionHistoryManager:AddAuctionItem(auctionItem, uuid)
        if not GetEnabled(self) then return end
        -- Translate new data format to old history format
        -- TODO new format in history! -> Requires  DB and dependant UIs changes
        -- uuid also in weird state as there can be multiple awards towards 1 auction
        local auction = CLM.MODULES.AuctionManager:GetCurrentAuctionInfo()
        local roster = auction:GetRoster()
        local namedButtonsMode = auction:GetNamedButtonsMode()
        local isEPGP = (roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP)
        local bids = {}
        local bidNames = {}
        local rolls = {}
        local items =  {}

        for player,response in pairs(auctionItem:GetAllResponses()) do
            bids[player] = response:Value()
            rolls[player] = response:Roll()
            -- TODO unify bid name sourcing globally in addon
            local bidName = CONSTANTS.BID_TYPE_NAMES[response:Type()]
            if namedButtonsMode then
                bidName = bidName or roster:GetFieldName(response:Type())
            end
            bidNames[player] = bidName
            items[player] = response:Items()
        end
        local uuidData
        if uuid then
            uuidData = { [uuid] = true }
        end

        tinsert(self.db.stack, 1, {
            link      = auctionItem:GetItemLink(),
            id        = auctionItem:GetItemID(),
            bids      = bids,
            names     = bidNames,
            rolls     = rolls,
            upgraded  = items,
            time      = auction:GetEndTime(),
            isEPGP    = isEPGP,
            uuid      = uuidData
        })
        CLM.GUI.AuctionHistory:Refresh(true)
end

function AuctionHistoryManager:CorrelateWithLoot(link, time, uuid)
    for _, auction in ipairs(self.db.stack) do
        if auction.link == link and auction.time == time then
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

function AuctionHistoryManager:PostById(id)
    local data = self.db.stack[id]
    if data then
        local channel = CHANNELS[GetPostBidsChannel(self)] or "OFFICER"
        UTILS.SendChatMessage(data.link, channel)
        local noBids = true
        for bidder,bid in pairs(data.bids) do
            noBids = false
            local bidName = ""
            if data.names[bidder] then
                bidName = " - " .. data.names[bidder]
            end

            local items = ""

            if data.upgraded and data.upgraded[bidder] then
                local _, item1 = GetItemInfo(data.upgraded[bidder][1] or 0)
                local _, item2 = GetItemInfo(data.upgraded[bidder][2] or 0)

                if item1 or item2 then
                    items = CLM.L[" over "]
                    if item1 then items = items .. item1 end
                    if item2 then items = items .. item2 end
                end
            end

            local rolls = ""
            if data.rolls and data.rolls[bidder] then
                rolls  = rolls .. "/" .. tostring(data.rolls[bidder])
            end
            UTILS.SendChatMessage(
                bidder .. ": " ..
                tostring(bid) .. " " ..
                (data.isEPGP and CLM.L["GP"] or CLM.L["DKP"]) ..
                rolls ..
                bidName ..
                items,
            channel)
        end
        if noBids then
            UTILS.SendChatMessage(CLM.L["No bids"], channel)
        end
    end
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