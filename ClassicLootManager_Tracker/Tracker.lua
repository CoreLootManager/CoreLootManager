-- ------------------------------- --
local _, PRIV = ...
local CLM = LibStub("ClassicLootManager").CLM
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local UTILS     = CLM.UTILS
-- ------------------------------- --


local track = {}

local function BuildItemTrack(roster, player, itemId)
    local UID = roster:UID()
    if not track[UID] then
        track[UID] = {}
    end
    if not track[UID][player] then
        track[UID][player] = {}
    end
    if not track[UID][player][itemId] then
        track[UID][player][itemId] = {
            count = 0,
            list = {}
        }
    end

    local profile = CLM.MODULES.ProfileManager:GetProfileByName(player)
    if profile then
        for _, loot in ipairs(roster:GetProfileLootByGUID(profile:GUID())) do
            if loot:Id() == itemId then
                track[UID][player][itemId].count = track[UID][player][itemId].count + 1
                track[UID][player][itemId].list[#track[UID][player][itemId].list+1] = loot:Timestamp()
            end
        end
    end
end

local function GetCount(roster, player, itemId)
    return track[roster:UID()][player][itemId].count
end

local Tracker = {}
function Tracker:Initialize()
    self.track = track
end

function Tracker:GetCount(roster, player, itemId)
    local success, count = pcall(GetCount, roster, player, itemId)
    if not success then
        BuildItemTrack(roster, player, itemId)
        count = GetCount(roster, player, itemId)
    end

    return count
end

local function invalidateTrack(roster, loot, profile)
    track[roster:UID()][profile:Name()][loot:Id()] = nil
end
hooksecurefunc(CLM.MODULES.RosterManager, "AddLootToRoster", function(r, l, p) pcall(invalidateTrack, r, l, p) end)

CLM_Tracker = Tracker
PRIV.MODULES.Tracker = Tracker