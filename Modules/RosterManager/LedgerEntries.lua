local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local typeof = UTILS.typeof
-- local getIntegerGuid = UTILS.getIntegerGuid
-- local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- local inflate = UTILS.inflate
local deflate = UTILS.deflate

local RosterCreate                  = LogEntry:extend("R0")
local RosterDelete                  = LogEntry:extend("R1")
local RosterRename                  = LogEntry:extend("R2")
local RosterUpdateConfig            = LogEntry:extend("R3")
local RosterUpdateConfigSingle      = LogEntry:extend("R4")
local RosterUpdateDefault           = LogEntry:extend("R5")
local RosterUpdateDefaultSingle     = LogEntry:extend("R6")
local RosterUpdateOverrides         = LogEntry:extend("R7")
local RosterUpdateOverridesSingle   = LogEntry:extend("R8")
local RosterUpdateProfiles          = LogEntry:extend("R9")

-- ------------ --
-- RosterCreate --
-- ------------ --
function RosterCreate:new(rosterUid, name)
    local o = LogEntry.new(self);
    o.n = tostring(name) or ""
    o.r = tonumber(rosterUid) or 0
    return o
end

function RosterCreate:rosterUid()
    return self.r
end

function RosterCreate:name()
    return self.n
end

-- ------------ --
-- RosterDelete --
-- ------------ --
function RosterDelete:new(rosterUid)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    return o
end

function RosterDelete:rosterUid()
    return self.r
end

-- ------------ --
-- RosterRename --
-- ------------ --
function RosterRename:new(rosterUid, name)
    local o = LogEntry.new(self);
    o.n = tostring(name) or ""
    o.r = tonumber(rosterUid) or 0
    return o
end

function RosterRename:rosterUid()
    return self.r
end

function RosterRename:name()
    return self.n
end

-- ------------------ --
-- RosterUpdateConfig --
-- ------------------ --
function RosterUpdateConfig:new(rosterUid, config)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    if not typeof(config, MODELS.RosterConfiguration) then
        config = MODELS.RosterConfiguration:New()
    end
    o.o = deflate(config)
    return o
end

function RosterUpdateConfig:rosterUid()
    return self.r
end

function RosterUpdateConfig:config()
    return self.o
end

-- ------------------------ --
-- RosterUpdateConfigSingle --
-- ------------------------ --
function RosterUpdateConfigSingle:new(rosterUid, config, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.c = tostring(config) or ""
    o.v = value
    return o
end

function RosterUpdateConfigSingle:rosterUid()
    return self.r
end

function RosterUpdateConfigSingle:config()
    return self.c
end

function RosterUpdateConfigSingle:value()
    return self.v
end
-- ------------------- --
-- RosterUpdateDefault --
-- ------------------- --
function RosterUpdateDefault:new(rosterUid, defaults)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.d = defaults or {}
    return o
end

function RosterUpdateDefault:rosterUid()
    return self.r
end

function RosterUpdateDefault:defaults()
    return self.d
end

-- ------------------------- --
-- RosterUpdateDefaultSingle --
-- ------------------------- --
function RosterUpdateDefaultSingle:new(rosterUid, slot, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.c = tostring(slot) or "" -- not the most optimal but i don't expect it to be changed too often
    o.v = value
    return o
end

function RosterUpdateDefaultSingle:rosterUid()
    return self.r
end

function RosterUpdateDefaultSingle:config()
    return self.c
end

function RosterUpdateDefaultSingle:value()
    return self.v
end
-- ------------------------ --
-- RosterUpdateOverrides --
-- ------------------------ --
function RosterUpdateOverrides:new(rosterUid, overrides)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.o = overrides or {} -- TODO: Implement when creating the overrides
    return o
end

-- --------------------------- --
-- RosterUpdateOverridesSingle --
-- --------------------------- --
function RosterUpdateOverridesSingle:new(rosterUid, itemId, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.i = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
end

function RosterUpdateOverridesSingle:rosterUid()
    return self.r
end

function RosterUpdateOverridesSingle:itemId()
    return self.i
end

function RosterUpdateOverridesSingle:value()
    return self.v
end

-- -------------------- --
-- RosterUpdateProfiles --
-- -------------------- --
function RosterUpdateProfiles:new(rosterUid, profiles, remove)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(profiles)
    o.e = remove and true or false
    return o
end

function RosterUpdateProfiles:rosterUid()
    return self.r
end

function RosterUpdateProfiles:profiles()
    return self.p
end

function RosterUpdateProfiles:remove()
    return self.e
end

MODELS.LEDGER.Roster = {
    Create                  = RosterCreate,
    Delete                  = RosterDelete,
    Rename                  = RosterRename,
    UpdateConfig            = RosterUpdateConfig,
    UpdateConfigSingle      = RosterUpdateConfigSingle,
    UpdateDefault           = RosterUpdateDefault,
    UpdateDefaultSingle     = RosterUpdateDefaultSingle,
    UpdateOverrides         = RosterUpdateOverrides,
    UpdateOverridesSingle   = RosterUpdateOverridesSingle,
    UpdateProfiles          = RosterUpdateProfiles
}
