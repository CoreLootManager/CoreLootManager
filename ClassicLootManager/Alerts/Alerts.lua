local _, CLM = ...
local CONSTANTS = CLM.CONSTANTS

local eventDispatcher = LibStub("EventDispatcher")

local USER_RECEIVED_ITEM = "CLM_USER_RECEIVED_ITEM"
local USER_RECEIVED_POINTS = "CLM_USER_RECEIVED_POINTS"
local USER_BID_ACCEPTED = "CLM_BID_ACCEPTED"
local USER_BID_DENIED = "CLM_BID_DENIED"

local POINT_CHANGE_REASON_DECAY = 101

local function DKPReceivedAlertFrame_SetUp(self, data)
    local value = tonumber(data.value) or 0
    value = (value ~= nil) and tostring(value) or tostring(data.value)
    if data.reason ~= POINT_CHANGE_REASON_DECAY then
        local suffix = ((data.pointType == CONSTANTS.POINT_TYPE.DKP) and CLM.L["DKP"] or CLM.L["EP"])
        self.Amount:SetText(string.format(CLM.L["%s %s"], value, suffix))
    else
        local suffix = ((data.pointType == CONSTANTS.POINT_TYPE.DKP) and CLM.L["DKP"] or CLM.L["EP/GP"])
        self.Amount:SetText(string.format(CLM.L["%s %% %s decay"], value, suffix))
    end
    PlaySound(SOUNDKIT.UI_EPICLOOT_TOAST)
end

local DKPReceivedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("DKPReceivedAlertFrameTemplate", DKPReceivedAlertFrame_SetUp, 6, math.huge)

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

eventDispatcher.addEventListener(USER_RECEIVED_POINTS, function(event, data)
    if not CLM.GlobalConfigs:GetAlerts() then return end
    DKPReceivedAlertSystem:AddAlert(data)
end)

eventDispatcher.addEventListener(USER_RECEIVED_ITEM, function(event, data)
    if not CLM.GlobalConfigs:GetAlerts() then return end
    LootAlertSystem:AddAlert("item: " .. data.id, 1)
end)

eventDispatcher.addEventListener(USER_BID_ACCEPTED, function(event, data)
    if not CLM.GlobalConfigs:GetAlerts() then return end
    BidAcceptedAlertSystem:AddAlert(data)
end)

eventDispatcher.addEventListener(USER_BID_DENIED, function(event, data)
    if not CLM.GlobalConfigs:GetAlerts() then return end
    BidDeniedAlertSystem:AddAlert(data)
end)
