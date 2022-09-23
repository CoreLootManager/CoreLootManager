-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local setmetatable, ipairs, tsort = setmetatable, ipairs, table.sort

local Raid = {} -- Raid information

Raid.__index = Raid
function Raid:New(uid, name, roster, config, creator, entry)
    local o = {}

    setmetatable(o, self)

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
    -- Dynamic status of the raid
    o.players = { [creator] = true } -- for raid management we check sometimes if creator is part of raid
    o.standby = { }

    -- Historical storage of the raid
    o.participated = {
        inRaid = {},
        standby = {}
    }

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

function Raid:SetPlayers(players)
    self.players = players
end

function Raid:AddPlayer(guid)
    self.players[guid] = true
    self.participated.inRaid[guid] = true
end

function Raid:AddPlayers(players)
    for _, guid in ipairs(players) do
        self:AddPlayer(guid)
    end
end

function Raid:RemovePlayer(guid)
    self.players[guid] = nil
end

function Raid:RemovePlayers(players)
    for _, guid in ipairs(players) do
        self:RemovePlayer(guid)
    end
end

function Raid:StandbyPlayer(guid)
    self.standby[guid] = true
    self.participated.standby[guid] = true
end

function Raid:StandbyPlayers(players)
    for _, guid in ipairs(players) do
        self:StandbyPlayer(guid)
    end
end

function Raid:RemoveFromStandbyPlayer(guid)
    self.standby[guid] = nil
end

function Raid:RemoveFromStandbyPlayers(players)
    for _, guid in ipairs(players) do
        self:RemoveFromStandbyPlayer(guid)
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
    return UTILS.keys(self.players)
end

function Raid:PlayersOnStandby()
    return UTILS.keys(self.standby)
end

function Raid:AllPlayers()
    return UTILS.mergeLists(self:Players(), self:PlayersOnStandby())
end

function Raid:IsPlayerOnStandby(GUID)
    return self.standby[GUID] and true or false
end

function Raid:Profiles(historical)
    local result = {}
    local players = self.players
    if historical then
        players = self.participated.inRaid
    end
    for player,_ in pairs(players) do
        -- The code below breaks Model-View-Controller rule as it accessess Managers
        -- Maybe the caching should be done in GUI module?
        -- TODO: resolve this
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(player)
        if profile then
            result[#result + 1] = profile
        end
    end
    tsort(result, (function(first, second)
        return first:Name() < second:Name()
    end))
    return result
end

function Raid:Standby(historical)
    local result = {}
    local standby = self.standby
    if historical then
        standby = self.participated.standby
    end
    for player,_ in pairs(standby) do
        -- The code below breaks Model-View-Controller rule as it accessess Managers
        -- Maybe the caching should be done in GUI module?
        -- TODO: resolve this
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(player)
        if profile then
            result[#result + 1] = profile
        end
    end
    tsort(result, (function(first, second)
        return first:Name() < second:Name()
    end))
    return result
end

function Raid:Entry()
    return self.entry
end

CLM.MODELS.Raid = Raid