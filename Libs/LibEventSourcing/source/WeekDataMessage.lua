local Factory, _ = LibStub:NewLibrary("EventSourcing/Message/WeekData", 1)
if not Factory then
    return
end


local Message = LibStub("EventSourcing/Message")

local WeekDataMessage = Message:extend('WD')

function WeekDataMessage:new(week, hash)
    local o = Message.new(self)
    o.week = week
    o.hash = hash
    o.entries = {}
    return o
end

function WeekDataMessage:addEntry(listLogEntry)
    if type(listLogEntry) ~= "table" or listLogEntry[1] == nil then
        error("Entry must be list")
    end
    self.entries[#self.entries + 1] = listLogEntry
end

function Factory.create(week, hash)
    return WeekDataMessage:new(week, hash)
end

function Factory.type()
    return WeekDataMessage._type
end
