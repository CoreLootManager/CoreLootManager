-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs

local colorRedTransparent = {r = 0.93, g = 0.2, b = 0.2, a = 0.3}
local colorGreenTransparent = {r = 0.2, g = 0.93, b = 0.2, a = 0.3}

local highlightLocked = UTILS.getHighlightMethod(colorRedTransparent, true)
local highlightTrusted = UTILS.getHighlightMethod(colorGreenTransparent, true)

local function ST_GetName(row)
    return row.cols[2].value
end

local function ST_GetClass(row)
    return row.cols[9].value
end

local function ST_GetHighlight(row)
    return row.cols[8].value
end

local UnifiedGUI_Profiles = {
    name = "profiles",
    filter = CLM.MODELS.Filters:New(
    (function() CLM.GUI.Unified:FilterScrollingTable() end),
    UTILS.Set({"class", "inRaid", "inStandby", "inGuild", "external", "rank", "locked"}),
    UTILS.Set({"buttons", "search"}),
    nil, 1),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIProfilesDialogTooltip", UIParent, "GameTooltipTemplate"),
}

function UnifiedGUI_Profiles:GetSelection()
    LOG:Trace("UnifiedGUI_Profiles:GetSelection()")
    local st = CLM.GUI.Unified:GetScrollingTable()
    local profiles = {}
    -- Profiles
    local selected = st:GetSelection()
    if #selected == 0 then
        return profiles
    end
    for _,s in pairs(selected) do
        local profile = CLM.MODULES.ProfileManager:GetProfileByName(ST_GetName(st:GetRow(s)))
        if profile then
            profiles[#profiles + 1] = profile
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
            max  = 80,
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
            end),
            confirm = true,
            order = 24
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
            desc = CLM.L["Adds selected players to the selected roster (from dropdown)."],
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

local function verticalOptionsFeeder()
    local options = {
        type = "group",
        args = {}
    }
    UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_Profiles))
    if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(UnifiedGUI_Profiles))
    end
    return options
end

local tableStructure = {
    rows = 25,
    -- columns - structure of the ScrollingTable
    columns = {
        {name = "", width = 18, DoCellUpdate = UTILS.LibStClassCellUpdate},
        {name = CLM.L["Name"],  width = 115, sort = LibStub("ScrollingTable").SORT_ASC},
        {name = CLM.L["Main"],  width = 115 },
        {name = CLM.L["Role"],  width = 60},
        {name = CLM.L["Version"],  width = 70,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFnVersion)
        }
    },
    -- Function to filter ScrollingTable
    filter = (function(stobject, row)
        local playerName = ST_GetName(row)
        local class = ST_GetClass(row)
        return UnifiedGUI_Profiles.filter:Filter(playerName, class, {playerName, class})
    end),
    -- Events to override for ScrollingTable
    events = {
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            return status
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            local highlight = ST_GetHighlight(rowData)
            if highlight then
                highlight(rowFrame, cellFrame, data, cols, row, realrow, column, true, table, ...)
            end
            return status
        end),
        -- OnClick handler -> click
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStClickHandler(table, UnifiedGUI_Profiles.RightClickMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            return true
        end
    }
}

local function tableDataFeeder()
    LOG:Trace("UnifiedGUI_Profiles tableDataFeeder()")
    local data = {}
    local profiles = CLM.MODULES.ProfileManager:GetProfiles()
    for _,object in pairs(profiles) do
        local isLocked = object:IsLocked()
        local profileMain = CLM.MODULES.ProfileManager:GetProfileByGUID(object:Main())
        local name = object:Name()
        local rank = ""
        if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER, name) then
            rank = CLM.L["GM"]
        elseif CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER, name) then
            rank = CLM.L["Manager"]
        elseif CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
            rank = CLM.L["Assistant"]
        end
        local profile = CLM.MODULES.ProfileManager:GetProfileByName(name)
        local highlight
        if isLocked then
            highlight = highlightLocked
        elseif rank ~= "" then
            highlight = highlightTrusted
        end
        local classColor = UTILS.GetClassColor(profile:ClassInternal())
        local mainColor
        local main = ""
        if profileMain then
            main = profileMain:Name()
            mainColor = UTILS.GetClassColor(profileMain:ClassInternal())
        end
        local row = { cols = {
            {value = profile:ClassInternal()},
            {value = profile:Name(), color = classColor},
            {value = main, color = mainColor},
            {value = CONSTANTS.PROFILE_ROLES_GUI[object:Role()] or ""},
            {value = object:VersionString()},
            -- hidden
            {value = rank},
            {value = isLocked},
            {value = highlight},
            {value = object:Class()}
        },
        DoCellUpdate = highlight
        }
        data[#data+1] = row
    end
    return data
end

local function initializeHandler()
    LOG:Trace("UnifiedGUI_Profiles initializeHandler()")
    UnifiedGUI_Profiles.RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            {
                title = CLM.L["Lock selected"],
                func = (function()
                    CLM.MODULES.ProfileManager:SetProfilesLock(UnifiedGUI_Profiles:GetSelection(), true)
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                color = "cccc00"
            },
            {
                title = CLM.L["Unlock selected"],
                func = (function()
                    CLM.MODULES.ProfileManager:SetProfilesLock(UnifiedGUI_Profiles:GetSelection(), false)
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                color = "00cc00"
            },
            {
                separator = true,
                trustedOnly = true
            },
            {
                title = CLM.L["Remove selected"],
                func = (function()
                    for _,profile in ipairs(UnifiedGUI_Profiles:GetSelection()) do
                        CLM.MODULES.ProfileManager:RemoveProfile(profile:GUID())
                    end
                    CLM.GUI.Unified:ClearSelection()
                end),
                trustedOnly = true,
                color = "cc0000"
            },
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )
end

local function beforeShowHandler()
    LOG:Trace("UnifiedGUI_Profiles beforeShowHandler()")
    if CLM.MODULES.RaidManager:IsInRaid() then
        UnifiedGUI_Profiles.roster = CLM.MODULES.RaidManager:GetRaid():UID()
        UnifiedGUI_Profiles.filter:SetFilterValue(CONSTANTS.FILTER.IN_RAID, true)
    end
end

CLM.GUI.Unified:RegisterTab(
    UnifiedGUI_Profiles.name, 4,
    tableStructure,
    tableDataFeeder,
    nil,
    verticalOptionsFeeder,
    {
        initialize = initializeHandler,
        beforeShow = beforeShowHandler
    }
)
