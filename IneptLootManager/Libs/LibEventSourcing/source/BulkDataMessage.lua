local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/BulkData", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")

local BulkDataMessage = Message:extend('BD')

function BulkDataMessage:new()
    local o = Message.new(self)
    o.entries = {}
    return o
end

function BulkDataMessage:addEntry(listLogEntry)
    if type(listLogEntry) ~= "table" or listLogEntry[1] == nil then
        error("Entry must be list")
    end
    self.entries[#self.entries + 1] = listLogEntry
end

function Factory.create()
    return BulkDataMessage:new()
end

function Factory.type()
    return BulkDataMessage._type
end
