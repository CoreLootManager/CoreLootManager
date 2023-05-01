-- Placeholders for WoW functions

GetTime = os.clock
GetTimePreciseSec = os.clock

strmatch = string.match


C_Timer = {
    tickers = {}
}

SlashCmdList = {}
ItemRefTooltip = {}

local tickers = C_Timer.tickers

function C_Timer.Tick()
    for _, callbacks in pairs(tickers) do
        for _, callback in ipairs(callbacks) do
            callback()
        end
    end
end
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
            C_Timer.Tick()
        end
        print("\nEvent loop stopped")
    end
end

function UnitName()
    return "Bob"
end

function UnitGUID(target)
    if target == "player" then
        return "Player-1234-ABCDABCD"
    elseif target == "Bob" then
        return "Player-111-0ABCDABC"
    elseif target == "Joe" then
        return "Player-012-ABCDABCE"
    else
        error(string.format("Unknown target '%s'", target))
    end

end

function GetPlayerInfoByGUID(guid)
    if "Player-111-0ABCDABC" == guid then
        return nil, nil, nil, nil, nil, "Bob", nil
    else
        error(string.format("Unknown GUID: %s", guid))
    end
end
function UnitAffectingCombat(target)
    return false
end

date = os.date

WOW_STUB = true

strsplit = function(delimiter, str, pieces)
    pieces = tonumber(pieces) or math.huge
    if delimiter == nil then
        delimiter = "%s"
    end
    local t = {}
    for token in string.gmatch(str, "([^"..delimiter.."]+)") do
        t[#t+1] = token
        if #t >= pieces then
            break
        end
    end
    return unpack(t)
end

GetBuildInfo = function()
    return "3.4.1", "45678", "Apr 01 2023", 30401
end