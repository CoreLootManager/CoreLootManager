-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

---@class Raid
---@field uid number
---@field name string
---@field roster Roster
---@field config table
---@field entry table
---@field status number
---@field startTime number
---@field endTime number
---@field players table<string, boolean>
---@field standby table<string, boolean>
---@field participated { inRaid: table<string, boolean>, standby: table<string, boolean> }
local Raid = {} -- Raid information

Raid.__index = Raid
---@param uid number
---@param name string
---@param roster Roster
---@param config table
---@param creator string
---@param entry table
---@return Raid
function Raid:New(uid, name, roster, config, creator, entry)
    local o = {}

    setmetatable(o, self)

    o.entry = entry

    -- Raid Management
    o.uid  = uid
    o.roster = roster

    o.config = config
    o.name = strsub(tostring(name or ""), 1, 128)

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

---@return number
function Raid:UID()
    return self.uid
end

---@return string
function Raid:Name()
    return self.name
end

---@param time number
function Raid:Start(time)
    self.status = CONSTANTS.RAID_STATUS.IN_PROGRESS
    self.startTime = time
end

---@param time number
function Raid:End(time)
    self.status = CONSTANTS.RAID_STATUS.FINISHED
    self.endTime = time
end

function Raid:SetStale()
    self.status = CONSTANTS.RAID_STATUS.STALE
end

---@return Roster
function Raid:Roster()
    return self.roster
end

---@return number
function Raid:Status()
    return self.status
end

---@return table
function Raid:Configuration()
    return self.config
end

---@param players table<string, boolean>
function Raid:SetPlayers(players)
    self.players = players
end

---@param guid string
function Raid:AddPlayer(guid)
    self.players[guid] = true
    self.participated.inRaid[guid] = true
end

---@param players string[]
function Raid:AddPlayers(players)
    for _, guid in ipairs(players) do
        self:AddPlayer(guid)
    end
end

---@param guid string
function Raid:RemovePlayer(guid)
    self.players[guid] = nil
end

---@param players string[]
function Raid:RemovePlayers(players)
    for _, guid in ipairs(players) do
        self:RemovePlayer(guid)
    end
end

---@param guid string
function Raid:StandbyPlayer(guid)
    self.standby[guid] = true
    self.participated.standby[guid] = true
end

---@param players string[]
function Raid:StandbyPlayers(players)
    for _, guid in ipairs(players) do
        self:StandbyPlayer(guid)
    end
end

---@param guid string
function Raid:RemoveFromStandbyPlayer(guid)
    self.standby[guid] = nil
end

---@param players string[]
function Raid:RemoveFromStandbyPlayers(players)
    for _, guid in ipairs(players) do
        self:RemoveFromStandbyPlayer(guid)
    end
end

---@param GUID string
---@return boolean
function Raid:IsPlayerInRaid(GUID)
    return self.players[GUID]
end

---@return number
function Raid:StartTime()
    return self.startTime
end

---@return number
function Raid:EndTime()
    return self.endTime
end

---@return number
function Raid:CreatedAt()
    return self.entry:time()
end

---@return boolean
function Raid:IsActive()
    return CONSTANTS.RAID_STATUS_ACTIVE[self:Status()] and true or false
end

---@return string[]
function Raid:Players()
    return UTILS.keys(self.players)
end

---@return string[]
function Raid:PlayersOnStandby()
    return UTILS.keys(self.standby)
end

---@return string[]
function Raid:AllPlayers()
    return UTILS.mergeLists(self:Players(), self:PlayersOnStandby())
end

---@param GUID string
---@return boolean
function Raid:IsPlayerOnStandby(GUID)
    return self.standby[GUID] and true or false
end

---@param historical boolean?
---@return Profile[]
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
    table.sort(result, (function(first, second)
        return first:Name() < second:Name()
    end))
    return result
end

---@param historical boolean?
---@return Profile[]
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
    table.sort(result, (function(first, second)
        return first:Name() < second:Name()
    end))
    return result
end

---@return table
function Raid:Entry()
    return self.entry
end

CLM.MODELS.Raid = Raid