local  _, CLM = ...


local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local capitalize = UTILS.capitalize
local ColorCodeText = UTILS.ColorCodeText

-- Libs
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local ALL = 0

local EXPORT_DATA_TYPE = {
    STANDINGS = 0,
    POINT_HISTORY = 1,
    LOOT_HISTORY = 2,
    -- AUCTION_HISTORY = 3,
    RAIDS = 4
}

local EXPORT_DATA_TYPE_GUI = {
    [EXPORT_DATA_TYPE.STANDINGS] = CLM.L["Standings"],
    [EXPORT_DATA_TYPE.POINT_HISTORY] = CLM.L["Point History"],
    [EXPORT_DATA_TYPE.LOOT_HISTORY] = CLM.L["Loot History"],
    -- [EXPORT_DATA_TYPE.AUCTION_HISTORY] = CLM.L["Auction History"],
    [EXPORT_DATA_TYPE.RAIDS] = CLM.L["Raids"],
}

local FORMAT_VALUES = {
    XML = 0,
    CSV = 1,
    JSON = 2
}

local FORMAT_VALUES_GUI =  {
    [FORMAT_VALUES.XML] = "XML",
    [FORMAT_VALUES.CSV] = "CSV",
    [FORMAT_VALUES.JSON] = "JSON"
}

local TIMEFRAME_SCALE_VALUES = {
    HOURS = 0,
    DAYS = 1,
    WEEKS = 2,
    MONTHS = 3,
    YEARS  = 4
}

local TIMEFRAME_SCALE_VALUES_GUI =  {
    [TIMEFRAME_SCALE_VALUES.HOURS] = CLM.L["hours"],
    [TIMEFRAME_SCALE_VALUES.DAYS] = CLM.L["days"],
    [TIMEFRAME_SCALE_VALUES.WEEKS] = CLM.L["weeks"],
    [TIMEFRAME_SCALE_VALUES.MONTHS] = CLM.L["months"],
    [TIMEFRAME_SCALE_VALUES.YEARS] = CLM.L["years"],
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
            format = FORMAT_VALUES.XML,
            timeframe = 1,
            timeframe_scale = TIMEFRAME_SCALE_VALUES.WEEKS
        }
    })
end

local ExportGUI = {}
function ExportGUI:Initialize()
    LOG:Trace("ExportGUI:Initialize()")
    InitializeDB(self)
    self.roster_select_list = { [ALL] = true }
    self.profile_select_list = { [ALL] = true }
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
                set = function(i, v) self.db.export_config.timeframe_scale = v end,
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
                get = function(i) end,
                width = "full",
                order = 1
            },
            execute_export = {
                name = CLM.L["Export"],
                type = "execute",
                func = (function() end),
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