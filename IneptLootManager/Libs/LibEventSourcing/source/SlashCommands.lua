local _, LibEventSourcing = ...
--[[
 Contains a list of tables. Each table in the list has:
  - addon: string --name of the addon that created the statemanager
  - stateManager: StateManager -- stateManager that was created

  One addon may have multiple state managers
]]--
LibEventSourcing.stateManagers = {}
local stateManagers = LibEventSourcing.stateManagers

local ChatOps = LibStub("ChatOps")

SLASH_LibEventSourcing_TimeTravel1 = "/timetravel"

local function createAutoCompleteLink(linkText, prefill, color)
    color = color or "ffff4500"
    return ChatOps.createAutoCompleteLink(ChatOps.colorize(linkText, color), prefill)
end

local function createCallbackLink(linkText, callback, color)
    color = color or "ffff4500"
    return ChatOps.createCallbackLink(ChatOps.colorize(linkText, color), callback)
end

local function printer(editBox, argb)
    local color = argb or "ff000000"
    return function(message, prefill, colorOverride)
        editBox.chatFrame:AddMessage(string.format("|c%s%s|r", colorOverride or color, message))
        if prefill ~= nil then
            C_Timer.After(0, function()
                editBox:Show()
                editBox:SetText(prefill)
                editBox:SetFocus()
            end)

        end
    end
end

local function printDetails(print, index, offset)
    local addon = stateManagers[index].addon
    local stateManager = stateManagers[index].stateManager
    print(string.format("Details for statemanager %d from addon %s", index, addon))
    print(string.format("State manager has %d entries", stateManager:logSize()))

    local oldestEntry = stateManager:getSortedList():entries()[1]:time()
    print(string.format("The oldest entry has timestamp %d (%s)", oldestEntry, date(nil, oldestEntry)))

    if (stateManager:isTimeTraveling()) then
        print("Currently timetravelling, use stop to stop traveling", string.format("/timetravel %d stop", index))
        return
    end

    print("Here is a list of timestamps of the past few weeks:")
    offset = offset or 0
    for i = 0, 4 do
        local timestamp = GetServerTime() - 7 * 24 * 3600 * (i + offset)
        local link = createAutoCompleteLink(timestamp, string.format("/timetravel %d travel %d", index, timestamp))
        print(string.format("%s %s", link, date(nil, timestamp)))
    end
    print(createCallbackLink('<< Go back further', function()
        printDetails(print, index, offset + 5)
    end))
    print("Pick a timestamp to travel back to or use stop to stop traveling", string.format("/timetravel %d travel ", index))

end

local function printHelp(print)
    print("This is the EventSourcing time travel help")
    print("Below is a list of registered State Managers that support time travel")
    for i, v in ipairs(stateManagers) do
        local addon = v.addon
        local stateManager = v.stateManager
        if type(stateManager.isTimeTraveling) == 'function' then
            local linkText  = string.format("State Manager %d", i)
            local link = createCallbackLink(linkText, function()
                printDetails(print, i)
            end)
            print(string.format("%s created by %s", link, addon), nil, "ff00ff00")
        end
    end
    print("Continue by choosing a state manager", "/timetravel ")

end

local function timeTravel(print, index, timestamp)
    local addon = stateManagers[index].addon
    local stateManager = stateManagers[index].stateManager
    print(string.format("Time traveling State Manager %d from addon %s to %s", index, addon, date(nil, timestamp)))
    stateManager:travelToTime(timestamp)

end

local function stopTimeTravel(print, index)
    local addon = stateManagers[index].addon
    local stateManager = stateManagers[index].stateManager
    print(string.format("Stopping time traveling State Manager %d from addon %s", index, addon))
    stateManager:stopTimeTravel()


end


local function parsePattern(buffer, pattern)
    local start, offset, n = string.find(buffer, pattern)
    if (start == nil) then
        return nil, buffer
    end
    return n, string.sub(buffer, offset + 1)
end

local function parseNumber(buffer)
    local n, newBuffer = parsePattern(buffer, "^%s*(%d+)")
    return tonumber(n), newBuffer
end

local function parseStop(buffer)
    return parsePattern(buffer, "^%s(stop)")
end
local function parseTravel(buffer)
    return parsePattern(buffer, "^%s(travel)")
end

local function parseAny(buffer, ...)
    for _, parser in ipairs({...}) do
        local result, newBuffer = parser(buffer)
        if result ~= nil then
            return result, newBuffer
        end
    end
    return nil, buffer
end

local function parseCommand(buffer)
    return parseAny(buffer, parseStop, parseTravel)
end




local function handleTimeTravelCommand(msg, source)
    local pprint = printer(source, "ffff0000")

    -- parse the message.
    local buffer = msg
    local stateManagerIndex
    local command

    stateManagerIndex, buffer = parseNumber(buffer)

    if (stateManagerIndex == nil) then
        return printHelp(pprint)
    end
    command, buffer = parseCommand(buffer)
    if command == 'stop' then
        return stopTimeTravel(pprint, stateManagerIndex)
    end

    if command == 'travel' then
        local target = parseNumber(buffer)
        if (target ~= nil) then
            timeTravel(pprint, stateManagerIndex, target)
        end

    end
    return printDetails(pprint, stateManagerIndex)


end
SlashCmdList["LibEventSourcing_TimeTravel"] = handleTimeTravelCommand