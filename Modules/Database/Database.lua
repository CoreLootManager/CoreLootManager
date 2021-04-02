local  _, CLM = ...

local MODULES = CLM.MODULES
local LOG = CLM.LOG

local DB = {}

local function UpdateGuild()
    DB.server_faction_guild = string.lower(UnitFactionGroup("player") .. " " .. GetNormalizedRealmName() .. " " .. (GetGuildInfo("player") or "unguilded"))
    LOG:Info(DB.server_faction_guild)
end

function DB:Initialize()
    LOG:Info("DB:Initialize()")
    -- Below API requires delay after loading to work after variables loaded event
    UpdateGuild()

    if type(CLM_DB[self.server_faction_guild]) ~= "table" then
        CLM_DB[self.server_faction_guild] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['personal']) ~= "table" then
        CLM_DB[self.server_faction_guild]['personal'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['guild']) ~= "table" then
        CLM_DB[self.server_faction_guild]['guild'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['profiles']) ~= "table" then
        CLM_DB[self.server_faction_guild]['profiles'] = {}
    end
    if type(CLM_DB[self.server_faction_guild]['ledger']) ~= "table" then
        CLM_DB[self.server_faction_guild]['ledger'] = {}
    end
end

function DB:Personal()
    return CLM_DB[self.server_faction_guild]['personal']
end

function DB:Guild()
    return CLM_DB[self.server_faction_guild]['guild']
end

function DB:Profiles()
    return CLM_DB[self.server_faction_guild]['profiles']
end

function DB:Ledger()
    return CLM_DB[self.server_faction_guild]['ledger']
end

MODULES.Database = DB