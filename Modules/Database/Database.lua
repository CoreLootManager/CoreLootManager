local  _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG

local DB = {}

local function UpdateGuild()
    DB.server_faction_guild = string.lower(UnitFactionGroup("player") .. " " .. GetNormalizedRealmName() .. " " .. (GetGuildInfo("player") or "unguilded"))
    LOG:Debug("Using database: %s", DB.server_faction_guild)
end

function DB:Initialize()
    LOG:Trace("DB:Initialize()")
    -- Below API requires delay after loading to work after variables loaded event
    UpdateGuild()

    if type(CLM_DB[self.server_faction_guild]) ~= "table" then
        CLM_DB[self.server_faction_guild] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['personal']) ~= "table" then
        CLM_DB[self.server_faction_guild]['personal'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['personal']['gui']) ~= "table" then
        CLM_DB[self.server_faction_guild]['personal']['gui'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['guild']) ~= "table" then
        CLM_DB[self.server_faction_guild]['guild'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['raid']) ~= "table" then
        CLM_DB[self.server_faction_guild]['raid'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['ledger']) ~= "table" then
        CLM_DB[self.server_faction_guild]['ledger'] = {}
    end
end

function DB:Global()
    return CLM_DB['global']
end

function DB:Logger()
    return CLM_DB['global']['logger']
end

function DB:Server()
    return CLM_DB[self.server_faction_guild]
end

function DB:Personal()
    return CLM_DB[self.server_faction_guild]['personal']
end

function DB:GUI()
    return CLM_DB[self.server_faction_guild]['personal']['gui']
end

function DB:Ledger()
    return CLM_DB[self.server_faction_guild]['ledger']
end

function DB:UpdateLedger(ledger)
    CLM_DB[self.server_faction_guild]['ledger'] = ledger
end

MODULES.Database = DB