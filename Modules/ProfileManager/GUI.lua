-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local tostring, tinsert = tostring, table.insert

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local REGISTRY = "clm_profiles_gui_options"

local FILTER_IN_RAID = 100
-- local FILTER_ONLINE = 101
-- local FILTER_STANDBY = 102
local FILTER_IN_GUILD = 103
local FILTER_NOT_IN_GUILD = 104
-- local FILTER_MAINS_ONLY = 105

local ProfilesGUI = {}

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('profile', {
        location = {nil, nil, "CENTER", 0, 0 }
    })
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
    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
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
    local filters = UTILS.ShallowCopy(UTILS.GetColorCodedClassDict())
    filters[FILTER_IN_RAID] = UTILS.ColorCodeText(CLM.L["In Raid"], "FFD100")
    filters[FILTER_IN_GUILD] = UTILS.ColorCodeText(CLM.L["In Guild"], "FFD100")
    filters[FILTER_NOT_IN_GUILD] = UTILS.ColorCodeText(CLM.L["External"], "FFD100")
    return {
        filter_header = {
            type = "header",
            name = CLM.L["Filtering"],
            order = 0
        },
        filter_display = {
            name = CLM.L["Filter"],
            type = "multiselect",
            set = function(i, k, v)
                local n = tonumber(k) or 0
                self.filterOptions[n] = v
                if v then
                    if n == FILTER_IN_GUILD then
                        self.filterOptions[FILTER_NOT_IN_GUILD] = not v
                    elseif n == FILTER_NOT_IN_GUILD then
                        self.filterOptions[FILTER_IN_GUILD] = not v
                    end
                end
                self:Refresh()
            end,
            get = function(i, v) return self.filterOptions[tonumber(v)] end,
            values = filters,
            width = 0.49,
            order = 1
        },
        filter_select_all = {
            name = CLM.L["All"],
            desc = CLM.L["Select all classes."],
            type = "execute",
            func = (function()
                for i=1,9 do
                    self.filterOptions[i] = true
                end
                self:Refresh(true)
            end),
            width = 0.55,
            order = 2,
        },
        filter_select_none = {
            name = CLM.L["None"],
            desc = CLM.L["Clear all classes."],
            type = "execute",
            func = (function()
                for i=1,9 do
                    self.filterOptions[i] = false
                end
                self:Refresh(true)
            end),
            width = 0.55,
            order = 3,
        },
    }
end

local function GenerateManagerOptions(self)
    return {}
end

local function GenerateAssistantOptions(self)
    local rankOptions = {}
    local ranks = CLM.MODULES.GuildInfoListener:GetRanks()
    for i,o in pairs(ranks) do
        rankOptions[i] = o.name
    end
    rankOptions[-1] = CLM.L["Any"]
    return {
        management_header = {
            type = "header",
            name = CLM.L["Management"],
            order = 20
        },
        fill_from_guild_ranks = {
            name = CLM.L["Ranks"],
            type = "select",
            set = function(i, v) self.rank = v end,
            get = function(i) return self.rank end,
            values = rankOptions,
            width = "full",
            order = 21
        },
        fill_from_guild_min_level = {
            name = CLM.L["Minimum Level"],
            desc = CLM.L["Minimum level of players to fill from guild."],
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
            name = CLM.L["Fill from Guild"],
            desc = CLM.L["Fill profile list with players with the minimum level and ranks."],
            type = "execute",
            width = "full",
            func = (function(i)
                CLM.MODULES.ProfileManager:FillFromGuild(self.rank, tonumber(self.minimumLevel) or 1)
                self:Refresh()
            end),
            -- disabled = (function() return not IsInGuild() end)
            confirm = true,
            order = 23
        },
        fill_from_raid_roster = {
            name = CLM.L["Fill from Raid Roster"],
            desc = CLM.L["Fill profile list with players in current raid roster."],
            type = "execute",
            width = "full",
            func = (function(i)
                CLM.MODULES.ProfileManager:FillFromRaid()
                self:Refresh()
            end),
            -- disabled = (function() return not IsInRaid() end)
            confirm = true,
            order = 23
        },
        add_target = {
            name = CLM.L["Add target"],
            desc = CLM.L["Add currently selected target to list."],
            type = "execute",
            width = "full",
            func = (function(i)
                CLM.MODULES.ProfileManager:AddTarget()
                self:Refresh()
            end),
            confirm = true,
            order = 24
        },
        remove_selected = {
            name = CLM.L["Remove"],
            desc = CLM.L["Removes selected profiles or everyone if none selected."],
            type = "execute",
            width = "full",
            func = (function(i)
                for _,profile in ipairs(self:GetSelected()) do
                    CLM.MODULES.ProfileManager:RemoveProfile(profile:GUID())
                end
                self:Refresh()
            end),
            confirm = true,
            order = 25
        },
        select_roster = {
            name = CLM.L["Select roster"],
            desc = CLM.L["Select roster to add profiles to."],
            type = "select",
            width = "full",
            values = (function()
                local rosters = CLM.MODULES.RosterManager:GetRosters()
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
            name = CLM.L["Add to roster"],
            desc = CLM.L["Adds selected players or everyone if none selected to the selected roster (from dropdown)."],
            type = "execute",
            width = "full",
            func = (function(i)
                CLM.MODULES.RosterManager:AddProfilesToRoster(CLM.MODULES.RosterManager:GetRosterByName(self.selectedRoster), self:GetSelected())
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
    for _=1,9 do tinsert( self.filterOptions, true ) end
    self.filterOptions[FILTER_IN_RAID] = false
    self.filterOptions[FILTER_IN_GUILD] = false
    self.filterOptions[FILTER_NOT_IN_GUILD] = false
    local options = {
        type = "group",
        args = {}
    }
    UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(self))
    if CLM.MODULES.ACL:IsTrusted() then
        UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(self))
        UTILS.mergeDictsInline(options.args, GenerateManagerOptions(self))
        UTILS.mergeDictsInline(options.args, GenerateGMOptions(self))
    end
    AceConfigRegistry:RegisterOptionsTable(REGISTRY, options)
    AceConfigDialog:Open(REGISTRY, ManagementOptions)

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
        for id, _class in pairs(UTILS.GetColorCodedClassDict()) do
            if class == _class then
                status = self.filterOptions[id]
            end
        end
        if status == nil then return false end -- failsafe
        if self.filterOptions[FILTER_IN_RAID] then
            status = status and isInRaid[playerName]
        end
        if self.filterOptions[FILTER_NOT_IN_GUILD] then
            status = status and not CLM.MODULES.GuildInfoListener:GetGuildies()[playerName]
        end
        if self.filterOptions[FILTER_IN_GUILD] then
            status = status and CLM.MODULES.GuildInfoListener:GetGuildies()[playerName]
        end
        return status
    end))

    return ManagementOptions
end

local function CreateStandingsDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = CLM.L["Name"],  width = 100},
        {name = CLM.L["Class"], width = 70,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        },
        {name = CLM.L["Spec"],  width = 70},
        {name = CLM.L["Main"],  width = 70},
        {name = CLM.L["Rank"],  width = 70},
        {name = CLM.L["Version"],  width = 100},
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
    f:SetTitle(CLM.L["Profiles"])
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
    local profiles = CLM.MODULES.ProfileManager:GetProfiles()
    for _,object in pairs(profiles) do
        local row = {cols = {}}
        local main = ""
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(object:Main())
        if profile then
            main = profile:Name()
        end
        local name = object:Name()
        local rank = ""
        if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER, name) then
            rank = CLM.L["GM"]
        elseif CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER, name) then
            rank = CLM.L["Manager"]
        elseif CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
            rank = CLM.L["Assistant"]
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
    AceConfigDialog:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
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
        local profile = CLM.MODULES.ProfileManager:GetProfileByName(ST_GetName(self.st:GetRow(s)))
        if profile then
            tinsert(profiles, profile)
        else
            LOG:Debug(CLM.L["No profile for "] .. tostring(ST_GetName(self.st:GetRow(s))))
        end
    end
    local profiles_filtered = {}
    for _, profile in ipairs(profiles) do
        if filter(profile) then
            tinsert(profiles_filtered, profile)
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
            desc = CLM.L["Toggle Profiles window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function ProfilesGUI:Reset()
    LOG:Trace("ProfilesGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.Profiles = ProfilesGUI