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
local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline
local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

local ACL = MODULES.ACL
local GuildInfoListener = MODULES.GuildInfoListener
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local LedgerManager = MODULES.LedgerManager
local EventManager = MODULES.EventManager

local REGISTRY = "clm_profiles_gui_options"

local FILTER_IN_RAID = 100

local ProfilesGUI = {}

local function InitializeDB(self)
    local db = MODULES.Database:GUI()
    if not db.profile then
        db.profile = { }
    end
    self.db = db.profile
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

function ProfilesGUI:Initialize()
    LOG:Trace("ProfilesGUI:Initialize()")
    InitializeDB(self)
    EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
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
    filters[100] = UTILS.ColorCodeText("In Raid", "FFD100")
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
            width = 0.49,
            order = 1
        }
    }
end

local function GenerateManagerOptions(self)
    return {}
end

local function GenerateAssistantOptions(self)
    local rankOptions = {}
    local ranks = GuildInfoListener:GetRanks()
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
        -- select_main = {
        --     name = "Select main",
        --     desc = "Select character to be marked as main for alt-main linking.",
        --     type = "select",
        --     width = "full",
        --     values = {}, --self.profilesList, -- not used for now. causes a lot of lag with big profile lists
        --     set = function(i, v) self.selectedMain = v end,
        --     get = function(i) return self.selectedMain end,
        --     disabled = true,
        --     order = 28
        -- },
        -- mark_as_alt = {
        --     name = "Mark as alt",
        --     desc = "Marks selected profiles or everyone if none selected as alts of choosen player (from dropdown).",
        --     type = "execute",
        --     width = "full",
        --     func = (function(i)
        --         for _,alt in ipairs(self:GetSelected()) do
        --             ProfileManager:MarkAsAltByNames(self.selectedMain, alt:Name())
        --         end
        --         self:Refresh()
        --     end),
        --     confirm = true,
        --     disabled = true,
        --     order = 29
        -- },
        -- clear_main = {
        --     name = "Clear mains",
        --     desc = "Clears selected profiles mains.",
        --     type = "execute",
        --     width = "full",
        --     func = (function(i)
        --         for _,profile in ipairs(self:GetSelected()) do
        --             ProfileManager:MarkAsAltByNames(profile:Name(), profile:Name())
        --         end
        --         self:Refresh()
        --     end),
        --     confirm = true,
        --     disabled = true,
        --     order = 30
        -- },
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
            order = 31
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
            order = 32
        },
    }
end

local function GenerateGMOptions(self)
    return {}
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
    self.filterOptions[100] = false
    local options = {
        type = "group",
        args = {}
    }
    mergeDictsInline(options.args, GenerateUntrustedOptions(self))
    if ACL:IsTrusted() then
        mergeDictsInline(options.args, GenerateAssistantOptions(self))
        mergeDictsInline(options.args, GenerateManagerOptions(self))
        mergeDictsInline(options.args, GenerateGMOptions(self))
    end
    LIBS.registry:RegisterOptionsTable(REGISTRY, options)
    LIBS.gui:Open(REGISTRY, ManagementOptions) -- this doesnt directly open but it feeds it to the container -> tricky ^^

    self.st:SetFilter((function(stobject, row)
        local isInRaid = {}
        -- Check raid
        for i=1,MAX_RAID_MEMBERS do
            local name = GetRaidRosterInfo(i)
            if name then
                name = UTILS.RemoveServer(name)
                isInRaid[name] = true
            end
        end
        -- Check for standby filter
        -- FILTER_STANDBY = 102
        -- Check class filter
        local playerName = ST_GetName(row)
        local class = ST_GetClass(row)

        local status
        for id, _class in pairs(GetColorCodedClassDict()) do
            if class == _class then
                status = self.filterOptions[id]
            end
        end
        if status == nil then return false end -- failsafe
        if self.filterOptions[FILTER_IN_RAID] then
            status = status and isInRaid[playerName]
        end
        return status
    end))

    return ManagementOptions
end

local function CreateStandingsDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = "Name",  width = 100},
        {name = "Class", width = 70},
        {name = "Spec",  width = 70},
        {name = "Main",  width = 70},
        {name = "Rank",  width = 70},
        {name = "Version",  width = 100},
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(550)
    StandingsGroup:SetWidth(550)
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
    f:SetWidth(800)
    f:SetHeight(675)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Profiles_GUI")

    f:AddChild(CreateStandingsDisplay(self))
    f:AddChild(CreateManagementOptions(self))
    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function ProfilesGUI:Refresh(visible)
    LOG:Trace("ProfilesGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top:IsVisible() then return end
    self.st:ClearSelection()

    local rowId = 1
    local data = {}
    local profiles = ProfileManager:GetProfiles()
    for _,object in pairs(profiles) do
        local row = {cols = {}}
        local main = ""
        local profile = ProfileManager:GetProfileByGUID(object:Main())
        if profile then
            main = profile:Name()
        end
        local name = object:Name()
        local rank = ""
        if ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER, name) then
            rank = "GM"
        elseif ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER, name) then
            rank = "Manager"
        elseif ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
            rank = "Assistant"
        end
        row.cols[1] = {value = name}
        row.cols[2] = {value = UTILS.ColorCodeClass(object:Class())}
        row.cols[3] = {value = object:SpecString()}
        row.cols[4] = {value = main}
        row.cols[5] = {value = rank}
        row.cols[6] = {value = object:VersionString()}
        data[rowId] = row
        rowId = rowId + 1

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
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self.filterOptions[FILTER_IN_RAID] = IsInRaid() and true or false
        self:Refresh()
        self.top:Show()
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

function ProfilesGUI:Reset()
    LOG:Trace("ProfilesGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

GUI.Profiles = ProfilesGUI