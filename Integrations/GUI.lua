local  _, CLM = ...


local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

-- Libs
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local ALL = 0

local EXPORT_DATA_TYPE_GUI = {
    -- [CLM.CONSTANTS.EXPORT_DATA_TYPE.CONFIGS] = CLM.L["Configuration"],
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.STANDINGS] = CLM.L["Standings"],
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.POINT_HISTORY] = CLM.L["Point History"],
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.LOOT_HISTORY] = CLM.L["Loot History"],
    [CLM.CONSTANTS.EXPORT_DATA_TYPE.RAIDS] = CLM.L["Raids"],

}

local FORMAT_VALUES_GUI =  {
    [CLM.CONSTANTS.FORMAT_VALUE.XML] = "XML",
    [CLM.CONSTANTS.FORMAT_VALUE.CSV] = "CSV",
    [CLM.CONSTANTS.FORMAT_VALUE.JSON] = "JSON"
}

local TIMEFRAME_SCALE_VALUES_GUI =  {
    [CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.HOURS] = CLM.L["hours"],
    [CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.DAYS] = CLM.L["days"],
    [CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.WEEKS] = CLM.L["weeks"],
    [CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.MONTHS] = CLM.L["months"],
    [CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.YEARS] = CLM.L["years"],
}


local function GetProgressText(percent)
    percent = percent or 0
    if percent > 100 then percent = 100 end
    local s = string.format("Progress: %d%% | ", percent)
    local fill = math.floor(percent / 2)
    local missing = 50 - fill
    local i = 0
    while (i < fill) do
        s = s .. "#"
        i = i + 1
    end
    i = 0
    while (i < missing) do
        s = s .. "_"
        i = i + 1
    end
    return s
end

local function InitializeDB(self)
    self.db = MODULES.Database:GUI('export', {
        location = {nil, nil, "CENTER", 0, 0 },
        export_config = {
            data = {},
            format = CLM.CONSTANTS.FORMAT_VALUE.XML,
            timeframe = 1,
            timeframe_scale = CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.WEEKS
        }
    })
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
    -- MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
    --     if lag ~= 0 or uncommitted ~= 0 then return end
    --     self:Refresh(true)
    -- end)
end

local function Create(self)
    local parent = AceGUI:Create("Frame")
    parent:SetLayout("Flow")
    parent:EnableResize(false)
    -- local body = AceGUI:Create("SimpleGroup")
    -- parent:AddChild(body)
    -- body:SetWidth(450)
    -- body:SetWidth(700)
    -- body:SetLayout("Flow")
    local options = {
        type = "group",
        childGroups = "tab",
        args = {}
    }
    options.args.export_config_group = {
        type = "group",
        name = "Configure",
        -- inline = true,
        args = {
            export_data_type = {
                name = CLM.L["Data"],
                type = "multiselect",
                set = function(i, k, v)
                    self.db.export_config.data[k] = v
                end,
                get = function(i, k) return self.db.export_config.data[k] end,
                values = EXPORT_DATA_TYPE_GUI,
                order = 1
            },
            format = {
                name = CLM.L["Format"],
                type = "select",
                set = function(i, v) self.db.export_config.format = v end,
                get = function(i) return self.db.export_config.format end,
                style = "radio",
                values = FORMAT_VALUES_GUI,
                order = 2
            },
            timeframe_input = {
                name = CLM.L["Timeframe"],
                desc = CLM.L["Sets the limit to what time data can be exported"],
                type = "input",
                set = function(i, v) self.db.export_config.timeframe = tonumber(v) end,
                get = function(i) return tostring(self.db.export_config.timeframe) end,
                pattern = "^%d+$",
                order = 3,
            },
            timeframe_scale = {
                name = CLM.L["Timeframe scale"],
                type = "select",
                set = function(i, v) self.db.export_config.timeframe_scale = tonumber(v) end,
                get = function(i) return self.db.export_config.timeframe_scale end,
                values = TIMEFRAME_SCALE_VALUES_GUI,
                order = 4,
            },
        },
        order = 1
    }

    options.args.roster_select_group = {
        type = "group",
        name = "Rosters",
        -- inline = true,
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
                    for name, roster in pairs(MODULES.RosterManager:GetRosters()) do
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
        -- inline = true,
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
                values = function()
                    local profile_list = {
                        [ALL] = UTILS.ColorCodeText("Everyone", "6699ff")
                    }
                    for guid, profile in pairs(MODULES.ProfileManager:GetProfiles()) do
                        profile_list[UTILS.getIntegerGuid(guid)] = UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex or "6699ff")
                    end
                    return profile_list
                end,
                order = 3
            }
        },
        order = 3
    }
    options.args.execute_group = {
        type = "group",
        name = "Export",
        -- inline = true,
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
                    local lastProgress = -1

                    local rosters = {}
                    if self.roster_select_list[ALL] then
                        for _, roster in pairs(MODULES.RosterManager:GetRosters()) do
                            table.insert(rosters, roster:UID())
                        end
                    else
                        for UID, status in pairs(self.roster_select_list) do
                            if status then
                                table.insert(rosters, UID)
                            end
                        end
                    end
                    local profiles = {}
                    if self.profile_select_list[ALL] then
                        for GUID, _ in pairs(MODULES.ProfileManager:GetProfiles()) do
                            table.insert(rosters, GUID)
                        end
                    else
                        for iGUID, status in pairs(self.profile_select_list) do
                            if status then
                                table.insert(profiles, UTILS.getGuidFromInteger(iGUID))
                            end
                        end
                    end

                    local config = CLM.MODELS.ExportConfiguration:New(
                        self.db.export_config.format,   -- Format
                        self.db.export_config.data,     -- Config
                        {                               -- Timeframe
                            ["value"] = self.db.export_config.timeframe,
                            ["scale"] = self.db.export_config.timeframe_scale,
                        },
                        rosters,                        -- Rosters
                        profiles                        -- Profiles
                    )

                    CLM.Integration:Export(
                        config, -- Config
                        (function(data) -- Complete callback
                            self.export_data = data
                            -- Update view
                            LOG:Message("Export complete: %s [B].", #self.export_data)
                        end),
                        (function(progress) -- Update callback
                            if lastProgress ~= progress then
                                self:SetStatusText(GetProgressText(progress))
                                lastProgress = progress
                            end
                        end)
                    )
                end),
                order = 2
            }
        },
        order = 4
    }


    LIBS.registry:RegisterOptionsTable("clm_export_gui_options", options)
    LIBS.gui:Open("clm_export_gui_options", parent)

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
    MODULES.ConfigManager:RegisterSlash(options)
end

function ExportGUI:Reset()
    LOG:Trace("ExportGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.Export = ExportGUI