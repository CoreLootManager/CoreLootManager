-- Module for integrating modules communication
-- Basically it provides centralied way to access and substitute functions and callbacks
-- Modules should access other modules logic only through this glue logic
-- This will allow for easy inter-module communication
-- Designer should keep this up to date as this glue logic represents addons public API
-- All other functions are expected to be local

_, CLM = ...

local function stub(...)
    -- Not implemented
end

CLM.Interconnect = 
{
    Database = { -- in memory database and storage backend
        Initialize = stub,
        Get = stub,
        Search = stub
    },
    Config = { -- Addon Configuration
        Initialize = stub,
        Get = stub,
        Update = stub
    },
    Comms = { -- AddOn communication
        Initialize = stub,
        Send = stub,
        RegisterCallback = stub
    },
    Raid = { -- Raid management (initialize / standby / boss points award)
        Initialize = stub,
        -- TODO
    },
    StandingsManager = { -- Point Management
        Initialize = stub,
        -- TODO
    },
    LootManager = { -- Loot award / entry management
        Initialize = stub,
        -- TODO
    },
    ACL = { -- Security and whitelist checks
        Initialize = stub,
        Check = stub
    }
    -- More TBD
}