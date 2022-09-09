-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local type, pairs = type, pairs

local DeepCopy = UTILS.DeepCopy
local assertType = UTILS.assertType

local DB = {}

-- You really do not want to modify this
-- vvvvv
local DB_NAME_PERSONAL = 'personal'
local DB_NAME_GUI = 'gui'
local DB_NAME_RAID = 'raid'
local DB_NAME_GUILD = 'guild'
local DB_NAME_LEDGER = 'ledger'
local DB_NAME_LOGGER = 'logger'
local DB_NAME_GLOBAL = 'global'
-- ^^^^^

local function UpdateGuild()
    DB.server_faction_guild = string.lower(UnitFactionGroup("player") .. " " .. GetNormalizedRealmName() .. " " .. (GetGuildInfo("player") or "unguilded"))
    LOG:Debug("Using database: %s", DB.server_faction_guild)
end

local function UpdateSchema(table, schema)
    if type(schema) == "table" then
        for key, value in pairs(schema) do
            if table[key] == nil then
                table[key] = DeepCopy(value)
            end
        end
    elseif type(schema) == "function" then
        schema(table)
    end
end

function DB:Initialize()
    LOG:Trace("DB:Initialize()")
    -- Below API requires delay after loading to work after variables loaded event
    UpdateGuild()

    if type(CLM2_DB[self.server_faction_guild]) ~= "table" then
        CLM2_DB[self.server_faction_guild] = {}
    end
    if type(CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL]) ~= "table" then
        CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL] = {}
    end
    if type(CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][DB_NAME_GUI]) ~= "table" then
        CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][DB_NAME_GUI] = {}
    end
    if type(CLM2_DB[self.server_faction_guild][DB_NAME_GUILD]) ~= "table" then
        CLM2_DB[self.server_faction_guild][DB_NAME_GUILD] = {}
    end
    if type(CLM2_DB[self.server_faction_guild][DB_NAME_RAID]) ~= "table" then
        CLM2_DB[self.server_faction_guild][DB_NAME_RAID] = {}
    end
    if type(CLM2_DB[self.server_faction_guild][DB_NAME_LEDGER]) ~= "table" then
        CLM2_DB[self.server_faction_guild][DB_NAME_LEDGER] = {}
    end
end

function DB:Global()
    return CLM2_DB[DB_NAME_GLOBAL]
end

function DB:Logger()
    return CLM2_DB[DB_NAME_GLOBAL][DB_NAME_LOGGER]
end

function DB:Server()
    return CLM2_DB[self.server_faction_guild]
end

function DB:Personal(table, schema)
    assertType(table, 'table', 'string')

    if not CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][table] then
        CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][table] = {}
    end

    UpdateSchema(CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][table], schema)

    return CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][table]
end

function DB:GUI(table, schema)
    assertType(table, 'table', 'string')

    if not CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][DB_NAME_GUI][table] then
        CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][DB_NAME_GUI][table] = {}
    end

    UpdateSchema(CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][DB_NAME_GUI][table], schema)

    return CLM2_DB[self.server_faction_guild][DB_NAME_PERSONAL][DB_NAME_GUI][table]
end

function DB:Ledger()
    return CLM2_DB[self.server_faction_guild][DB_NAME_LEDGER]
end

function DB:UpdateLedger(ledger)
    CLM2_DB[self.server_faction_guild][DB_NAME_LEDGER] = ledger
end

CLM.MODULES.Database = DB