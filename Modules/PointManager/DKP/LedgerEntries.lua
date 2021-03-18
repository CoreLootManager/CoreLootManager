local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local typeof = UTILS.typeof
local getIntegerGuid = UTILS.getIntegerGuid

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- Point DKP X
local Modify = LogEntry:extend("PDM")
local Set = LogEntry:extend("PDS")
local Decay = LogEntry:extend("PDD")

local function GetGUIDFromEntry(e)
    if typeof(e, MODELS.Profile) then
        return getIntegerGuid(e:GUID())
    elseif typeof(e) == "number" then
        return e
    elseif typeof(e) == "string" then
        return getIntegerGuid(e)
    else
        return nil
    end
end

local function CreateGUIDList(playerList)
    local playerGUIDList = {}
    local GUID
    -- We expect list of either: GUID in string/integer form or profile
    -- List is expected always
    for _, p in ipairs(playerList) do
        GUID = GetGUIDFromEntry(p)
        if GUID ~= nil then
            table.insert(playerGUIDList, GUID)
        end
    end
    return playerGUIDList
end

function Modify:new(rosterUid, playerList, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.tar = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    return o
end

function Modify:rosterUid()
    return self.r
end

function Modify:targets()
    return self.tar
end

function Modify:value()
    return self.v
end

function Set:new(rosterUid, playerList, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.tar = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    return o
end

function Set:rosterUid()
    return self.r
end

function Set:targets()
    return self.tar
end

function Set:value()
    return self.v
end

function Decay:new(rosterUid, playerList, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.tar = CreateGUIDList(playerList)
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = value
    return o
end

function Decay:rosterUid()
    return self.r
end

function Decay:targets()
    return self.tar
end

function Decay:value()
    return self.v
end

MODELS.DKPLedgerEntries = {
    Modify = Modify,
    Set = Set,
    Decay = Decay
}
