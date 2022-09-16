local define = LibDependencyInjection.createContext(...)

define.module("UnifiedGUI/Profiles", {"Models", "Constants", "Acl", "L", "Log", "Utils", "UnifiedGUI", "ProfileManager", "RosterManager","RaidManager"},
function(resolve, Models, CONSTANTS, Acl, L, LOG, UTILS, UnifiedGUI, ProfileManager, RosterManager, RaidManager)
local pairs, ipairs = pairs, ipairs

local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}
local colorRedTransparent = {r = 0.93, g = 0.2, b = 0.2, a = 0.3}
local colorGreenTransparent = {r = 0.2, g = 0.93, b = 0.2, a = 0.3}

local highlightLocked = UTILS.getHighlightMethod(colorRedTransparent, true)
local highlightTrusted = UTILS.getHighlightMethod(colorGreenTransparent, true)

local function ST_GetName(row)
    return row.cols[1].value
end

local function ST_GetClass(row)
    return row.cols[3].value
end

-- local function ST_GetRank(row)
--     return row.cols[6].value
-- end

-- local function ST_GetIsLocked(row)
--     return row.cols[7].value
-- end

local function ST_GetHighlight(row)
    return row.cols[8].value
end

local UnifiedGUI_Profiles = {
    name = "profiles",
    filter = Models.Filters:New(
    (function() UnifiedGUI:FilterScrollingTable() end),
    UTILS.Set({"class", "inGuild", "external", "rank", "locked"}),
    UTILS.Set({"buttons", "search"}),
    nil, 1),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIProfilesDialogTooltip", UIParent, "GameTooltipTemplate"),
}

function UnifiedGUI_Profiles:GetSelection()
    LOG:Trace("UnifiedGUI_Profiles:GetSelection()")
    local st = UnifiedGUI:GetScrollingTable()
    local profiles = {}
    -- Profiles
    local selected = st:GetSelection()
    if #selected == 0 then
        return profiles
    end
    for _,s in pairs(selected) do
        local profile = ProfileManager:GetProfileByName(ST_GetName(st:GetRow(s)))
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
    local ranks = GuildInfoListener:GetRanks()
    for i,o in pairs(ranks) do
        rankOptions[i] = o.name
    end
    rankOptions[-1] = L["Any"]
    return {
        management_header = {
            type = "header",
            name = L["Management"],
            order = 20
        },
        fill_from_guild_ranks = {
            name = L["Ranks"],
            type = "select",
            set = function(i, v) self.rank = v end,
            get = function(i) return self.rank end,
            values = rankOptions,
            width = "full",
            order = 21
        },
        fill_from_guild_min_level = {
            name = L["Minimum Level"],
            desc = L["Minimum level of players to fill from guild."],
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
            name = L["Fill from Guild"],
            desc = L["Fill profile list with players with the minimum level and ranks."],
            type = "execute",
            width = "full",
            func = (function(i)
                ProfileManager:FillFromGuild(self.rank, tonumber(self.minimumLevel) or 1)
            end),
            -- disabled = (function() return not IsInGuild() end)
            confirm = true,
            order = 23
        },
        fill_from_raid_roster = {
            name = L["Fill from Raid Roster"],
            desc = L["Fill profile list with players in current raid roster."],
            type = "execute",
            width = "full",
            func = (function(i)
                ProfileManager:FillFromRaid()
            end),
            -- disabled = (function() return not IsInRaid() end)
            confirm = true,
            order = 23
        },
        add_target = {
            name = L["Add target"],
            desc = L["Add currently selected target to list."],
            type = "execute",
            width = "full",
            func = (function(i)
                ProfileManager:AddTarget()
            end),
            confirm = true,
            order = 24
        },
        select_roster = {
            name = L["Select roster"],
            desc = L["Select roster to add profiles to."],
            type = "select",
            width = "full",
            values = RosterManager:GetRostersUidMap(),
            set = function(i, v) self.roster = v end,
            get = function(i) return self.roster end,
            order = 31
        },
        add_to_roster = {
            name = L["Add to roster"],
            desc = L["Adds selected players to the selected roster (from dropdown)."],
            type = "execute",
            width = "full",
            func = (function(i)
                RosterManager:AddProfilesToRoster(RosterManager:GetRosterByUid(self.roster), self:GetSelection())
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
    if Acl:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
        UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(UnifiedGUI_Profiles))
    end
    return options
end

local tableStructure = {
    rows = 25,
    -- columns - structure of the ScrollingTable
    columns = {
        {name = L["Name"],  width = 85, sort = LibStub("ScrollingTable").SORT_ASC},
        {name = L["Main"],  width = 85,
            color = colorGreen
        },
        {name = L["Class"], width = 100,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        },
        {name = L["Role"],  width = 60},
        {name = L["Version"],  width = 60},
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
    local profiles = ProfileManager:GetProfiles()
    for _,object in pairs(profiles) do
        local main = ""
        local isLocked = object:IsLocked()
        local profile = ProfileManager:GetProfileByGUID(object:Main())
        if profile then
            main = profile:Name()
        end
        local name = object:Name()
        local rank = ""
        if Acl:CheckLevel(CONSTANTS.ACL.LEVEL.GUILD_MASTER, name) then
            rank = L["GM"]
        elseif Acl:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER, name) then
            rank = L["Manager"]
        elseif Acl:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT, name) then
            rank = L["Assistant"]
        end
        local highlight
        if isLocked then
            highlight = highlightLocked
        elseif rank ~= "" then
            highlight = highlightTrusted
        end
        local row = { cols = {
            {value = name},
            {value = main},
            {value = UTILS.ColorCodeClass(object:Class())},
            {value = CONSTANTS.PROFILE_ROLES_GUI[object:Role()] or ""},
            {value = object:VersionString()},
            -- hidden
            {value = rank},
            {value = isLocked},
            {value = highlight}
        },
        DoCellUpdate = highlight
        }
        data[#data+1] = row
    end
    return data
end

local function beforeShowHandler()
    LOG:Trace("UnifiedGUI_Profiles beforeShowHandler()")
    if RaidManager:IsInRaid() then
        UnifiedGUI_Profiles.roster = RaidManager:GetRaid():UID()
        UnifiedGUI_Profiles.filter:SetFilterValue(CONSTANTS.FILTER.IN_RAID)
    end
end
UnifiedGUI_Profiles.RightClickMenu = UTILS.GenerateDropDownMenu(
        {
            {
                title = L["Lock selected"],
                func = (function()
                    ProfileManager:SetProfilesLock(UnifiedGUI_Profiles:GetSelection(), true)
                    UnifiedGUI:ClearSelection()
                end),
                trustedOnly = true,
                color = "cccc00"
            },
            {
                title = L["Unlock selected"],
                func = (function()
                    ProfileManager:SetProfilesLock(UnifiedGUI_Profiles:GetSelection(), false)
                    UnifiedGUI:ClearSelection()
                end),
                trustedOnly = true,
                color = "00cc00"
            },
            {
                separator = true,
                trustedOnly = true
            },
            {
                title = L["Remove selected"],
                func = (function()
                    for _,profile in ipairs(UnifiedGUI_Profiles:GetSelection()) do
                        ProfileManager:RemoveProfile(profile:GUID())
                    end
                    UnifiedGUI:ClearSelection()
                end),
                trustedOnly = true,
                color = "cc0000"
            },
        },
        Acl:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        Acl:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )
UnifiedGUI:RegisterTab(
    UnifiedGUI_Profiles.name, 4,
    tableStructure,
    tableDataFeeder,
    nil,
    verticalOptionsFeeder,
    {
        beforeShow = beforeShowHandler
    }
)
resolve(true)
end)