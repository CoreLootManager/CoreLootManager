local  _, CLM = ...

local eventDispatcher = LibStub("EventDispatcher")

local CLM_RECEIVED_POINTS = 'CLM_RECEIVED_POINTS'

CLM.ALERTS.DKPReceived = function(amount, timestamp)
	eventDispatcher.dispatchEventWithTTL(CLM_RECEIVED_POINTS, {
		amount = amount
	}, timestamp);
end


local function DKPReceivedAlertFrame_SetUp(self, amount)
	self.Amount:SetText(amount .. " DKP");
	PlaySound(SOUNDKIT.UI_EPICLOOT_TOAST);
end

local DKPReceivedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("DKPReceivedAlertFrameTemplate", DKPReceivedAlertFrame_SetUp, 6, math.huge);

eventDispatcher.addEventListener(CLM_RECEIVED_POINTS, function(data)
	DKPReceivedAlertSystem:AddAlert(data.amount)
end)