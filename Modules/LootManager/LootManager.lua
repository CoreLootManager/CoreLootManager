local  _, CLM = ...

local LOG = CLM.LOG

local MODULES =  CLM.MODULES
-- local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS
local MODELS =  CLM.MODELS

-- local ACL_LEVEL = CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
-- local RosterManager = MODULES.RosterManager
-- local ProfileManager = MODULES.ProfileManager

local LEDGER_LOOT = MODELS.LEDGER.LOOT
local Profile = MODELS.Profile
local Roster = MODELS.Roster
local Loot = MODELS.Loot

local typeof = UTILS.typeof
-- local getGuidFromInteger = UTILS.getGuidFromInteger

local LootManager = {}
function LootManager:Initialize()
    LOG:Trace("LootManager:Initialize()")
    LedgerManager:RegisterEntryType(
        LEDGER_LOOT.Award,
        (function(entry)
            LOG:Trace("mutator(LOOTAward)")
            local roster = RosterManager:GetRosterByUid(entry:rosterUid())
            if roster == nil then
                LOG:Warning("PointManager mutator(): Unknown roster uid %s", entry:rosterUid())
                return
            end
            local GUID = getGuidFromInteger(entry:player())
            if roster:IsProfileInRoster(GUID) then
                local loot = Loot:New(entry)
                -- TODO add to roster loot list
                -- TODO add to profile loot list
            else
                -- TODO: Add  Profile to roster? Store in anonymous profile?
                LOG:Warning("PointManager mutator(): Unknown profile guid [%s] in roster [%s]", GUID, entry:rosterUid())
                return
            end
        end),
        ACL_LEVEL.MANAGER)
end

function LootManager:AwardItem(roster, profile, itemId, value)
    LOG:Trace("LootManager:AwardItem()")
    if not typeof(roster, Roster) then
        LOG:Error("LootManager:AwardItem(): Missing valid roster")
        return
    end
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

    LedgerManager:Submit(LEDGER_LOOT.Award:new(roster:UID(), profile, itemId, value))
end

function LootManager:RevokeItem(roster, profile, loot)
    LOG:Trace("LootManager:RevokeItem()")
    if not typeof(roster, Roster) then
        LOG:Error("LootManager:RevokeItem(): Missing valid roster")
        return
    end
    if not typeof(profile, Profile) then
        LOG:Error("LootManager:RevokeItem(): Missing valid profile")
        return
    end
    if not typeof(loot, Loot) then
        LOG:Error("LootManager:RevokeItem(): Missing valid loot")
        return
    end
    -- TODO: Add entry to track who removed?
    LedgerManager:Remove(loot:entry())
end

function LootManager:TransferItem(roster, profile, loot)
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
    LedgerManager:Submit(LEDGER_LOOT.Award:new(roster:UID(), profile, loot:Id(), loot:Value()))
    LedgerManager:Remove(loot:entry())
end

MODULES.LootManager = LootManager