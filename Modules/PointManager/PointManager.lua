local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS

local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager

local DKPLedgerEntries = CLM.MODELS.DKPLedgerEntries
local Profile = CLM.MODELS.Profile
local Roster = CLM.MODELS.Roster

local typeof = CLM.UTILS.typeof
local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

-- local function round(value, decimals)
--     return tonumber((("%%.%df"):format(decimals)):format(value))
-- end

local function mutator(entry, mutate)
    local roster = RosterManager:GetRosterByUid(entry:rosterUid())
    if roster == nil then
        LOG:Warning("PointManager mutator(): Unknown roster uid " .. entry:rosterUid())
        return
    end

    local value = entry:value()
    local standings = roster:Standings()
    local targets = entry:targets()
    for _,target in ipairs(targets) do
        local GUID = getGuidFromInteger(target)
        if roster:IsProfileInRoster(GUID) then
            standings[GUID] = mutate(standings[GUID], value)
        else
            -- TODO: Add  Profile to roster? Store in anonymous profile?
            LOG:Warning("PointManager mutator(): Unknown profile guid " .. entry:rosterUid(getGuidFromInteger(target)))
            return
        end
    end
end

local function mutate_pdm(current, value)
    return current + value
end

local function mutate_pds(current, value)
    return value
end

local function mutate_pdd(current, value)
    return (current * (100 - value)) / 100
end

local PointManager = {}
function PointManager:Initialize()

    LedgerManager:RegisterEntryType(
        DKPLedgerEntries.Modify:class(),
        (function(entry) mutator(entry, mutate_pdm) end),
        ACL_LEVEL.MANAGER)

    LedgerManager:RegisterEntryType(
        DKPLedgerEntries.Set:class(),
        (function(entry) mutator(entry, mutate_pds) end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        DKPLedgerEntries.Decay:class(),
        (function(entry) mutator(entry, mutate_pdd) end),
        ACL_LEVEL.OFFICER)

        LedgerManager:RegisterOnRestart(function()
            RosterManager:WipeStandings()
        end)

    LedgerManager:RegisterOnUpdate(function()
        local rosters = RosterManager:GetRosters()
        for rosterName, roster in pairs(rosters) do
            print(UTILS.ColorCodeText(rosterName, "ff5522"))
            local standings = roster:Standings()
            for GUID, value in pairs(standings) do
                local profile = ProfileManager:GetProfileByGuid(GUID)
                if profile ~= nil then
                    print(UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex) .. ": " .. tostring(value))
                end
            end
        end
    end)

    MODULES.ConfigManager:RegisterUniversalExecutor("pom", "PointManager", self)
end

function PointManager:RandomTest()
    local rosters = RosterManager:GetRosters()
    local numRosters = 0
    local numProfiles = {}
    for name, roster in pairs(rosters) do
        numRosters = numRosters + 1
        local profiles = roster:GetProfiles()
        numProfiles[name] = 0
        for _,_ in pairs(profiles) do
            numProfiles[name] = numProfiles[name] + 1
        end
    end

    print("Detected " .. tonumber(numRosters) .. " rosters")
    for name, value in pairs(numProfiles) do
        print("  " .. name .. ": " .. tostring(value) .. " profiles")
    end
end

-- function PointManager:Round(value)
--     return tonumber(self.roundingFormatter:format(value))
-- end

function PointManager:UpdatePoints(roster, targets, value, action)
    if not CONSTANTS.POINT_MANAGER_ACTIONS[action] then return end
    if targets == nil then return end
    if type(value) ~= "number" then return end

    local uid
    if typeof(roster, Roster) then
        uid = roster:UID()
    elseif type(roster) == "number" then
        roster = RosterManager:GetRosterByUid(roster)
        if roster == nil then return end
        uid = roster:UID()
    elseif type(roster) == "string" then
        roster = RosterManager:GetRosterByName(roster)
        if roster == nil then return end
        uid = roster:UID()
    end

    if typeof(targets, Profile) or type(targets) == "number" or type(targets) == "string" then
        targets = { targets }
    end

    local entry = nil
    if action == CONSTANTS.POINT_MANAGER_ACTION.MODIFY then
        entry = DKPLedgerEntries.Modify:new(uid, targets, value)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.SET then
        entry = DKPLedgerEntries.Set:new(uid, targets, value)
    elseif action == CONSTANTS.POINT_MANAGER_ACTION.DECAY then
        entry = DKPLedgerEntries.Decay:new(uid, targets, value)
    end

    LedgerManager:Submit(entry)

end

CONSTANTS.POINT_MANAGER_ACTION =
{
    MODIFY = 0,
    SET = 1,
    DECAY = 2
}

CONSTANTS.POINT_MANAGER_ACTIONS = UTILS.Set({ 0, 1, 2 })

MODULES.PointManager = PointManager