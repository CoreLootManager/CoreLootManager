local _, CLM = ...
local CONSTANTS = CLM.CONSTANTS
local MODELS = CLM.MODELS
-- Class object models to be used by storage part of database

-----------------------------------
--         Point Entry           --
--                               --
--       points storage          --
-----------------------------------
MODELS.PointEntry = class()

function MODELS.PointEntry:init(primary, secondary)
    self.primary = primary or 0 
    self.secondary = secondary 
    -- We allow secondary to be nil so it wont be stored, or i think at least :D
    -- This way it will be up to Point manager discretion to use it properly
end
-----------------------------------
--         Source Entry          --
--                               --
-- where does the loot come from --
-----------------------------------
MODELS.SourceEntry = class()

function MODELS.SourceEntry:init(encounter, zone)
    self.encounter = CONSTANTS.ENCOUNTERS[encounter] and encounter or 0
    self.zone = CONSTANTS.ZONES[zone] and zone or 0
end

---------------------------------
--         Loot Entry          --
--                             --
--       loot description      --
---------------------------------
MODELS.LootEntry = class()

function MODELS.LootEntry:init(id, target, value, timestamp, manager, reassignInfo)
    self.id = id or 0
    self.value = value or MODELS.PointEntry:new()
    self.target = target or ""
    self.timestamp = timestamp or 0
    self.manager = manager or ""
    self.reassignInfo = reassignInfo
    -- reassignInfo should be nil and stored only if this is a reassignment
    -- reassignInfo will contain the uuid (timestamp..officer concatenation)
end

----------------------------
--      Point Change      --
--                        --
--  changes to the points --
--    related to users    --
----------------------------
MODELS.PointChange = class()

function MODELS.PointChange:init(operation, target, value)
    self.operation = CONSTANTS.POINT_OPERATIONS[operation] and operation or CONSTANTS.POINT_OPERATION_NOP
    self.target = target or ""
    self.value = value or MODELS.PointEntry:new()
end

-----------------------------
--  Point Operation Entry  --
--                         --
--  changes to the points  --
-----------------------------
MODELS.PointOperationEntry = class()

function MODELS.PointOperationEntry:init(changes, timestamp, manager, comment)
    -- enforce changes to be always a list
    local changeType = type(changes)
    if changeType == "table" then
        self.changes = targets
    elseif changeType == "nil" then
        self.changes = {}
    else
        self.changes = { changes }
    end
    self.timestamp = timestamp or 0
    self.manager = manager or ""
    self.comment = comment or ""
end

MODELS.Profile = class()

function MODELS.Profile:init(name, current, gained, spent)
    self.name = name or ""
    self.current = current or MODELS.PointEntry:new()
    self.gained = gained or MODELS.PointEntry:new()
    self.spent = spent or MODELS.PointEntry:new()
end

MODELS.AltLink = class()

function MODELS.AltLink:init(alt, main)
    self.alt = alt or ""
    self.main = main or "" 
end