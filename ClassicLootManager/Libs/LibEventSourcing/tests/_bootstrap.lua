require "tests/_wowstubs"

local addonName = "DoesNotMatter"
local addonTable = {}

local function parseXml(xmlFile, prefix)
    prefix = prefix or ''
    for line in io.lines(xmlFile) do
        for file in string.gmatch(line, 'Script file="(.+\.lua)"') do
            local search = prefix .. file:gsub('\\', '/');
            loadfile(search, "bt", {})(addonName, addonTable)
        end
        for file in string.gmatch(line, 'Include file="(.+\.xml)"') do
            local xmlFile = prefix .. file:gsub('\\', '/');
            -- get the new prefix
            local newPrefix = string.match(xmlFile, "(.*/).*")
            print("new prefix", newPrefix)
            parseXml(xmlFile, newPrefix)
        end
    end
end

parseXml('LibEventSourcing.xml')
math.randomseed(os.time())

local Util = LibStub("EventSourcing/Util")
local assertionStatistics = {
    total = 0,
    passed = 0,
    failed = 0
}
function assertTrue(param, message)
    assertionStatistics["total"] = assertionStatistics["total"] + 1
    assert(param == true, "Assertion failed: " .. (message or ''))
    assertionStatistics["passed"] = assertionStatistics["passed"] + 1
end

function assertFalse(param, message)
    assertionStatistics["total"] = assertionStatistics["total"] + 1
    assert(param == false, message or "failed asserting that param is false")
    assertionStatistics["passed"] = assertionStatistics["passed"] + 1
end

function assertSame(expected, value)
    assertionStatistics["total"] = assertionStatistics["total"] + 1
    assert(expected == value, "failed assert that expected " .. (expected or 'NIL') .. " matches " .. (value or 'NIL'))
    assertionStatistics["passed"] = assertionStatistics["passed"] + 1
end

function assertNotSame(expected, value)
    assertionStatistics["total"] = assertionStatistics["total"] + 1
    assert(expected ~= value, "failed assert that expected " .. (expected or 'NIL') .. " does not match " .. (value or 'NIL'))
    assertionStatistics["passed"] = assertionStatistics["passed"] + 1
end

function assertEmpty(table)
    assertCount(0, table)
end

function assertCount(expected, table)
    assertionStatistics["total"] = assertionStatistics["total"] + 1
    assert(#table == expected, string.format("failed assert that table has length %d", expected))
    assertionStatistics["passed"] = assertionStatistics["passed"] + 1
end
function assertError(cb)
    assertionStatistics["total"] = assertionStatistics["total"] + 1
    assert(pcall(cb) == false, "Assert failed: Expected error")
    assertionStatistics["passed"] = assertionStatistics["passed"] + 1
end

local Util = LibStub("EventSourcing/Util")
-- freeze time
local ts = Util.time()
Util.time = function() return ts  end

function printResultsAndExit()
    Util.DumpTable(assertionStatistics)
    if (assertionStatistics['failed'] > 0) then
        os.exit(1)
    else
        os.exit(0)
    end
end

function beginTests()
    print(string.format("Starting tests in file %s", arg[0]))
end
