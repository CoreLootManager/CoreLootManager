-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local mergeLists = UTILS.mergeLists
local typeof = UTILS.typeof
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

local deflate = UTILS.deflate

---@class RosterCreate
---@field n string name
---@field r number rosterUid
---@field p number pointType
local RosterCreate                  = LogEntry:extend("R0")
---@class RosterDelete
---@field r number rosterUid
local RosterDelete                  = LogEntry:extend("R1")
---@class RosterRename
---@field n string name
---@field r number rosterUid
local RosterRename                  = LogEntry:extend("R2")
---@class RosterUpdateConfig
---@field r number rosterUid
---@field c table deflated config
local RosterUpdateConfig            = LogEntry:extend("R3")
---@class RosterUpdateConfigSingle
---@field r number rosterUid
---@field c string config key
---@field v any value
local RosterUpdateConfigSingle      = LogEntry:extend("R4")
-- local RosterUpdateDefault           = LogEntry:extend("R5")
---@class RosterUpdateDefaultSingle
---@field r number rosterUid
---@field d string slot
---@field i any tier
---@field a number value
local RosterUpdateDefaultSingle     = LogEntry:extend("R6")
---@class RosterUpdateOverrides
---@field r number rosterUid
---@field i number itemId
---@field b table values
local RosterUpdateOverrides         = LogEntry:extend("R7")
---@class RosterUpdateOverridesSingle
---@field r number rosterUid
---@field o number itemId
---@field t any tier
---@field v number value
local RosterUpdateOverridesSingle   = LogEntry:extend("R8")
---@class RosterRemoveOverrides
---@field r number rosterUid
---@field i number itemId
local RosterRemoveOverrides         = LogEntry:extend("RR")
---@class RosterUpdateProfiles
---@field r number rosterUid
---@field p table profile GUID list
---@field e boolean remove
local RosterUpdateProfiles          = LogEntry:extend("R9")
---@class RosterCopyData
---@field r number sourceRosterUid
---@field a number targetRosterUid
---@field c boolean copy config
---@field d boolean copy defaults
---@field o boolean copy overrides
---@field p boolean copy profiles
local RosterCopyData                = LogEntry:extend("RC")
---@class RosterBossKillBonus
---@field r number rosterUid
---@field e number encounterId
---@field v number value
---@field d number difficultyId
---@field h boolean isHardMode
local RosterBossKillBonus           = LogEntry:extend("RB")
---@class RosterFieldRename
---@field r number rosterUid
---@field i any tier
---@field a string name
local RosterFieldRename             = LogEntry:extend("RF")
---@class RosterAwardMultiplier
---@field r number rosterUid
---@field c number class
---@field s string slot
---@field v number value
local RosterAwardMultiplier         = LogEntry:extend("RM")

---@class RosterDynamicItemValueEquation
---@field r number rosterUid
---@field e number equation
local RosterDynamicItemValueEquation       = LogEntry:extend("VE")
---@class RosterDynamicItemValueExpvar
---@field r number rosterUid
---@field m number expvar
local RosterDynamicItemValueExpvar         = LogEntry:extend("VX")
---@class RosterDynamicItemValueMultiplier
---@field r number rosterUid
---@field m number multiplier
local RosterDynamicItemValueMultiplier     = LogEntry:extend("VM")
---@class RosterDynamicItemValueSlotMultiplier
---@field r number rosterUid
---@field s any slot
---@field m number multiplier
local RosterDynamicItemValueSlotMultiplier = LogEntry:extend("VS")
---@class RosterDynamicItemValueTierMultiplier
---@field r number rosterUid
---@field i any tier
---@field m number multiplier
local RosterDynamicItemValueTierMultiplier = LogEntry:extend("VT")

-- ------------ --
-- RosterCreate --
-- ------------ --
---@param rosterUid number
---@param name string
---@param pointType number
---@return RosterCreate
function RosterCreate:new(rosterUid, name, pointType)
    local o = LogEntry.new(self);
    o.n = tostring(name) or ""
    o.r = tonumber(rosterUid) or 0
    o.p = tonumber(pointType) or 0
    return o
end

---@return number
function RosterCreate:rosterUid()
    return self.r
end

---@return string
function RosterCreate:name()
    return self.n
end

---@return number
function RosterCreate:pointType()
    return self.p
end

local RosterCreateFields = mergeLists(LogEntry:fields(), {"r", "n", "p"})
function RosterCreate:fields()
    return RosterCreateFields
end

-- ------------ --
-- RosterDelete --
-- ------------ --
---@param rosterUid number
---@return RosterDelete
function RosterDelete:new(rosterUid)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    return o
end

---@return number
function RosterDelete:rosterUid()
    return self.r
end

local RosterDeleteFields = mergeLists(LogEntry:fields(), {"r"})
function RosterDelete:fields()
    return RosterDeleteFields
end

-- ------------ --
-- RosterRename --
-- ------------ --
---@param rosterUid number
---@param name string
---@return RosterRename
function RosterRename:new(rosterUid, name)
    local o = LogEntry.new(self);
    o.n = tostring(name) or ""
    o.r = tonumber(rosterUid) or 0
    return o
end

---@return number
function RosterRename:rosterUid()
    return self.r
end

---@return string
function RosterRename:name()
    return self.n
end

local RosterRenameFields = mergeLists(LogEntry:fields(), {"r", "n"})
function RosterRename:fields()
    return RosterRenameFields
end
-- ------------------ --
-- RosterUpdateConfig --
-- ------------------ --
---@param rosterUid number
---@param config table
---@return RosterUpdateConfig
function RosterUpdateConfig:new(rosterUid, config)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    if not typeof(config, CLM.MODELS.RosterConfiguration) then
        config = CLM.MODELS.RosterConfiguration:New()
    end
    o.c = deflate(config)
    return o
end

---@return number
function RosterUpdateConfig:rosterUid()
    return self.r
end

---@return table
function RosterUpdateConfig:config()
    return self.c
end

local RosterUpdateConfigFields = mergeLists(LogEntry:fields(), {"r", "c"})
function RosterUpdateConfig:fields()
    return RosterUpdateConfigFields
end
-- ------------------------ --
-- RosterUpdateConfigSingle --
-- ------------------------ --
---@param rosterUid number
---@param config string
---@param value any
---@return RosterUpdateConfigSingle
function RosterUpdateConfigSingle:new(rosterUid, config, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.c = tostring(config) or ""
    o.v = value
    return o
end

---@return number
function RosterUpdateConfigSingle:rosterUid()
    return self.r
end

---@return string
function RosterUpdateConfigSingle:config()
    return self.c
end

---@return any
function RosterUpdateConfigSingle:value()
    return self.v
end

local RosterUpdateConfigSingleFields = mergeLists(LogEntry:fields(), {"r", "c", "v"})
function RosterUpdateConfigSingle:fields()
    return RosterUpdateConfigSingleFields
end
-- ------------------- --
-- RosterUpdateDefault --
-- ------------------- --
-- function RosterUpdateDefault:new(rosterUid, defaults)
--     local o = LogEntry.new(self);
--     o.r = tonumber(rosterUid) or 0
--     o.d = defaults or {}
--     return o
-- end

-- function RosterUpdateDefault:rosterUid()
--     return self.r
-- end

-- function RosterUpdateDefault:defaults()
--     return self.d
-- end

-- local RosterUpdateDefaultFields = mergeLists(LogEntry:fields(), {"r", "d"})
-- function RosterUpdateDefault:fields()
--     return RosterUpdateDefaultFields
-- end
-- ------------------------- --
-- RosterUpdateDefaultSingle --
-- ------------------------- --
---@param rosterUid number
---@param slot string
---@param tier any
---@param value number
---@return RosterUpdateDefaultSingle
function RosterUpdateDefaultSingle:new(rosterUid, slot, tier, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.d = tostring(slot) or "" -- not the most optimal but i don't expect it to be changed too often
    o.i = tier
    o.a = tonumber(value)
    return o
end

---@return number
function RosterUpdateDefaultSingle:rosterUid()
    return self.r
end

---@return string
function RosterUpdateDefaultSingle:slot()
    return self.d
end

---@return any
function RosterUpdateDefaultSingle:tier()
    return self.i
end

---@return number
function RosterUpdateDefaultSingle:value()
    return self.a
end

local RosterUpdateDefaultSingleFields = mergeLists(LogEntry:fields(), {"r", "d", "i", "a"})
function RosterUpdateDefaultSingle:fields()
    return RosterUpdateDefaultSingleFields
end
-- ------------------------ --
-- RosterUpdateOverrides --
-- ------------------------ --
---@param rosterUid number
---@param itemId number
---@param values table
---@return RosterUpdateOverrides
function RosterUpdateOverrides:new(rosterUid, itemId, values)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.i = tonumber(itemId) or 0
    o.b = {}
    if type(values) == "table" then
        for key,_ in pairs(CLM.CONSTANTS.SLOT_VALUE_TIERS) do
            o.b[key] = tonumber(values[key])
        end
    end
    return o
end

---@return number
function RosterUpdateOverrides:rosterUid()
    return self.r
end

---@return number
function RosterUpdateOverrides:itemId()
    return self.i
end

---@return table
function RosterUpdateOverrides:values()
    -- return self.b
    return ((type(self.b) == "table") and self.b or {})
end

local RosterUpdateOverridesFields = mergeLists(LogEntry:fields(), {"r", "i", "b"})
function RosterUpdateOverrides:fields()
    return RosterUpdateOverridesFields
end
-- --------------------------- --
-- RosterUpdateOverridesSingle --
-- --------------------------- --
---@param rosterUid number
---@param itemId number
---@param tier any
---@param value number
---@return RosterUpdateOverridesSingle
function RosterUpdateOverridesSingle:new(rosterUid, itemId, tier, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.o = tonumber(itemId) or 0
    o.t = tier
    o.v = tonumber(value) or 0
    return o
end

---@return number
function RosterUpdateOverridesSingle:rosterUid()
    return self.r
end

---@return number
function RosterUpdateOverridesSingle:itemId()
    return self.o
end

---@return any
function RosterUpdateOverridesSingle:tier()
    return self.t
end

---@return number
function RosterUpdateOverridesSingle:value()
    return self.v
end

local RosterUpdateOverridesSingleFields = mergeLists(LogEntry:fields(), {"r", "o", "t", "v"})
function RosterUpdateOverridesSingle:fields()
    return RosterUpdateOverridesSingleFields
end
-- ------------------------ --
-- RosterRemoveOverrides --
-- ------------------------ --
---@param rosterUid number
---@param itemId number
---@return RosterRemoveOverrides
function RosterRemoveOverrides:new(rosterUid, itemId)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.i = tonumber(itemId) or 0
    return o
end

---@return number
function RosterRemoveOverrides:rosterUid()
    return self.r
end

---@return number
function RosterRemoveOverrides:itemId()
    return self.i
end

local RosterRemoveOverridesFields = mergeLists(LogEntry:fields(), {"r", "i"})
function RosterRemoveOverrides:fields()
    return RosterRemoveOverridesFields
end
-- -------------------- --
-- RosterUpdateProfiles --
-- -------------------- --
---@param rosterUid number
---@param profiles table
---@param remove boolean
---@return RosterUpdateProfiles
function RosterUpdateProfiles:new(rosterUid, profiles, remove)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(profiles)
    o.e = remove and true or false
    return o
end

---@return number
function RosterUpdateProfiles:rosterUid()
    return self.r
end

---@return table
function RosterUpdateProfiles:profiles()
    return self.p
end

---@return boolean
function RosterUpdateProfiles:remove()
    return self.e
end

local RosterUpdateProfilesFields = mergeLists(LogEntry:fields(), {"r", "p", "e"})
function RosterUpdateProfiles:fields()
    return RosterUpdateProfilesFields
end

-- -------------------- --
-- RosterCopyData --
-- -------------------- --
---@param sourceRosterUid number
---@param targetRosterUid number
---@param config boolean
---@param defaults boolean
---@param overrides boolean
---@param profiles boolean
---@return RosterCopyData
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

---@return number
function RosterCopyData:sourceRosterUid()
    return self.r
end

---@return number
function RosterCopyData:targetRosterUid()
    return self.a
end

---@return boolean
function RosterCopyData:config()
    return self.c
end

---@return boolean
function RosterCopyData:defaults()
    return self.d
end

---@return boolean
function RosterCopyData:overrides()
    return self.o
end

---@return boolean
function RosterCopyData:profiles()
    return self.p
end

local RosterCopyDataFields = mergeLists(LogEntry:fields(), {"r", "a", "c", "d", "o", "p"})
function RosterCopyData:fields()
    return RosterCopyDataFields
end

-- -------------------- --
-- RosterBossKillBonus --
-- -------------------- --
---@param rosterUid number
---@param encounterId number
---@param difficultyId number
---@param isHardMode boolean
---@param value number
---@return RosterBossKillBonus
function RosterBossKillBonus:new(rosterUid, encounterId, difficultyId, isHardMode, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.e = tonumber(encounterId) or 0
    o.v = tonumber(value) or 0
    o.d = tonumber(difficultyId) or -1
    o.h = isHardMode and true or false
    return o
end

---@return number
function RosterBossKillBonus:rosterUid()
    return self.r
end

---@return number
function RosterBossKillBonus:encounterId()
    return self.e
end

---@return number
function RosterBossKillBonus:difficultyId()
    return (self.d or -1)
end

---@return boolean
function RosterBossKillBonus:isHardMode()
    return self.h
end

---@return number
function RosterBossKillBonus:value()
    return self.v
end

local RosterBossKillBonusFields = mergeLists(LogEntry:fields(), {"r", "e", "v", "d", "h"})
function RosterBossKillBonus:fields()
    return RosterBossKillBonusFields
end

-- ------------------------- --
-- RosterFieldRename --
-- ------------------------- --
---@param rosterUid number
---@param tier any
---@param name string
---@return RosterFieldRename
function RosterFieldRename:new(rosterUid, tier, name)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.i = tier
    o.a = name
    return o
end

---@return number
function RosterFieldRename:rosterUid()
    return self.r
end

---@return any
function RosterFieldRename:tier()
    return self.i
end

---@return string
function RosterFieldRename:name()
    return self.a
end

local RosterFieldRenameFields = mergeLists(LogEntry:fields(), {"r", "i", "a"})
function RosterFieldRename:fields()
    return RosterFieldRenameFields
end
-- ------------------------- --
-- RosterAwardMultiplier --
-- ------------------------- --
---@param rosterUid number
---@param class number|string
---@param slot string
---@param value number
---@return RosterAwardMultiplier
function RosterAwardMultiplier:new(rosterUid, class, slot, value)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.c = tonumber(class) or UTILS.ClassToNumber(class)
    o.s = tostring(slot) or "" -- not the most optimal but i don't expect it to be changed too often
    o.v = tonumber(value)
    return o
end

---@return number
function RosterAwardMultiplier:rosterUid()
    return self.r
end

---@return number
function RosterAwardMultiplier:ingameClass()
    return self.c
end

---@return string
function RosterAwardMultiplier:slot()
    return self.s
end

---@return number
function RosterAwardMultiplier:value()
    return self.v
end

local RosterAwardMultiplierFields = mergeLists(LogEntry:fields(), {"r", "c", "s", "v"})
function RosterAwardMultiplier:fields()
    return RosterAwardMultiplierFields
end
-- ------------------------------ --
-- RosterDynamicItemValueEquation --
-- ------------------------------ --
---@param rosterUid number
---@param equation number
---@return RosterDynamicItemValueEquation
function RosterDynamicItemValueEquation:new(rosterUid, equation)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.e = tonumber(equation) or 0
    return o
end

---@return number
function RosterDynamicItemValueEquation:rosterUid()
    return self.r
end

---@return number
function RosterDynamicItemValueEquation:equation()
    return self.e
end

local RosterDynamicItemValueEquationFields = mergeLists(LogEntry:fields(), {"r", "e"})
function RosterDynamicItemValueEquation:fields()
    return RosterDynamicItemValueEquationFields
end

-- ---------------------------- --
-- RosterDynamicItemValueExpvar --
-- ---------------------------- --
---@param rosterUid number
---@param expvar number
---@return RosterDynamicItemValueExpvar
function RosterDynamicItemValueExpvar:new(rosterUid, expvar)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.m = tonumber(expvar) or 0
    return o
end

---@return number
function RosterDynamicItemValueExpvar:rosterUid()
    return self.r
end

---@return number
function RosterDynamicItemValueExpvar:expvar()
    return self.m
end

local RosterDynamicItemValueExpvarFields = mergeLists(LogEntry:fields(), {"r", "m"})
function RosterDynamicItemValueExpvar:fields()
    return RosterDynamicItemValueExpvarFields
end

-- -------------------------------- --
-- RosterDynamicItemValueMultiplier --
-- -------------------------------- --
---@param rosterUid number
---@param multiplier number
---@return RosterDynamicItemValueMultiplier
function RosterDynamicItemValueMultiplier:new(rosterUid, multiplier)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.m = tonumber(multiplier) or 0
    return o
end

---@return number
function RosterDynamicItemValueMultiplier:rosterUid()
    return self.r
end

---@return number
function RosterDynamicItemValueMultiplier:multiplier()
    return self.m
end

local RosterDynamicItemValueMultiplierFields = mergeLists(LogEntry:fields(), {"r", "m"})
function RosterDynamicItemValueMultiplier:fields()
    return RosterDynamicItemValueMultiplierFields
end

-- ------------------------------------ --
-- RosterDynamicItemValueSlotMultiplier --
-- ------------------------------------ --
---@param rosterUid number
---@param slot any
---@param multiplier number
---@return RosterDynamicItemValueSlotMultiplier
function RosterDynamicItemValueSlotMultiplier:new(rosterUid, slot, multiplier)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.s = slot
    o.m = tonumber(multiplier) or 0
    return o
end

---@return number
function RosterDynamicItemValueSlotMultiplier:rosterUid()
    return self.r
end

---@return any
function RosterDynamicItemValueSlotMultiplier:slot()
    return self.s
end

---@return number
function RosterDynamicItemValueSlotMultiplier:multiplier()
    return self.m
end

local RosterDynamicItemValueSlotMultiplierFields = mergeLists(LogEntry:fields(), {"r", "s", "m"})
function RosterDynamicItemValueSlotMultiplier:fields()
    return RosterDynamicItemValueSlotMultiplierFields
end

-- ------------------------------------ --
-- RosterDynamicItemValueTierMultiplier --
-- ------------------------------------ --
---@param rosterUid number
---@param tier any
---@param multiplier number
---@return RosterDynamicItemValueTierMultiplier
function RosterDynamicItemValueTierMultiplier:new(rosterUid, tier, multiplier)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.i = tier
    o.m = tonumber(multiplier) or 0
    return o
end

---@return number
function RosterDynamicItemValueTierMultiplier:rosterUid()
    return self.r
end

---@return any
function RosterDynamicItemValueTierMultiplier:tier()
    return self.i
end

---@return number
function RosterDynamicItemValueTierMultiplier:multiplier()
    return self.m
end

local RosterDynamicItemValueTierMultiplierFields = mergeLists(LogEntry:fields(), {"r", "i", "m"})
function RosterDynamicItemValueTierMultiplier:fields()
    return RosterDynamicItemValueTierMultiplierFields
end

CLM.MODELS.LEDGER.ROSTER = {
    Create                          = RosterCreate,
    Delete                          = RosterDelete,
    Rename                          = RosterRename,
    UpdateConfig                    = RosterUpdateConfig,
    UpdateConfigSingle              = RosterUpdateConfigSingle,
    UpdateDefaultSingle             = RosterUpdateDefaultSingle,
    UpdateOverrides                 = RosterUpdateOverrides,
    UpdateOverridesSingle           = RosterUpdateOverridesSingle,
    RemoveOverrides                 = RosterRemoveOverrides,
    UpdateProfiles                  = RosterUpdateProfiles,
    CopyData                        = RosterCopyData,
    BossKillBonus                   = RosterBossKillBonus,
    FieldRename                     = RosterFieldRename,
    AwardMultiplier                 = RosterAwardMultiplier,
    DynamicItemValueEquation        = RosterDynamicItemValueEquation,
    DynamicItemValueExpvar          = RosterDynamicItemValueExpvar,
    DynamicItemValueMultiplier      = RosterDynamicItemValueMultiplier,
    DynamicItemValueSlotMultiplier  = RosterDynamicItemValueSlotMultiplier,
    DynamicItemValueTierMultiplier  = RosterDynamicItemValueTierMultiplier
}
