local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/RequestWeek", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")
local Util = LibStub("EventSourcing/Util")
local RequestWeekMessage = Message:extend('RW')

function RequestWeekMessage:new(week)
    local o = Message.new(self)
    Util.assertNumber(week, 'week')
    o.week = week
    return o
end

function RequestWeekMessage:validate()
    Message.validate(self)
    Util.assertNumber(self.week, 'week')
end


function Factory.create(week)
    return RequestWeekMessage:new(week)
end

function Factory.type()
    return RequestWeekMessage._type
end
