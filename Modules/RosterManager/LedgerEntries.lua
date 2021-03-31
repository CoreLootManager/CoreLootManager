local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local merge = UTILS.merge
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
local RosterCopyData                = LogEntry:extend("RC")

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

local RosterCreateFields = merge(LogEntry:fields(), {"r", "n"})
function RosterCreate:fields()
    return RosterCreateFields
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

local RosterDeleteFields = merge(LogEntry:fields(), {"r"})
function RosterDelete:fields()
    return RosterDeleteFields
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

local RosterRenameFields = merge(LogEntry:fields(), {"r", "n"})
function RosterRename:fields()
    return RosterRenameFields
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
    o.c = deflate(config)
    return o
end

function RosterUpdateConfig:rosterUid()
    return self.r
end

function RosterUpdateConfig:config()
    return self.c
end

local RosterUpdateConfigFields = merge(LogEntry:fields(), {"r", "c"})
function RosterUpdateConfig:fields()
    return RosterUpdateConfigFields
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

local RosterUpdateConfigSingleFields = merge(LogEntry:fields(), {"r", "c", "v"})
function RosterUpdateConfigSingle:fields()
    return RosterUpdateConfigSingleFields
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

local RosterUpdateDefaultFields = merge(LogEntry:fields(), {"r", "d"})
function RosterUpdateDefault:fields()
    return RosterUpdateDefaultFields
end
-- ------------------------- --
-- RosterUpdateDefaultSingle --
-- ------------------------- --
function RosterUpdateDefaultSingle:new(rosterUid, slot, minValue, maxValue)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.d = tostring(slot) or "" -- not the most optimal but i don't expect it to be changed too often
    o.i = tonumber(minValue) or 0
    o.a = tonumber(maxValue) or 0
    return o
end

function RosterUpdateDefaultSingle:rosterUid()
    return self.r
end

function RosterUpdateDefaultSingle:config()
    return self.d
end

function RosterUpdateDefaultSingle:min()
    return self.i
end

function RosterUpdateDefaultSingle:max()
    return self.a
end

local RosterUpdateDefaultSingleFields = merge(LogEntry:fields(), {"r", "d", "i", "a"})
function RosterUpdateDefaultSingle:fields()
    return RosterUpdateDefaultSingleFields
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

local RosterUpdateOverridesFields = merge(LogEntry:fields(), {"r", "o"})
function RosterUpdateOverrides:fields()
    return RosterUpdateOverridesFields
end
-- --------------------------- --
-- RosterUpdateOverridesSingle --
-- --------------------------- --
function RosterUpdateOverridesSingle:new(rosterUid, itemId, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.o = tonumber(itemId) or 0
    o.v = tonumber(value) or 0
    return o
end

function RosterUpdateOverridesSingle:rosterUid()
    return self.r
end

function RosterUpdateOverridesSingle:itemId()
    return self.o
end

function RosterUpdateOverridesSingle:value()
    return self.v
end

local RosterUpdateOverridesSingleFields = merge(LogEntry:fields(), {"r", "o", "v"})
function RosterUpdateOverridesSingle:fields()
    return RosterUpdateOverridesSingleFields
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

local RosterUpdateProfilesFields = merge(LogEntry:fields(), {"r", "p", "e"})
function RosterUpdateProfiles:fields()
    return RosterUpdateProfilesFields
end

-- -------------------- --
-- RosterCopyData --
-- -------------------- --
function RosterCopyData:new(sourceRosterUid, targetRosterUid, config, defaults, overrides, profiles)
    local o = LogEntry.new(self);
    o.r = tonumber(sourceRosterUid) or 0
    o.a = tonumber(targetRosterUid) or 0
    o.c = config    and true or false
    o.d = defaults  and true or false
    o.o = overrides and true or false
    o.p = profiles  and true or false
    return o
end

function RosterCopyData:sourceRosterUid()
    return self.r
end

function RosterCopyData:targetRosterUid()
    return self.a
end

function RosterCopyData:config()
    return self.c
end

function RosterCopyData:defaults()
    return self.d
end

function RosterCopyData:overrides()
    return self.o
end

function RosterCopyData:profiles()
    return self.p
end

local RosterCopyDataFields = merge(LogEntry:fields(), {"r", "a", "c", "d", "o", "p"})
function RosterCopyData:fields()
    return RosterCopyDataFields
end

MODELS.LEDGER.ROSTER = {
    Create                  = RosterCreate,
    Delete                  = RosterDelete,
    Rename                  = RosterRename,
    UpdateConfig            = RosterUpdateConfig,
    UpdateConfigSingle      = RosterUpdateConfigSingle,
    UpdateDefault           = RosterUpdateDefault,
    UpdateDefaultSingle     = RosterUpdateDefaultSingle,
    UpdateOverrides         = RosterUpdateOverrides,
    UpdateOverridesSingle   = RosterUpdateOverridesSingle,
    UpdateProfiles          = RosterUpdateProfiles,
    CopyData                = RosterCopyData,
}
