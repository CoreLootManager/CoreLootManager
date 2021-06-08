local _, CLM = ...

local CONSTANTS =  CLM.CONSTANTS
local UTILS = CLM.UTILS
-- local MODELS = CLM.MODELS

-- local ShallowCopy = UTILS.ShallowCopy

local getGuidFromInteger = UTILS.getGuidFromInteger
local keys = UTILS.keys
-- local whoami = UTILS.whoami
-- local typeof = UTILS.typeof


local Raid = { } -- Raid information

function Raid:New(uid, name, roster, config, creator, entry)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry

    -- Raid Management
    o.uid  = uid
    o.roster = roster

    o.config = config
    o.name = name
    o.status = CONSTANTS.RAID_STATUS.CREATED
    -- o.owner = creator

    o.startTime = 0
    o.endTime = 0

    -- GUID dict
    o.players = { }
    o.standby = { }

    return o
end

function Raid:UID()
    return self.uid
end

function Raid:Name()
    return self.name
end

function Raid:Start(time)
    self.status = CONSTANTS.RAID_STATUS.IN_PROGRESS
    self.startTime = time
end

function Raid:End(time)
    self.status = CONSTANTS.RAID_STATUS.FINISHED
    self.endTime = time
end

function Raid:SetStale()
    self.status = CONSTANTS.RAID_STATUS.STALE
end

function Raid:Roster()
    return self.roster
end

function Raid:Status()
    return self.status
end

function Raid:Configuration()
    return self.config
end

-- function Raid:Owner()
--     return self.owner
-- end

-- function Raid:SetOwner(owner)
--     self.owner = owner
-- end

function Raid:SetPlayers(players)
    self.players = players
end

function Raid:AddPlayer(guid)
    self.players[guid] = true
end

function Raid:AddPlayers(players)
    for _, guid in ipairs(players) do
        self.players[guid] = true
    end
end

function Raid:RemovePlayer(guid)
    self.players[guid] = nil
end

function Raid:RemovePlayers(players)
    for _, guid in ipairs(players) do
        self.players[guid] = nil
    end
end

function Raid:IsPlayerInRaid(GUID)
    return self.players[GUID]
end

function Raid:StartTime()
    return self.startTime
end

function Raid:EndTime()
    return self.endTime
end

function Raid:CreatedAt()
    return self.entry:time()
end

function Raid:IsActive()
    return CONSTANTS.RAID_STATUS_ACTIVE[self:Status()] and true or false
end

function Raid:Players()
    return keys(self.players)
end

function Raid:Profiles()
    self.playerProfileCache = {}
    for player,_ in pairs(self.players) do
        -- The code below breaks Model-View-Controller rule as it accessess Managers
        -- Maybe the caching should be done in GUI module?
        -- TODO: resolve this
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(player)
        if profile then
            table.insert(self.playerProfileCache, profile)
        end
    end
    table.sort(self.playerProfileCache, (function(first, second)
        return first:Name() < second:Name()
    end))
    return self.playerProfileCache
end

function Raid:Standby()
    self.standbyProfileCache = {}
    for player,_ in pairs(self.standby) do
        -- The code below breaks Model-View-Controller rule as it accessess Managers
        -- Maybe the caching should be done in GUI module?
        -- TODO: resolve this
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(player)
        if profile then
            table.insert(self.standbyProfileCache, profile)
        end
    end
    table.sort(self.standbyProfileCache, (function(first, second)
        return first:Name() < second:Name()
    end))
    return self.standbyProfileCache
end

CLM.MODELS.Raid = Raid