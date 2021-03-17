--[[
    This event models an amount of points given to a set of players on a specific ledger
]]--
local Factory, _ = LibStub:NewLibrary("EventSourcing/PlayerAmountEntry", 1)
if not Factory then
    return
end


local LogEntry = LibStub("EventSourcing/LogEntry")
local PlayerAmountEntry = LogEntry:extend('PAE')

function PlayerAmountEntry:new(players, amount, creator)
    local o = LogEntry.new(self, creator)
    o.p = players
    o.a = amount
    return o
end


function PlayerAmountEntry:players()
    return self.p
end

function PlayerAmountEntry:amount()
    return self.a
end

function PlayerAmountEntry:fields()
    local result = LogEntry:fields()
    table.insert(result, 'p')
    table.insert(result, 'a')
    return result
end

function Factory.create(players, amount, creator)
    return PlayerAmountEntry:new(players, amount, creator)
end

function Factory.class()
    return PlayerAmountEntry
end
