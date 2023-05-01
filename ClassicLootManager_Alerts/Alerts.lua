local CLM = LibStub("ClassicLootManager").CLM
if not CLM then return end

local eventDispatcher = LibStub("EventDispatcher")
if not eventDispatcher then return end

local function PointReceivedAlertFrame_SetUp(self, data)
    local value = tonumber(data.value) or 0
    value = (value ~= nil) and tostring(value) or tostring(data.value)
    if data.reason ~= CLM.CONSTANTS.POINT_CHANGE_REASON.DECAY then
        local suffix = CLM.L[data.pointType]
        self.Amount:SetText(string.format(CLM.L["%s %s"], value, suffix))
    else
        local suffix = ((data.pointType == "DKP") and CLM.L["DKP"] or CLM.L["EP/GP"])
        self.Amount:SetText(string.format(CLM.L["%s %% %s decay"], value, suffix))
    end
    PlaySound(SOUNDKIT.UI_EPICLOOT_TOAST)
end

local PointReceivedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("PointReceivedAlertFrameTemplate", PointReceivedAlertFrame_SetUp, 6, math.huge)

local function BidAcceptedAlertFrame_SetUp(self, data)
    local value = tonumber(data.value)
    value = (value ~= nil) and tostring(value) or tostring(data.value)
    self.Amount:SetText(string.format(CLM.L["Bid %s accepted!"], value))
end

local BidAcceptedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("BidAcceptedAlertFrameTemplate", BidAcceptedAlertFrame_SetUp, 6, math.huge)

local function BidDeniedAlertFrame_SetUp(self, data)
    local value = tonumber(data.value)
    value = (value ~= nil) and tostring(value) or tostring(data.value)
    self.Amount:SetText(string.format(CLM.L["Bid %s denied!"], value))
end

local BidDeniedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("BidDeniedAlertFrameTemplate", BidDeniedAlertFrame_SetUp, 6, math.huge)

eventDispatcher.addEventListener(CLM.CONSTANTS.EVENTS.USER_RECEIVED_POINTS, function(event, data)
    PointReceivedAlertSystem:AddAlert(data)
end)

eventDispatcher.addEventListener(CLM.CONSTANTS.EVENTS.USER_RECEIVED_ITEM, function(event, data)
    LootAlertSystem:AddAlert(data.link or "item:0", 1)
end)

eventDispatcher.addEventListener(CLM.CONSTANTS.EVENTS.USER_BID_ACCEPTED, function(event, data)
    BidAcceptedAlertSystem:AddAlert(data)
end)

eventDispatcher.addEventListener(CLM.CONSTANTS.EVENTS.USER_BID_DENIED, function(event, data)
    BidDeniedAlertSystem:AddAlert(data)
end)
