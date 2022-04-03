local _, CLM = ...

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES -- Not typical model since it accessess modules and breaks the MVP but i wanted not as singleton
local MODELS = CLM.MODELS

local json = LibStub:GetLibrary("LibJsonLua")

local function dictNotEmpty(dict)
    return not rawequal(next(dict), nil)
end

local Exporter = {}

function Exporter:New(config)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.config    = config

    o.output = ""

    o.dataInfo = {
        rosters = {},
        profiles = {},
        cutoffTimestamp = 0
    }

    return o
end

local function GetCutoffTimestamp(timeframe)
    local multiplier = 1

    if timeframe.scale == CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.HOURS then
        multiplier = 3600
    elseif timeframe.scale == CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.DAYS then
        multiplier = (3600 * 24)
    elseif timeframe.scale == CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.WEEKS then
        multiplier = (3600 * 24) * 7
    elseif timeframe.scale == CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.MONTHS then
        multiplier = (3600 * 24) * 31
    elseif timeframe.scale == CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.YEARS then
        multiplier = (3600 * 24) * 365
    end
    LOG:Info(GetServerTime(), (timeframe.value * multiplier),  (GetServerTime() - (timeframe.value * multiplier)))
    return (GetServerTime() - (timeframe.value * multiplier))
end

local function decodeNote(note)
    if note ~= "" then
        local numNote = tonumber(note)
        if numNote then
            note = CLM.EncounterIDsMap[numNote] or note
        end
    end
    return note
end

local EXPORT_GROUP_NAME = {
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = "standings",
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = "pointHistory",
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = "lootHistory",
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.RAIDS] = "raids",
    -- [CLM.CONSTANTS.EXPORT_DATA_TYPE.CONFIGS] = "configs"
}

-- -------- --
-- Encoders --
-- -------- --

local ENCODERS =  {
    [CLM.CONSTANTS.FORMAT_VALUE.XML]  = (function() return "XML not supported" end),
    [CLM.CONSTANTS.FORMAT_VALUE.CSV]  = (function() return "CSV not supported" end),
    [CLM.CONSTANTS.FORMAT_VALUE.JSON] = (function(output) return json.encode(output) end),
}

-- ------------- --
-- Data Builders --
-- ------------- --

local DATA_BUILDERS = {
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = (function(self)
        local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }
        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    standings = {
                        player = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    if roster:IsProfileInRoster(GUID) then
                        local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
                        if profile then
                            table.insert(roster_data.standings.player, {
                                guid = GUID,
                                name = profile:Name(),
                                class = profile:Class(),
                                spec = profile:SpecString(),
                                dkp = roster:Standings(GUID)
                            })
                        end
                    end
                end
                table.insert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    standings = {
                        player = {}
                    }
                }
                local standings = roster:Standings()
                for GUID,value in pairs(standings) do
                    local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
                    if profile then
                        table.insert(roster_data.standings.player, {
                            guid = GUID,
                            name = profile:Name(),
                            class = profile:Class(),
                            spec = profile:SpecString(),
                            dkp = value
                        })
                    end
                end
                table.insert(data.roster, roster_data)
            end
        end
        return data
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = (function(self)
        local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    lootHistory = {
                        item = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local lootList = roster:GetProfileLootByGUID(GUID)
                    for _, loot in ipairs(lootList) do
                        local profile = MODULES.ProfileManager:GetProfileByGUID(loot:OwnerGUID())
                        if profile then
                            local awardedBy = MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(loot:Creator()))
                            local itemName, _, itemQuality = GetItemInfo(loot:Id())
                            table.insert(roster_data.lootHistory.item, {
                                id = loot:Id(),
                                name = itemName or "",
                                quality = itemQuality or 0,
                                player = profile:Name(),
                                awardedBy = awardedBy and awardedBy:Name() or "",
                                dkp = loot:Value(),
                                timestamp = loot:Timestamp()
                            })
                        end
                    end
                end
                table.insert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    lootHistory = {
                        item = {}
                    }
                }
                local lootList = roster:GetRaidLoot()
                for _, loot in ipairs(lootList) do
                    local profile = MODULES.ProfileManager:GetProfileByGUID(loot:OwnerGUID())
                    if profile then
                        local awardedBy = MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(loot:Creator()))
                        local itemName, _, itemQuality = GetItemInfo(loot:Id())
                        table.insert(roster_data.lootHistory.item, {
                            id = loot:Id(),
                            name = itemName or "",
                            quality = itemQuality or 0,
                            player = profile:Name(),
                            awardedBy = awardedBy and awardedBy:Name() or "",
                            dkp = loot:Value(),
                            timestamp = loot:Timestamp()
                        })
                    end
                end
                table.insert(data.roster, roster_data)
            end
        end
        return data
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = (function(self)
        local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    pointHistory = {
                        point = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local historyList = roster:GetProfilePointHistoryByGUID(GUID)
                    for _, history in ipairs(historyList) do
                        local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
                        if profile then
                            local note = decodeNote(history:Note())
                            local awardedBy = MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(history:Creator()))
                            table.insert(roster_data.pointHistory.point, {
                                dkp = history:Value(),
                                player = profile:Name(),
                                reason = CLM.CONSTANTS.POINT_CHANGE_REASONS.ALL[history:Reason()] or "",
                                note = note,
                                awardedBy = awardedBy and awardedBy:Name() or "",
                                timestamp = history:Timestamp()
                            })
                        end
                    end
                end
                table.insert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    pointHistory = {
                        point = {}
                    }
                }
                local historyList = roster:GetRaidPointHistory()
                for _, history in ipairs(historyList) do
                    for _,profile in ipairs(history:Profiles()) do
                        local note = decodeNote(history:Note())
                        local awardedBy = MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(history:Creator()))
                        table.insert(roster_data.pointHistory.point, {
                            dkp = history:Value(),
                            player = profile:Name(),
                            reason = CLM.CONSTANTS.POINT_CHANGE_REASONS.ALL[history:Reason()] or "",
                            note = note,
                            awardedBy = awardedBy and awardedBy:Name() or "",
                            timestamp = history:Timestamp()
                        })
                    end
                end
                table.insert(data.roster, roster_data)
            end
        end
        return data
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.RAIDS] = (function(self)
        -- local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        -- local workEstimate = 0
        -- local now = GetServerTime()

        return {}
    end),
}

-- ---------- --
-- Estimators --
-- ---------- --

local ESTIMATORS = {
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = (function(self)
        local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local workEstimate = 0
        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    if roster:IsProfileInRoster(GUID) then
                        workEstimate = workEstimate + 1
                    end
                end
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                workEstimate = workEstimate + #roster:Profiles()
            end
        end
        LOG:Message("Standings: %d", workEstimate)
        return workEstimate
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = (function(self)
        local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local workEstimate = 0

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local loot = roster:GetProfileLootByGUID(GUID)
                    if #loot > 0 then
                        local oldest = loot[1]
                        local newest = loot[#loot]
                        LOG:Info("Loot n %d o %d", newest:Timestamp(), oldest:Timestamp())

                        if newest:Timestamp() >= self.dataInfo.cutoffTimestamp then
                            workEstimate = workEstimate + #loot
                            LOG:Info("Newer than Newest: %d", #loot)
                        elseif oldest:Timestamp() < self.dataInfo.cutoffTimestamp then
                            -- 0 work needed
                            LOG:Info("Older than Oldest")
                        else
                            workEstimate = workEstimate + math.floor(#loot * ((newest:Timestamp() - oldest:Timestamp())/(self.dataInfo.cutoffTimestamp - oldest:Timestamp())))
                            LOG:Info("Estimation")
                        end
                    end
                end
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local loot = roster:GetRaidLoot()
                if #loot > 0 then
                    local oldest = loot[1]
                    local newest = loot[#loot]
                    LOG:Info("Loot n %d o %d", newest:Timestamp(), oldest:Timestamp())
                    if newest:Timestamp() >= self.dataInfo.cutoffTimestamp then
                        workEstimate = workEstimate + #loot
                        LOG:Info("Newer than Newest: %d", #loot)
                    elseif oldest:Timestamp() < self.dataInfo.cutoffTimestamp then
                        -- 0 work needed
                        LOG:Info("Older than Oldest")
                    else
                        workEstimate = workEstimate + math.floor(#loot * ((newest:Timestamp() - oldest:Timestamp())/(self.dataInfo.cutoffTimestamp - oldest:Timestamp())))
                    end
                end
            end
        end
        LOG:Message("Loot History: %d", workEstimate)
        return workEstimate
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = (function(self)
        local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local workEstimate = 0

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local history = roster:GetProfilePointHistoryByGUID(GUID)
                    if #history > 0 then
                        local oldest = history[#history]
                        local newest = history[1]
                        LOG:Info("History n %d o %d", newest:Timestamp(), oldest:Timestamp())
                        if newest:Timestamp() >= self.dataInfo.cutoffTimestamp then
                            LOG:Info("Newer than Newest: %d", #history)
                            workEstimate = workEstimate + #history
                        elseif oldest:Timestamp() < self.dataInfo.cutoffTimestamp then
                            -- 0 work needed
                            LOG:Info("Older than Oldest")
                        else
                            workEstimate = workEstimate + math.floor(#history * ((newest:Timestamp() - oldest:Timestamp())/(self.dataInfo.cutoffTimestamp - oldest:Timestamp())))
                        end
                    end
                end
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local history = roster:GetRaidPointHistory()
                if #history > 0 then
                    local oldest = history[#history]
                    local newest = history[1]
                    LOG:Info("History n %d o %d", newest:Timestamp(), oldest:Timestamp())
                    if newest:Timestamp() >= self.dataInfo.cutoffTimestamp then
                        workEstimate = workEstimate + #history
                        LOG:Info("Newer than Newest: %d", #history)
                    elseif oldest:Timestamp() < self.dataInfo.cutoffTimestamp then
                        -- 0 work needed
                        LOG:Info("Older than Oldest")
                    else
                        workEstimate = workEstimate + math.floor(#history * ((newest:Timestamp() - oldest:Timestamp())/(self.dataInfo.cutoffTimestamp - oldest:Timestamp())))
                    end
                end
            end
        end
        LOG:Message("Point History: %d", workEstimate)
        return workEstimate
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.RAIDS] = (function(self)
        -- local filterPlayers = dictNotEmpty(self.dataInfo.profiles)
        local workEstimate = 0
        -- local now = GetServerTime()

        -- if filterPlayers then
        --     for _, roster in ipairs(self.dataInfo.rosters) do
        --         for GUID,_ in pairs(self.dataInfo.profiles) do
        --             if roster:IsProfileInRoster(GUID) then

        --             end
        --         end
        --     end
        -- else
        --     for _, roster in ipairs(self.dataInfo.rosters) do
        --     end
        -- end
        LOG:Message("Raids: %d", workEstimate)
        return workEstimate
    end),
}

-- ------------ --
-- Exporter Run --
-- ------------ --

function Exporter:Run(completeCallback, updateCallback)
    -- Prepare Data Info
    for _, UID in ipairs(self.config.rosters) do
        local roster = MODULES.RosterManager:GetRosterByUid(UID)
        if roster then
            table.insert(self.dataInfo.rosters, roster)
        end
    end
    for _, GUID in ipairs(self.config.profiles) do
        local profile = MODULES.ProfileManager:GetProfileByGUID(GUID)
        if profile then
            self.dataInfo.profiles[GUID] = profile
        end
    end
    self.dataInfo.cutoffTimestamp = GetCutoffTimestamp(self.config.timeframe)
    LOG:Info("Cutoff Timestamp %d", self.dataInfo.cutoffTimestamp)
    -- Prepare Encoder
    local encoder = ENCODERS[self.config.format]
    if not encoder then
        LOG:Fatal("Unknown encoder %s", tostring(self.config.format))
        return
    end
    -- Estimate work
    local totalWorkEstimate = 0
    for export_job, status in pairs(self.config.jobs) do
        local ESTIMATOR = ESTIMATORS[export_job]
        if status and ESTIMATOR then
            totalWorkEstimate = totalWorkEstimate + ESTIMATOR(self)
        end
    end
    LOG:Message("Total Work Estimate: %d", totalWorkEstimate)
    -- Data Build
    local builtData = {}
    for export_job, status in pairs(self.config.jobs) do
        local DATA_BUILDER = DATA_BUILDERS[export_job]
        if status and DATA_BUILDER then
            builtData[EXPORT_GROUP_NAME[export_job] or ""] = DATA_BUILDER(self)
        end
    end

    local output = encoder(builtData)
    completeCallback(output)
end


MODELS.Exporter = Exporter