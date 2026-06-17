-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

---@class Loot
---@field entry table
---@field owner Profile
---@field ownerGuid string
---@field raidUid number
local Loot = {}

---@param entry table
---@param owner Profile
---@return Loot
function Loot:New(entry, owner)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.owner = owner

    return o
end

---@return Profile
function Loot:Owner()
    return self.owner
end

---@return number
function Loot:Id()
    return self.entry:item()
end

---@return string
function Loot:String()
    return "item:" .. tostring(self.entry:item()) .. (self.entry:extra() or "")
end

---@return string
function Loot:Extra()
    return self.entry:extra()
end

---@return number
function Loot:Value()
    return self.entry:value()
end

---@return number
function Loot:Timestamp()
    return self.entry:time()
end

---@return string
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

---@return string
function Loot:Creator()
    return self.entry:creatorFull()
end

---@return table
function Loot:Entry()
    return self.entry
end

---@return number
function Loot:RaidUid()
    if not self.raidUid then
        if self.entry.raidUid then
            self.raidUid = self.entry:raidUid()
        end
    end
    return self.raidUid
end

CLM.MODELS.Loot = Loot