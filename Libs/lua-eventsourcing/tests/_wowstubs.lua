-- Placeholders for WoW functions

GetTime = os.clock
GetTimePreciseSec = os.clock

strmatch = string.match


C_Timer = {
}

local tickers = {}

function C_Timer.NewTicker(interval, callback)
    interval = math.max(1, math.floor(interval))
    if tickers[interval] == nil then
        tickers[interval] = {}
    end
    table.insert(tickers[interval], callback)
end

function C_Timer.startEventLoop()
    if os.execute ~= nil then
        print("Starting custom event loop to mimic WOW C_Timer tickers")
        local i = 0
        while os.execute("sleep 1") == 0 do
            io.write('.')
            io.flush()
            for interval, callbacks in pairs(tickers) do
                if (i % interval == 0) then
                    for _, callback in ipairs(callbacks) do
                        callback()
                    end
                end

            end
            i = i + 1
        end
        print("\nEvent loop stopped")
    end
end

function UnitName()
    return "Bob"
end

function UnitGUID(target)
    if target == "player" then
        return "00000000-0000-BOB-0000-000000000"
    else
        error(string.format("Unknown target '%s'", target))
    end

end

function GetPlayerInfoByGUID(guid)
    if "00000000-0000-BOB-0000-0000000000" == guid then
        return nil, nil, nil, nil, nil, "Bob", nil
    else
        error(string.format("Unknown GUID: %s", guid))
    end
end
function UnitAffectingCombat(target)
    return false
end

function GetServerTime()
    return os.time()
end

date = os.date

WOW_STUB = true
print("Stubs loaded")
