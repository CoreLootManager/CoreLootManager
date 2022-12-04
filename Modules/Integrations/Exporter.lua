-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local json = LibStub:GetLibrary("LibJsonLua")
local XML = LibStub:GetLibrary("LibLuaXML")

local pairs, ipairs = pairs, ipairs
local tonumber, date = tonumber, date
local tinsert = table.insert
local setmetatable = setmetatable

local getGuidFromInteger = UTILS.getGuidFromInteger

local function buildTMBLine(item)
    -- yeah thats not a checksum but should be unique enough
    local checksum = tostring(item.timestamp) .. tostring(item.id)

    return  date("%Y-%m-%d", item.timestamp) .. "," ..
            item.player .. "," ..
            tostring(item.id) ..  "," ..
            checksum .. "\n"
end

local function CLM_TMB_encode(data)
    local output = "date,name,itemID,id\n"
    for _, roster in ipairs(data.lootHistory.roster) do
        for _, item in ipairs(roster.lootHistory.item) do
            output = output .. buildTMBLine(item)
        end
    end
    return output
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
        begin = 0,
        finish = 0
    }

    return o
end

function Exporter:TimestampInRange(timestamp)
    timestamp = timestamp or 0
    return ((timestamp >= self.dataInfo.begin) and (timestamp <= self.dataInfo.finish))
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
    [CLM.CONSTANTS.FORMAT_VALUE.XML]  = (function(output) return XML.encode(output) end),
    [CLM.CONSTANTS.FORMAT_VALUE.CSV]  = (function() return "CSV not supported" end),
    [CLM.CONSTANTS.FORMAT_VALUE.TMB]  = (function(output) return CLM_TMB_encode(output) end),
    [CLM.CONSTANTS.FORMAT_VALUE.JSON] = (function(output) return json.encode(output) end),
}

-- ------------- --
-- Data Builders --
-- ------------- --

local DATA_BUILDERS = {
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = (function(self)
        local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }
        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = CLM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    standings = {
                        player = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    if roster:IsProfileInRoster(GUID) then
                        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
                        if profile then
                            tinsert(roster_data.standings.player, {
                                guid = GUID,
                                name = profile:Name(),
                                class = profile:Class(),
                                spec = profile:SpecString(),
                                role = profile:Role(),
                                points = roster:Standings(GUID),
                                spent = roster:GetPointInfoForPlayer(GUID).spent
                            })
                        end
                    end
                end
                tinsert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = CLM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    standings = {
                        player = {}
                    }
                }
                local standings = roster:Standings()
                for GUID,value in pairs(standings) do
                    local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
                    if profile then
                        tinsert(roster_data.standings.player, {
                            guid = GUID,
                            name = profile:Name(),
                            class = profile:Class(),
                            spec = profile:SpecString(),
                            role = profile:Role(),
                            points = value,
                            spent = roster:GetPointInfoForPlayer(GUID).spent
                        })
                    end
                end
                tinsert(data.roster, roster_data)
            end
        end
        return data
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = (function(self)
        local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = CLM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    lootHistory = {
                        item = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local lootList = roster:GetProfileLootByGUID(GUID)
                    for _, loot in ipairs(lootList) do
                        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(loot:OwnerGUID())
                        if profile and self:TimestampInRange(loot:Timestamp()) then
                            local awardedBy = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(loot:Creator()))
                            local itemName, _, itemQuality = GetItemInfo(loot:Id())
                            tinsert(roster_data.lootHistory.item, {
                                id = loot:Id(),
                                name = itemName or "",
                                quality = itemQuality or 0,
                                player = profile:Name(),
                                awardedBy = awardedBy and awardedBy:Name() or "",
                                points = loot:Value(),
                                timestamp = loot:Timestamp()
                            })
                        end
                    end
                end
                tinsert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = CLM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    lootHistory = {
                        item = {}
                    }
                }
                local lootList = roster:GetRaidLoot()
                for _, loot in ipairs(lootList) do
                    local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(loot:OwnerGUID())
                    if profile and self:TimestampInRange(loot:Timestamp()) then
                        local awardedBy = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(loot:Creator()))
                        local itemName, _, itemQuality = GetItemInfo(loot:Id())
                        tinsert(roster_data.lootHistory.item, {
                            id = loot:Id(),
                            name = itemName or "",
                            quality = itemQuality or 0,
                            player = profile:Name(),
                            awardedBy = awardedBy and awardedBy:Name() or "",
                            points = loot:Value(),
                            timestamp = loot:Timestamp()
                        })
                    end
                end
                tinsert(data.roster, roster_data)
            end
        end
        return data
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = (function(self)
        local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = CLM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    pointHistory = {
                        point = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local historyList = roster:GetProfilePointHistoryByGUID(GUID)
                    for _, history in ipairs(historyList) do
                        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
                        if profile and self:TimestampInRange(history:Timestamp()) then
                            local note = decodeNote(history:Note())
                            local awardedBy = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(history:Creator()))
                            tinsert(roster_data.pointHistory.point, {
                                points = history:Value(),
                                player = profile:Name(),
                                reason = CLM.CONSTANTS.POINT_CHANGE_REASONS.ALL[history:Reason()] or "",
                                note = note,
                                awardedBy = awardedBy and awardedBy:Name() or "",
                                timestamp = history:Timestamp()
                            })
                        end
                    end
                end
                tinsert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = CLM.MODULES.RosterManager:GetRosterNameByUid(roster:UID()),
                    pointHistory = {
                        point = {}
                    }
                }
                local historyList = roster:GetRaidPointHistory()
                for _, history in ipairs(historyList) do
                    if self:TimestampInRange(history:Timestamp()) then
                        for _,profile in ipairs(history:Profiles()) do
                            local note = decodeNote(history:Note())
                            local awardedBy = CLM.MODULES.ProfileManager:GetProfileByGUID(getGuidFromInteger(history:Creator()))
                            tinsert(roster_data.pointHistory.point, {
                                points = history:Value(),
                                player = profile:Name(),
                                reason = CLM.CONSTANTS.POINT_CHANGE_REASONS.ALL[history:Reason()] or "",
                                note = note,
                                awardedBy = awardedBy and awardedBy:Name() or "",
                                timestamp = history:Timestamp()
                            })
                        end
                    end
                end
                tinsert(data.roster, roster_data)
            end
        end
        return data
    end),
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.RAIDS] = (function(self)
        -- local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        -- local workEstimate = 0
        -- local now = GetServerTime()

        return {}
    end),
}

-- ------------ --
-- Exporter Run --
-- ------------ --

function Exporter:Run(completeCallback, updateCallback)
    -- Prepare Data Info
    for _, UID in ipairs(self.config.rosters) do
        local roster = CLM.MODULES.RosterManager:GetRosterByUid(UID)
        if roster then
            tinsert(self.dataInfo.rosters, roster)
        end
    end
    for _, GUID in ipairs(self.config.profiles) do
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
        if profile then
            self.dataInfo.profiles[GUID] = profile
        end
    end
    -- self.dataInfo.cutoffTimestamp = GetCutoffTimestamp(self.config.timeframe)
    -- LOG:Info("Cutoff Timestamp %d", self.dataInfo.cutoffTimestamp)
    LOG:Message("Exporting data between: %s and %s",
        date(CLM.L["%Y/%m/%d %a %H:%M:%S"], self.config.timerange.begin),
        date(CLM.L["%Y/%m/%d %a %H:%M:%S"], self.config.timerange.finish)
    )
    self.dataInfo.begin = self.config.timerange.begin
    self.dataInfo.finish = self.config.timerange.finish
    -- Prepare Encoder
    local encoder = ENCODERS[self.config.format]
    if not encoder then
        LOG:Fatal("Unknown encoder %s", tostring(self.config.format))
        return
    end
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


CLM.MODELS.Exporter = Exporter