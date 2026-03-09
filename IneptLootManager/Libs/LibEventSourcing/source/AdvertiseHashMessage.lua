local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/AdvertiseHash", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")
local Util = LibStub("EventSourcing/Util")

local AdvertiseHashMessage = Message:extend('AHM')

function AdvertiseHashMessage:new(firstWeek, entryCount, stateHash, lag)
    local o = Message.new(self)
    o.hashes = {}
    o.firstWeek = firstWeek
    o.totalEntryCount = entryCount
    o.stateHash = stateHash
    o.lag = lag
    return o
end

function AdvertiseHashMessage:validate()
    Message.validate(self)
    Util.assertNumber(self.firstWeek, 'week')
    Util.assertNumber(self.totalEntryCount, 'totalEntryCount')
    Util.assertNumber(self.stateHash, 'stateHash')
    Util.assertNumber(self.lag, 'lag')
    for i, v in ipairs(self.hashes) do
        Util.assertNumber(v[1], string.format('hashes[%d].week', i))
        Util.assertNumber(v[2], string.format('hashes[%d].hash', i))
        Util.assertNumber(v[3], string.format('hashes[%d].count', i))
    end
end

function AdvertiseHashMessage:addHash(week, hash, count)
    self.hashes[#self.hashes + 1] = {week, hash, count}
end
function AdvertiseHashMessage:hashCount()
    return #self.hashes
end

function Factory.create(firstWeek, entryCount, stateHash, lag)
    return AdvertiseHashMessage:new(firstWeek, entryCount, stateHash, lag)
end

function Factory.type()
    return AdvertiseHashMessage._type
end
