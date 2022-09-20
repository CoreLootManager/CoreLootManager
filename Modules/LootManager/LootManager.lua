local define = LibDependencyInjection.createContext(...)

define.module("LootManager/mutateLootAward", {"Utils", "Log", "ProfileRegistry", "EventManager", "PointManager", "Constants/PointChangeReason", "Constants/Events", "Models/Loot", "RosterRegistry"},
function(resolve, UTILS, LOG, ProfileRegistry, EventManager, RaidManager, PointManager, PointChangeReason, Events, Loot, RosterRegistry)
    local function mutateLootAward(entry, roster)
        local GUID = UTILS.getGuidFromInteger(entry:profile())
        if not roster then
            LOG:Debug("mutateLootAward(): Roster does not exist")
            return
        end
        if roster:IsProfileInRoster(GUID) then
            local profile = ProfileRegistry.Get(GUID)
            if not profile then
                LOG:Debug("mutateLootAward(): Profile with guid [%s] does not exist", GUID)
                return
            end
            local loot = Loot:New(entry, profile)
            roster:AddLoot(loot)


            local main
            if profile:Main() == "" then -- is main
                if profile:HasAlts() then -- has alts
                    main = profile
                end
            else -- is alt
                main = ProfileRegistry.Get(profile:Main())
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
            EventManager:DispatchEvent(Events.USER_RECEIVED_ITEM, { id = loot:Id() }, entry:time(), GUID)
            -- Handle Zero-Sum Bank mode
            local raid = RaidRegistry.Get(loot:RaidUid())
            if not raid then
                LOG:Debug("mutateLootAward(): Loot not awarded to raid. Skipping handling zero-sum bank.")
                return
            end
            if raid:Configuration():Get("zeroSumBank") then
                local players
                if raid:Configuration():Get("autoAwardIncludeBench") then
                    players = RaidManager:GetUniquePlayersListInRaid(raid)
                else
                    players = raid:Players()
                end
                local num_players = #players
                if num_players > 0 then
                    local value = (loot:Value()/num_players) + roster:GetConfiguration("zeroSumBankInflation")
                    value = UTILS.round(value, raid:Configuration():Get("roundDecimals"))
                    PointManager:UpdatePointsDirectly(roster, players, value, PointChangeReason.ZERO_SUM_AWARD, loot:Timestamp(), entry:creator())
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
    resolve(mutateLootAward)
end)
define.module("LootManager", {
    "Log", "Utils", "LootManager/LedgerEntries", "Meta:ADDON_TABLE", "ProfileRegistry", "L", "LedgerManager", "RosterManager", "RaidManager", "Models", "LootManager/mutateLootAward"
}, function(resolve, LOG, UTILS, LedgerEntries, CLM, ProfileRegistry, L, LedgerManager, RosterManager, RaidManager, Models, mutateLootAward)

local tinsert, type = table.insert, type



local LootManager = {}
function LootManager:Initialize()
    LOG:Trace("LootManager:Initialize()")
    LedgerManager:RegisterEntryType(
        LedgerEntries.Award,
        (function(entry)
            LOG:TraceAndCount("mutator(LootAward)")
            local roster = RosterRegistry.Get(entry:rosterUid())
            if not roster then
                LOG:Debug("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
                return
            end
            mutateLootAward(entry, roster)
        end))

        LedgerManager:RegisterEntryType(
        LedgerEntries.RaidAward,
        (function(entry)
            LOG:TraceAndCount("mutator(LootRaidAward)")
            local raid = RaidRegistry.Get(entry:raidUid())
            if not raid then
                LOG:Debug("PointManager mutator(): Unknown raid uid %s", entry:raidUid())
                return
            end
            mutateLootAward(entry, raid:Roster())
        end))


end

function LootManager:AwardItem(raidOrRoster, name, itemLink, itemId, value, forceInstant)
    LOG:Trace("LootManager:AwardItem()")
    local isRaid = true
    if not UTILS.typeof(raidOrRoster, Models.Raid) then
        isRaid = false
        if not UTILS.typeof(raidOrRoster, Models.Roster) then
            LOG:Error("raidOrRoster:AwardItem(): Missing valid raid / roster")
            return false
        end
    end
    local profile = ProfileRegistry.GetByName(name)
    if not UTILS.typeof(profile, Models.Profile) then
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
            entry = LedgerEntries.RaidAward:new(raidOrRoster:UID(), profile, itemId, value)
        else
            entry = LedgerEntries.Award:new(roster:UID(), profile, itemId, value)
        end
        local pointTypeSuffix = ((roster:GetPointType() == PointType.DKP) and L["DKP"] or L["GP"])
        LedgerManager:Submit(entry, forceInstant)
        if CLM.GlobalConfigs:GetLootWarning() then
            local message = string.format(L["%s awarded to %s for %s %s"], itemLink, name, value, pointTypeSuffix)
            SendChatMessage(message, "RAID_WARNING")
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

function LootManager:RevokeItem(loot, forceInstant)
    LOG:Trace("LootManager:RevokeItem()")
    if not UTILS.typeof(loot, Models.Loot) then
        LOG:Error("LootManager:RevokeItem(): Missing valid loot")
        return
    end
    LedgerManager:Remove(loot:Entry(), forceInstant)
end

function LootManager:TransferItem(roster, profile, loot, forceInstant)
    LOG:Trace("LootManager:TransferItem()")
    if not UTILS.typeof(roster, Models.Roster) then
        LOG:Error("LootManager:TransferItem(): Missing valid roster")
        return
    end
    if not UTILS.typeof(profile, Models.Profile) then
        LOG:Error("LootManager:TransferItem(): Missing valid target profile")
        return
    end
    if not UTILS.typeof(loot, Models.Loot) then
        LOG:Error("LootManager:TransferItem(): Missing valid loot")
        return
    end
    if roster:IsProfileInRoster(profile:GUID()) then
        LedgerManager:Submit(LedgerEntries.Award:new(roster:UID(), profile, loot:Id(), loot:Value()), forceInstant)
        LedgerManager:Remove(loot:Entry(), forceInstant)
    else
        LOG:Error("LootManager:TransferItem(): Unknown profile guid [%s] in roster [%s]", profile:GUID(), roster:UID())
    end
end

resolve(LootManager)
end)