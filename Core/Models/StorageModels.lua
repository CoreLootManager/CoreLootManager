local _, CLM = ...
local CONSTANTS = CLM.CONSTANTS
-- Class object models to be used by storage part of database

-----------------------------------
--         Point Entry           --
--                               --
--       points storage          --
-----------------------------------
PointEntry = class()

function PointEntry:init(primary, secondary)
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
SourceEntry = class()

function SourceEntry:init(encounter, zone)
    self.encounter = CONSTANTS.ENCOUNTERS[encounter] and encounter or 0
    self.zone = CONSTANTS.ZONES[zone] and zone or 0
end

---------------------------------
--         Loot Entry          --
--                             --
--       loot description      --
---------------------------------
LootEntry = class()

function LootEntry:init(id, target, value, timestamp, source, manager, reassignInfo)
    self.id = id or 0
    self.value = value or PointEntry:new()
    self.target = target or ""
    self.timestamp = timestamp or 0
    self.source = source or SourceEntry:new()
    self.manager = manager or ""
    self.reassignInfo = reassignInfo
    -- reassignInfo should be nil and stored only if this is a reassignment
    -- reassignInfo will contain the uuid (timestamp-officer)
end

-----------------------------
--  Point Operation Entry  --
--                         --
--  changes to the points  --
-----------------------------
PointOperationEntry = class()

function PointOperationEntry:init(operation, targets, value, timestamp, manager, comment)
    self.operation = CONSTANTS.POINT_OPERATIONS[operation] and operation or CONSTANTS.POINT_OPERATION_NOP
    -- enforce targets to be always a list
    local targetsType = type(targets)
    if targetsType == "table" then
        self.targets = targets
    elseif targetsType == "string" then
        self.targets = { targets }
    else
        self.targets = {}
    end
    self.value = value or PointEntry:new()
    self.timestamp = timestamp or 0
    self.manager = manager or ""
    self.comment = comment or ""
end