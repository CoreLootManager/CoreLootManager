local _, CLM = ...

-- Libs
local AceGUI = LibStub("AceGUI-3.0")
local ScrollingTable = LibStub("ScrollingTable")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local ACL = MODULES.ACL
local MODELS = CLM.MODELS
local CONSTANTS = CLM.CONSTANTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline
-- local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

-- local ACL = MODULES.ACL
local RosterManager = MODULES.RosterManager
local LedgerManager = MODULES.LedgerManager
local RaidManager = MODULES.RaidManager
local EventManager = MODULES.EventManager

local buildPlayerListForTooltip = UTILS.buildPlayerListForTooltip
local DeepCopy = UTILS.DeepCopy
local GreenYes = UTILS.GreenYes
local RedNo = UTILS.RedNo

local RosterConfiguration = MODELS.RosterConfiguration

local REGISTRY = "clm_raid_manager_gui_options"

local function ST_GetRaid(row)
    return row.cols[5].value
end

local RightClickMenu

local RaidManagerGUI = {}

local function InitializeDB(self)
    local db = MODULES.Database:GUI()
    if not db.raid then
        db.raid = { }
    end
    self.db = db.raid
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

function RaidManagerGUI:Initialize()
    LOG:Trace("RaidManagerGUI:Initialize()")
    self.configuration = RosterConfiguration:New()
    self.name = ""
    self.tooltip = CreateFrame("GameTooltip", "CLMRaidListGUIDialogTooltip", UIParent, "GameTooltipTemplate")
    InitializeDB(self)
    EventManager:RegisterEvent({"PLAYER_LOGOUT"}, (function(...) StoreLocation(self) end))
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)

    RightClickMenu = CLM.UTILS.GenerateDropDownMenu({
        {
            title = "Start selected raid",
            func = (function(i)
                local raid = nil
                local row = self.st:GetRow(self.st:GetSelection())
                if row then
                    raid = ST_GetRaid(row)
                end
                RaidManager:StartRaid(raid)
                self:Refresh()
            end),
            trustedOnly = true
        },
        {
            title = "End selected raid",
            func = (function(i)
                local raid = nil
                local row = self.st:GetRow(self.st:GetSelection())
                if row then
                    raid = ST_GetRaid(row)
                end
                RaidManager:EndRaid(raid) -- TODO: after ending raid cant create new one heh
                self:Refresh()
            end),
            trustedOnly = true
        },
        {
            title = "Join selected raid",
            func = (function(i)
                local raid = nil
                local row = self.st:GetRow(self.st:GetSelection())
                if row then
                    raid = ST_GetRaid(row)
                end
                RaidManager:JoinRaid(raid)
                self:Refresh()
            end),
            trustedOnly = true
        },
        {
            separator = true,
            trustedOnly = true
        },
        {
            title = "Remove selected raid",
            func = (function()
                local row = self.st:GetRow(self.st:GetSelection())
                if row then
                    local raid = ST_GetRaid(row)
                    LedgerManager:Remove(raid:Entry(), true)
                end
            end),
            trustedOnly = true,
            color = "cc0000"
        }
    }, CLM.MODULES.ACL:IsTrusted())
end

function RaidManagerGUI:GetRosterOption(option)
    return self.configuration:Get(option)
end

function RaidManagerGUI:SetRosterOption(option, value)
    return self.configuration:Set(option, value)
end

local function FillConfigurationTooltip(configuration, tooltip)
    tooltip:AddDoubleLine("Auction Time", configuration:Get("auctionTime"))
    tooltip:AddDoubleLine("Anti-Snipe", configuration:Get("antiSnipe"))
    tooltip:AddDoubleLine("Boss Kill Bonus", configuration:Get("bossKillBonus") and GreenYes() or RedNo())
    local onTimeBonus = configuration:Get("onTimeBonus")
    tooltip:AddDoubleLine("On Time Bonus", onTimeBonus and GreenYes() or RedNo())
    if onTimeBonus then
        tooltip:AddDoubleLine("On Time Bonus Value", configuration:Get("onTimeBonusValue"))
    end
    local raidCompletionBonus = configuration:Get("raidCompletionBonus")
    tooltip:AddDoubleLine("Raid Completion Bonus", raidCompletionBonus and GreenYes() or RedNo())
    if raidCompletionBonus then
        tooltip:AddDoubleLine("Raid Completion Bonus Value", configuration:Get("raidCompletionBonusValue"))
    end
    local intervalBonus = configuration:Get("intervalBonus")
    tooltip:AddDoubleLine("Interval Bonus", intervalBonus and GreenYes() or RedNo())
    if intervalBonus then
        tooltip:AddDoubleLine("Interval Time", configuration:Get("intervalBonusTime"))
        tooltip:AddDoubleLine("Interval Bonus Value", configuration:Get("intervalBonusValue"))
    end
end

local function GenerateOfficerOptions(self)
    return {
        information_header = {
            type = "header",
            name = "Information",
            order = 30
        },
        boss_kill_bonus = {
            name = "Boss Kill Bonus",
            type = "toggle",
            set = (function(i, v) self:SetRosterOption("bossKillBonus", v) end),
            get = (function() return self:GetRosterOption("bossKillBonus") end),
            order = 31,
            disabled = true
        },
        on_time_bonus = {
            name = "On Time Bonus",
            type = "toggle",
            set = (function(i, v) self:SetRosterOption("onTimeBonus", v) end),
            get = (function() return self:GetRosterOption("onTimeBonus")  end),
            order = 32
        },
        on_time_bonus_value = {
            name = "On Time Bonus Value",
            type = "input",
            set = (function(i, v) self:SetRosterOption("onTimeBonusValue", tonumber(v)) end),
            get = (function() return tostring(self:GetRosterOption("onTimeBonusValue")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 33
        },
        raid_completion_bonus = {
            name = "Raid Completion Bonus",
            type = "toggle",
            set = (function(i, v) self:SetRosterOption("raidCompletionBonus", v) end),
            get = (function() return self:GetRosterOption("raidCompletionBonus") end),
            order = 34
        },
        raid_completion_bonus_value = {
            name = "Raid Completion Value",
            type = "input",
            set = (function(i, v) self:SetRosterOption("raidCompletionBonusValue", tonumber(v)) end),
            get = (function() return tostring(self:GetRosterOption("raidCompletionBonusValue")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 35
        },
        interval_bonus = {
            name = "Interval Bonus",
            type = "toggle",
            set = (function(i, v) self:SetRosterOption("intervalBonus", v) end),
            get = (function() return self:GetRosterOption("intervalBonus") end),
            order = 36,
            disabled = true
        },
        interval_time = {
            name = "Interval Time",
            type = "input",
            set = (function(i, v) self:SetRosterOption("intervalBonusTime", tonumber(v)) end),
            get = (function() return tostring(self:GetRosterOption("intervalBonusTime")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 37,
            disabled = true
        },
        interval_bonus_value = {
            name = "Interval Bonus Value",
            type = "input",
            set = (function(i, v) self:SetRosterOption("intervalBonusValue", tonumber(v)) end),
            get = (function() return tostring(self:GetRosterOption("intervalBonusValue")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 38,
            disabled = true
        },
        create_header = {
            type = "header",
            name = "Create",
            order = 7
        },
        select_roster = {
            name = "Select roster",
            desc = "Select roster to create raid for.",
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
            set = (function(i, v)
                self.selectedRoster = v
                self.roster = RosterManager:GetRosterByName(self.selectedRoster)
                self.configuration = RosterConfiguration:New(DeepCopy(self.roster.configuration))
                self:Refresh()
            end),
            get = function(i) return self.selectedRoster end,
            disabled = (function() return RaidManager:IsInActiveRaid() end),
            order = 9
        },
        name_raid = {
            name = "Raid Name",
            desc = "Set raid name",
            type = "input",
            set = function(i, v) self.name = v end,
            get = function(i) return self.name end,
            disabled = (function() return RaidManager:IsInActiveRaid() end),
            width = "full",
            order = 8
        },
        create_raid = {
            name = "Create raid",
            desc = "Create new raid with provided name. You will automatically join this raid and leave any other you are part of.",
            type = "execute",
            width = "full",
            func = (function(i)
                RaidManager:CreateRaid(self.roster, self.name, self.configuration)
                self:Refresh()
            end),
            disabled = (function() return RaidManager:IsInActiveRaid() end),
            confirm = true,
            order = 10
        }
    }
end

local function CreateManagementOptions(self, container)
    local ManagementOptions = AceGUI:Create("SimpleGroup")
    ManagementOptions:SetLayout("Flow")
    ManagementOptions:SetWidth(200)
    self.ManagementOptions = ManagementOptions
    self.selectedRoster = ""
    local options = {
        type = "group",
        args = {}
    }
    mergeDictsInline(options.args, GenerateOfficerOptions(self))
    LIBS.registry:RegisterOptionsTable(REGISTRY, options)
    LIBS.gui:Open(REGISTRY, ManagementOptions)
    return ManagementOptions
end

local function CreateRaidDisplay(self)
    -- Profile Scrolling Table
    local columns = {
        {name = "Name",  width = 100},
        {name = "Status", width = 100},
        {name = "Roster",  width = 100},
        {name = "Created",  width = 150, sort = ScrollingTable.SORT_DSC}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(600)
    StandingsGroup:SetWidth(520)
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 25, 18, nil, StandingsGroup.frame)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", StandingsGroup.frame, "TOPLEFT", 0, -63)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)
    -- OnEnter handler -> on hover
    local OnEnterHandler = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local rowData = self.st:GetRow(realrow)
        if not rowData or not rowData.cols then return status end
        local tooltip = self.tooltip
        if not tooltip then return end
        tooltip:SetOwner(rowFrame, "ANCHOR_TOPRIGHT")
        local raid = ST_GetRaid(rowData)
        -- In Raid
        local profiles = raid:Profiles()
        local numProfiles = #profiles
        tooltip:AddDoubleLine(raid:Name(), CONSTANTS.RAID_STATUS_GUI[raid:Status()] or "Unknown")
        tooltip:AddLine(" ")
        tooltip:AddDoubleLine("In Raid:", tostring(numProfiles))
        if not profiles or numProfiles == 0 then
            tooltip:AddLine("None")
        else
            buildPlayerListForTooltip(profiles, tooltip)
        end
        local standby = raid:Standby()
        local numStandby = #standby
        tooltip:AddDoubleLine("Standby:", tostring(numStandby))
        if not standby or numStandby == 0 then
            tooltip:AddLine("None")
        else
            buildPlayerListForTooltip(standby, tooltip)
        end
        tooltip:AddLine(" ")
        tooltip:AddLine("Configuration:")
        FillConfigurationTooltip(raid:Configuration(), tooltip)
        tooltip:Show()
        return status
    end)
    -- OnLeave handler -> on hover out
    local OnLeaveHandler = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        local status = self.st.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
        self.tooltip:Hide()
        return status
    end)
    -- end
    -- OnClick handler
    local OnClickHandler = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
        local rightButton = (button == "RightButton")
        local status = self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, rightButton and "LeftButton" or button, ...)
        if rightButton then
            ToggleDropDownMenu(1, nil, RightClickMenu, cellFrame, -20, 0)
        end
        return status
    end
    -- end
    self.st:RegisterEvents({
        OnEnter = OnEnterHandler,
        OnLeave = OnLeaveHandler,
        OnClick = OnClickHandler
    })
    return StandingsGroup
end

function RaidManagerGUI:Create()
    LOG:Trace("RaidManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Raid Manager")

    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(760)
    f:SetHeight(640)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Raid_Manager_GUI")

    f:AddChild(CreateRaidDisplay(self))
    if ACL:IsTrusted() then
        f:AddChild(CreateManagementOptions(self))
    end
    RestoreLocation(self)
    -- Hide by default
    f:Hide()
end

function RaidManagerGUI:Refresh(visible)
    LOG:Trace("RaidManagerGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top.frame:IsVisible() then return end

    local data = {}
    local rowId = 1
    for _, raid in pairs(RaidManager:ListRaids()) do
        local row = {cols = {
            { value = raid:Name() },
            { value = CONSTANTS.RAID_STATUS_GUI[raid:Status()] or "Unknown" },
            { value = RosterManager:GetRosterNameByUid(raid:Roster():UID()) },
            { value = date("%Y/%m/%d %a %H:%M:%S", raid:CreatedAt()) },
            { value = raid }
        }};
        data[rowId] = row
        rowId = rowId + 1

    end

    self.st:SetData(data)

    if RaidManager:IsInActiveRaid() then
        self.top:SetStatusText("Currently in raid: " .. RaidManager:GetRaid():Name())
    else
        self.top:SetStatusText("Not in raid")
    end

    -- LIBS.registry:NotifyChange(REGISTRY)
    LIBS.gui:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
end

function RaidManagerGUI:Toggle()
    LOG:Trace("RaidManagerGUI:Toggle()")
    if not self._initialized then
        print("not init");
        return end
    if self.top.frame:IsVisible() or not ACL:IsTrusted() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function RaidManagerGUI:RegisterSlash()
    local options = {
        raid = {
            type = "execute",
            name = "Raid Manager",
            desc = "Toggle Raid Manager window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

GUI.RaidManager = RaidManagerGUI
