local  _, CLM = ...

local LOG = CLM.LOG

local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local GUI = CLM.GUI

local Roster = MODELS.Roster
local RosterConfiguration =  MODELS.RosterConfiguration

local typeof = UTILS.typeof

local AuctionManager = {}
function AuctionManager:Initialize()
    LOG:Trace("AuctionManager:Initialize()")

    self.bids = {}
    self.auctionInProgress = false
    self._initialized = true
end

-- We pass configuration separately as it can be overriden on per-auction basis
function AuctionManager:StartAuction(itemId, itemLink, minValue, maxValue, note, roster, configuration)
    LOG:Trace("AuctionManager:StartAuction()")
    if self.auctionInProgress then
        LOG:Warning("AuctionManager:StartAuction(): Auction in progress")
    end
    -- Auction parameters sanity checks
    note = note or ""
    if not typeof(roster, Roster) then
        LOG:Warning("RosterManager:StartAuction(): Invalid roster object")
        return false
    end
    self.roster = roster
    if not tonumber(itemId) then
        LOG:Warning("RosterManager:StartAuction(): invalid item id")
        return false
    end
    if not itemLink then
        LOG:Warning("RosterManager:StartAuction(): invalid item link")
        return false
    end
    if not (tonumber(minValue) and tonumber(maxValue)) then
        LOG:Warning("RosterManager:StartAuction(): invalid values [%s] [%s]", tostring(minValue), tostring(maxValue))
        return false
    end
    if not typeof(configuration, RosterConfiguration) then
        LOG:Warning("RosterManager:StartAuction(): Invalid roster object")
        return false
    end
    -- Auction Settings sanity checks
    local auctionTime = configuration:Get("auctionTime")
    if auctionTime <= 0 then
        LOG:Warning("RosterManager:StartAuction(): 0s auction time")
        return false
    end
    if auctionTime < 10 then
        LOG:Warning("RosterManager:StartAuction(): Very short (below 10s) auction time")
    end
    if maxValue > 0 and minValue > maxValue then
        LOG:Warning("RosterManager:StartAuction(): min value must be smaller or equal to max values")
        return false
    end
    self.minValue = minValue or 0
    self.maxValue = maxValue or 0
    if configuration:Get("auctionTime") <= 0 then
        LOG:Warning("RosterManager:StartAuction(): Auction time must be greater than 0 seconds")
        return false
    end
    self.allowNegativeBidders = configuration:Get("allowNegativeBidders")
    self.allowNegativeStandings = configuration:Get("allowNegativeStandings")
    -- Auctioning
    if self:UserCanAuctionItems() then
        -- Send users information about auction start
        -- Start auction timer
    else
        LOG:Warning("RosterManager:StartAuction(): Missing auctioning permissions")
        return false
    end
    -- Start Auction Messages
    local auctionMessage = "Auction of " .. itemLink
    if note:len() > 0 then
        auctionMessage = auctionMessage .. " (" .. tostring(note) .. ")"
    end
    -- Max 2 raid warnings are displayed at the same time
    SendChatMessage(auctionMessage , "RAID_WARNING");
    auctionMessage = ""
    if minValue > 0 then
        auctionMessage = auctionMessage .. "Minimum bid: " .. tostring(minValue) .. ". "
    end
    if maxValue > 0 then
        auctionMessage = auctionMessage .. "Maximum bid: " .. tostring(maxValue) .. ". "
    end
    auctionMessage = auctionMessage .. "Auction time: " .. tostring(auctionTime) .. ". "
    self.antiSnipe = configuration:Get("antiSnipe")
    if self.antiSnipe > 0 then
        auctionMessage = auctionMessage .. "AntiSnipe time: " .. tostring(self.antiSnipe) .. ". "
    end
    SendChatMessage(auctionMessage , "RAID_WARNING");
    -- AntiSnipe settings
    self.antiSnipeLimit = 3 and (self.antiSnipe > 0) or 0
    -- Start Auction Ticker
    self.auctionTimeLeft = auctionTime
    self.ticker = C_Timer.NewTicker(1, function()
        self:AntiSnipe()
        if self.auctionTimeLeft <= 0 then
            self:StopAuctionTimed()
            return
        end
        if self.auctionTimeLeft <= 5 then
            SendChatMessage(tostring(self.auctionTimeLeft), "RAID_WARNING")
        end
        self.auctionTimeLeft = self.auctionTimeLeft - 1
    end)
    -- Set auction in progress
    self.auctionInProgress = true
    -- UI
    GUI.AuctionManager:Refresh()
    -- -- DEBUG auto bids for long auctions
    -- if auctionTime > 15 then
    --     C_Timer.After(1, (function()
    --         local profiles = self.roster:Profiles()
    --         local actions = math.random(1,auctionTime)
    --         for i=1,actions do
    --             local delay = math.random(1,auctionTime)*0.9
    --             C_Timer.After(delay, (function()
    --                 local value
    --                 if math.random(1, 20) == 1 then
    --                     value = nil
    --                 else
    --                     value = math.random(minValue, maxValue)
    --                 end
    --                 self:UpdateBid(profiles[math.random(1, #profiles)], value)
    --             end))
    --         end
    --     end))
    -- end
    -- --
    return true
end

function AuctionManager:StopAuctionTimed()
    LOG:Trace("AuctionManager:StopAuctionTimed()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    SendChatMessage("Auction complete", "RAID_WARNING");
    GUI.AuctionManager:Refresh()
end

function AuctionManager:StopAuctionManual()
    LOG:Trace("AuctionManager:StopAuctionManual()")
    self.auctionInProgress = false
    self.ticker:Cancel()
    SendChatMessage("Auction stopped by Master Looter", "RAID_WARNING");
    GUI.AuctionManager:Refresh()
end

function AuctionManager:AntiSnipe()
    LOG:Trace("AuctionManager:AntiSnipe()")
    if self.antiSnipeLimit > 0 then
        self.auctionTimeLeft = self.auctionTimeLeft + self.AntiSnipe
        self.antiSnipeLimit = self.antiSnipeLimit - 1
    end
end

function AuctionManager:ValidateBid(GUID, bid)
    -- allow bid cancelling
    if bid == nil then return true end
    -- sanity check
    if not self.roster:IsProfileInRoster(GUID) then return false
    -- allow negative bidders
    local current = self.roster:Standings(GUID)
    if current < 0 and not self.allowNegativeBidders then return false end
    -- allow negative standings after bid
    local new = current - bid
    if new < 0 and not self.allowNegativeStandings then return false end
    -- min
    if self.minValue > 0 and bid < self.minValue then return false end
    -- max
    if self.maxValue > 0 and bid > self.maxValue then return false end
    -- accept otherwise
    return true
end

function AuctionManager:UpdateBid(GUID, bid)
    LOG:Trace("AuctionManager:UpdateBid()")
    if not self:IsAuctionInProgress() then return end
    if self:ValidateBid(GUID, bid) then
        self.bids[GUID] = bid
    else
        -- respond with deny
    end
    GUI.AuctionManager:Refresh()
end

function AuctionManager:Bids()
    return self.bids
end

function AuctionManager:Award(itemId, price, GUID)
    -- award item to winner
    -- add to loot history
    -- deduce points
end

function AuctionManager:UserCanAuctionItems() -- todo
    return true
end

function AuctionManager:IsAuctionInProgress()
    return self.auctionInProgress
end

MODULES.AuctionManager = AuctionManager