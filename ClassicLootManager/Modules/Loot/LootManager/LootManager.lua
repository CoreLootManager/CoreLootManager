-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

-- luacheck: ignore CHAT_MESSAGE_CHANNEL
local CHAT_MESSAGE_CHANNEL = "RAID_WARNING"
--@debug@
CHAT_MESSAGE_CHANNEL = "GUILD"
--@end-debug@

local function mutateLootAward(entry, roster)
    local GUID = UTILS.getGuidFromInteger(entry:profile())
    if not roster then
        LOG:Debug("mutateLootAward(): Roster does not exist")
        return
    end
    if roster:IsProfileInRoster(GUID) then
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
        if not profile then
            LOG:Debug("mutateLootAward(): Profile with guid [%s] does not exist", GUID)
            return
        end
        local loot = CLM.MODELS.Loot:New(entry, profile)
        CLM.MODULES.RosterManager:AddLootToRoster(roster, loot, profile)

        local main
        if profile:Main() == "" then -- is main
            if profile:HasAlts() then -- has alts
                main = profile
            end
        else -- is alt
            main = CLM.MODULES.ProfileManager:GetProfileByGUID(profile:Main())
        end
        if main then
            -- points are already awarded to alt in AddLoot
            -- mirror them from the alt to all other alts + main
            local mirrorTargets = UTILS.keys(main:Alts())
            tinsert(mirrorTargets, main:GUID())
            roster:MirrorStandings(profile:GUID(), mirrorTargets)
        end

        -- Force caching loot from server
        GetItemInfo(loot:Id())
        CLM.MODULES.EventManager:DispatchEvent(CONSTANTS.EVENTS.USER_RECEIVED_ITEM, { id = loot:Id() }, entry:time(), GUID)
        -- Handle Zero-Sum Bank mode
        local raid = CLM.MODULES.RaidManager:GetRaidByUid(loot:RaidUid())
        if not raid then
            LOG:Debug("mutateLootAward(): Loot not awarded to raid. Skipping handling zero-sum bank.")
            return
        end
        if raid:Configuration():Get("zeroSumBank") then
            local players
            if raid:Configuration():Get("autoAwardIncludeBench") then
                players = CLM.MODULES.RaidManager:GetUniquePlayersListInRaid(raid)
            else
                players = raid:Players()
            end
            local num_players = #players
            if num_players > 0 then
                local value = (loot:Value()/num_players) + roster:GetConfiguration("zeroSumBankInflation")
                value = UTILS.round(value, raid:Configuration():Get("roundDecimals"))
                CLM.MODULES.PointManager:UpdatePointsDirectly(roster, players, value, CONSTANTS.POINT_CHANGE_REASON.ZERO_SUM_AWARD, false, loot:Timestamp(), entry:creatorFull())
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

local function mutateLootDisenchant(entry, roster)
    if not roster then
        LOG:Debug("mutateLootAward(): Roster does not exist")
        return
    end
    local loot = CLM.MODELS.Loot:New(entry, CLM.MODULES.ProfileManager:GetDisenchanterProfile())
    CLM.MODULES.RosterManager:AddDisenchantedToRoster(roster, loot)
    GetItemInfo(loot:Id())
end

local LootManager = {}
function LootManager:Initialize()
    LOG:Trace("LootManager:Initialize()")

    CLM.MODULES.LedgerManager:RegisterEntryType(
        CLM.MODELS.LEDGER.LOOT.Award,
        (function(entry)
            LOG:TraceAndCount("mutator(LootAward)")
            local roster = CLM.MODULES.RosterManager:GetRosterByUid(entry:rosterUid())
            if not roster then
                LOG:Debug("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
                return
            end
            mutateLootAward(entry, roster)
        end))

    CLM.MODULES.LedgerManager:RegisterEntryType(
        CLM.MODELS.LEDGER.LOOT.RaidAward,
        (function(entry)
            LOG:TraceAndCount("mutator(LootRaidAward)")
            local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raidUid())
            if not raid then
                LOG:Debug("PointManager mutator(): Unknown raid uid %s", entry:raidUid())
                return
            end
            mutateLootAward(entry, raid:Roster())
        end))

        CLM.MODULES.LedgerManager:RegisterEntryType(
            CLM.MODELS.LEDGER.LOOT.Disenchant,
            (function(entry)
                LOG:TraceAndCount("mutator(LootDisenchant)")
                local roster = CLM.MODULES.RosterManager:GetRosterByUid(entry:rosterUid())
                if not roster then
                    LOG:Debug("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
                    return
                end
                mutateLootDisenchant(entry, roster)
            end))

        CLM.MODULES.LedgerManager:RegisterEntryType(
            CLM.MODELS.LEDGER.LOOT.RaidDisenchant,
            (function(entry)
                LOG:TraceAndCount("mutator(LootRaidDisenchant)")
                local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raidUid())
                if not raid then
                    LOG:Debug("PointManager mutator(): Unknown raid uid %s", entry:raidUid())
                    return
                end
                mutateLootDisenchant(entry, raid:Roster())
            end))

end

function LootManager:AwardItem(raidOrRoster, name, itemLink, value, forceInstant)
    LOG:Trace("LootManager:AwardItem()")
    local isRaid = true
    if not UTILS.typeof(raidOrRoster, CLM.MODELS.Raid) then
        isRaid = false
        if not UTILS.typeof(raidOrRoster, CLM.MODELS.Roster) then
            LOG:Error("raidOrRoster:AwardItem(): Missing valid raid / roster")
            return false
        end
    end
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
    if not UTILS.typeof(profile, CLM.MODELS.Profile) then
        LOG:Error("LootManager:AwardItem(): Missing valid profile")
        return false
    end
    if type(itemId) ~= "number" then
        LOG:Error("LootManager:AwardItem(): Invalid ItemId")
        return false
    end
    if not GetItemInfoInstant(itemId) then
        LOG:Error("LootManager:AwardItem(): Item does not exist")
        return false
    end
    if type(value) ~= "number" then
        LOG:Error("LootManager:AwardItem(): Invalid Value")
        return false
    end
    local roster = isRaid and raidOrRoster:Roster() or raidOrRoster
    if roster:IsProfileInRoster(profile:GUID()) then
        local entry
        if isRaid then
            entry = CLM.MODELS.LEDGER.LOOT.RaidAward:new(raidOrRoster:UID(), profile, itemId, value)
        else
            entry = CLM.MODELS.LEDGER.LOOT.Award:new(roster:UID(), profile, itemId, value)
        end
        local pointTypeSuffix = ((roster:GetPointType() == CONSTANTS.POINT_TYPE.DKP) and CLM.L["DKP"] or CLM.L["GP"])
        CLM.MODULES.LedgerManager:Submit(entry, forceInstant)
        if CLM.GlobalConfigs:GetLootWarning() then
            local message = string.format(CLM.L["%s awarded to %s for %s %s"], itemLink, name, value, pointTypeSuffix)
            SendChatMessage(message, CHAT_MESSAGE_CHANNEL)
            if CLM.GlobalConfigs:GetAnnounceAwardToGuild() then
                SendChatMessage(message, "GUILD")
            end
        end
        return true, entry:uuid()
    else
        LOG:Error("LootManager:AwardItem(): Unknown profile guid [%s] in roster [%s]", profile:GUID(), roster:UID())
    end
    return false
end

function LootManager:DisenchantItem(raidOrRoster, itemLink, forceInstant)
    LOG:Trace("LootManager:DisenchantItem()")
    local isRaid = true
    if not UTILS.typeof(raidOrRoster, CLM.MODELS.Raid) then
        isRaid = false
        if not UTILS.typeof(raidOrRoster, CLM.MODELS.Roster) then
            LOG:Error("raidOrRoster:DisenchantItem(): Missing valid raid / roster")
            return false
        end
    end
    if type(itemId) ~= "number" then
        LOG:Error("LootManager:DisenchantItem(): Invalid ItemId")
        return false
    end
    if not GetItemInfoInstant(itemId) then
        LOG:Error("LootManager:DisenchantItem(): Item does not exist")
        return false
    end
    local roster = isRaid and raidOrRoster:Roster() or raidOrRoster
    local entry
    if isRaid then
        entry = CLM.MODELS.LEDGER.LOOT.RaidDisenchant:new(raidOrRoster:UID(), itemId)
    else
        entry = CLM.MODELS.LEDGER.LOOT.Disenchant:new(roster:UID(), itemId)
    end
    CLM.MODULES.LedgerManager:Submit(entry, forceInstant)
    if CLM.GlobalConfigs:GetLootWarning() then
        local message = CLM.L["Disenchanted"] .. " " .. itemLink
        SendChatMessage(message, CHAT_MESSAGE_CHANNEL)
        if CLM.GlobalConfigs:GetAnnounceAwardToGuild() then
            SendChatMessage(message, "GUILD")
        end
    end
    return true, entry:uuid()
end

function LootManager:RevokeItem(loot, forceInstant)
    LOG:Trace("LootManager:RevokeItem()")
    if not UTILS.typeof(loot, CLM.MODELS.Loot) then
        LOG:Error("LootManager:RevokeItem(): Missing valid loot")
        return
    end
    CLM.MODULES.LedgerManager:Remove(loot:Entry(), forceInstant)
end


CLM.MODULES.LootManager = LootManager
