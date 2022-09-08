-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local CreateFrame, UIParent, pairs = CreateFrame, UIParent, pairs

local GreenYes = UTILS.GreenYes()
local RedNo = UTILS.RedNo()

local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}
local colorYellow = {r = 0.93, g = 0.93, b = 0.2, a = 1.0}

local function ST_GetRaid(row)
    return row.cols[4].value
end

local function refreshFn(...)
    CLM.GUI.Unified:Refresh(...)
end

local UnifiedGUI_Raids = {
    name = "raids",
    -- filter = CLM.MODELS.Filters:New(
    -- (function() CLM.GUI.Unified:FilterScrollingTable() end),
    -- UTILS.Set({"class", "inGuild", "external"}),
    -- UTILS.Set({"buttons", "search"}),
    -- nil, 1),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIRaidsDialogTooltip", UIParent, "GameTooltipTemplate"),
    configuration = CLM.MODELS.RosterConfiguration:New()
}

function UnifiedGUI_Raids:GetSelection()
    LOG:Trace("UnifiedGUI_Raids:GetSelection()")
    local st = CLM.GUI.Unified:GetScrollingTable()

    local raid
    local _, selection = next(st:GetSelection())
    local row = st:GetRow(selection)
    if row then
        raid = ST_GetRaid(row)
    end

    return raid
end

local function UpdateRaid(self, name)
    LOG:Trace("UnifiedGUI_Raids UpdateRaid()")
    local roster = CLM.MODULES.RosterManager:GetRosterByName(name)
    if roster then
        self.configuration = CLM.MODELS.RosterConfiguration:New(UTILS.DeepCopy(roster.configuration))
        return true
    end
    return false
end

local function GetRaidConfigurationOption(self, option)
    return self.configuration:Get(option)
end

local function SetRaidConfigurationOption(self, option, value)
    return self.configuration:Set(option, value)
end

-- local function GenerateUntrustedOptions(self)
--     return self.filter:GetAceOptions()
-- end

local function GenerateAssistantOptions(self)
    return {
        information_header = {
            type = "header",
            name = CLM.L["Overrides"],
            order = 30
        },
        boss_kill_bonus = {
            name = CLM.L["Boss Kill Bonus"],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "bossKillBonus", v) end),
            get = (function() return GetRaidConfigurationOption(self, "bossKillBonus") end),
            order = 31,
        },
        on_time_bonus = {
            name = CLM.L["On Time Bonus"],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "onTimeBonus", v) end),
            get = (function() return GetRaidConfigurationOption(self, "onTimeBonus")  end),
            order = 32,
        },
        on_time_bonus_value = {
            name = CLM.L["On Time Bonus Value"],
            type = "input",
            set = (function(i, v) SetRaidConfigurationOption(self, "onTimeBonusValue", tonumber(v)) end),
            get = (function() return tostring(GetRaidConfigurationOption(self, "onTimeBonusValue")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 33,
        },
        raid_completion_bonus = {
            name = CLM.L["Raid Completion Bonus"],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "raidCompletionBonus", v) end),
            get = (function() return GetRaidConfigurationOption(self, "raidCompletionBonus") end),
            order = 34,
        },
        raid_completion_bonus_value = {
            name = CLM.L["Raid Completion Value"],
            type = "input",
            set = (function(i, v) SetRaidConfigurationOption(self, "raidCompletionBonusValue", tonumber(v)) end),
            get = (function() return tostring(GetRaidConfigurationOption(self, "raidCompletionBonusValue")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 35,
        },
        interval_bonus = {
            name = CLM.L["Interval Bonus"],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "intervalBonus", v) end),
            get = (function() return GetRaidConfigurationOption(self, "intervalBonus") end),
            order = 36,
        },
        interval_time = {
            name = CLM.L["Interval Time"],
            type = "input",
            set = (function(i, v) SetRaidConfigurationOption(self, "intervalBonusTime", tonumber(v)) end),
            get = (function() return tostring(GetRaidConfigurationOption(self, "intervalBonusTime")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 37,
        },
        interval_bonus_value = {
            name = CLM.L["Interval Value"],
            type = "input",
            set = (function(i, v) SetRaidConfigurationOption(self, "intervalBonusValue", tonumber(v)) end),
            get = (function() return tostring(GetRaidConfigurationOption(self, "intervalBonusValue")) end),
            pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
            order = 38,
        },
        auto_award_include_bench =  {
            name = CLM.L["Include bench"],
            desc = CLM.L["Include benched players in all auto-awards"],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "autoAwardIncludeBench", v) end),
            get = (function() return GetRaidConfigurationOption(self, "autoAwardIncludeBench") end),
            order = 39,
        },
        auto_bench_leavers =  {
            name = CLM.L["Auto bench leavers"],
            desc = CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "autoBenchLeavers", v) end),
            get = (function() return GetRaidConfigurationOption(self, "autoBenchLeavers") end),
            order = 40,
        },
        allow_self_bench_subscribe =  {
            name = CLM.L["Allow subscription"],
            desc = CLM.L["Allow players to subscribe to the bench through Raids menu"],
            type = "toggle",
            set = (function(i, v) SetRaidConfigurationOption(self, "selfBenchSubscribe", v) end),
            get = (function() return GetRaidConfigurationOption(self, "selfBenchSubscribe") end),
            order = 41,
        },
        select_roster = {
            name = CLM.L["Select roster"],
            desc = CLM.L["Select roster to create raid for."],
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
            set = (function(i, v)
                self.roster = v
                UpdateRaid(self, self.roster)
            end),
            get = function(i) return self.roster end,
            disabled = (function() return CLM.MODULES.RaidManager:IsInActiveRaid() end),
            order = 9
        },
        name_raid = {
            name = CLM.L["Raid Name"],
            desc = CLM.L["Set raid name"],
            type = "input",
            set = function(i, v) self.raidName = v end,
            get = function(i) return self.raidName end,
            disabled = (function() return CLM.MODULES.RaidManager:IsInActiveRaid() end),
            width = "full",
            order = 8
        },
        create_raid = {
            name = CLM.L["Create raid"],
            desc = CLM.L["Create new raid with provided name. You will automatically join this raid and leave any other you are part of."],
            type = "execute",
            width = "full",
            func = (function(i)
                CLM.MODULES.RaidManager:CreateRaid(CLM.MODULES.RosterManager:GetRosterByName(self.roster), self.raidName, self.configuration)
            end),
            disabled = (function() return CLM.MODULES.RaidManager:IsInActiveRaid() end),
            confirm = true,
            order = 10
        }
    }
end

-- local function GenerateManagerOptions(self)
--     return {}
-- end

-- local function GenerateGMOptions(self)
--     return {}
-- end

local function verticalOptionsFeeder()
    local options = {
        type = "group",
        args = {}
    }
    -- UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_Raids))
    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(UnifiedGUI_Raids))
    end
    -- if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
    --     UTILS.mergeDictsInline(options.args, GenerateManagerOptions(UnifiedGUI_Raids))
    -- end
    -- if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
    --     UTILS.mergeDictsInline(options.args, GenerateGMOptions(UnifiedGUI_Raids))
    -- end
    return options
end

local function FillConfigurationTooltip(configuration, tooltip)
    tooltip:AddDoubleLine(CLM.L["Auction Time"], configuration:Get("auctionTime"))
    tooltip:AddDoubleLine(CLM.L["Anti-snipe"], configuration:Get("antiSnipe"))
    tooltip:AddDoubleLine(CLM.L["Boss Kill Bonus"], configuration:Get("bossKillBonus") and GreenYes or RedNo)
    local onTimeBonus = configuration:Get("onTimeBonus")
    tooltip:AddDoubleLine(CLM.L["On Time Bonus"], onTimeBonus and GreenYes or RedNo)
    if onTimeBonus then
        tooltip:AddDoubleLine(CLM.L["On Time Bonus Value"], configuration:Get("onTimeBonusValue"))
    end
    local raidCompletionBonus = configuration:Get("raidCompletionBonus")
    tooltip:AddDoubleLine(CLM.L["Raid Completion Bonus"], raidCompletionBonus and GreenYes or RedNo)
    if raidCompletionBonus then
        tooltip:AddDoubleLine(CLM.L["Raid Completion Bonus Value"], configuration:Get("raidCompletionBonusValue"))
    end
    local intervalBonus = configuration:Get("intervalBonus")
    tooltip:AddDoubleLine(CLM.L["Interval Bonus"], intervalBonus and GreenYes or RedNo)
    if intervalBonus then
        tooltip:AddDoubleLine(CLM.L["Interval Time"], configuration:Get("intervalBonusTime"))
        tooltip:AddDoubleLine(CLM.L["Interval Value"], configuration:Get("intervalBonusValue"))
    end
end

local tableStructure = {
    rows = 25,
    -- columns - structure of the ScrollingTable
    columns = {
        {name = CLM.L["Name"],  width = 140},
        {name = CLM.L["Status"], width = 65},
        {name = CLM.L["Created"],  width = 205, sort = LibStub("ScrollingTable").SORT_DSC}
    },
    -- Function to filter ScrollingTable
    -- filter = (function(stobject, row)
    --     local playerName = ST_GetName(row)
    --     local class = ST_GetClass(row)
    --     return UnifiedGUI_Raids.filter:Filter(playerName, class, {playerName, class})
    -- end),
    -- Events to override for ScrollingTable
    events = {
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            local tooltip = UnifiedGUI_Raids.tooltip
            if not tooltip then return end
            tooltip:SetOwner(rowFrame, "ANCHOR_RIGHT")
            local raid = ST_GetRaid(rowData)
            -- In Raid
            local finished = not raid:IsActive()
            local profiles = raid:Profiles(finished)
            local numProfiles = #profiles
            tooltip:AddDoubleLine(raid:Name(), CONSTANTS.RAID_STATUS_GUI[raid:Status()] or CLM.L["Unknown"])
            tooltip:AddLine(" ")
            if finished then
                tooltip:AddDoubleLine(CLM.L["Participated"] .. ":", tostring(numProfiles))
            else
                tooltip:AddDoubleLine(CLM.L["In Raid"] .. ":", tostring(numProfiles))
            end
            if not profiles or numProfiles == 0 then
                tooltip:AddLine("None")
            else
                UTILS.buildPlayerListForTooltip(profiles, tooltip)
            end
            local standby = raid:Standby(finished)
            local numStandby = #standby
            tooltip:AddDoubleLine(CLM.L["Standby"] .. ":", tostring(numStandby))
            if not standby or numStandby == 0 then
                tooltip:AddLine(CLM.L["None"])
            else
                UTILS.buildPlayerListForTooltip(standby, tooltip)
            end

            tooltip:AddLine(" ")
            tooltip:AddDoubleLine(CLM.L["Roster"], CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID()) or "")

            tooltip:AddLine(" ")
            tooltip:AddLine(CLM.L["Configuration"] .. ":")
            FillConfigurationTooltip(raid:Configuration(), tooltip)
            tooltip:Show()
            return status
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            UnifiedGUI_Raids.tooltip:Hide()
            return status
        end),
        -- OnClick handler -> click
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStSingleSelectClickHandler(table, UnifiedGUI_Raids.RightClickMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            return true
        end
    }
}

local function tableDataFeeder()
    LOG:Trace("UnifiedGUI_Raids tableDataFeeder()")
    local data = {}
    for _, raid in pairs(CLM.MODULES.RaidManager:ListRaids()) do
        local color = nil
        if CONSTANTS.RAID_STATUS.IN_PROGRESS == raid:Status() then
            color = colorGreen
        elseif CONSTANTS.RAID_STATUS.CREATED == raid:Status() then
            color = colorYellow
        end
        local row = {cols = {
            { value = raid:Name() },
            { value = CONSTANTS.RAID_STATUS_GUI[raid:Status()] or CLM.L["Unknown"], color = color },
            { value = date(CLM.L["%Y/%m/%d %H:%M:%S (%A)"], raid:CreatedAt()) },
            { value = raid }
        }}
        data[#data+1] = row
    end
    return data
end

local function initializeHandler()
    LOG:Trace("UnifiedGUI_Raids initializeHandler()")
    UnifiedGUI_Raids.RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            {
                title = CLM.L["Request standby"],
                func = (function(i)
                    local raid = UnifiedGUI_Raids:GetSelection()
                    if raid then
                        CLM.MODULES.StandbyStagingManager:SignupToStandby(raid:UID())
                    else
                        LOG:Message(CLM.L["Please select a raid"])
                    end
                    refreshFn(true)
                    CLM.GUI.Unified:ClearSelection()
                end)
            },
            {
                title = CLM.L["Revoke standby"],
                func = (function(i)
                    local raid = UnifiedGUI_Raids:GetSelection()
                    if raid then
                        CLM.MODULES.StandbyStagingManager:RevokeStandby(raid:UID())
                    else
                        LOG:Message(CLM.L["Please select a raid"])
                    end
                    refreshFn(true)
                    CLM.GUI.Unified:ClearSelection()
                end)
            },
            {
                separator = true,
                trustedOnly = true
            },
            {
                title = CLM.L["Start selected raid"],
                func = (function(i)
                    local raid = UnifiedGUI_Raids:GetSelection()
                    if raid then
                        CLM.MODULES.RaidManager:StartRaid(raid)
                    else
                        LOG:Message(CLM.L["Please select a raid"])
                    end
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                color = "eeee00"
            },
            {
                title = CLM.L["End selected raid"],
                func = (function(i)
                    local raid = UnifiedGUI_Raids:GetSelection()
                    if raid then
                        CLM.MODULES.RaidManager:EndRaid(raid)
                    else
                        LOG:Message(CLM.L["Please select a raid"])
                    end
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                color = "eeee00"
            },
            {
                title = CLM.L["Join selected raid"],
                func = (function(i)
                    local raid = UnifiedGUI_Raids:GetSelection()
                    if raid then
                        CLM.MODULES.RaidManager:JoinRaid(raid)
                    else
                        LOG:Message(CLM.L["Please select a raid"])
                    end
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                color = "eeee00"
            },
            {
                separator = true,
                trustedOnly = true,
                managerOnly = true
            },
            {
                title = CLM.L["Remove selected raid"],
                func = (function()
                    local raid = UnifiedGUI_Raids:GetSelection()
                    if raid then
                        CLM.MODULES.LedgerManager:Remove(raid:Entry(), true)
                    else
                        LOG:Message(CLM.L["Please select a raid"])
                    end
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                managerOnly = true,
                color = "cc0000"
            }
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )
end

-- local function refreshHandler()
-- end

-- local function beforeShowHandler()
-- end

local function storeHandler()
    LOG:Trace("UnifiedGUI_Raids storeHandler()")
    local storage = CLM.GUI.Unified:GetStorage(UnifiedGUI_Raids.name)
    storage.roster = UnifiedGUI_Raids.roster
end

local function restoreHandler()
    LOG:Trace("UnifiedGUI_Raids restoreHandler()")
    local storage = CLM.GUI.Unified:GetStorage(UnifiedGUI_Raids.name)
    UnifiedGUI_Raids.roster = storage.roster
end

local function dataReadyHandler()
    LOG:Trace("UnifiedGUI_Raids dataReadyHandler()")
    if not CLM.MODULES.RosterManager:GetRosterByName(UnifiedGUI_Raids.roster) then
        local _, roster = next(CLM.MODULES.RosterManager:GetRosters())
        if roster then
            UnifiedGUI_Raids.roster = roster:UID()
        end
    end

    UpdateRaid(UnifiedGUI_Raids, UnifiedGUI_Raids.roster)
end

CLM.GUI.Unified:RegisterTab(
    UnifiedGUI_Raids.name, 3,
    tableStructure,
    tableDataFeeder,
    nil,
    verticalOptionsFeeder,
    {
        initialize = initializeHandler,
        -- refresh = refreshHandler,
        -- beforeShow = beforeShowHandler,
        store = storeHandler,
        restore = restoreHandler,
        dataReady = dataReadyHandler
    }
)
