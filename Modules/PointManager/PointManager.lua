local  _, CLM = ...

local MODULES =  CLM.MODULES
local LOG = CLM.LOG
local ACL = MODULES.ACL
local ACL_LEVEL = MODULES.CONSTANTS.ACL.LEVEL

local LedgerManager = MODULES.LedgerManager
local RosterManager = MODULES.RosterManager

local DKPLedgerEntries = CLM.MODELS.DKPLedgerEntries

-- TODO getGuidFromInteger check the GUID of current user on every call... that may not be the best
local getGuidFromInteger = LibStub("EventSourcing/Util").getGuidFromInteger

-- local function round(value, decimals)
--     return tonumber((("%%.%df"):format(decimals)):format(value))
-- end

local PointManager = {}
function PointManager:Initialize()
    self.roundingFormatter = "%%.2f"

    local mutatorFn = (function(entry)
        local roster = RosterManager:GetRosterByUid(entry:rosterUid())
        if roster == nil then
            LOG:Warning("PointManager mutatorFn(): Unknown roster uid " .. entry:rosterUid())
            return
        end

        local mutate
        local class = entry:class()
        if class == "PDM" then
            mutate = (function(current, value)
                return current + value
            end)
        elseif class == "PDS" then
            mutate = (function(current, value)
                return value
            end)
        elseif class == "PDD" then
            mutate = (function(current, value)
                return (current * (100 - value)) / 100
            end)
        else
            LOG:Warning("PointManager mutatorFn(): Unknown class " .. entry:class())
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
                LOG:Warning("PointManager mutatorFn(): Unknown profile guid " .. entry:rosterUid(getGuidFromInteger(target)))
                return
            end
        end
    end)

    local authorizationFn = (function(entry, sender)
        local class = entry:class()
        if class == "PDM" then
            return ACL:CheckLevel(ACL_LEVEL.MANAGER, sender)
        elseif class == "PDS" or class == "PDD" then
            return ACL:CheckLevel(ACL_LEVEL.OFFICER, sender)
        else
            return false
        end
    end)

    LedgerManager.RegisterEntryType(DKPLedgerEntries.Modify:class(), mutatorFn, authorizationFn)
    LedgerManager.RegisterEntryType(DKPLedgerEntries.Set:class(), mutatorFn, authorizationFn)
    LedgerManager.RegisterEntryType(DKPLedgerEntries.Decay:class(), mutatorFn, authorizationFn)
end

function PointManager:Round(value)
    return tonumber(self.roundingFormatter:format(value))
end

MODULES.PointManager = PointManager