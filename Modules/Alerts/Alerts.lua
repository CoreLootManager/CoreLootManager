-- Intentionally separated from CLM to use as a separate addon through dispatcher
local eventDispatcher = LibStub("EventDispatcher")

local USER_RECEIVED_ITEM = "CLM_USER_RECEIVED_ITEM"
local USER_RECEIVED_POINTS = "CLM_USER_RECEIVED_POINTS"

local POINT_CHANGE_REASON_DECAY = 101

local function DKPReceivedAlertFrame_SetUp(self, data)
    if data.reason ~= POINT_CHANGE_REASON_DECAY then
        self.Amount:SetText(data.value .. " DKP")
    else
        self.Amount:SetText(data.value .. "% DKP decay")
    end
    PlaySound(SOUNDKIT.UI_EPICLOOT_TOAST)
end

local DKPReceivedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("DKPReceivedAlertFrameTemplate", DKPReceivedAlertFrame_SetUp, 6, math.huge)
eventDispatcher.addEventListener(USER_RECEIVED_POINTS, function(event, data)
    DKPReceivedAlertSystem:AddAlert(data)
end)

eventDispatcher.addEventListener(USER_RECEIVED_ITEM, function(event, data)
    LootAlertSystem:AddAlert("item: " .. data.id, 1)
end)