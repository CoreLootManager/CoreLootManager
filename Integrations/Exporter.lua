local define = LibDependencyInjection.createContext(...)

define.module("UnifiedGUI_Standings", {
    "Log", "Utils", "ProfileRegistry", "Meta:ADDON_TABLE", "L", "Integrations", "RosterManager", "Constants/ExportDataTypes", "Constants/FormatValues"
}, function(resolve, LOG, UTILS, ProfileRegistry, CLM, L, _, RosterManager, ExportDataTypes, FormatValues)

local json = LibStub:GetLibrary("LibJsonLua")
local XML = LibStub:GetLibrary("LibLuaXML")

local pairs, ipairs = pairs, ipairs
local tonumber, date = tonumber, date
local tinsert = table.insert
local setmetatable = setmetatable

local getGuidFromInteger = UTILS.getGuidFromInteger

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
    [ExportDataTypes.STANDINGS] = "standings",
    [ExportDataTypes.POINT_HISTORY] = "pointHistory",
    [ExportDataTypes.LOOT_HISTORY] = "lootHistory",
    [ExportDataTypes.RAIDS] = "raids",
    -- [ExportDataTypes.CONFIGS] = "configs"
}

-- -------- --
-- Encoders --
-- -------- --

local ENCODERS =  {
    [FormatValues.XML]  = (function(output) return XML.encode(output) end),
    [FormatValues.CSV]  = (function() return "CSV not supported" end),
    [FormatValues.JSON] = (function(output) return json.encode(output) end),
}

-- ------------- --
-- Data Builders --
-- ------------- --

local DATA_BUILDERS = {
    [ExportDataTypes.STANDINGS] = (function(self)
        local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }
        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = RosterManager:GetRosterNameByUid(roster:UID()),
                    standings = {
                        player = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    if roster:IsProfileInRoster(GUID) then
                        local profile = ProfileRegistry.Get(GUID)
                        if profile then
                            tinsert(roster_data.standings.player, {
                                guid = GUID,
                                name = profile:Name(),
                                class = profile:Class(),
                                spec = profile:SpecString(),
                                dkp = roster:Standings(GUID)
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
                    name = RosterManager:GetRosterNameByUid(roster:UID()),
                    standings = {
                        player = {}
                    }
                }
                local standings = roster:Standings()
                for GUID,value in pairs(standings) do
                    local profile = ProfileRegistry.Get(GUID)
                    if profile then
                        tinsert(roster_data.standings.player, {
                            guid = GUID,
                            name = profile:Name(),
                            class = profile:Class(),
                            spec = profile:SpecString(),
                            dkp = value
                        })
                    end
                end
                tinsert(data.roster, roster_data)
            end
        end
        return data
    end),
    [ExportDataTypes.LOOT_HISTORY] = (function(self)
        local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = RosterManager:GetRosterNameByUid(roster:UID()),
                    lootHistory = {
                        item = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local lootList = roster:GetProfileLootByGUID(GUID)
                    for _, loot in ipairs(lootList) do
                        local profile = ProfileRegistry.Get(loot:OwnerGUID())
                        if profile and self:TimestampInRange(loot:Timestamp()) then
                            local awardedBy = ProfileRegistry.Get(getGuidFromInteger(loot:Creator()))
                            local itemName, _, itemQuality = GetItemInfo(loot:Id())
                            tinsert(roster_data.lootHistory.item, {
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
                tinsert(data.roster, roster_data)
            end
        else
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = RosterManager:GetRosterNameByUid(roster:UID()),
                    lootHistory = {
                        item = {}
                    }
                }
                local lootList = roster:GetRaidLoot()
                for _, loot in ipairs(lootList) do
                    local profile = ProfileRegistry.Get(loot:OwnerGUID())
                    if profile and self:TimestampInRange(loot:Timestamp()) then
                        local awardedBy = ProfileRegistry.Get(getGuidFromInteger(loot:Creator()))
                        local itemName, _, itemQuality = GetItemInfo(loot:Id())
                        tinsert(roster_data.lootHistory.item, {
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
                tinsert(data.roster, roster_data)
            end
        end
        return data
    end),
    [ExportDataTypes.POINT_HISTORY] = (function(self)
        local filterPlayers = UTILS.DictNotEmpty(self.dataInfo.profiles)
        local data = { roster = {} }

        if filterPlayers then
            for _, roster in ipairs(self.dataInfo.rosters) do
                local roster_data = {
                    uid = roster:UID(),
                    name = RosterManager:GetRosterNameByUid(roster:UID()),
                    pointHistory = {
                        point = {}
                    }
                }
                for GUID,_ in pairs(self.dataInfo.profiles) do
                    local historyList = roster:GetProfilePointHistoryByGUID(GUID)
                    for _, history in ipairs(historyList) do
                        local profile = ProfileRegistry.Get(GUID)
                        if profile and self:TimestampInRange(history:Timestamp()) then
                            local note = decodeNote(history:Note())
                            local awardedBy = ProfileRegistry.Get(getGuidFromInteger(history:Creator()))
                            tinsert(roster_data.pointHistory.point, {
                                dkp = history:Value(),
                                player = profile:Name(),
                                reason = PointChangeReasons.ALL[history:Reason()] or "",
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
                    name = RosterManager:GetRosterNameByUid(roster:UID()),
                    pointHistory = {
                        point = {}
                    }
                }
                local historyList = roster:GetRaidPointHistory()
                for _, history in ipairs(historyList) do
                    if self:TimestampInRange(history:Timestamp()) then
                        for _,profile in ipairs(history:Profiles()) do
                            local note = decodeNote(history:Note())
                            local awardedBy = ProfileRegistry.Get(getGuidFromInteger(history:Creator()))
                            tinsert(roster_data.pointHistory.point, {
                                dkp = history:Value(),
                                player = profile:Name(),
                                reason = PointChangeReasons.ALL[history:Reason()] or "",
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
    [ExportDataTypes.RAIDS] = (function(self)
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
        local roster = GetRosterByUid(UID)
        if roster then
            tinsert(self.dataInfo.rosters, roster)
        end
    end
    for _, GUID in ipairs(self.config.profiles) do
        local profile = ProfileRegistry.Get(GUID)
        if profile then
            self.dataInfo.profiles[GUID] = profile
        end
    end
    -- self.dataInfo.cutoffTimestamp = GetCutoffTimestamp(self.config.timeframe)
    -- LOG:Info("Cutoff Timestamp %d", self.dataInfo.cutoffTimestamp)
    LOG:Message("Exporting data between: %s and %s",
        date(L["%Y/%m/%d %a %H:%M:%S"], self.config.timerange.begin),
        date(L["%Y/%m/%d %a %H:%M:%S"], self.config.timerange.finish)
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
resolve(Exporter)
end)