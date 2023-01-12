local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/RequestState", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")
local RequestStateMessage = Message:extend('RS')

function RequestStateMessage:new()
    local o = Message.new(self)
    return o
end

function RequestStateMessage:validate()
    Message.validate(self)
end

function Factory.create(...)
    return RequestStateMessage:new()
end

function Factory.type()
    return RequestStateMessage._type
end
