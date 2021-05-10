local _, CLM = ...

-- Libs
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0-CLM"),
    gui = LibStub("AceConfigDialog-3.0-CLM")
}

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local ACL = MODULES.ACL
-- local CONSTANTS = CLM.CONSTANTS
-- local RESULTS = CLM.CONSTANTS.RESULTS
local GUI = CLM.GUI

local mergeDictsInline = UTILS.mergeDictsInline
-- local GetColorCodedClassDict = UTILS.GetColorCodedClassDict

-- local ACL = MODULES.ACL
local RosterManager = MODULES.RosterManager
local LedgerManager = MODULES.LedgerManager
local RaidManager = MODULES.RaidManager

local REGISTRY = "clm_raid_manager_gui_options"

local RaidManagerGUI = {}
function RaidManagerGUI:Initialize()
    LOG:Trace("RaidManagerGUI:Initialize()")
    if not ACL:IsTrusted() then return end
    self:Create()
    self:RegisterSlash()
    self._initialized = true
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh(true)
    end)

end

function RaidManagerGUI:GetRosterOption(option)
    local roster = RosterManager:GetRosterByName(self.selectedRoster or "")
    if not roster then return false end
    return roster:GetConfiguration(option)
end

local function GenerateOfficerOptions(self)
    return {
        select_roster = {
            name = "Select roster",
            desc = "Select roster to initialize raid on.",
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
            set = function(i, v) self.selectedRoster = v; self:Refresh() end,
            get = function(i) return self.selectedRoster end,
            disabled = (function() return RaidManager:IsRaidInProgress() end),
            order = 10
        },
        information_header = {
            type = "header",
            name = "Information",
            order = 30
        },
        boss_kill_bonus = {
            name = "Boss Kill Bonus",
            type = "toggle",
            set = (function() end),
            get = (function() return self:GetRosterOption("bossKillBonus") end),
            order = 31,
            disabled = true
        },
        on_time_bonus = {
            name = "On Time Bonus",
            type = "toggle",
            set = (function() end),
            get = (function() return self:GetRosterOption("onTimeBonus")  end),
            order = 32,
            disabled = true
        },
        on_time_bonus_value = {
            name = "On Time Bonus Value",
            type = "input",
            set = (function() end),
            get = (function() return tostring(self:GetRosterOption("onTimeBonusValue")) end),
            order = 33,
            disabled = true
        },
        raid_completion_bonus = {
            name = "Raid Completion Bonus",
            type = "toggle",
            set = (function() end),
            get = (function() return self:GetRosterOption("raidCompletionBonus") end),
            order = 34,
            disabled = true
        },
        raid_completion_bonus_value = {
            name = "Raid Completion Value",
            type = "input",
            set = (function() end),
            get = (function() return tostring(self:GetRosterOption("raidCompletionBonusValue")) end),
            order = 35,
            disabled = true
        },
        interval_bonus = {
            name = "Interval Bonus",
            type = "toggle",
            set = (function() end),
            get = (function() return self:GetRosterOption("intervalBonus") end),
            order = 36,
            disabled = true
        },
        interval_time = {
            name = "Interval Time",
            type = "input",
            set = (function() end),
            get = (function() return tostring(self:GetRosterOption("intervalBonusTime")) end),
            order = 37,
            disabled = true
        },
        interval_bonus_value = {
            name = "Interval Bonus Value",
            type = "input",
            set = (function() end),
            get = (function() return tostring(self:GetRosterOption("intervalBonusValue")) end),
            order = 38,
            disabled = true
        },
        initialize = {
            name = "Initialize raid",
            type = "execute",
            width = "full",
            func = (function(i)
                RaidManager:InitializeRaid(RosterManager:GetRosterByName(self.selectedRoster))
                self:Refresh()
            end),
            disabled = (function() return RaidManager:IsRaidInProgress() end),
            confirm = true,
            order = 11
        },
        end_raid = {
            name = "End raid",
            type = "execute",
            width = "full",
            func = (function(i)
                RaidManager:EndRaid()
                self:Refresh()
            end),
            disabled = (function() return not RaidManager:IsRaidInProgress() end),
            confirm = true,
            order = 12
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

function RaidManagerGUI:Create()
    LOG:Trace("RaidManagerGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Raid Manager")
    f:SetStatusText("")
    f:SetLayout("flow")
    f:EnableResize(false)
    f:SetWidth(200)
    f:SetHeight(500)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Raid_Manager_GUI")

    f:AddChild(CreateManagementOptions(self))

    -- Hide by default
    f:Hide()
end

function RaidManagerGUI:Refresh(visible)
    LOG:Trace("RaidManagerGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top.frame:IsVisible() then return end
    LIBS.gui:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
end

function RaidManagerGUI:Toggle()
    LOG:Trace("RaidManagerGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
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