local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS =  CLM.MODELS
-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager
local EventManager = MODULES.EventManager

local LEDGER_LOOT = MODELS.LEDGER.LOOT
local Profile = MODELS.Profile
local Roster = MODELS.Roster
local Raid = MODELS.Raid
local Loot = MODELS.Loot

local typeof = UTILS.typeof
local getGuidFromInteger = UTILS.getGuidFromInteger
local keys = UTILS.keys

local function mutateLootAward(entry, roster)
    local GUID = getGuidFromInteger(entry:profile())
    if not roster then
        LOG:Debug("mutateLootAward(): Roster does not exist")
        return
    end
    if roster:IsProfileInRoster(GUID) then
        local profile = ProfileManager:GetProfileByGUID(GUID)
        if not profile then
            LOG:Debug("mutateLootAward(): Profile with guid [%s] does not exist", GUID)
            return
        end
        local loot = Loot:New(entry, profile)
        RosterManager:AddLootToRoster(roster, loot, profile)

        local main
        if profile:Main() == "" then -- is main
            if profile:HasAlts() then -- has alts
                main = profile
            end
        else -- is alt
            main = ProfileManager:GetProfileByGUID(profile:Main())
        end
        if main then
            -- points are already awarded to alt in AddLoot
            -- mirror them from the alt to all other alts + main
            local mirrorTargets = keys(profile:Alts())
            table.insert(mirrorTargets, main:GUID())
            roster:MirrorStandings(profile:GUID(), mirrorTargets)
        end

        -- Force caching loot from server
        GetItemInfo(loot:Id())
        EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_RECEIVED_ITEM, { id = loot:Id() }, entry:time(), GUID)
    else
        LOG:Debug("mutateLootAward(): Unknown profile guid [%s] in roster [%s]", GUID, roster:UID())
        return
    end
end

local LootManager = {}
function LootManager:Initialize()
    LOG:Trace("LootManager:Initialize()")
    LedgerManager:RegisterEntryType(
        LEDGER_LOOT.Award,
        (function(entry)
            LOG:TraceAndCount("mutator(LootAward)")
            local roster = RosterManager:GetRosterByUid(entry:rosterUid())
            if not roster then
                LOG:Debug("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
                return
            end
            mutateLootAward(entry, roster)
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_LOOT.RaidAward,
        (function(entry)
            LOG:TraceAndCount("mutator(LootRaidAward)")
            local raid = MODULES.RaidManager:GetRaidByUid(entry:raidUid())
            if not raid then
                LOG:Debug("PointManager mutator(): Unknown raid uid %s", entry:raidUid())
                return
            end
            mutateLootAward(entry, raid:Roster())
        end))

        MODULES.ConfigManager:RegisterUniversalExecutor("lm", "LootManager", self)
end

function LootManager:AwardItem(raidOrRoster, name, itemLink, itemId, value, forceInstant)
    LOG:Trace("LootManager:AwardItem()")
    local isRaid = true
    if not typeof(raidOrRoster, Raid) then
        isRaid = false
        if not typeof(raidOrRoster, Roster) then
            LOG:Error("raidOrRoster:AwardItem(): Missing valid raid / roster")
            return
        end
    end
    local profile = ProfileManager:GetProfileByName(name)
    if not typeof(profile, Profile) then
        LOG:Error("LootManager:AwardItem(): Missing valid profile")
        return
    end
    if type(itemId) ~= "number" then
        LOG:Error("LootManager:AwardItem(): Invalid ItemId")
        return
    end
    if type(value) ~= "number" then
        LOG:Error("LootManager:AwardItem(): Invalid Value")
        return
    end
    local roster = isRaid and raidOrRoster:Roster() or raidOrRoster
    if roster:IsProfileInRoster(profile:GUID()) then
        if isRaid then
            LedgerManager:Submit(LEDGER_LOOT.RaidAward:new(raidOrRoster:UID(), profile, itemId, value), forceInstant)
        else
            LedgerManager:Submit(LEDGER_LOOT.Award:new(roster:UID(), profile, itemId, value), forceInstant)
        end
        local message = string.format("%s awarded to %s for %s DKP", itemLink, name, value)
        SendChatMessage(message, "RAID_WARNING")
        if CLM.GlobalConfigs:GetAnnounceAwardToGuild() then
            SendChatMessage(message, "GUILD")
        end
    else
        LOG:Error("LootManager:AwardItem(): Unknown profile guid [%s] in roster [%s]", profile:GUID(), roster:UID())
    end
end

function LootManager:RevokeItem(loot, forceInstant)
    LOG:Trace("LootManager:RevokeItem()")
    if not typeof(loot, Loot) then
        LOG:Error("LootManager:RevokeItem(): Missing valid loot")
        return
    end
    LedgerManager:Remove(loot:Entry(), forceInstant)
end

function LootManager:TransferItem(roster, profile, loot, forceInstant)
    LOG:Trace("LootManager:TransferItem()")
    if not typeof(roster, Roster) then
        LOG:Error("LootManager:TransferItem(): Missing valid roster")
        return
    end
    if not typeof(profile, Profile) then
        LOG:Error("LootManager:TransferItem(): Missing valid target profile")
        return
    end
    if not typeof(loot, Loot) then
        LOG:Error("LootManager:TransferItem(): Missing valid loot")
        return
    end
    if roster:IsProfileInRoster(profile:GUID()) then
        LedgerManager:Submit(LEDGER_LOOT.Award:new(roster:UID(), profile, loot:Id(), loot:Value()), forceInstant)
        LedgerManager:Remove(loot:Entry(), forceInstant)
    else
        LOG:Error("LootManager:TransferItem(): Unknown profile guid [%s] in roster [%s]", profile:GUID(), roster:UID())
    end
end

function LootManager:Debug(N)
    N = N or 10
    local rosters = RosterManager:GetRosters()
    local numRosters = 0
    local rosterLookup = {}
    local numProfiles = {}
    local profileLookup = {}
    for name, roster in pairs(rosters) do
        print(tostring(name))
        local standings = roster:Standings()
        numProfiles[name] = 0
        profileLookup[name] = {}
        for GUID,_ in pairs(standings) do
            numProfiles[name] = numProfiles[name] + 1
            table.insert(profileLookup[name], GUID)
        end
        if numProfiles[name] > 0 then
            numRosters = numRosters + 1
            table.insert(rosterLookup, name)
        end
    end

    print("Detected " .. tonumber(numRosters) .. " rosters with profiles")
    for name, value in pairs(numProfiles) do
        print("  " .. name .. ": " .. tostring(value) .. " profiles")
    end

    if numRosters == 0 then
        return
    end

    print("Generating total of  " .. N .. " entries")

    for iteration=1,N do
        local selectedRoster = rosterLookup[math.random(1, numRosters)]
        local roster = rosters[selectedRoster]
        if roster == nil then
            print("=== Wrong roster selection ===")
        else
            local profile = ProfileManager:GetProfileByGUID(profileLookup[selectedRoster][math.random(1, numProfiles[selectedRoster])])
            if profile == nil then
                print("=== Wrong profile selection ===")
            else
                local profileLoot = roster:GetProfileLootByGUID(profile:GUID())
                local numLoot = #profileLoot
                local entryType
                if numLoot > 0 then
                 entryType = math.random(0, 2)
                else
                 entryType = 0 -- Award only
                end
                -- local itemId = math.random(1100, 23328)
                -- local icon
                -- while icon == nil do
                --     _, _, _, _, icon = GetItemInfoInstant(itemId)
                --     itemId = math.random(1100, 23328)
                -- end
                -- Limit to known existing items by using AtlasLootClassic
                if not _G.AtlasLoot then
                    LOG:Error("loot Debug requires AtlasLoot")
                    return
                end
                -- Select instance
                local dungeons = _G.AtlasLoot.ItemDB.Storage.AtlasLootClassic_DungeonsAndRaids
                local instanceList = {}
                for k,v in pairs(dungeons) do
                    if type(v) == "table" and v.items then
                        table.insert(instanceList, k)
                    end
                end

                local instance = dungeons[instanceList[math.random(1, #instanceList)]]
                -- Select boss
                local bosses = instance.items
                local bossList = {}
                for k,_ in pairs(bosses) do
                    table.insert(bossList, k)
                end

                local boss = bosses[bossList[math.random(1, #bossList)]]
                -- select item
                local items = boss[1]
                if items then
                    local itemList = {}
                    for k,_ in pairs(items) do
                        table.insert(itemList, k)
                    end

                    local itemId = items[itemList[math.random(1, #itemList)]][2]

                    local value = math.random() * 1000
                    -- while GetItemInfoInstant(itemId) == nil do
                        -- value = math.random(1100, 23328)
                    -- end
                    print(
                        "Generated entry: " .. tostring(iteration) ..
                        " of type " .. tostring(entryType) ..
                        " in roster " .. selectedRoster .. " " ..
                        " with id " .. tostring(itemId) .. " "..
                        " and value " .. tostring(value)
                    )
                    if entryType == 0 then -- Award
                        self:AwardItem(roster, profile:Name(), itemId, value, true)
                    elseif entryType == 1 then -- Revoke
                        self:RevokeItem(profileLoot[math.random(1, numLoot)], true)
                    elseif entryType == 2 then -- Transfer
                        local targetProfile = ProfileManager:GetProfileByGUID(profileLookup[selectedRoster][math.random(1, numProfiles[selectedRoster])])
                        while targetProfile == nil or (targetProfile:GUID() == profile:GUID()) do
                            targetProfile = ProfileManager:GetProfileByGUID(profileLookup[selectedRoster][math.random(1, numProfiles[selectedRoster])])
                        end
                        self:TransferItem(roster, targetProfile, profileLoot[math.random(1, numLoot)], true)
                    end
                end
            end
        end
    end
end

MODULES.LootManager = LootManager
