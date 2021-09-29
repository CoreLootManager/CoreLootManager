local _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local getGuidFromInteger = UTILS.getGuidFromInteger

local EventManager = MODULES.EventManager
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local ProfileInfoManager = MODULES.ProfileInfoManager

local Integration = {}

local function InitializeDB(key)
    local db = MODULES.Database:Server()
    if not db.integration then
        db.integration = {}
    end
    if not db.integration[key] then
        db.integration[key] = { }
    end
    return db.integration[key]
end

local function StoreWoWDKPBotData()
    if not CLM.GlobalConfigs:GetWoWDKPBotIntegration() then return end
    local db = InitializeDB("wowdkpbot")
    db.profiles = {}
    -- Fill Profiles
    for GUID,profile in pairs(ProfileManager:GetProfiles()) do
       db.profiles[GUID] = {
            name = profile:Name(),
            class = profile:Class(),
            spec = profile:Spec(),
            main = profile:Main()
        }
    end
    -- Fill Rosters
    db.rosters = {}
    for name,roster in pairs(RosterManager:GetRosters()) do
        db.rosters[name] = {}
        -- Config
        local rounding = roster:GetConfiguration("roundDecimals")
        if rounding > 2 then rounding = 2 end -- fix for default 10-digit rounding
        db.rosters[name].rounding = rounding
        -- For each profile in roster
        for GUID, value in pairs(roster.standings) do
            db.rosters[name][GUID] = {
                dkp = value, -- set standings
                loot = {},
                history = {}
            }
            local data = db.rosters[name][GUID]
            -- set loot
            for _, lootEntry in ipairs(roster:GetProfileLootByGUID(GUID)) do
                local loot = {
                    id = lootEntry:Id(),
                    time = lootEntry:Timestamp(),
                    value = lootEntry:Value()
                }
                local lootName = GetItemInfo(lootEntry:Id())
                loot.name = lootName or "???"
                table.insert(data.loot, loot)
            end
            -- set point history
            for _, historyEntry in ipairs(roster:GetProfilePointHistoryByGUID(GUID)) do
                local history = {
                    reason = historyEntry:Reason(),
                    time = historyEntry:Timestamp(),
                    value = historyEntry:Value(),
                    creator = getGuidFromInteger(historyEntry:Creator())
                }
                table.insert(data.history, history)
            end
        end

    end
end

local function ClearWoWDKPBotData()
    if not CLM.GlobalConfigs:GetWoWDKPBotIntegration() then return end
    local db = InitializeDB("wowdkpbot") -- luacheck: ignore
    wipe(db)
end

local function RequestWoWDKPBotData()
    if not CLM.GlobalConfigs:GetWoWDKPBotIntegration() then return end
    ProfileInfoManager:RequestSpec()
    ProfileInfoManager:RequestVersion()
end

function Integration:Initialize()
    LOG:Trace("Integration:Initialize()")
    ClearWoWDKPBotData()

    C_Timer.After(10, RequestWoWDKPBotData)

    EventManager:RegisterEvent({"PLAYER_LOGOUT"}, (function()
        StoreWoWDKPBotData()
    end))
end

function Integration:Export()
    StoreWoWDKPBotData()
end


CLM.Integration = Integration