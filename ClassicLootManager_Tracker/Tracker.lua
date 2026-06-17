-- ------------------------------- --
local _, PRIV = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local UTILS     = CLM.UTILS
-- ------------------------------- --


local track = {}

---@param roster Roster
---@param itemId number
---@param player string
local function BuildPlayerItemTrack(roster, itemId, player)
    local UID = roster:UID()
    if not track[UID] then
        track[UID] = {}
    end
    if not track[UID][itemId] then
        track[UID][itemId] = {}
    end
    if not track[UID][itemId][player] then
        track[UID][itemId][player] = {
            count = 0,
            list = {}
        }
    end

    local profile = CLM.MODULES.ProfileManager:GetProfileByName(player)
    if profile then
        for _, loot in ipairs(roster:GetProfileLootByGUID(profile:GUID())) do
            if loot:Id() == itemId then
                track[UID][itemId][player].count = track[UID][itemId][player].count + 1
                track[UID][itemId][player].list[#track[UID][itemId][player].list+1] = loot:Timestamp()
            end
        end
    end
end

---@param roster Roster
---@param itemId number
---@param player string
---@return number
local function GetCount(roster, itemId, player)
    return track[roster:UID()][itemId][player].count
end

---@class Tracker
local Tracker = {}
function Tracker:Initialize()
    self.track = track
end

---@param roster Roster
---@param itemId number
---@param player string
---@return number, boolean
function Tracker:GetCount(roster, itemId, player)
    local success, count = pcall(GetCount, roster, itemId, player)
    if not success then
        BuildPlayerItemTrack(roster, itemId, player)
        count = GetCount(roster, itemId, player)
    end

    return count, success
end

local function _invalidateTrack(roster, loot, profile)
    track[roster:UID()][loot:Id()][profile:Name()] = nil
end

local function invalidateTrack(_, roster, loot, profile)
    pcall(_invalidateTrack, roster, loot, profile)
end

hooksecurefunc(CLM.MODULES.RosterManager, "AddLootToRoster", invalidateTrack)

PRIV.MODULES.Tracker = Tracker