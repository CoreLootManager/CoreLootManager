-- Module for integrating modules communication
-- Basically it provides centralied way to access and substitute functions and callbacks
-- Modules should access other modules logic only through this glue logic
-- This will allow for easy inter-module communication
-- Designer should keep this up to date as this glue logic represents addons public API
-- All other functions are expected to be local

local _, CLM = ...

local function stub(...)
    -- Not implemented
end

CLM.Interconnect =
{
    Database = { -- in memory database and storage backend for handling user information
        Initialize = stub,
        Local = stub,
        Shared = stub,
        Rosters = stub,
        Ledger = stub

    },
    ConfigManager = { -- Addon Configuration
        -- Each module will have own configuration
        -- they will register with the config module using the ACE3 options tables
        Initialize = stub,
        Register = stub, -- args: Table, type (LOCAL /  SHARED / PER_ROSTER)
        Update = stub -- Active Roster change
    },
    LedgerManager = {
        Initialize = stub,
        Enable = stub,
        PrepareType = stub,
        Submit = stub,
        RegisterOnStart = stub,
        RegisterOnUpdate = stub,
        RegisterOnFinish = stub
    },
    Comms = { -- AddOn communication
        Initialize = stub,
        Send = stub,
        RegisterCallback = stub
    },
    EventHandler = { -- WoW Events handling
        -- Each module can require mutliple events
        -- they will register with the handler module which will then call their handlers one by one on the events
        Initialize = stub,
        Register = stub
    },
    RaidManager = { -- Raid management (initialize / standby / boss points award)
        Initialize = stub
        -- TODO
    },
    TeamManager = { -- Manage team selection. TODO: Use the ACE DB Profile functionality for this?
        Initialize = stub
        -- TODO
    }
    ProfileManager = { -- User profiles, alt linking etc
        Initialize = stub
        -- TODO
    },
    PointManager = { -- Point award / modify manager
        Initialize = stub
        -- TODO
    },
    LootManager = { -- Loot award / entry management
        Initialize = stub
        -- TODO
    },
    ACL = { -- Security and whitelist checks
        Initialize = stub,
        Check = stub
    }
    -- More TBD
}