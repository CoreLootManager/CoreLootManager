-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local AuctionItem = CLM.MODELS.AuctionItem
local assertTypeof = UTILS.assertTypeof
local assertType = UTILS.assertType

local nickMap = {
    "Millhouse ",
    "Jenkins ",
    "Hemet ",
    "Mrgl-Mrgl "
}

local AuctionInfo = {} -- AuctionInfo
AuctionInfo.__index = AuctionInfo

local function assertNotInProgress(self)
    if not self.passiveMode and self.state == CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS then
        error("Not allowed while auction is IN PROGRESS.", 2)
    end
end

local function assertInProgress(self)
    if not self.passiveMode and self.state ~= CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS then
        error("Not allowed while auction is not IN PROGRESS.", 2)
    end
end

local function assertCantAddItems(self)
    if not self.passiveMode and not self:CanAddItems() then
        error("Not allowed to add items in current state.", 2)
    end
end

local function assertIsAcceptingRolls(self)
    if self.acceptingRolls then
        error("Not allowed while auction is accepting ROLLS.", 2)
    end
end


local function Clear(self)
    for _, item in pairs(self.items) do
        item:Clear()
    end

    self.anonymousMap = {}
    self.nextAnonymousId = 1
end

function AuctionInfo:New(object)
    local o = {}
    object = object or {}
    setmetatable(o, self)

    o.state = object.state or CONSTANTS.AUCTION_INFO.STATE.NOT_CONFIGURED

    o.configuration = object.configuration
    o.roster = object.roster
    o.raid = object.raid

    o.items = {}
    o.itemUIDMap = {}
    o.nextItemUID = 1
    o.itemCount = 0

    o.auctionTime = object.auctionTime or 0
    o.antiSnipe = object.antiSnipe or 0

    o.endTime = object.endTime or 0
    o.antiSnipeLimit = object.antiSnipeLimit or 0

    return o
end

local function _GetType(s)
    return s.auctionType
end
local function _GetMode(s)
    return s.mode
end
local function _GetUseOS(s)
    return s.useOS
end
local function _GetNamedButtonsMode(s)
    return s.namedButtons
end
local function _GetFieldName(s, tier)
    return s.fieldNames[tier] or ""
end
local function _GetIncrement(s)
    return s.increment
end

local function UpdateAuctionTime(self)
    if self.configuration then
        local auctionTime = self.configuration:Get("auctionTime")
        local multiplier = 1
        if self.configuration:Get("multiplyTime") then
            multiplier = self.itemCount
        end
        self.auctionTime = auctionTime * multiplier
    end
end

function AuctionInfo:NewShim(auctionType, mode, useOS, namedButtons, increment, fieldNames)
    local o = {}
    setmetatable(o, self)

    o.state = CONSTANTS.AUCTION_INFO.STATE.IDLE
    o.items = {}
    o.itemUIDMap = {}
    o.nextItemUID = 1
    o.itemCount = 0

    o.auctionTime = 0
    o.antiSnipe = 0
    o.endTime = 0
    o.antiSnipeLimit =  0

    -- Remove unsupported
    o.UpdateRaid = nil
    o.UpdateRoster = nil
    o.GetAlwaysAllowBaseBids = nil
    o.GetAlwaysAllowAllInBids = nil
    o.GetAlwaysAllowAll0 = nil
    o.GetAllowEqualBids = nil
    o.GetAllowCancelPass = nil
    o.GetTax = nil
    o.GetRounding = nil
    o.GetMinimumPoints = nil
    o.GetAllowBelowMinStandings = nil

    -- Overwrite new ones
    self.auctionType = auctionType
    self.mode = mode
    self.useOS = useOS
    self.namedButtons = namedButtons

    self.increment = increment
    self.fieldNames = UTILS.DeepCopy(fieldNames)

    o.GetType = _GetType
    o.GetMode = _GetMode
    o.GetUseOS = _GetUseOS
    o.GetNamedButtonsMode = _GetNamedButtonsMode
    o.GetFieldName = _GetFieldName
    o.GetIncrement = _GetIncrement

    return o
end

function AuctionInfo:CopySettings(object)
    assertTypeof(object, AuctionInfo)
    self.state = CONSTANTS.AUCTION_INFO.STATE.IDLE

    self.configuration = object.configuration
    self.roster = object.roster
    self.raid = object.raid

    self.auctionTime = object.auctionTime or 0
    self.antiSnipe = object.antiSnipe or 0

    if self.roster then
        for _,item in pairs(self.items) do
            item:LoadValues(self.roster)
        end
    end

    UpdateAuctionTime(self)
end

local function UpdateConfigurableData(self)
    UpdateAuctionTime(self)
    self.antiSnipe = self.configuration:Get("antiSnipe")
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

    if self.roster == roster then return end

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

    if self.raid == raid then return end

    UpdateRaidInternal(self, raid)
    UpdateRosterInternal(self, raid:Roster())
    UpdateConfigurationInternal(self)

    self.state = CONSTANTS.AUCTION_INFO.STATE.IDLE
end

local function GetItemInAuctionByLink(self, auctionItem)
    return self.items[self:GetAuctionItemUID(auctionItem)]
end

local function AddAuctionItemToList(self, auctionItem, uid)
    if self.passiveMode then
        if type(uid) == "number" then
            self.nextItemUID = uid
        else
            LOG:Fatal("Invalid UID provided %s", string(uid))
        end
    else
        if uid then LOG:Warning("Ignoring Auction Item UID in active mode") end
    end

    self.items[self.nextItemUID] = auctionItem
    self.nextItemUID = self.nextItemUID + 1
    self.itemCount = self.itemCount + 1
    self.hasUsableItems = nil
    UpdateAuctionTime(self)
end

local function AddItemInternal(self, item, uid)
    local auctionItem = GetItemInAuctionByLink(self, item)
    if auctionItem then
        LOG:Message("%s already in auction list. Increasing the amount to award", item:GetItemLink())
        auctionItem:IncrementTotal()
        return auctionItem
    end
    auctionItem = AuctionItem:New(item)
    AddAuctionItemToList(self, auctionItem, uid)
    return auctionItem
end

function AuctionInfo:AddExistingAuctionItem(auctionItem, uid)
    assertCantAddItems(self)
    if GetItemInAuctionByLink(self, auctionItem) then
        LOG:Message("%s already in auction list.", auctionItem:GetItemLink())
        return
    end
    AddAuctionItemToList(self, auctionItem, uid)
    return auctionItem
end

function AuctionInfo:AddItem(item, uid)
    assertCantAddItems(self)
    local auctionItem = AddItemInternal(self, item, uid)
    if auctionItem and self.roster then
        auctionItem:LoadValues(self.roster)
    end
    return auctionItem
end

function AuctionInfo:RemoveItem(item)
    assertNotInProgress(self)
    local UID = self:GetAuctionItemUID(item)
    if self.items[UID] then
        self.items[UID] = nil
        self.itemCount = self.itemCount - 1
        UpdateAuctionTime(self)
    end
end

function AuctionInfo:IsItemInAuction(auctionItem)
    return self:GetAuctionItemUID(auctionItem) ~= nil
end

function AuctionInfo:FindItemByLink(itemLink)
    if not self.itemUIDMap[itemLink] then
        for uid, item in pairs(self.items) do
            if item:GetItemLink() == itemLink then
                self.itemUIDMap[itemLink] = uid
                break
            end
        end
    end
    return self.itemUIDMap[itemLink]
end

function AuctionInfo:GetAuctionItemUID(auctionItem)
    return self:FindItemByLink(auctionItem:GetItemLink())
end

function AuctionInfo:GetItemByUID(uid)
    return self.items[uid]
end

function AuctionInfo:GetItems()
    return self.items
end

function AuctionInfo:SetResponse(uid, username, response)
    assertInProgress(self)
    local auctionItem = self.items[uid]
    if not auctionItem then
        LOG:Warning("Received response to non existent item.")
        return
    end
    auctionItem:SetResponse(username, response)
end

function AuctionInfo:IsInProgress()
    return self.state == CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS
end

function AuctionInfo:IsComplete()
    return self.state == CONSTANTS.AUCTION_INFO.STATE.COMPLETE
end

function AuctionInfo:IsAcceptingRolls()
    return (self.acceptingRolls == true)
end

function AuctionInfo:CanAddItems()
    return CONSTANTS.AUCTION_INFO.STATES_ALLOW_ADDING_ITEMS[self.state]
end

function AuctionInfo:IsEmpty()
    return (self.itemCount <= 0)
end

function AuctionInfo:GetItemCount()
    return self.itemCount
end

local function acceptRolls(self)
    self.acceptingRolls = true
end

local function ignoreRolls(self)
    self.acceptingRolls = false
end

function AuctionInfo:Roll(auctionItem)
    assertNotInProgress(self)
    assertIsAcceptingRolls(self)
     -- Reset rolls if there were any responses
     local responses = auctionItem:GetAllResponses()
     for _,response in pairs(responses) do
         response:SetRoll(0)
     end

    self.rollItem = auctionItem

    acceptRolls(self)
end

function AuctionInfo:EndRoll()
    ignoreRolls(self)
    self.rollItem = nil
end

function AuctionInfo:HandleRoll(who, roll)
    local response = self.rollItem:GetResponse(who)
    if not response then
        response = CLM.MODELS.UserResponse:New()
        self.rollItem:SetResponse(who, response, true)
    else
        -- very dirty override for hidden types
        if CONSTANTS.BID_TYPE_HIDDEN[response:Type()] then
            response.type = CONSTANTS.BID_TYPE.MAIN_SPEC
        end
    end

    -- re-rolls are ignored
    if response:Roll() == 0 then
        response:SetRoll(roll)
    end

end

function AuctionInfo:GetRollItem()
    return self.rollItem
end

function AuctionInfo:Start(endTime)
    assertNotInProgress(self)
    assertIsAcceptingRolls(self)
    self.endTime = endTime and endTime or (GetServerTime() + self.auctionTime)
    self.state = CONSTANTS.AUCTION_INFO.STATE.IN_PROGRESS
    self.antiSnipeLimit = CONSTANTS.AUCTION_TYPES_OPEN[self:GetType()] and 100 or 3

    Clear(self)
end

function AuctionInfo:End()
    assertInProgress(self)
    self.state = CONSTANTS.AUCTION_INFO.STATE.COMPLETE
end

-- Passive mode for bidders
function AuctionInfo:SetPassiveMode()
    self.passiveMode = true
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

function AuctionInfo:AntiSnipe()
    self.antiSnipeLimit = self.antiSnipeLimit - 1
    self.endTime = self.endTime + self.antiSnipe
end

function AuctionInfo:IsAntiSnipeAvailable()
    return self.antiSnipeLimit > 0
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

function AuctionInfo:GetAlwaysAllowBaseBids()
    return self.configuration:Get("baseAlways")
end

function AuctionInfo:GetAlwaysAllowAllInBids()
    return self.configuration:Get("allInAlways")
end

function AuctionInfo:GetAlwaysAllow0()
    return self.configuration:Get("always0")
end

function AuctionInfo:GetAllowEqualBids()
    return self.configuration:Get("allowEqualMax")
end

function AuctionInfo:GetAllowCancelPass()
    return self.configuration:Get("allowCancelPass")
end

function AuctionInfo:GetNamedButtonsMode()
    return self.configuration:Get("namedButtons")
end

function AuctionInfo:GetIncrement()
    return self.configuration:Get("minimalIncrement")
end

function AuctionInfo:GetTax()
    return self.configuration:Get("tax")
end

function AuctionInfo:GetRounding()
    return self.configuration:Get("roundDecimals")
end

function AuctionInfo:GetMinimumPoints()
    return self.configuration:Get("minimumPoints")
end

function AuctionInfo:GetAllowBelowMinStandings()
    return self.configuration:Get("allowBelowMinStandings")
end

function AuctionInfo:GetRollTime()
    return self.configuration:Get("rollTime")
end

function AuctionInfo:GetFieldName(tier)
    return self.roster:GetFieldName(tier)
end

function AuctionInfo:GetAwardMultiplier(class, itemId)
    return self.roster:GetClassItemMultiplierValue(class, itemId)
end

function AuctionInfo:GetRoster()
    return self.roster
end

function AuctionInfo:GetRaid()
    return self.raid
end

function AuctionInfo:HasBids(uid, username)
    local item = self.items[uid]
    if item then
        return (item:GetResponse(username) ~= nil)
    end
    return false
end

function AuctionInfo:HasUsableItems()
    if self.hasUsableItems == nil then
        self.hasUsableItems = false
        for _, item in pairs(self.items) do
            if item:GetCanUse() then
                self.hasUsableItems = true
                break
            end
        end
    end
    return self.hasUsableItems
end

function AuctionInfo:GetAnonymousName(name)
    if not self.anonymousMap[name] then
        self.anonymousMap[name] = nickMap[math.random(1,#nickMap)] .. tostring(self.nextAnonymousId)
        self.nextAnonymousId = self.nextAnonymousId + 1
    end
    return self.anonymousMap[name]
end

-----------------
--- CONSTANTS ---
-----------------
CONSTANTS.AUCTION_INFO = {
    STATE = {
        NOT_CONFIGURED = 0,
        IDLE = 1,
        IN_PROGRESS = 2,
        COMPLETE = 3
    }
}

CONSTANTS.AUCTION_INFO.STATES_ALLOW_ADDING_ITEMS = UTILS.Set({
    CONSTANTS.AUCTION_INFO.STATE.NOT_CONFIGURED,
    CONSTANTS.AUCTION_INFO.STATE.IDLE
})

CLM.MODELS.AuctionInfo = AuctionInfo
