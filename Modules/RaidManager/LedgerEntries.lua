local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local CreateGUIDList = UTILS.CreateGUIDList
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Begin = LogEntry:extend("RMB");
local End = LogEntry:extend("RME");
local Update = LogEntry:extend("RMU");

MODELS.LEDGER.RAID = {
    Begin = Begin,
    End = End,
    Update = Update
}

function Begin:new(rosterUid, playerList, name, config)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList);
    o.n = name or "Raid without name";
    o.c = config or nil;

    return o
end

function Begin:targets()
    return self.p
end

function Begin:name()
    return self.n
end

function Begin:config()
    return self.c;
end

local beginFields = mergeLists(LogEntry:fields(), {"r", "p", "n", "c"})
function Begin:fields()
    return beginFields
end

function End:new(raidUid)
    local o = LogEntry.new(self);
    o.r = raidUid;
    return o
end

function End:raid()
    return self.r;
end

local endFields = mergeLists(LogEntry:fields(), {"r"})
function End:fields()
    return endFields
end

function Update:new(raidUid, leavers, joiners)
    local o = LogEntry.new(self);
    o.r = raidUid;
    o.l = CreateGUIDList(leavers);
    o.j = CreateGUIDList(joiners);
    return o
end

function Update:raid()
    return self.r;
end

function Update:leavers()
    return self.l;
end

function Update:joiners()
    return self.j;
end

local updateFields = mergeLists(LogEntry:fields(), {"r", "l", "j"})
function Update:fields()
    return updateFields
end
