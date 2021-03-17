--[[
    This event models an amount of points given to a set of players on a specific ledger
]]--

local Factory, _ = LibStub:NewLibrary("EventSourcing/PercentageDecayEntry", 1)
if not Factory then
    return
end

local LogEntry = LibStub("EventSourcing/LogEntry")
local PercentageDecayEntry = LogEntry:extend('PDE')

function PercentageDecayEntry:new(percentage, creator, players)
    local o = LogEntry.new(self, creator);
    o.p = players
    o.a = percentage
    return o
end

function PercentageDecayEntry:applyDecay(balance)
    -- We multiply by 100 and divide by 100 outside the floor to implement rounding
    return math.floor(balance * 100 * 100 / (100 + self.a)) / 100
end

function PercentageDecayEntry:amount()
    return self.a
end

function Factory.create(percentage, creator, players)
    return PercentageDecayEntry:new(percentage, creator, players)
end

function Factory.class()
    return PercentageDecayEntry
end
