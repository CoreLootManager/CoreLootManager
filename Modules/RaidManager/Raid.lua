local _, CLM = ...

local CONSTANTS =  CLM.CONSTANTS
-- local MODELS = CLM.MODELS

-- local ShallowCopy = UTILS.ShallowCopy

-- local whoami = UTILS.whoami
-- local typeof = UTILS.typeof


CONSTANTS.RAID_STATUS = {
    CREATED = 'created',
    ACTIVE = 'active',
    ENDED = 'ended'
}

local Raid = { } -- Raid information

CLM.MODELS.Raid = Raid
function Raid:New(uid)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Raid Management
    o.uid  = tonumber(uid)
    o.players = {}
    o.config = {}
    o.name = "Raid without name"
    o.status = CONSTANTS.RAID_STATUS.CREATED;


    return o
end

function Raid:SetName(name)
    self.name = name
end

function Raid:SetConfig(config)
    self.config = config
end

function Raid:MarkAsEnded()
    self.status = CONSTANTS.RAID_STATUS.ENDED
end

function Raid:AddPlayers(players)
    for _, guid in ipairs(players) do
        self.players[guid] = 1;
    end
end
function Raid:RemovePlayers(players)
    for _, guid in ipairs(players) do
        self.players[guid] = nil;
    end
end
