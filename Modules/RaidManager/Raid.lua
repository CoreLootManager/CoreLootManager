local _, CLM = ...

local CONSTANTS =  CLM.CONSTANTS
-- local MODELS = CLM.MODELS

-- local ShallowCopy = UTILS.ShallowCopy

-- local whoami = UTILS.whoami
-- local typeof = UTILS.typeof


local Raid = { } -- Raid information

CLM.MODELS.Raid = Raid
function Raid:New(uid, name, roster, config)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Raid Management
    o.uid  = tonumber(uid)
    o.roster = roster

    o.config = config
    o.name = name
    o.status = CONSTANTS.RAID_STATUS.CREATED

    -- GUID dict
    o.players = {}
    o.standby = {}

    return o
end

function Raid:SetStatus(status)
    self.status = status
end

function Raid:Roster()
    return self.roster
end

function Raid:Status()
    return self.status
end

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