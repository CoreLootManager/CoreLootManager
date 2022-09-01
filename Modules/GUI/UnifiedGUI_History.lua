-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local sformat, sgsub, tsort = string.format, string.gsub, table.sort

-- local colorRed = {r = 0.93, g = 0.2, b = 0.2, a = 1.0}
local colorGreen = {r = 0.2, g = 0.93, b = 0.2, a = 1.0}

CONSTANTS.HISTORY_TYPE = {
    ALL = 1,
    LOOT = 2,
    POINT = 3
}

CONSTANTS.HISTORY_TYPES_GUI = {
    [CONSTANTS.HISTORY_TYPE.ALL] = CLM.L["All"],
    [CONSTANTS.HISTORY_TYPE.LOOT] = CLM.L["Loot"],
    [CONSTANTS.HISTORY_TYPE.POINT] = CLM.L["Point"]
}

local function ST_GetInfo(row)
    return row.cols[1].value
end

local function ST_GetValue(row)
    return row.cols[2].value
end

local function ST_GetIsLoot(row)
    return row.cols[5].value
end

local function ST_GetObject(row)
    return row.cols[6].value
end


local function refreshFn(...)
    CLM.GUI.Unified:Refresh(...)
end

local UnifiedGUI_History = {
    name = "history",
    filter = CLM.MODELS.Filters:New(
    refreshFn,
    {},
    UTILS.Set({
        "search", "horizontal"
    }),
    nil, 3),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIHistoryDialogTooltip", UIParent, "GameTooltipTemplate"),
    historyType = CONSTANTS.HISTORY_TYPE.ALL
}

function UnifiedGUI_History:GetSelection()
    -- local st = CLM.GUI.Unified:GetScrollingTable()
    -- local profiles = {}
    -- -- Roster
    -- local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.roster)
    -- if not roster then
    --     return profiles
    -- end
    -- -- Profiles
    -- local selected = st:GetSelection()
    -- if #selected == 0 then -- nothing selected: assume all visible are selected
    --     return profiles
    -- end
    -- for _,s in pairs(selected) do
    --     local profile = CLM.MODULES.ProfileManager:GetProfileByName(ST_GetInfo(st:GetRow(s)))
    --     if profile then
    --         tinsert(profiles, profile)
    --     else
    --         LOG:Debug("No profile for %s", ST_GetInfo(st:GetRow(s)))
    --     end
    -- end
    -- return profiles
end

local function GenerateUntrustedOptions(self)
    local options = {}
    local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.roster)
    if not roster then return {} end
    local profiles = roster:Profiles()
    local profileNameMap = { [CLM.L["-- All --"]] = CLM.L["-- All --"]}
    local profileList = {CLM.L["-- All --"]}
    for _, GUID in ipairs(profiles) do
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
        if profile then
            profileNameMap[profile:Name()] = profile:Name()
            profileList[#profileList + 1] = profile:Name()
        end
    end
    tsort(profileList)

    options.roster = {
        name = CLM.L["Roster"],
        type = "select",
        values = CLM.MODULES.RosterManager:GetRostersUidMap(),
        set = function(i, v)
            self.roster = v
            refreshFn()
        end,
        get = function(i) return self.roster end,
        order = 0
    }
    options.player = {
        name = CLM.L["Player"],
        type = "select",
        values = profileNameMap,
        sorting = profileList,
        set = function(i, v)
            self.profile = v
            refreshFn()
        end,
        get = function(i) return self.profile end,
        order = 1
    }
    options.history = {
        name = CLM.L["History type"],
        type = "select",
        values = CONSTANTS.HISTORY_TYPES_GUI,
        set = function(i, v)
            self.historyType = v
            refreshFn()
        end,
        get = function(i) return self.historyType end,
        width = 0.75,
        order = 4
    }
    UTILS.mergeDictsInline(options, self.filter:GetAceOptions())
    return options
end

-- local function GenerateAssistantOptions(self)
--     return {
--         award_header = {
--             type = "header",
--             name = CLM.L["Management"],
--             order = 9
--         },
--         action_context = {
--             name = CLM.L["Action context"],
--             type = "select",
--             values = CONSTANTS.ACTION_CONTEXT_GUI,
--             set = function(i, v) self.context = v end,
--             get = function(i) return self.context end,
--             order = 10,
--             width = "full"
--         },
--         award_dkp_note = {
--             name = CLM.L["Note"],
--             desc = (function()
--                 local n = CLM.L["Note to be added to award. Max 25 characters. It is recommended to not include date nor selected reason here. If you will input encounter ID it will be transformed into boss name."]
--                 if strlen(self.note or "") > 0 then
--                     n = n .. "\n\n|cffeeee00Note:|r " .. self.note
--                 end
--                 return n
--             end),
--             type = "input",
--             set = function(i, v) self.note = v end,
--             get = function(i) return self.note end,
--             width = "full",
--             order = 12
--         },
--         award_reason = {
--             name = CLM.L["Reason"],
--             type = "select",
--             values = CONSTANTS.POINT_CHANGE_REASONS.GENERAL,
--             set = function(i, v) self.awardReason = v end,
--             get = function(i) return self.awardReason end,
--             order = 11,
--             width = "full"
--         },
--         award_dkp_value = {
--             name = CLM.L["Award value"],
--             desc = CLM.L["Points value that will be awarded."],
--             type = "input",
--             set = function(i, v) self.awardValue = v end,
--             get = function(i) return self.awardValue end,
--             width = 0.575,
--             pattern = CONSTANTS.REGEXP_FLOAT,
--             order = 13
--         },
--         award_dkp = {
--             name = CLM.L["Award"],
--             desc = CLM.L["Award DKP to selected players or everyone if none selected."],
--             type = "execute",
--             width = 0.575,
--             func = (function(i)
--                 -- Award Value
--                 local awardValue = tonumber(self.awardValue)
--                 if not awardValue then LOG:Debug("UnifiedGUI_History(Award): missing award value"); return end
--                 -- Reason
--                 local awardReason
--                 if self.awardReason and CONSTANTS.POINT_CHANGE_REASONS.GENERAL[self.awardReason] then
--                     awardReason = self.awardReason
--                 else
--                     LOG:Debug("UnifiedGUI_History(Award): missing reason");
--                     awardReason = CONSTANTS.POINT_CHANGE_REASON.MANUAL_ADJUSTMENT
--                 end
--                 local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.roster)
--                 if self.context == CONSTANTS.ACTION_CONTEXT.RAID then
--                     if CLM.MODULES.RaidManager:IsInRaid() then
--                         CLM.MODULES.PointManager:UpdateRaidPoints(CLM.MODULES.RaidManager:GetRaid(), awardValue, awardReason, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, self.note)
--                     else
--                         LOG:Warning("You are not in raid.")
--                     end
--                 elseif self.context == CONSTANTS.ACTION_CONTEXT.ROSTER then
--                     if roster then
--                         CLM.MODULES.PointManager:UpdateRosterPoints(roster, awardValue, awardReason, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, false, self.note)
--                     else
--                         LOG:Warning("Missing valid roster.")
--                     end
--                 elseif self.context == CONSTANTS.ACTION_CONTEXT.SELECTED then
--                     local profiles = UnifiedGUI_History:GetSelection()
--                     if not profiles or #profiles == 0 then
--                         LOG:Message(CLM.L["No players selected"])
--                         LOG:Debug("UnifiedGUI_History(Award): profiles == 0")
--                         return
--                     end
--                     if roster then
--                         CLM.MODULES.PointManager:UpdatePoints(roster, profiles, awardValue, awardReason, CONSTANTS.POINT_MANAGER_ACTION.MODIFY, self.note)
--                     else
--                         LOG:Warning("Missing valid roster.")
--                     end
--                 end
--             end),
--             confirm = true,
--             order = 14
--         }
--     }
-- end

-- local function GenerateManagerOptions(self)
--     return {
--         decay_dkp_value = {
--             name = CLM.L["Decay %"],
--             desc = CLM.L["% that will be decayed."],
--             type = "input",
--             set = function(i, v) self.decayValue = v end,
--             get = function(i) return self.decayValue end,
--             width = 0.575,
--             pattern = CONSTANTS.REGEXP_FLOAT,
--             order = 21
--         },
--         decay_negative = {
--             name = CLM.L["Decay Negatives"],
--             desc = CLM.L["Include players with negative standings in decay."],
--             type = "toggle",
--             set = function(i, v) self.includeNegative = v end,
--             get = function(i) return self.includeNegative end,
--             width = "full",
--             order = 23
--         },
--         decay_dkp = {
--             name = CLM.L["Decay"],
--             desc = CLM.L["Execute decay for selected players or everyone if none selected."],
--             type = "execute",
--             width = 0.575,
--             func = (function(i)
--                 -- Decay Value
--                 local decayValue = tonumber(self.decayValue)
--                 if not decayValue then LOG:Debug("UnifiedGUI_History(Decay): missing decay value"); return end
--                 if decayValue > 100 or decayValue < 0 then LOG:Warning("Standings: Decay value should be between 0 and 100%"); return end
--                 local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.roster)
--                 if roster == nil then
--                     LOG:Debug("UnifiedGUI_History(Decay): roster == nil")
--                     return
--                 end
--                 if self.context == CONSTANTS.ACTION_CONTEXT.ROSTER then
--                     CLM.MODULES.PointManager:UpdateRosterPoints(roster, decayValue, CONSTANTS.POINT_CHANGE_REASON.DECAY, CONSTANTS.POINT_MANAGER_ACTION.DECAY, not self.includeNegative)
--                 elseif self.context == CONSTANTS.ACTION_CONTEXT.SELECTED then
--                     local profiles = UnifiedGUI_History:GetSelection()
--                     if not profiles or #profiles == 0 then
--                         LOG:Message(CLM.L["No players selected"])
--                         LOG:Debug("UnifiedGUI_History(Decay): profiles == 0")
--                         return
--                     end
--                     CLM.MODULES.PointManager:UpdatePoints(roster, profiles, decayValue, CONSTANTS.POINT_CHANGE_REASON.DECAY, CONSTANTS.POINT_MANAGER_ACTION.DECAY)
--                 else
--                     LOG:Warning("Invalid context. You should not decay raid only.")
--                 end
--             end),
--             confirm = true,
--             order = 22
--         }
--     }
-- end

local function horizontalOptionsFeeder()
    local options = {
        type = "group",
        args = {

        }
    }
    UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_History))
    return options
end

local function verticalOptionsFeeder()
    local options = {
        type = "group",
        args = {}
    }
    -- UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_History))
    -- if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT) then
    --     UTILS.mergeDictsInline(options.args, GenerateAssistantOptions(UnifiedGUI_History))
    -- end
    -- if CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then
    --     UTILS.mergeDictsInline(options.args, GenerateManagerOptions(UnifiedGUI_History))
    -- end
    return options
end

local tableStructure = {
    rows = 22,
    -- columns - structure of the ScrollingTable
    columns = {
        {name = CLM.L["Info"],  width = 235 },
        {name = CLM.L["Value"], width = 85, color = colorGreen,
            comparesort = UTILS.LibStCompareSortWrapper(function(a1,b1)
                return tonumber(sgsub(a1, "%%", "")), tonumber(sgsub(b1, "%%", ""))
            end)
        },
        {name = CLM.L["Date"],  width = 205, sort = LibStub("ScrollingTable").SORT_DSC},
        {name = CLM.L["Player"],width = 95,
            comparesort = UTILS.LibStCompareSortWrapper(UTILS.LibStModifierFn)
        }
    },
    -- Function to filter ScrollingTable
    filter = (function(stobject, row)
        return UnifiedGUI_History.filter:Filter("", "", {ST_GetInfo(row)})
    end),
    -- Events to override for ScrollingTable
    events = {
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            local tooltip = UnifiedGUI_History.tooltip
            if not tooltip then return end
            tooltip:SetOwner(rowFrame, "ANCHOR_RIGHT")
            -- ------------------------------ --
            if ST_GetIsLoot(rowData) == true then
                -- ----------- Loot ------------- --
                local itemLink = ST_GetInfo(rowData) or ""
                local itemId = UTILS.GetItemIdFromLink(itemLink)
                local itemString = "item:" .. tonumber(itemId)
                tooltip:SetHyperlink(itemString)
                local loot = ST_GetObject(rowData)
                if loot then
                    local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(loot:Creator()))
                    local name
                    if profile then
                        name = UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex)
                    else
                        name = CLM.L["Unknown"]
                    end
                    local raid = CLM.MODULES.RaidManager:GetRaidByUid(loot:RaidUid())
                    if raid then
                        tooltip:AddLine(raid:Name())
                    end
                    tooltip:AddDoubleLine(CLM.L["Awarded by"], name)
                    local auction = CLM.MODULES.AuctionHistoryManager:GetByUUID(loot:Entry():uuid())
                    if auction then
                        tooltip:AddLine(CLM.L["Bids"])
                        for bidder, bid in pairs(auction.bids) do
                            local bidderProfile = CLM.MODULES.ProfileManager:GetProfileByName(bidder)
                            if bidderProfile then
                                bidder = UTILS.ColorCodeText(bidder, UTILS.GetClassColor(bidderProfile:Class()).hex)
                            end
                            tooltip:AddDoubleLine(bidder, bid)
                        end
                    end
                end
            elseif ST_GetIsLoot(rowData) == false then
                -- ----------- Point ------------ --
                local history = ST_GetObject(rowData)
                local profiles = history:Profiles()
                local numProfiles = #profiles
                tooltip:AddDoubleLine(CLM.L["Affected players:"], tostring(numProfiles))
                if not profiles or numProfiles == 0 then
                    tooltip:AddLine(CLM.L["None"])
                else
                    UTILS.buildPlayerListForTooltip(profiles, tooltip)
                end
                local note = history:Note()
                if note ~= "" then
                    local numNote = tonumber(note)
                    if numNote then
                        note = CLM.EncounterIDsMap[numNote] or note
                    end
                    tooltip:AddDoubleLine(CLM.L["Note"] .. "", note)
                end
                local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(history:Creator()))
                local name
                if profile then
                    name = UTILS.ColorCodeText(profile:Name(), UTILS.GetClassColor(profile:Class()).hex)
                else
                    name = CLM.L["Unknown"]
                end
                tooltip:AddDoubleLine(CLM.L["Awarded by"], name)
            else
                return status
            end
            -- ------------------------------ --
            -- Display
            tooltip:Show()
            return status
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            UnifiedGUI_History.tooltip:Hide()
            return status
        end),
        -- OnClick handler -> click
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStClickHandler(table, UnifiedGUI_History.RightClickMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            return true
        end
    }
}

local function tableDataFeeder()
    local data = {}

    local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_History.roster)
    if not roster then return {} end
    -- TODO: Change from loot type and profile name to filter as its faster
    local profile = CLM.MODULES.ProfileManager:GetProfileByName(UnifiedGUI_History.profile or "")
    if UnifiedGUI_History.historyType ~= CONSTANTS.HISTORY_TYPE.POINT then
        local isProfileLoot = (profile and roster:IsProfileInRoster(profile:GUID()))
        local lootList
        -- player loot
        if isProfileLoot then
            lootList = roster:GetProfileLootByGUID(profile:GUID())
        else -- raid loot
            lootList = roster:GetRaidLoot()
        end

        local displayedLoot = {}
        UnifiedGUI_History.pendingLoot = false

        for _,loot in ipairs(lootList) do
            if GetItemInfoInstant(loot:Id()) then
                local _, itemLink = GetItemInfo(loot:Id())
                if not itemLink then
                    UnifiedGUI_History.pendingLoot = true
                elseif not UnifiedGUI_History.pendingLoot then -- dont populate if we will be skipping it anyway - not displaying partially atm
                    local owner = loot:Owner()
                    displayedLoot[#displayedLoot+1] = {loot, itemLink, UTILS.ColorCodeText(owner:Name(), UTILS.GetClassColor(owner:Class()).hex)}
                end
            end
        end

        if UnifiedGUI_History.pendingLoot then
            return {{cols = { {value = ""}, {value = ""}, {value = CLM.L["Loading..."]}, {value = ""}, {value = nil} }}}
        end

        for _,lootData in ipairs(displayedLoot) do
            local loot = lootData[1] --
            local row = {cols = {
                {value = lootData[2]}, -- itemLink
                {value = loot:Value()},
                {value = date(CLM.L["%Y/%m/%d %H:%M:%S (%A)"], loot:Timestamp())},
                {value = lootData[3]}, -- owner
                -- Not visible
                {value = true}, -- is Loot
                {value = loot} -- Loot Object
            }}
            data[#data + 1] =  row
        end
    end

    if UnifiedGUI_History.historyType ~= CONSTANTS.HISTORY_TYPE.LOOT then
        local isProfileHistory = (profile and roster:IsProfileInRoster(profile:GUID()))

        local pointList
        -- player loot
        if isProfileHistory then
            pointList = roster:GetProfilePointHistoryByGUID(profile:GUID())
        else -- raid loot
            pointList = roster:GetRaidPointHistory()
        end

        for _,history in ipairs(pointList) do
            local reason = history:Reason() or 0
            local value = tostring(history:Value())
            if reason == CONSTANTS.POINT_CHANGE_REASON.DECAY then
                value = value .. "%"
            end
            -- local awardedBy
            -- local creator = CLM.MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(history:Creator()))
            -- if creator then
            --     awardedBy = UTILS.ColorCodeText(creator:Name(), UTILS.GetClassColor(creator:Class()).hex)
            -- else
            --     awardedBy = ""
            -- end
            local row = {cols = {
                {value = CONSTANTS.POINT_CHANGE_REASONS.ALL[reason] or ""},
                {value = value},
                {value = date(CLM.L["%Y/%m/%d %H:%M:%S (%A)"], history:Timestamp())},
                {value = CLM.L["Multiple"]},
                {value = false},
                {value = history}
            }}
            data[#data + 1] =  row
        end
    end
    return data
end

local function initializeHandler()
    UnifiedGUI_History.RightClickMenu = CLM.UTILS.GenerateDropDownMenu({
        {
            title = CLM.L["Add to standby"],
            func = (function()
                if not CLM.MODULES.RaidManager:IsInRaid() then
                    LOG:Message(CLM.L["Not in raid"])
                    return
                end
                local profiles = UnifiedGUI_History:GetSelection()
                local raid = CLM.MODULES.RaidManager:GetRaid()
                local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_History.roster)
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
                local profiles = UnifiedGUI_History:GetSelection()
                local raid = CLM.MODULES.RaidManager:GetRaid()
                local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_History.roster)
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
                local profiles = UnifiedGUI_History:GetSelection()
                local roster = CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_History.roster)
                if roster == nil then
                    LOG:Debug("UnifiedGUI_History(Remove): roster == nil")
                    return
                end
                if not profiles or #profiles == 0 then
                    LOG:Debug("UnifiedGUI_History(Remove): profiles == 0")
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
end

-- local function refreshHandler()
-- end

local function beforeShowHandler()
    UnifiedGUI_History.context = CONSTANTS.ACTION_CONTEXT.ROSTER
    if CLM.MODULES.RaidManager:IsInRaid() then
        UnifiedGUI_History.roster = CLM.MODULES.RaidManager:GetRaid():UID()
        UnifiedGUI_History.filter:SetFilterValue(CONSTANTS.FILTER.IN_RAID)
        UnifiedGUI_History.context = CONSTANTS.ACTION_CONTEXT.RAID
    end
end

local function storeHandler()
    local storage = CLM.GUI.Unified:GetStorage(UnifiedGUI_History.name)
    storage.roster = UnifiedGUI_History.roster
end

local function restoreHandler()
    local storage = CLM.GUI.Unified:GetStorage(UnifiedGUI_History.name)
    UnifiedGUI_History.roster = storage.roster
end

local function dataReadyHandler()
    if not CLM.MODULES.RosterManager:GetRosterByUid(UnifiedGUI_History.roster) then
        local _, roster = next(CLM.MODULES.RosterManager:GetRosters())
        if roster then
            UnifiedGUI_History.roster = roster:UID()
        end
    end
end

-- CONSTANTS.HISTORY_TYPES = UTILS.Set({
--     CONSTANTS.HISTORY_TYPE.ALL,
--     CONSTANTS.HISTORY_TYPE.LOOT,
--     CONSTANTS.HISTORY_TYPE.POINT
-- })

CLM.GUI.Unified:RegisterTab(
    UnifiedGUI_History.name, 2,
    tableStructure,
    tableDataFeeder,
    horizontalOptionsFeeder,
    verticalOptionsFeeder,
    {
        initialize = initializeHandler,
        -- refresh = refreshHandler,
        beforeShow = beforeShowHandler,
        store = storeHandler,
        restore = restoreHandler,
        dataReady = dataReadyHandler
    }
)
