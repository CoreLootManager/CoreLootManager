-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local sformat = string.format

local colorRed = {r = 0.93, g = 0.2, b = 0.2, a = 1.0}
local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}

local function ST_GetName(row)
    return row.cols[1].value
end

local function ST_GetClass(row)
    return row.cols[3].value
end

local function ST_GetWeeklyGains(row)
    return row.cols[6].value
end

local function ST_GetWeeklyCap(row)
    return row.cols[7].value
end

local function ST_GetPointInfo(row)
    return row.cols[8].value
end

local function ST_GetProfileLoot(row)
    return row.cols[9].value
end

local function ST_GetProfilePoints(row)
    return row.cols[10].value
end

local function refreshFn(...)
    CLM.GUI.Unified:Refresh(...)
end

local TAB_NAME = "standings"

local UnifiedGUI_Standings = {
    filter = CLM.MODELS.Filters:New(refreshFn, true, true, true, true, true, true, false, true, true, nil, 1),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIStandingsDialogTooltip", UIParent, "GameTooltipTemplate"),
    GetSelected = (function()

    end)
}

local function GenerateUntrustedOptions(self)
    local options = {}
    local rosters = CLM.MODULES.RosterManager:GetRosters()
    local rosterMap = {}
    for name, roster in pairs(rosters) do
        rosterMap[roster:UID()] = name
    end
    options.roster = {
        name = CLM.L["Roster"],
        type = "select",
        values = rosterMap,
        set = function(i, v)
            self.roster = v
            self.context = CONSTANTS.ACTION_CONTEXT.ROSTER
            refreshFn()
        end,
        get = function(i) return self.roster end,
        width = "full",
        order = 0
    }
    UTILS.mergeDictsInline(options, self.filter:GetAceOptions())
    return options
end

local function GenerateAssistantOptions(self)
    return {
        award_header = {
            type = "header",
            name = CLM.L["Management"],
            order = 9
        },
        action_context = {
            name = CLM.L["Action context"],
            type = "select",
            values = CONSTANTS.ACTION_CONTEXT_GUI,
            set = function(i, v) self.context = v end,
            get = function(i) return self.context end,
            order = 10,
            width = "full"
        },
        award_dkp_note = {
            name = CLM.L["Note"],
            desc = (function()
                local n = CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."]
                if strlen(self.note or "") > 0 then
                    n = n .. "\n\n|cffeeee00Note:|r " .. self.note
                end
                return n
            end),
            type = "input",
            set = function(i, v) self.note = v end,
            get = function(i) return self.note end,
            width = "full",
            order = 12
        },
        award_reason = {
            name = CLM.L["Reason"],
            type = "select",
            values = CONSTANTS.POINT_CHANGE_REASONS.GENERAL,
            set = function(i, v) self.awardReason = v end,
            get = function(i) return self.awardReason end,
            order = 11,
            width = "full"
        },
        award_dkp_value = {
            name = CLM.L["Award value"],
            desc = CLM.L["Points value that will be awarded."],
            type = "input",
            set = function(i, v) self.awardValue = v end,
            get = function(i) return self.awardValue end,
            width = 0.575,
            pattern = CONSTANTS.REGEXP_FLOAT,
            order = 13
        },
        award_dkp = {
            name = CLM.L["Award"],
            desc = CLM.L["Award DKP to selected players or everyone if none selected."],
            type = "execute",
            width = 0.575,
            func = (function(i)
                -- Award Value
                local awardValue = tonumber(self.awardValue)
                if not awardValue then LOG:Debug("UnifiedGUI_Standings(Award): missing award value"); return end
                -- Reason
                local awardReason
                if self.awardReason and CONSTANTS.POINT_CHANGE_REASONS.GENERAL[self.awardReason] then
                    awardReason = self.awardReason
                else
                    LOG:Debug("UnifiedGUI_Standings(Award): missing reason");
                    awardReason = CONSTANTS.POINT_CHANGE_REASON.MANUAL_ADJUSTMENT
                end
                local roster = CLM.MODULES.RosterManager:GetRosterNameByUid(self.roster)
                if self.context == CONSTANTS.ACTION_CONTEXT.RAID then
                    if CLM.MODULES.RosterManager:IsInRaid() then
                        CLM.MODULES.PointManager:UpdateRaidPoints(CLM.MODULES.RosterManager:GetRaid(), awardValue, awardReason, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, self.note)
                    else
                        LOG:Warning("You are not in raid.")
                    end
                elseif self.context == CONSTANTS.ACTION_CONTEXT.ROSTER then
                    if roster then
                        CLM.MODULES.PointManager:UpdateRosterPoints(roster, awardValue, awardReason, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, false, self.note)
                    else
                        LOG:Warning("Missing valid roster.")
                    end
                elseif self.context == CONSTANTS.ACTION_CONTEXT.SELECTED then
                    local profiles = UnifiedGUI_Standings:GetSelected()
                    if not profiles or #profiles == 0 then
                        LOG:Debug("UnifiedGUI_Standings(Award): profiles == 0")
                        return
                    end
                    if roster then
                        CLM.MODULES.PointManager:UpdatePoints(roster, profiles, awardValue, awardReason, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, self.note)
                    else
                        LOG:Warning("Missing valid roster.")
                    end
                end
            end),
            confirm = true,
            order = 14
        }
    }
end

local function GenerateManagerOptions(self)
    return {
        decay_dkp_value = {
            name = CLM.L["Decay %"],
            desc = CLM.L["% that will be decayed."],
            type = "input",
            set = function(i, v) self.decayValue = v end,
            get = function(i) return self.decayValue end,
            width = 0.575,
            pattern = CONSTANTS.REGEXP_FLOAT,
            order = 21
        },
        decay_negative = {
            name = CLM.L["Decay Negatives"],
            desc = CLM.L["Include players with negative standings in decay."],
            type = "toggle",
            set = function(i, v) self.includeNegative = v end,
            get = function(i) return self.includeNegative end,
            width = "full",
            order = 23
        },
        decay_dkp = {
            name = CLM.L["Decay"],
            desc = CLM.L["Execute decay for selected players or everyone if none selected."],
            type = "execute",
            width = 0.575,
            func = (function(i)
                -- Decay Value
                local decayValue = tonumber(self.decayValue)
                if not decayValue then LOG:Debug("UnifiedGUI_Standings(Decay): missing decay value"); return end
                if decayValue > 100 or decayValue < 0 then LOG:Warning("Standings: Decay value should be between 0 and 100%"); return end
                local roster = CLM.MODULES.RosterManager:GetRosterNameByUid(self.roster)
                if roster == nil then
                    LOG:Debug("UnifiedGUI_Standings(Decay): roster == nil")
                    return
                end
                if self.context == CONSTANTS.ACTION_CONTEXT.ROSTER then
                    CLM.MODULES.PointManager:UpdateRosterPoints(roster, decayValue, CONSTANTS.POINT_CHANGE_REASON.DECAY, CONSTANTS.POINT_MANAGER_ACTION.DECAY, not self.includeNegative)
                elseif self.context == CONSTANTS.ACTION_CONTEXT.SELECTED then
                    local profiles = UnifiedGUI_Standings:GetSelected()
                    if not profiles or #profiles == 0 then
                        LOG:Debug("UnifiedGUI_Standings(Decay): profiles == 0")
                        return
                    end
                    CLM.MODULES.PointManager:UpdatePoints(roster, profiles, decayValue, CONSTANTS.POINT_CHANGE_REASON.DECAY, CONSTANTS.POINT_MANAGER_ACTION.DECAY)
                else
                    LOG:Warning("Invalid context. You should not decay raid only.")
                end
            end),
            confirm = true,
            order = 22
        }
    }
end

local RightClickMenu = CLM.UTILS.GenerateDropDownMenu({
    {
        title = CLM.L["Add to standby"],
        func = (function()
            if not CLM.MODULES.RaidManager:IsInRaid() then
                LOG:Message(CLM.L["Not in raid"])
                return
            end
            local profiles = UnifiedGUI_Standings:GetSelected()
            local raid = CLM.MODULES.RaidManager:GetRaid()
            local roster = CLM.MODULES.RosterManager:GetRosterNameByUid(UnifiedGUI_Standings.roster)
            if roster ~= raid:Roster() then
                LOG:Message(sformat(
                    CLM.L["You can only bench players from same roster as the raid (%s)."],
                    CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID())
                ))
                return
            end

            if CLM.MODULES.RaidManager:IsInProgressingRaid() then
                if #profiles > 10 then
                    LOG:Message(sformat(
                        CLM.L["You can %s max %d players to standby at the same time to a %s raid."],
                        CLM.L["add"], 10, CLM.L["progressing"]
                    ))
                    return
                end
                CLM.MODULES.RaidManager:AddToStandby(CLM.MODULES.RaidManager:GetRaid(), profiles)
            elseif CLM.MODULES.RaidManager:IsInCreatedRaid() then
                if #profiles > 25 then
                    LOG:Message(sformat(
                        CLM.L["You can %s max %d players to standby at the same time to a %s raid."],
                        CLM.L["add"], 25, CLM.L["created"]
                    ))
                    return
                end
                for _, profile in ipairs(profiles) do
                    CLM.MODULES.StandbyStagingManager:AddToStandby(CLM.MODULES.RaidManager:GetRaid():UID(), profile:GUID())
                end
            end
            refreshFn(true)
        end),
        trustedOnly = true,
        color = "eeee00"
    },
    {
        title = CLM.L["Remove from standby"],
        func = (function()
            if not CLM.MODULES.RaidManager:IsInRaid() then
                LOG:Message(CLM.L["Not in raid"])
                return
            end
            local profiles = UnifiedGUI_Standings:GetSelected()
            local raid = CLM.MODULES.RaidManager:GetRaid()
            local roster = CLM.MODULES.RosterManager:GetRosterNameByUid(UnifiedGUI_Standings.roster)
            if roster ~= raid:Roster() then
                LOG:Message(sformat(
                    CLM.L["You can only remove from bench players from same roster as the raid (%s)."],
                    CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID())
                ))
                return
            end

            if CLM.MODULES.RaidManager:IsInProgressingRaid() then
                if #profiles > 10 then
                    LOG:Message(sformat(
                        CLM.L["You can %s max %d players from standby at the same time to a %s raid."],
                        CLM.L["remove"], 10, CLM.L["progressing"]
                    ))
                    return
                end
                CLM.MODULES.RaidManager:RemoveFromStandby(CLM.MODULES.RaidManager:GetRaid(), profiles)
            elseif CLM.MODULES.RaidManager:IsInCreatedRaid() then
                if #profiles > 25 then
                    LOG:Message(sformat(
                        CLM.L["You can %s max %d players from standby at the same time to a %s raid."],
                        CLM.L["remove"], 25, CLM.L["created"]
                    ))
                    return
                end
                for _, profile in ipairs(profiles) do
                    CLM.MODULES.StandbyStagingManager:RemoveFromStandby(CLM.MODULES.RaidManager:GetRaid():UID(), profile:GUID())
                end
            end
            refreshFn(true)
        end),
        trustedOnly = true,
        color = "eeee00"
    },
    {
        separator = true,
        trustedOnly = true
    },
    {
        title = CLM.L["Remove from roster"],
        func = (function(i)
            local profiles = UnifiedGUI_Standings:GetSelected()
            local roster = CLM.MODULES.RosterManager:GetRosterNameByUid(UnifiedGUI_Standings.roster)
            if roster == nil then
                LOG:Debug("UnifiedGUI_Standings(Remove): roster == nil")
                return
            end
            if not profiles or #profiles == 0 then
                LOG:Debug("UnifiedGUI_Standings(Remove): profiles == 0")
                return
            end
            if #profiles > 10 then
                LOG:Message(sformat(
                    CLM.L["You can remove max %d players from roster at the same time."],
                    10
                ))
                return
            end
            CLM.MODULES.RosterManager:RemoveProfilesFromRoster(roster, profiles)
        end),
        trustedOnly = true,
        color = "cc0000"
    },
},
CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
)

local function optionsFeeder()
    local options = {
        type = "group",
        args = {}
    }
    UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_Standings))
    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(UnifiedGUI_Standings))
    end
    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
        UTILS.mergeDictsInline(options.args, GenerateManagerOptions(UnifiedGUI_Standings))
    end
    UnifiedGUI_Standings.options = options
    return options
end

local function tableFeeder(st)
    return {
        -- columns - structure of the ScrollingTable
        columns = {
            {   name = CLM.L["Name"],   width = 80 },
            {   name = CLM.L["DKP"],    width = 60, sort = LibStub("ScrollingTable").SORT_DSC, color = {r = 0.0, g = 0.93, b = 0.0, a = 1.0} },
            {   name = CLM.L["Class"],  width = 60,
                comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
            },
            {   name = CLM.L["Spec"],   width = 60 },
            {   name = CLM.L["Attendance [%]"], width = 60,
                comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
            }
        },
        -- Function to fill ScrollingTable
        dataProvider = (function()
            local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_Standings.roster)
            if not roster then return {} end
            local weeklyCap = roster:GetConfiguration("weeklyCap")
            local rowId = 1
            local data = {}

            for GUID,value in pairs(roster:Standings()) do
                local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
                local attendance = UTILS.round(roster:GetAttendance(GUID) or 0, 0)
                if profile then
                    local row = { cols = {
                        {value = profile:Name()},
                        {value = value, color = (value > 0 and colorGreen or colorRed)},
                        {value = UTILS.ColorCodeClass(profile:Class())},
                        {value = profile:SpecString()},
                        {value = UTILS.ColorCodeByPercentage(attendance)},
                        -- not displayed
                        {value = roster:GetCurrentGainsForPlayer(GUID)},
                        {value = weeklyCap},
                        {value = roster:GetPointInfoForPlayer(GUID)},
                        {value = roster:GetProfileLootByGUID(GUID)},
                        {value = roster:GetProfilePointHistoryByGUID(GUID)}
                    }}
                    data[rowId] = row
                    rowId = rowId + 1
                end
            end
            return data
        end),
        -- Function to filter ScrollingTable
        filter = (function(stobject, row)
            local playerName = ST_GetName(row)
            local class = ST_GetClass(row)
            return UnifiedGUI_Standings.filter:Filter(playerName, class, {playerName, class})
        end),
        -- Events to override for ScrollingTable
        events = {
            -- OnEnter handler -> on hover
            OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
                local status = st.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
                local rowData = st:GetRow(realrow)
                if not rowData or not rowData.cols then return status end
                local tooltip = UnifiedGUI_Standings.tooltip
                if not tooltip then return end
                tooltip:SetOwner(rowFrame, "ANCHOR_RIGHT")
                local weeklyGain = ST_GetWeeklyGains(rowData)
                local weeklyCap = ST_GetWeeklyCap(rowData)
                local gains = weeklyGain
                if weeklyCap > 0 then
                    gains = gains .. " / " .. weeklyCap
                end
                local pointInfo = ST_GetPointInfo(rowData)
                tooltip:AddDoubleLine(CLM.L["Information"], CLM.L["DKP"])
                tooltip:AddDoubleLine(CLM.L["Weekly gains"], gains)
                tooltip:AddLine("\n")
                -- Statistics
                tooltip:AddLine(UTILS.ColorCodeText(CLM.L["Statistics:"], "44ee44"))
                tooltip:AddDoubleLine(CLM.L["Total spent"], pointInfo.spent)
                tooltip:AddDoubleLine(CLM.L["Total received"], pointInfo.received)
                tooltip:AddDoubleLine(CLM.L["Total blocked"], pointInfo.blocked)
                tooltip:AddDoubleLine(CLM.L["Total decayed"], pointInfo.decayed)
                -- Loot History
                local lootList = ST_GetProfileLoot(rowData)
                tooltip:AddLine("\n")
                if #lootList > 0 then
                    tooltip:AddLine(UTILS.ColorCodeText(CLM.L["Latest loot:"], "44ee44"))
                    local limit = #lootList - 4 -- inclusive (- 5 + 1)
                    if limit < 1 then
                        limit = 1
                    end
                    for i=#lootList, limit, -1 do
                        local loot = lootList[i]
                        local _, itemLink = GetItemInfo(loot:Id())
                        if itemLink then
                            tooltip:AddDoubleLine(itemLink, loot:Value())
                        end
                    end
                else
                    tooltip:AddLine(CLM.L["No loot received"])
                end
                -- Point History
                local pointList = ST_GetProfilePoints(rowData)
                tooltip:AddLine("\n")
                if #pointList > 0 then
                    tooltip:AddLine(UTILS.ColorCodeText(CLM.L["Latest DKP changes:"], "44ee44"))
                    for i, point in ipairs(pointList) do -- so I do have 2 different orders. Why tho
                        if i > 5 then break end
                        local reason = point:Reason() or 0
                        local value = tostring(point:Value())
                        if reason == CONSTANTS.POINT_CHANGE_REASON.DECAY then
                            value = value .. "%"
                        end
                        tooltip:AddDoubleLine(CONSTANTS.POINT_CHANGE_REASONS.ALL[reason] or "", value)
                    end
                else
                    tooltip:AddLine(CLM.L["No points received"])
                end
                -- Display
                tooltip:Show()
                return status
            end),
            -- OnLeave handler -> on hover out
            OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
                local status = st.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
                UnifiedGUI_Standings.tooltip:Hide()
                return status
            end),
            -- OnClick handler -> click
            OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
                UTILS.LibStClickHandler(st, RightClickMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
                UnifiedGUI_Standings.context = CONSTANTS.ACTION_CONTEXT.SELECTED
                CLM.GUI.Unified:RefreshOptionsPane()
                return true
            end
        }
    }
end

local function refreshHandler()
end

local function preShowHandler()
    UnifiedGUI_Standings.context = CONSTANTS.ACTION_CONTEXT.ROSTER
    if CLM.MODULES.RosterManager:IsInRaid() then
        UnifiedGUI_Standings.roster = CLM.MODULES.RosterManager:GetRaid():UID()
        UnifiedGUI_Standings.filter:SetFilterValue(CONSTANTS.FILTER.IN_RAID)
        UnifiedGUI_Standings.context = CONSTANTS.ACTION_CONTEXT.RAID
    end
end

local function storeHandler()
    local storage = CLM.GUI.Unified:GetStorage(TAB_NAME)
    storage.raid = UnifiedGUI_Standings.roster
end
    
local function restoreHandler()
    local storage = CLM.GUI.Unified:GetStorage(TAB_NAME)
    UnifiedGUI_Standings.roster = storage.raid
end
   
local function dataReadyHandler()
    if not CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_Standings.roster) then
        for _, roster in pairs(CLM.MODULES.RosterManager:GetRosters()) do
            UnifiedGUI_Standings.roster = roster:UID()
            break
        end
    end
end

CONSTANTS.ACTION_CONTEXT = {
    SELECTED = 1,
    ROSTER = 2,
    RAID = 3
}

CONSTANTS.ACTION_CONTEXT_GUI = {
    [CONSTANTS.ACTION_CONTEXT.SELECTED] = CLM.L["Selected"],
    [CONSTANTS.ACTION_CONTEXT.ROSTER] = CLM.L["Roster"],
    [CONSTANTS.ACTION_CONTEXT.RAID] = CLM.L["Raid"],
}

CONSTANTS.ACTION_CONTEXT_LIST = {
    CONSTANTS.ACTION_CONTEXT.SELECTED,
    CONSTANTS.ACTION_CONTEXT.ROSTER,
    CONSTANTS.ACTION_CONTEXT.RAID
}

CLM.GUI.Unified:RegisterTab(
    TAB_NAME,
    tableFeeder, optionsFeeder,
    {
        refreshHandler = refreshHandler,
        preShowHandler = preShowHandler,
        storeHandler = storeHandler,
        restoreHandler = restoreHandler,
        dataReadyHandler = dataReadyHandler
    })
