--[[
This file is used for direct inclusion outside WoW

]]--
if (GetTime == nil) then
    require "_wowstubs"
    require "libs/LibStub/LibStub"
    require "Util"
    require "SortedList"
    require "LogEntry"
    require "StateManager"
    require "source/Message"
    require "source/AdvertiseHashMessage"
    require "source/WeekDataMessage"
    require "source/RequestWeekMessage"
    require "source/BulkDataMessage"
    require "ListSync"
    require "LedgerFactory"
    math.randomseed(os.time())
end
