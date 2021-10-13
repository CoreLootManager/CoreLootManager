local  _, CLM = ...

local eventDispatcher = LibStub("EventDispatcher")


local CLM_USER_RECEIVED_POINTS = 'CLM_USER_RECEIVED_POINTS'
local CLM_RAID_RECEIVED_POINTS = 'CLM_RAID_RECEIVED_POINTS'

-- storing reference to value not function, this value doesn't change
local myGUID = CLM.UTILS.whoamiGUID()


--[[
	This module exposes an internal API for CLM to allow it to trigger events.
	Events might be for the current user or someone else. This module will decide if / how and when to 
	dispatch an event through the dispatcher.
]]

CLM.ALERTS.DKPReceived = function(amount, guid, timestamp)
	--[[
		We don't use nested ifs here; instead we exit early, this makes the code more readable.
		The idea is that we try dispatching one event and as soon as we succeed we return.
	]]
	if (guid == myGUID) then
		eventDispatcher.dispatchEventWithTTL(CLM_USER_RECEIVED_POINTS, {
			amount = amount
		}, timestamp)
		return
	end

	-- dirty implementation, for demonstration purposes and to keep it simple
	-- since gathering data for raid members could be considered expensive, we could discard old timestamps immediately.
	if timestamp + 1000 < GetServerTime() then
		return
	end

	for i = 1, 40 do
		if guid == UnitGUID('raid' .. i)  then
			eventDispatcher.dispatchEventWithTTL(CLM_RAID_RECEIVED_POINTS, {
				amount = amount,
				name = UnitName(guid)
			}, timestamp)
			return
		end
	end
end









--[[

Everything below is a "separate" addon. It does not depend on CLM in any way.
Note that the part below uses the XML file while the part above does not.

]]

local function DKPReceivedAlertFrame_SetUp(self, amount)
	self.Amount:SetText(amount .. " DKP");
	PlaySound(SOUNDKIT.UI_EPICLOOT_TOAST);
end

local DKPReceivedAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("DKPReceivedAlertFrameTemplate", DKPReceivedAlertFrame_SetUp, 6, math.huge);

-- Using a string event name here so we don't depend on CLM actually being available.
eventDispatcher.addEventListener("CLM_USER_RECEIVED_POINTS", function(data)
	DKPReceivedAlertSystem:AddAlert(data.amount)
end)

-- For raid members we print something, again illustration mostly.
eventDispatcher.addEventListener("CLM_RAID_RECEIVED_POINTS", function(data)
	print(string.format("A raid member by the name %s just received %d points", data.name, data.amount));
end)