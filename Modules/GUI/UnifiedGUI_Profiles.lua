-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local sformat = string.format

-- local colorRed = {r = 0.93, g = 0.2, b = 0.2, a = 1.0}
local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}

local function ST_GetName(row)
    return row.cols[1].value
end

local function ST_GetClass(row)
    return row.cols[2].value
end

local function refreshFn(...)
    CLM.GUI.Unified:Refresh(...)
end

local UnifiedGUI_Profiles = {
    name = "profiles",
    filter = CLM.MODELS.Filters:New(refreshFn, true, false, false, true, true, false, false, true, true, nil, 1),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIProfilesDialogTooltip", UIParent, "GameTooltipTemplate"),
}

function UnifiedGUI_Profiles:GetSelection()
    local st = CLM.GUI.Unified:GetScrollingTable()
    local profiles = {}
    -- Profiles
    local selected = st:GetSelection()
    if #selected == 0 then -- nothing selected: assume all visible are selected
        return profiles
    end
    for _,s in pairs(selected) do
        local profile = CLM.MODULES.ProfileManager:GetProfileByName(ST_GetName(st:GetRow(s)))
        if profile then
            tinsert(profiles, profile)
        else
            LOG:Debug("No profile for %s", ST_GetName(st:GetRow(s)))
        end
    end
    return profiles
end

local function GenerateUntrustedOptions(self)
    return self.filter:GetAceOptions()
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
                -- refreshFn()
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
                -- refreshFn()
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
                -- refreshFn()
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
                for _,profile in ipairs(self:GetSelection()) do
                    CLM.MODULES.ProfileManager:RemoveProfile(profile:GUID())
                end
                -- refreshFn()
            end),
            confirm = true,
            order = 25
        },
        select_roster = {
            name = CLM.L["Select roster"],
            desc = CLM.L["Select roster to add profiles to."],
            type = "select",
            width = "full",
            values = CLM.MODULES.RosterManager:GetRostersUidMap(),
            set = function(i, v) self.roster = v end,
            get = function(i) return self.roster end,
            order = 31
        },
        add_to_roster = {
            name = CLM.L["Add to roster"],
            desc = CLM.L["Adds selected players or everyone if none selected to the selected roster (from dropdown)."],
            type = "execute",
            width = "full",
            func = (function(i)
                CLM.MODULES.RosterManager:AddProfilesToRoster(CLM.MODULES.RosterManager:GetRosterByUid(self.roster), self:GetSelection())
            end),
            confirm = true,
            order = 32
        },
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
    UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_Profiles))
    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(UnifiedGUI_Profiles))
    end
    -- if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
    --     UTILS.mergeDictsInline(options.args, GenerateManagerOptions(UnifiedGUI_Profiles))
    -- end
    -- if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER) then
    --     UTILS.mergeDictsInline(options.args, GenerateGMOptions(UnifiedGUI_Profiles))
    -- end
    UnifiedGUI_Profiles.options = options
    return options
end

local tableStructure = {
    -- columns - structure of the ScrollingTable
    columns = {
        {name = CLM.L["Name"],  width = 80},
        {name = CLM.L["Class"], width = 80,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        },
        {name = CLM.L["Spec"],  width = 60},
        {name = CLM.L["Main"],  width = 80,
            color = colorGreen
        },
        {name = CLM.L["Rank"],  width = 60},
        {name = CLM.L["Version"],  width = 60},
    },
    -- Function to filter ScrollingTable
    filter = (function(stobject, row)
        local playerName = ST_GetName(row)
        local class = ST_GetClass(row)
        return UnifiedGUI_Profiles.filter:Filter(playerName, class, {playerName, class})
    end),
    -- Events to override for ScrollingTable
    events = {
        -- -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            -- local rowData = table:GetRow(realrow)
            -- if not rowData or not rowData.cols then return status end
            -- local tooltip = UnifiedGUI_Profiles.tooltip
            -- if not tooltip then return end
            -- tooltip:SetOwner(rowFrame, "ANCHOR_RIGHT")
            -- local weeklyGain = ST_GetWeeklyGains(rowData)
            -- local weeklyCap = ST_GetWeeklyCap(rowData)
            -- local gains = weeklyGain
            -- if weeklyCap > 0 then
            --     gains = gains .. " / " .. weeklyCap
            -- end
            -- local pointInfo = ST_GetPointInfo(rowData)
            -- tooltip:AddDoubleLine(CLM.L["Information"], CLM.L["DKP"])
            -- tooltip:AddDoubleLine(CLM.L["Weekly gains"], gains)
            -- tooltip:AddLine("\n")
            -- -- Statistics
            -- tooltip:AddLine(UTILS.ColorCodeText(CLM.L["Statistics:"], "44ee44"))
            -- tooltip:AddDoubleLine(CLM.L["Total spent"], pointInfo.spent)
            -- tooltip:AddDoubleLine(CLM.L["Total received"], pointInfo.received)
            -- tooltip:AddDoubleLine(CLM.L["Total blocked"], pointInfo.blocked)
            -- tooltip:AddDoubleLine(CLM.L["Total decayed"], pointInfo.decayed)
            -- -- Loot History
            -- local lootList = ST_GetProfileLoot(rowData)
            -- tooltip:AddLine("\n")
            -- if #lootList > 0 then
            --     tooltip:AddLine(UTILS.ColorCodeText(CLM.L["Latest loot:"], "44ee44"))
            --     local limit = #lootList - 4 -- inclusive (- 5 + 1)
            --     if limit < 1 then
            --         limit = 1
            --     end
            --     for i=#lootList, limit, -1 do
            --         local loot = lootList[i]
            --         local _, itemLink = GetItemInfo(loot:Id())
            --         if itemLink then
            --             tooltip:AddDoubleLine(itemLink, loot:Value())
            --         end
            --     end
            -- else
            --     tooltip:AddLine(CLM.L["No loot received"])
            -- end
            -- -- Point History
            -- local pointList = ST_GetProfilePoints(rowData)
            -- tooltip:AddLine("\n")
            -- if #pointList > 0 then
            --     tooltip:AddLine(UTILS.ColorCodeText(CLM.L["Latest DKP changes:"], "44ee44"))
            --     for i, point in ipairs(pointList) do -- so I do have 2 different orders. Why tho
            --         if i > 5 then break end
            --         local reason = point:Reason() or 0
            --         local value = tostring(point:Value())
            --         if reason == CONSTANTS.POINT_CHANGE_REASON.DECAY then
            --             value = value .. "%"
            --         end
            --         tooltip:AddDoubleLine(CONSTANTS.POINT_CHANGE_REASONS.ALL[reason] or "", value)
            --     end
            -- else
            --     tooltip:AddLine(CLM.L["No points received"])
            -- end
            -- -- Display
            -- tooltip:Show()
            return status
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            -- UnifiedGUI_Profiles.tooltip:Hide()
            return status
        end),
        -- OnClick handler -> click
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStClickHandler(table, UnifiedGUI_Profiles.RightClickMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UnifiedGUI_Profiles.context = CONSTANTS.ACTION_CONTEXT.SELECTED
            CLM.GUI.Unified:RefreshOptionsPane()
            return true
        end
    }
}

local function tableDataFeeder()
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
    end
    return data
end

local function initializeHandler()
    -- UnifiedGUI_Profiles.RightClickMenu = CLM.UTILS.GenerateDropDownMenu({
    --     {
    --         title = CLM.L["Add to standby"],
    --         func = (function()
    --             if not CLM.MODULES.RaidManager:IsInRaid() then
    --                 LOG:Message(CLM.L["Not in raid"])
    --                 return
    --             end
    --             local profiles = UnifiedGUI_Profiles:GetSelection()
    --             local raid = CLM.MODULES.RaidManager:GetRaid()
    --             local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_Profiles.roster)
    --             if roster ~= raid:Roster() then
    --                 LOG:Message(sformat(
    --                     CLM.L["You can only bench players from same roster as the raid (%s)."],
    --                     CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID())
    --                 ))
    --                 return
    --             end

    --             if CLM.MODULES.RaidManager:IsInProgressingRaid() then
    --                 if #profiles > 10 then
    --                     LOG:Message(sformat(
    --                         CLM.L["You can %s max %d players to standby at the same time to a %s raid."],
    --                         CLM.L["add"], 10, CLM.L["progressing"]
    --                     ))
    --                     return
    --                 end
    --                 CLM.MODULES.RaidManager:AddToStandby(CLM.MODULES.RaidManager:GetRaid(), profiles)
    --             elseif CLM.MODULES.RaidManager:IsInCreatedRaid() then
    --                 if #profiles > 25 then
    --                     LOG:Message(sformat(
    --                         CLM.L["You can %s max %d players to standby at the same time to a %s raid."],
    --                         CLM.L["add"], 25, CLM.L["created"]
    --                     ))
    --                     return
    --                 end
    --                 for _, profile in ipairs(profiles) do
    --                     CLM.MODULES.StandbyStagingManager:AddToStandby(CLM.MODULES.RaidManager:GetRaid():UID(), profile:GUID())
    --                 end
    --             end
    --             refreshFn(true)
    --         end),
    --         trustedOnly = true,
    --         color = "eeee00"
    --     },
    --     {
    --         title = CLM.L["Remove from standby"],
    --         func = (function()
    --             if not CLM.MODULES.RaidManager:IsInRaid() then
    --                 LOG:Message(CLM.L["Not in raid"])
    --                 return
    --             end
    --             local profiles = UnifiedGUI_Profiles:GetSelection()
    --             local raid = CLM.MODULES.RaidManager:GetRaid()
    --             local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_Profiles.roster)
    --             if roster ~= raid:Roster() then
    --                 LOG:Message(sformat(
    --                     CLM.L["You can only remove from bench players from same roster as the raid (%s)."],
    --                     CLM.MODULES.RosterManager:GetRosterNameByUid(raid:Roster():UID())
    --                 ))
    --                 return
    --             end

    --             if CLM.MODULES.RaidManager:IsInProgressingRaid() then
    --                 if #profiles > 10 then
    --                     LOG:Message(sformat(
    --                         CLM.L["You can %s max %d players from standby at the same time to a %s raid."],
    --                         CLM.L["remove"], 10, CLM.L["progressing"]
    --                     ))
    --                     return
    --                 end
    --                 CLM.MODULES.RaidManager:RemoveFromStandby(CLM.MODULES.RaidManager:GetRaid(), profiles)
    --             elseif CLM.MODULES.RaidManager:IsInCreatedRaid() then
    --                 if #profiles > 25 then
    --                     LOG:Message(sformat(
    --                         CLM.L["You can %s max %d players from standby at the same time to a %s raid."],
    --                         CLM.L["remove"], 25, CLM.L["created"]
    --                     ))
    --                     return
    --                 end
    --                 for _, profile in ipairs(profiles) do
    --                     CLM.MODULES.StandbyStagingManager:RemoveFromStandby(CLM.MODULES.RaidManager:GetRaid():UID(), profile:GUID())
    --                 end
    --             end
    --             refreshFn(true)
    --         end),
    --         trustedOnly = true,
    --         color = "eeee00"
    --     },
    --     {
    --         separator = true,
    --         trustedOnly = true
    --     },
    --     {
    --         title = CLM.L["Remove from roster"],
    --         func = (function(i)
    --             local profiles = UnifiedGUI_Profiles:GetSelection()
    --             local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_Profiles.roster)
    --             if roster == nil then
    --                 LOG:Debug("UnifiedGUI_Profiles(Remove): roster == nil")
    --                 return
    --             end
    --             if not profiles or #profiles == 0 then
    --                 LOG:Debug("UnifiedGUI_Profiles(Remove): profiles == 0")
    --                 return
    --             end
    --             if #profiles > 10 then
    --                 LOG:Message(sformat(
    --                     CLM.L["You can remove max %d players from roster at the same time."],
    --                     10
    --                 ))
    --                 return
    --             end
    --             CLM.MODULES.RosterManager:RemoveProfilesFromRoster(roster, profiles)
    --         end),
    --         trustedOnly = true,
    --         color = "cc0000"
    --     },
    -- },
    -- CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
    -- CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    -- )
end

-- local function refreshHandler()
-- end

local function beforeShowHandler()
    if CLM.MODULES.RaidManager:IsInRaid() then
        UnifiedGUI_Profiles.roster = CLM.MODULES.RaidManager:GetRaid():UID()
        UnifiedGUI_Profiles.filter:SetFilterValue(CONSTANTS.FILTER.IN_RAID)
    end
end

-- local function storeHandler()
--     local storage = CLM.GUI.Unified:GetStorage(UnifiedGUI_Profiles.name)
-- end

-- local function restoreHandler()
--     local storage = CLM.GUI.Unified:GetStorage(UnifiedGUI_Profiles.name)
-- end

-- local function dataReadyHandler()
-- end

CLM.GUI.Unified:RegisterTab(
    UnifiedGUI_Profiles.name,
    tableStructure,
    tableDataFeeder,
    horizontalOptionsFeeder,
    verticalOptionsFeeder,
    {
        initialize = initializeHandler,
        -- refresh = refreshHandler,
        beforeShow = beforeShowHandler,
        -- store = storeHandler,
        -- restore = restoreHandler,
        -- dataReady = dataReadyHandler
    }
)
