local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS =  CLM.MODELS
-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager
local PointManager = MODULES.PointManager
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
        -- Handle Zero-Sum Bank mode
        if roster:GetConfiguration("zeroSumBank") then
            local raid = MODULES.RaidManager:GetRaidByUid(loot:RaidUid())
            if not raid then
                LOG:Debug("mutateLootAward(): Loot not awarded to raid. Skipping handling zero-sum bank.")
                return
            end
            local num_players = #raid:Players()
            if num_players > 0 then
                local value = (loot:Value()/num_players) + roster:GetConfiguration("zeroSumBankInflation")
                PointManager:UpdatePointsDirectly(roster, raid:Players(), value, CONSTANTS.POINT_CHANGE_REASON.ZERO_SUM_AWARD, loot:Timestamp(), entry:creator())
            else
                LOG:Debug("mutateLootAward(): Empty player list in raid.")
                return
            end
        end
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
        local message = string.format(CLM.L["%s awarded to %s for %s DKP"], itemLink, name, value)
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

MODULES.LootManager = LootManager
