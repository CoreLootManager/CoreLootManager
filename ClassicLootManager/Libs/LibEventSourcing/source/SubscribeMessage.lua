local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/Subscribe", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")
local SubscribeMessage = Message:extend('SB')

function SubscribeMessage:new()
    local o = Message.new(self)
    return o
end

function SubscribeMessage:validate()
    Message.validate(self)
end


function Factory.create()
    return SubscribeMessage:new()
end

function Factory.type()
    return SubscribeMessage._type
end
