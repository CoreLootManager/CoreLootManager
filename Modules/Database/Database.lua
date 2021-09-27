-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

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

MODULES.Database = DB