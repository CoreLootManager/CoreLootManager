-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local Loot = {}
function Loot:New(entry, owner)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.owner = owner

    return o
end

function Loot:Owner()
    return self.owner
end

function Loot:Id()
    return self.entry:item()
end

function Loot:Value()
    return self.entry:value()
end

function Loot:Timestamp()
    return self.entry:time()
end

function Loot:OwnerGUID()
    if not self.ownerGuid then
        if self.entry.profile then
            self.ownerGuid = getGuidFromInteger(self.entry:profile())
        else
            self.ownerGuid = ""
        end
    end
    return self.ownerGuid
end

function Loot:Creator()
    return self.entry:creatorFull()
end

function Loot:Entry()
    return self.entry
end

function Loot:RaidUid()
    if not self.raidUid then
        if self.entry.raidUid then
            self.raidUid = self.entry:raidUid()
        end
    end
    return self.raidUid
end

CLM.MODELS.Loot = Loot