local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
-- local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline
local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

local ACL = MODULES.ACL
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local LedgerManager = MODULES.LedgerManager

local REGISTRY = "clm_profiles_gui_options"

local ProfilesGUI = {}
function ProfilesGUI:Initialize()
    LOG:Trace("ProfilesGUI:Initialize()")
    if not ACL:IsTrusted() then return end
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)

end

local function ST_GetName(row)
    return row.cols[1].value
end

local function ST_GetClass(row)
    return row.cols[2].value
end

local function GenerateUntrustedOptions(self)
    local filters = UTILS.ShallowCopy(GetColorCodedClassDict())
    return {
        filter_header = {
            type = "header",
            name = "Filtering",
            order = 0
        },
        filter_display = {
            name = "Filter",
            type = "multiselect",
            set = function(i, k, v) self.filterOptions[tonumber(k)] = v; self:Refresh() end,
            get = function(i, v) return self.filterOptions[tonumber(v)] end,
            values = filters,
            width = "half",
            order = 1
        }
    }
end

local function GenerateManagerOptions(self)
    return {}
end

local function GenerateOfficerOptions(self)
    local rankOptions = {}
    local ranks = ACL:GetGuildRanks()
    for i,o in pairs(ranks) do
        rankOptions[i] = o.name
    end
    rankOptions[-1] = "Any"
    return {
        management_header = {
            type = "header",
            name = "Management",
            order = 20
        },
        fill_from_guild_ranks = {
            name = "Ranks",
            type = "select",
            set = function(i, v) self.rank = v end,
            get = function(i) return self.rank end,
            values = rankOptions,
            width = "full",
            order = 21
        },
        fill_from_guild_min_level = {
            name = "Minimum Level",
            desc = "Minimum level of players to fill from guild.",
            type = "range",
            min  = 0,
            max  = 70,
            step = 1,
            bigStep = 1,
            set = function(i, v) self.minimumLevel = v end,
            get = function(i) return self.minimumLevel end,
            width = "full",
            order = 22
        },
        fill_from_guild = {
            name = "Fill from Guild",
            desc = "Fill profile list with players with the minimum level and ranks.",
            type = "execute",
            width = "full",
            func = (function(i)
                ProfileManager:FillFromGuild(self.rank, tonumber(self.minimumLevel) or 1)
                self:Refresh()
            end),
            -- disabled = (function() return not IsInGuild() end)
            confirm = true,
            order = 23
        },
        fill_from_raid_roster = {
            name = "Fill from Raid Roster",
            desc = "Fill profile list with players in current raid roster.",
            type = "execute",
            width = "full",
            func = (function(i)
                ProfileManager:FillFromRaid()
                self:Refresh()
            end),
            -- disabled = (function() return not IsInRaid() end)
            confirm = true,
            order = 23
        },
        add_target = {
            name = "Add target",
            desc = "Add currently selected target to list.",
            type = "execute",
            width = "full",
            func = (function(i)
                ProfileManager:AddTarget()
                self:Refresh()
            end),
            confirm = true,
            order = 24
        },
        remove_selected = {
            name = "Remove",
            desc = "Removes selected profiles or everyone if none selected.",
            type = "execute",
            width = "full",
            func = (function(i)
                for _,profile in ipairs(self:GetSelected()) do
                    ProfileManager:RemoveProfile(profile:GUID())
                end
                self:Refresh()
            end),
            confirm = true,
            order = 25
        },
        select_main = {
            name = "Select main",
            desc = "Select character to be marked as main for alt-main linking.",
            type = "select",
            width = "full",
            values = {}, --self.profilesList, -- not used for now. causes a lot of lag with big profile lists
            set = function(i, v) self.selectedMain = v end,
            get = function(i) return self.selectedMain end,
            disabled = true,
            order = 26
        },
        mark_as_alt = {
            name = "Mark as alt",
            desc = "Marks selected profiles or everyone if none selected as alts of choosen player (from dropdown).",
            type = "execute",
            width = "full",
            func = (function(i)
                for _,alt in ipairs(self:GetSelected()) do
                    ProfileManager:MarkAsAltByNames(self.selectedMain, alt:Name())
                end
                self:Refresh()
            end),
            confirm = true,
            disabled = true,
            order = 27
        },
        clear_main = {
            name = "Clear mains",
            desc = "Clears selected profiles mains.",
            type = "execute",
            width = "full",
            func = (function(i)
                for _,profile in ipairs(self:GetSelected()) do
                    ProfileManager:MarkAsAltByNames(profile:Name(), profile:Name())
                end
                self:Refresh()
            end),
            confirm = true,
            disabled = true,
            order = 28
        },
        select_roster = {
            name = "Select roster",
            desc = "Select roster to add profiles to.",
            type = "select",
            width = "full",
            values = (function()
                local rosters = RosterManager:GetRosters()
                local values = {}
                for name,_ in pairs(rosters) do
                    values[name] = name
                end
                return values
            end),
            set = function(i, v) self.selectedRoster = v end,
            get = function(i) return self.selectedRoster end,
            order = 29
        },
        add_to_roster = {
            name = "Add to roster",
            desc = "Adds selected players or everyone if none selected to the selected roster (from dropdown).",
            type = "execute",
            width = "full",
            func = (function(i)
                RosterManager:AddProfilesToRoster(RosterManager:GetRosterByName(self.selectedRoster), self:GetSelected())
            end),
            confirm = true,
            order = 30
        },
    }
end

local function CreateManagementOptions(self, container)
    local ManagementOptions = AceGUI:Create("SimpleGroup")
    ManagementOptions:SetLayout("Flow")
    ManagementOptions:SetWidth(200)
    self.ManagementOptions = ManagementOptions
    self.filterOptions = {}
    self.rank = -1
    self.minimumLevel =  60
    self.profilesList = {}
    self.selectedMain = ""
    self.selectedRoster = ""
    for _=1,9 do table.insert( self.filterOptions, true ) end
    local options = {
        type = "group",
        args = {}
    }
    mergeDictsInline(options.args, GenerateUntrustedOptions(self))
    mergeDictsInline(options.args, GenerateManagerOptions(self))
    mergeDictsInline(options.args, GenerateOfficerOptions(self))
    LIBS.registry:RegisterOptionsTable(REGISTRY, options)
    LIBS.gui:Open(REGISTRY, ManagementOptions) -- this doesnt directly open but it feeds it to the container -> tricky ^^

    self.st:SetFilter((function(stobject, row)
        -- Check class filter
        local class = ST_GetClass(row)
        for id, _class in pairs(GetColorCodedClassDict()) do
            if class == _class then
                return self.filterOptions[id]
            end
        end
        return true;
    end))

    return ManagementOptions
end

local function CreateStandingsDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = "Name",  width = 100},
        {name = "Class", width = 100},
        {name = "Spec",  width = 100},
        {name = "Main",   width = 100}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(550)
    StandingsGroup:SetWidth(450)
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 25, 18, nil, StandingsGroup.frame, true)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", StandingsGroup.frame, "TOPLEFT", 0, -63)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    return StandingsGroup
end

function ProfilesGUI:Create()
    LOG:Trace("ProfilesGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Profiles")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(700)
    f:SetHeight(675)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Profiles_GUI")

    f:AddChild(CreateStandingsDisplay(self))
    f:AddChild(CreateManagementOptions(self))

    -- Hide by default
    f:Hide()
end

function ProfilesGUI:Refresh(visible)
    LOG:Trace("ProfilesGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top.frame:IsVisible() then return end
    self.st:ClearSelection()

    local data = {}
    local profiles = ProfileManager:GetProfiles()
    for _,object in pairs(profiles) do
        local row = {cols = {}}
        table.insert(row.cols, {value = object:Name()})
        table.insert(row.cols, {value = UTILS.ColorCodeClass(object:Class())})
        table.insert(row.cols, {value = object:Spec()})
        local profile = ProfileManager:GetProfileByGUID(object:Main())
        local main
        if profile ~= nil then
            main = profile:Name()
        else
            main = ""
        end
        table.insert(row.cols, {value = main})
        table.insert(data, row)

        self.profilesList[object:Name()] = object:Name()
    end

    self.st:SetData(data)
    LIBS.gui:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
end

function ProfilesGUI:GetSelected(filter)
    if type(filter) ~= "function" then
        filter = (function(profile) return profile end)
    end
    -- Profiles
    local selected = self.st:GetSelection()
    local profiles = {}
    if #selected == 0 then -- nothing selected: assume all visible are selected
        selected = self.st:DoFilter()
    end
    for _,s in pairs(selected) do
        local profile = ProfileManager:GetProfileByName(ST_GetName(self.st:GetRow(s)))
        if profile then
            table.insert(profiles, profile)
        else
            LOG:Debug("No profile for " .. tostring(ST_GetName(self.st:GetRow(s))))
        end
    end
    local profiles_filtered = {}
    for _, profile in ipairs(profiles) do
        if filter(profile) then
            table.insert(profiles_filtered, profile)
        end
    end
    return profiles_filtered
end

function ProfilesGUI:Toggle()
    LOG:Trace("ProfilesGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function ProfilesGUI:RegisterSlash()
    local options = {
        profiles = {
            type = "execute",
            name = "Profiles",
            desc = "Toggle Profiles window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.Profiles = ProfilesGUI