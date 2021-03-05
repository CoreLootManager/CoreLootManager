local  _, CLM = ...

local DB = {}

local function UpdateGuild()
    DB.server_faction_guild = string.lower(UnitFactionGroup("player") .. " " .. GetNormalizedRealmName() .. " " .. (GetGuildInfo("player") or "unguilded"))
    CLM.LOG:Info(DB.server_faction_guild)
end

function DB:Initialize()
    CLM.LOG:Info("DB:Initialize()")
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
    if type(CLM_DB[self.server_faction_guild]['roster']) ~= "table" then
        CLM_DB[self.server_faction_guild]['roster'] = {}
    end
end

function DB:Personal()
    return CLM_DB[self.server_faction_guild]['personal']
end

function DB:Guild()
    return CLM_DB[self.server_faction_guild]['guild']
end

function DB:Roster()
    return CLM_DB[self.server_faction_guild]['roster']
end

function DB:Ledger()
    return CLM_DB[self.server_faction_guild]['roster']
end

CLM.Interconnect.Database = DB