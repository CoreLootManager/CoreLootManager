local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/AdvertiseHash", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")

local AdvertiseHashMessage = Message:extend('AHM')

function AdvertiseHashMessage:new()
    local o = Message.new(self)
    o.hashes = {}
    return o
end

function AdvertiseHashMessage:addHash(week, hash, count)
    self.hashes[#self.hashes + 1] = {week, hash, count}
end
function AdvertiseHashMessage:hashCount()
    return #self.hashes
end

function Factory.create()
    return AdvertiseHashMessage:new()
end

function Factory.type()
    return AdvertiseHashMessage._type
end
