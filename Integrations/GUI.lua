-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs = pairs
local tonumber, date = tonumber, date
local tinsert, tsort = table.insert, table.sort
local GetServerTime = GetServerTime

-- Libs
local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")


local ALL = 0

local EXPORT_DATA_TYPE_GUI = {
    -- [CONSTANTS.EXPORT_DATA_TYPE.CONFIGS] = CLM.L["Configuration"],
    [CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = CLM.L["Standings"],
    [CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = CLM.L["Point History"],
    [CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = CLM.L["Loot History"],
    -- [CONSTANTS.EXPORT_DATA_TYPE.RAIDS] = CLM.L["Raids"],

}

local FORMAT_VALUES_GUI =  {
    [CONSTANTS.FORMAT_VALUE.XML] = "XML",
    -- [CONSTANTS.FORMAT_VALUE.CSV] = "CSV",
    [CONSTANTS.FORMAT_VALUE.TMB] = "TMB",
    [CONSTANTS.FORMAT_VALUE.JSON] = "JSON"
}

-- local function GetProgressText(percent)
--     percent = percent or 0
--     if percent > 100 then percent = 100 end
--     local s = string.format("Progress: %d%% | ", percent)
--     local fill = math.floor(percent / 2)
--     local missing = 50 - fill
--     local i = 0
--     while (i < fill) do
--         s = s .. "#"
--         i = i + 1
--     end
--     i = 0
--     while (i < missing) do
--         s = s .. "_"
--         i = i + 1
--     end
--     return s
-- end

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('export', {
        location = {nil, nil, "CENTER", 0, 0 },
        export_config = {
            data = {},
            format = CONSTANTS.FORMAT_VALUE.XML,
            timerange = {
                begin = {
                    day = 1,
                    month = 1,
                    year = 2019
                },
                finish = {
                    day = 31,
                    month = 12,
                    year = 2022
                },
            },
        },
    })
end


local redoProfileList = false
local profileList = {}
local function GetProfileList()
    if redoProfileList then
        profileList = {}
        for _, profile in pairs(CLM.MODULES.ProfileManager:GetProfiles()) do
            tinsert(profileList, UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex or "6699ff"))
        end
        redoProfileList = false
    end
    tsort(profileList, function(a, b)
        return UTILS.RemoveColorCode(a) < UTILS.RemoveColorCode(b)
    end)
    profileList[ALL] = UTILS.ColorCodeText("Everyone", "6699ff")
    return profileList
end

local ExportGUI = {}
function ExportGUI:Initialize()
    LOG:Trace("ExportGUI:Initialize()")
    InitializeDB(self)
    self.roster_select_list = { [ALL] = true }
    self.profile_select_list = { [ALL] = true }
    self.export_data = ""
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        redoProfileList = true
    end)
end



local days_in_month = {
    [1]=31, [2]=28, [3]=31, [4]=30, [5]=31, [6]=30, [7]=31, [8]=31, [9]=30, [10]=31, [11]=30, [12]=31,
}

local leap_years = UTILS.Set({2022, 2024})

local function getDaysInMonth(month, year)
    if month == 2 then
        return leap_years[year] and 29 or 28
    else
        return days_in_month[month] or 0
    end
end

local timerange_select = {
    day = {},
    month = {},
    year = {}
}

for i=1,31 do
    tinsert(timerange_select.day, i)
end

local MONTHS = {
    [1]  = CLM.L["January"],
    [2]  = CLM.L["February"],
    [3]  = CLM.L["March"],
    [4]  = CLM.L["April"],
    [5]  = CLM.L["May"],
    [6]  = CLM.L["June"],
    [7]  = CLM.L["July"],
    [8]  = CLM.L["August"],
    [9]  = CLM.L["September"],
    [10] = CLM.L["October"],
    [11] = CLM.L["November"],
    [12] = CLM.L["December"],
}

for i=1,12 do
    timerange_select.month[i] = MONTHS[i]
end

for i=2019, tonumber(date("%Y", GetServerTime())) do
    timerange_select.year[i] = i
end

local function SanitizeDates(self)
    -- Check days in the month
    local begin_days = getDaysInMonth(self.db.export_config.timerange.begin.month, self.db.export_config.timerange.begin.year)
    if self.db.export_config.timerange.begin.day > begin_days then
        self.db.export_config.timerange.begin.day = begin_days
    end
    local finish_days = getDaysInMonth(self.db.export_config.timerange.finish.month, self.db.export_config.timerange.finish.year)
    if self.db.export_config.timerange.finish.day > finish_days then
        self.db.export_config.timerange.finish.day = finish_days
    end
    -- Check if start is later than end or end before start
    if self.db.export_config.timerange.begin.year > self.db.export_config.timerange.finish.year then
        -- Begin after Finished
        -- Set Finish to Begin
        self.db.export_config.timerange.finish.day   = self.db.export_config.timerange.begin.day
        self.db.export_config.timerange.finish.month = self.db.export_config.timerange.begin.month
        self.db.export_config.timerange.finish.year  = self.db.export_config.timerange.begin.year
    elseif self.db.export_config.timerange.begin.year == self.db.export_config.timerange.finish.year then
        -- Same year. Check months
        if self.db.export_config.timerange.begin.month > self.db.export_config.timerange.finish.month then
            -- Begin after Finished
            -- Set Finish to Begin
            self.db.export_config.timerange.finish.day   = self.db.export_config.timerange.begin.day
            self.db.export_config.timerange.finish.month = self.db.export_config.timerange.begin.month
        elseif self.db.export_config.timerange.begin.month == self.db.export_config.timerange.finish.month then
            -- Same year and month, check days
            if self.db.export_config.timerange.begin.day > self.db.export_config.timerange.finish.day then
                -- Begin after Finished
                -- Set Finish to Begin
                self.db.export_config.timerange.finish.day   = self.db.export_config.timerange.begin.day
            end
        end
    end
end

local function SetOffsetTime(self, offset)
    local time = GetServerTime()
    local d, m, y

    d, m, y = date("%d", time), date("%m", time), date("%Y", time)
    self.db.export_config.timerange.finish.day     = tonumber(d)
    self.db.export_config.timerange.finish.month   = tonumber(m)
    self.db.export_config.timerange.finish.year    = tonumber(y)

    d, m, y = date("%d", time - offset), date("%m", time - offset), date("%Y", time - offset)
    self.db.export_config.timerange.begin.day     = tonumber(d)
    self.db.export_config.timerange.begin.month   = tonumber(m)
    self.db.export_config.timerange.begin.year    = tonumber(y)
end

local function Create(self)
    local parent = AceGUI:Create("Window")
    parent:SetLayout("Flow")
    parent:EnableResize(false)
    local options = {
        type = "group",
        childGroups = "tab",
        args = {}
    }

    options.args.export_config_group = {
        type = "group",
        name = "Configure",
        args = {
            export_data_type = {
                name = CLM.L["Data"],
                type = "multiselect",
                set = function(i, k, v)
                    self.db.export_config.data[k] = v
                end,
                get = function(i, k) return self.db.export_config.data[k] end,
                disabled = (function() return (self.db.export_config.format == CONSTANTS.FORMAT_VALUE.TMB) end),
                values = EXPORT_DATA_TYPE_GUI,
                order = 1
            },
            format = {
                name = CLM.L["Format"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.format = v
                    if self.db.export_config.format == CONSTANTS.FORMAT_VALUE.TMB then
                        self.db.export_config.data[CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = false
                        self.db.export_config.data[CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = false
                        self.db.export_config.data[CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = true
                    end
                end,
                get = function(i) return self.db.export_config.format end,
                style = "radio",
                values = FORMAT_VALUES_GUI,
                order = 2
            },
            timerange_begin_day = {
                name = CLM.L["Begin Day"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.timerange.begin.day = v
                    SanitizeDates(self)
                end,
                get = function(i) return self.db.export_config.timerange.begin.day end,
                values = timerange_select.day,
                order = 5,
            },
            timerange_begin_month = {
                name = CLM.L["Begin Month"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.timerange.begin.month = v
                    SanitizeDates(self)
                end,
                get = function(i) return self.db.export_config.timerange.begin.month end,
                values = timerange_select.month,
                order = 6,
            },
            timerange_begin_year = {
                name = CLM.L["Begin Year"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.timerange.begin.year = v
                    SanitizeDates(self)
                end,
                get = function(i) return self.db.export_config.timerange.begin.year end,
                values = timerange_select.year,
                order = 7,
            },
            timerange_finish_day = {
                name = CLM.L["Finish Day"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.timerange.finish.day = v
                    SanitizeDates(self)
                end,
                get = function(i) return self.db.export_config.timerange.finish.day end,
                values = timerange_select.day,
                order = 8,
            },
            timerange_finish_month = {
                name = CLM.L["Finish Month"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.timerange.finish.month = v
                    SanitizeDates(self)
                end,
                get = function(i) return self.db.export_config.timerange.finish.month end,
                values = timerange_select.month,
                order = 9,
            },
            timerange_finish_year = {
                name = CLM.L["Finish Year"],
                type = "select",
                set = function(i, v)
                    self.db.export_config.timerange.finish.year = v
                    SanitizeDates(self)
                end,
                get = function(i) return self.db.export_config.timerange.finish.year end,
                values = timerange_select.year,
                order = 10,
            },
            timerange_set_last_week = {
                name =  CLM.L["Last week"],
                desc = string.format(CLM.L["Begin %d days ago, finish today."], 7),
                type = "execute",
                func = (function() SetOffsetTime(self, 604800) end),
                order = 11,
            },
            timerange_set_last_month = {
                name = CLM.L["Last month"],
                desc = string.format(CLM.L["Begin %d days ago, finish today."], 31),
                type = "execute",
                func = (function() SetOffsetTime(self, 2678400) end),
                order = 12,
            },
            timerange_set_last_year = {
                name =  CLM.L["Last year"],
                desc = string.format(CLM.L["Begin %d days ago, finish today."], 365),
                type = "execute",
                func = (function() SetOffsetTime(self, 31536000) end),
                order = 13,
            }
        },
        order = 1
    }

    options.args.roster_select_group = {
        type = "group",
        name = "Rosters",
        args = {
            export_rosters = {
                name = CLM.L["Select Rosters to export"],
                type = "multiselect",
                set = function(i, k, v)
                    k = tonumber(k) or 0
                    if k ~= 0 then
                        self.roster_select_list[ALL] = false
                    else
                        self.roster_select_list = {}
                    end
                    self.roster_select_list[k] = v
                end,
                get = function(i, k) return self.roster_select_list[k] end,
                values = function()
                    local roster_list = {
                        [ALL] = UTILS.ColorCodeText("All", "6699ff")
                    }
                    for name, roster in pairs(CLM.MODULES.RosterManager:GetRosters()) do
                        roster_list[roster:UID()] = name
                    end
                    return roster_list
                end,
                order = 3
            }
        },
        order = 2
    }
    options.args.profiles_select_group = {
        type = "group",
        name = "Profiles",
        args = {
            export_rosters = {
                name = CLM.L["Select Profiles to export"],
                type = "multiselect",
                set = function(i, k, v)
                    k = tonumber(k) or 0
                    if k ~= 0 then
                        self.profile_select_list[ALL] = false
                    else
                        self.profile_select_list = {}
                    end
                    self.profile_select_list[k] = v
                 end,
                get = function(i, k) return self.profile_select_list[k] end,
                values = function() return GetProfileList() end,
                order = 3
            }
        },
        order = 3
    }
    options.args.execute_group = {
        type = "group",
        name = "Export",
        args = {
            output = {
                name = CLM.L["Export"],
                type = "input",
                multiline = 10,
                set = function(i, v) end,
                get = function(i) return self.export_data end,
                width = "full",
                order = 1
            },
            execute_export = {
                name = CLM.L["Export"],
                type = "execute",
                func = (function()
                    local rosters = {}
                    if self.roster_select_list[ALL] then
                        for _, roster in pairs(CLM.MODULES.RosterManager:GetRosters()) do
                            tinsert(rosters, roster:UID())
                        end
                    else
                        for UID, status in pairs(self.roster_select_list) do
                            if status then
                                tinsert(rosters, UID)
                            end
                        end
                    end
                    local profiles = {}
                    if self.profile_select_list[ALL] then
                        for GUID, _ in pairs(CLM.MODULES.ProfileManager:GetProfiles()) do
                            tinsert(rosters, GUID)
                        end
                    else
                        for selectedId, status in pairs(self.profile_select_list) do
                            if status then
                                local profile = CLM.MODULES.ProfileManager:GetProfileByName(UTILS.RemoveColorCode(profileList[selectedId]))
                                tinsert(profiles, profile:GUID())
                            end
                        end
                    end

                    local begin = time({
                        year = self.db.export_config.timerange.begin.year,
                        month = self.db.export_config.timerange.begin.month,
                        day = self.db.export_config.timerange.begin.day,
                        hour = 0, min = 0, sec = 0})

                    local finish = time({
                        year = self.db.export_config.timerange.finish.year,
                        month = self.db.export_config.timerange.finish.month,
                        day = self.db.export_config.timerange.finish.day,
                        hour = 23, min = 59, sec = 59})

                    local config = CLM.MODELS.ExportConfiguration:New(
                        self.db.export_config.format,       -- Format
                        self.db.export_config.data,         -- Config
                        { begin = begin, finish = finish }, -- Timerange
                        rosters,                            -- Rosters
                        profiles                            -- Profiles
                    )

                    CLM.Integration:Export(
                        config, -- Config
                        (function(data) -- Complete callback
                            self.export_data = data
                            -- Update view
                            LOG:Message("Export complete: %s [B].", #self.export_data)
                        end),
                        (function(progress) -- Update callback
                            -- if lastProgress ~= progress then
                            --     self:SetStatusText(GetProgressText(progress))
                            --     lastProgress = progress
                            -- end
                        end)
                    )
                end),
                order = 2
            },
            clear_output = {
                name = CLM.L["Clear output"],
                type = "execute",
                func = (function() self.export_data = "" end),
                order = 3
            }
        },
        order = 4
    }


    AceConfigRegistry:RegisterOptionsTable(CLM.L["Export"], options)
    AceConfigDialog:Open(CLM.L["Export"], parent)

    return parent
end

function ExportGUI:Create()
    LOG:Trace("ExportGUI:Create()")
    local f = Create(self)
    self.top = f

    f:Hide()
end

function ExportGUI:Toggle()
    LOG:Trace("ExportGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self.top:Show()
    end
end

function ExportGUI:RegisterSlash()
    local options = {
        export = {
            type = "execute",
            name = "Export",
            desc = CLM.L["Toggle export window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function ExportGUI:Reset()
    LOG:Trace("ExportGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.Export = ExportGUI