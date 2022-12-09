-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable = setmetatable

local AuctionItem = CLM.MODELS.AuctionItem
local assertTypeof = UTILS.assertTypeof
local assertType = UTILS.assertType

local AuctionInfo = {} -- AuctionInfo
AuctionInfo.__index = AuctionInfo

local function assertNotInProgress(self)
    if self.state == CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS then
        error("Not allowed while auction is IN PROGRESS.", 2)
    end
end

local function assertInProgress(self)
    if self.state ~= CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS then
        error("Not allowed while auction is not IN PROGRESS.", 2)
    end
end

-- local function SetRosterInternal(self, roster)
--     assertNotInProgress(self)
--     if UTILS.typeof(roster, CLM.MODELS.Roster) then
--         self.roster = roster
--         self.state = CONSTANTS.AUCTION_INFO.STATE.IDLE
--     end
-- end

function AuctionInfo:New()
    local o = {}
    setmetatable(o, self)

    o.state = CONSTANTS.AUCTION_INFO.STATE.NOT_CONFIGURED

    o.configuration = nil
    o.roster = nil
    o.raid = nil

    o.items = {}
    o.itemCount = 0

    o.auctionTime = 0
    o.antiSnipe = 0

    o.endTime = 0

    return o
end

local function UpdateConfigurableData(self)
    self.auctionTime = self.roster:GetConfiguration("auctionTime")
    self.antiSnipe = self.roster:GetConfiguration("antiSnipe")
end

local function UpdateConfigurationInternal(self)
    if self.raid then
        self.configuration = self.raid:Configuration()
    elseif self.roster then
        self.configuration = self.roster.configuration
    end
    if self.configuration then
        UpdateConfigurableData(self)
    end
end

local function UpdateRosterInternal(self, roster)
    self.roster = roster
end

local function UpdateRaidInternal(self, raid)
    self.raid = raid
end

function AuctionInfo:UpdateRoster(roster)
    assertTypeof(roster, CLM.MODELS.Roster)
    if self:IsInProgress() then
        LOG:Debug("AuctionInfo:UpdateRoster(): Called during auction. Ignoring.")
        return
    end

    UpdateRosterInternal(self, roster)
    UpdateRaidInternal(self, nil)
    UpdateConfigurationInternal(self)

    self.state = CONSTANTS.AUCTION_INFO.STATE.IDLE
end

-- Clears raid also
function AuctionInfo:UpdateRaid(raid)
    assertTypeof(raid, CLM.MODELS.Raid)
    if self:IsInProgress() then
        LOG:Debug("AuctionInfo:UpdateRaid(): Called during auction. Ignoring.")
        return
    end
    print("AuctionInfo:UpdateRaid")
    UpdateRaidInternal(self, raid)
    UpdateRosterInternal(self, raid:Roster())
    UpdateConfigurationInternal(self)

    self.state = CONSTANTS.AUCTION_INFO.STATE.IDLE
end

local function AddItemInternal(self, item)
    if self.items[item:GetItemID()] then
        LOG:Message("%s already in auction list.", item:GetItemLink())
        return
    end
    local auctionItem = AuctionItem:New(item)
    self.items[item:GetItemID()] = auctionItem
    self.itemCount = self.itemCount + 1
    return auctionItem
end

function AuctionInfo:AddItem(item)
    assertNotInProgress(self)
    local auctionItem = AddItemInternal(self, item)
    if auctionItem and self.roster then
        auctionItem:LoadValues(self.roster)
    end
    return auctionItem
end

function AuctionInfo:RemoveItem(id)
    assertNotInProgress(self)
    if self.items[id] then
        self.items[id] = nil
        self.itemCount = self.itemCount - 1
    end
end

function AuctionInfo:GetItem(id)
    return self.items[id] or AuctionItem:New()
end

function AuctionInfo:GetItems()
    return self.items
end

function AuctionInfo:SetResponse(id, username, response)
    assertInProgress(self)
    local auctionItem = self.items[id]
    if not auctionItem then
        LOG:Warning("Received response to non existent item.")
    end
    auctionItem:SetResponse(username, response)
end

function AuctionInfo:IsInProgress()
    return self.state == CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS
end

function AuctionInfo:IsEmpty()
    return (self.itemCount <= 0)
end

function AuctionInfo:GetItemCount()
    return self.itemCount
end

function AuctionInfo:Start()
    assertNotInProgress(self)
    self.endTime = GetServerTime() + self.auctionTime
    self.state = CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS

    for _, item in pairs(self.items) do
        item:ClearResponses()
    end
end

function AuctionInfo:End()
    assertInProgress(self)
    self.state = CONSTANTS.AUCTION_INFO.STATE.IDLE
end

-- Configuration API

function AuctionInfo:SetTime(time)
    assertType(time, 'number')
    assertNotInProgress(self)
    self.auctionTime = time
end

function AuctionInfo:GetTime()
    return self.auctionTime
end

function AuctionInfo:GetEndTime()
    return self.endTime
end

function AuctionInfo:SetAntiSnipe(time)
    assertType(time, 'number')
    assertNotInProgress(self)
    self.antiSnipe = time
end

function AuctionInfo:GetAntiSnipe()
    return self.antiSnipe
end

function AuctionInfo:GetType()
    return self.configuration:Get("auctionType")
end

function AuctionInfo:GetMode()
    return self.configuration:Get("itemValueMode")
end

function AuctionInfo:GetUseOS()
    return self.configuration:Get("useOS")
end

function AuctionInfo:GetNamedButtonsMode()
    return self.configuration:Get("namedButtons")
end

function AuctionInfo:GetIncrement()
    return self.configuration:Get("minimalIncrement")
end

function AuctionInfo:GetRosterUID()
    return self.roster:UID()
end

CONSTANTS.AUCTION_INFO = {
    STATE = {
        NOT_CONFIGURED = 0,
        IDLE = 1,
        IN_PROGRESS = 2
    }
}

CLM.MODELS.AuctionInfo = AuctionInfo