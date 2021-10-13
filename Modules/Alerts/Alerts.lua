local  _, CLM = ...

local function DKPReceivedAlertFrame_SetUp(self, amount)
	self.Amount:SetText(amount .. " DKP");
	PlaySound(SOUNDKIT.UI_EPICLOOT_TOAST);
end

CLM.ALERTS.DKPReceivedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("DKPReceivedAlertFrameTemplate", DKPReceivedAlertFrame_SetUp, 6, math.huge);