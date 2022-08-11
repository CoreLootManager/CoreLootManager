local _, CLM = ...
local CONSTANTS = CLM.CONSTANTS
local OPTIONS = CLM.OPTIONS
local MODULES = CLM.MODULES
local ACL = MODULES.ACL
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager
local LedgerManager = MODULES.LedgerManager
local ConfigManager = MODULES.ConfigManager

local CBTYPE = {
    GETTER   = "get",
    SETTER   = "set",
    EXECUTOR = "execute",
    HIDER    = "hide"
}

local RosterManagerOptions = { externalOptions = {} }

local function GetRosterOption(name, option)
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    return roster:GetConfiguration(option)
end

local function SetRosterOption(name, option, value)
    RosterManager:SetRosterConfiguration(name, option, value)
end

-- local function GetDefaultSlotValue(name, slot, isBase)
--     local roster = RosterManager:GetRosterByName(name)
--     if roster == nil then return nil end
--     local v = roster:GetDefaultSlotValue(slot)
--     if isBase then return tostring(v.base) else return tostring(v.max) end
-- end

-- local function SetDefaultSlotValue(name, slot, value, isBase)
--     RosterManager:SetRosterDefaultSlotValue(name, slot, value, isBase)
-- end

function RosterManagerOptions:Initialize()
    self.pointType = CONSTANTS.POINT_TYPE.DKP
    self.rosterName = RosterManager:GenerateName()
    self.readOnly = not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    self.handlers = {
        general_name_get = (function(name)
            return name
        end),
        general_name_set = (function(old, new)
            RosterManager:RenameRoster(old, new)
        end),
        general_remove_execute = (function(name)
            RosterManager:DeleteRosterByName(name)
        end),
        general_fill_profiles_execute = (function(name)
            local profiles = ProfileManager:GetProfiles()
            local profileList = {}
            for GUID, _ in pairs(profiles) do
                table.insert(profileList, GUID)
            end
            local roster = RosterManager:GetRosterByName(name)
            RosterManager:AddProfilesToRoster(roster, profileList)
        end),
        general_copy_execute = (function(name)
            if self.copy_source_name == nil then return end
            RosterManager:Copy(self.copy_source_name, name, true, true, true, false)
        end),
        general_copy_source_get = (function(name)
            return self.copy_source_name
        end),
        general_copy_source_set = (function(name, value)
            self.copy_source_name = value
        end),
        -- Bonuses
        general_boss_kill_bonus_get = (function(name)
            return GetRosterOption(name, "bossKillBonus")
        end),
        general_boss_kill_bonus_set = (function(name, value)
            SetRosterOption(name, "bossKillBonus", value)
        end),
        general_boss_kill_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "bossKillBonusValue"))
        end),
        general_boss_kill_bonus_value_set = (function(name, value)
            SetRosterOption(name, "bossKillBonusValue", value)
        end),
        general_on_time_bonus_get = (function(name)
            return GetRosterOption(name, "onTimeBonus")
        end),
        general_on_time_bonus_set = (function(name, value)
            SetRosterOption(name, "onTimeBonus", value)
        end),
        general_on_time_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "onTimeBonusValue"))
        end),
        general_on_time_bonus_value_set = (function(name, value)
            SetRosterOption(name, "onTimeBonusValue", value)
        end),
        general_raid_completion_bonus_get = (function(name)
            return GetRosterOption(name, "raidCompletionBonus")
        end),
        general_raid_completion_bonus_set = (function(name, value)
            SetRosterOption(name, "raidCompletionBonus", value)
        end),
        general_raid_completion_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "raidCompletionBonusValue"))
        end),
        general_raid_completion_bonus_value_set = (function(name, value)
            SetRosterOption(name, "raidCompletionBonusValue", value)
        end),
        general_interval_bonus_get = (function(name)
            return GetRosterOption(name, "intervalBonus")
        end),
        general_interval_bonus_set = (function(name, value)
            SetRosterOption(name, "intervalBonus", value)
        end),
        general_interval_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "intervalBonusValue"))
        end),
        general_interval_bonus_value_set = (function(name, value)
            SetRosterOption(name, "intervalBonusValue", value)
        end),
        general_interval_bonus_time_get = (function(name)
            return tostring(GetRosterOption(name, "intervalBonusTime"))
        end),
        general_interval_bonus_time_set = (function(name, value)
            SetRosterOption(name, "intervalBonusTime", value)
        end),
        general_weekly_reset_timezone_get = (function(name)
            return GetRosterOption(name, "weeklyReset")
        end),
        general_weekly_reset_timezone_set = (function(name, value)
            SetRosterOption(name, "weeklyReset", value)
        end),
        general_allow_self_bench_subscribe_get = (function(name)
            return GetRosterOption(name, "selfBenchSubscribe")
        end),
        general_allow_self_bench_subscribe_set = (function(name, value)
            SetRosterOption(name, "selfBenchSubscribe", value)
        end),
        general_auto_bench_leavers_get = (function(name)
            return GetRosterOption(name, "autoBenchLeavers")
        end),
        general_auto_bench_leavers_set = (function(name, value)
            SetRosterOption(name, "autoBenchLeavers", value)
        end),
        general_auto_award_include_bench_get = (function(name)
            return GetRosterOption(name, "autoAwardIncludeBench")
        end),
        general_auto_award_include_bench_set = (function(name, value)
            SetRosterOption(name, "autoAwardIncludeBench", value)
        end),
        general_auto_award_online_only_get = (function(name)
            return GetRosterOption(name, "autoAwardOnlineOnly")
        end),
        general_auto_award_online_only_set = (function(name, value)
            SetRosterOption(name, "autoAwardOnlineOnly", value)
        end),
        general_auto_award_same_zone_only_get = (function(name)
            return GetRosterOption(name, "autoAwardSameZoneOnly")
        end),
        general_auto_award_same_zone_only_set = (function(name, value)
            SetRosterOption(name, "autoAwardSameZoneOnly", value)
        end),
        -- Caps
        general_hard_cap_get = (function(name)
            return tostring(GetRosterOption(name, "hardCap"))
        end),
        general_hard_cap_set = (function(name, value)
            SetRosterOption(name, "hardCap", value)
        end),
        general_round_decimals_get = (function(name)
            return GetRosterOption(name, "roundDecimals")
        end),
        general_round_decimals_set = (function(name, value)
            SetRosterOption(name, "roundDecimals", value)
        end),
        general_weekly_cap_get = (function(name)
            return tostring(GetRosterOption(name, "weeklyCap"))
        end),
        general_weekly_cap_set = (function(name, value)
            SetRosterOption(name, "weeklyCap", value)
        end),
        -- Auction
        auction_auction_type_get = (function(name)
            return GetRosterOption(name, "auctionType")
        end),
        auction_auction_type_set = (function(name, value)
            SetRosterOption(name, "auctionType", value)
        end),
        auction_item_value_mode_get = (function(name)
            return GetRosterOption(name, "itemValueMode")
        end),
        auction_item_value_mode_set = (function(name, value)
            SetRosterOption(name, "itemValueMode", value)
        end),
        auction_zero_sum_bank_get = (function(name)
            return GetRosterOption(name, "zeroSumBank")
        end),
        auction_zero_sum_bank_set = (function(name, value)
            SetRosterOption(name, "zeroSumBank", value)
        end),
        auction_zero_sum_bank_inflation_value_get = (function(name)
            return tostring(GetRosterOption(name, "zeroSumBankInflation"))
        end),
        auction_zero_sum_bank_inflation_value_set = (function(name, value)
            SetRosterOption(name, "zeroSumBankInflation", value)
        end),
        auction_allow_negative_standings_get = (function(name)
            return GetRosterOption(name, "allowNegativeStandings")
        end),
        auction_allow_negative_standings_set = (function(name, value)
            SetRosterOption(name, "allowNegativeStandings", value)
        end),
        auction_allow_negative_bidders_get = (function(name)
            return GetRosterOption(name, "allowNegativeBidders")
        end),
        auction_allow_negative_bidders_set = (function(name, value)
            SetRosterOption(name, "allowNegativeBidders", value)
        end),
        auction_minimal_increment_get = (function(name)
            return tostring(GetRosterOption(name, "minimalIncrement"))
        end),
        auction_minimal_increment_set = (function(name, value)
            SetRosterOption(name, "minimalIncrement", value)
        end),
        auction_tax_get = (function(name)
            return tostring(GetRosterOption(name, "tax"))
        end),
        auction_tax_set = (function(name, value)
            SetRosterOption(name, "tax", value)
        end),
        auction_auction_time_get = (function(name)
            return tostring(GetRosterOption(name, "auctionTime"))
        end),
        auction_auction_time_set = (function(name, value)
            SetRosterOption(name, "auctionTime", value)
        end),
        auction_antisnipe_time_get = (function(name)
            return tostring(GetRosterOption(name, "antiSnipe"))
        end),
        auction_antisnipe_time_set = (function(name, value)
            SetRosterOption(name, "antiSnipe", value)
        end)
    }
    -- Handlers for Minimum / Maximum setting
    -- local values = {base = true, maximum = false}
    -- for _, slot in ipairs(CONSTANTS.INVENTORY_TYPES_SORTED) do
    --     local prefix = slot.type:lower()
    --     for type, isBase in pairs(values) do
    --         local node = "default_slot_values_" .. prefix .. "_" .. type
    --         self.handlers[ node .."_get"] = (function(name)
    --             return GetDefaultSlotValue(name, slot.type, isBase)
    --         end)
    --         self.handlers[ node .."_set"] = (function(name, value)
    --             SetDefaultSlotValue(name, slot.type, value, isBase)
    --         end)
    --     end
    -- end

    self:UpdateOptions()

    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:UpdateOptions()
        ConfigManager:UpdateOptions(CONSTANTS.CONFIGS.GROUP.ROSTER)
    end)
end

function RosterManagerOptions:_Handle(cbtype, info, ...)
    -- Assumes This is the handler of each of the subgroups but not the main group
    local roster_name = info[1]
    local node_name
    if #info >= 2 then
        node_name = info[2]
        for i=3,#info do
            node_name = node_name .. "_" .. info[i]
        end
    else
        node_name = info[#info]
    end
    node_name = node_name .. "_".. cbtype

    -- print(node_name)
    -- Execute handler
    if type(self.handlers[node_name]) == "function" then
        return self.handlers[node_name](roster_name, ...)
    end

    if cbtype == CBTYPE.HIDER then
        return false
    end

    return nil
end

function RosterManagerOptions:Getter(info, ...)
   return self:_Handle(CBTYPE.GETTER, info, ...)
end

function RosterManagerOptions:Setter(info, ...)
    if self.readOnly then return end
    self:_Handle(CBTYPE.SETTER, info, ...)
end

function RosterManagerOptions:Handler(info, ...)
    self:_Handle(CBTYPE.EXECUTOR, info, ...)
end

function RosterManagerOptions:Hider(info, ...)
    self:_Handle(CBTYPE.HIDER, info, ...)
end

local valuesWithDesc = {
    {
        type = CONSTANTS.SLOT_VALUE_TIER.BASE,
        desc = CLM.L["Base value for Static-Priced auction.\nMinimum value for Ascending and Tiered auction.\n\nSet to 0 to ignore."]
    },
    {
        type = CONSTANTS.SLOT_VALUE_TIER.SMALL,
        desc = CLM.L["Small value for Tiered auction.\n\nSet to 0 to ignore."]
    },
    {
        type = CONSTANTS.SLOT_VALUE_TIER.MEDIUM,
        desc = CLM.L["Medium value for Tiered auction.\n\nSet to 0 to ignore."]
    },
    {
        type = CONSTANTS.SLOT_VALUE_TIER.LARGE,
        desc = CLM.L["Large value for Tiered auction.\n\nSet to 0 to ignore."]
    },
    {
        type = CONSTANTS.SLOT_VALUE_TIER.MAX,
        desc = CLM.L["Maximum value for Ascending and Tiered auction.\n\nSet to 0 to ignore."]
    }
}

function RosterManagerOptions:GenerateRosterOptions(name)
    local roster = RosterManager:GetRosterByName(name)

    local default_slot_values_args = (function()
        local args = {}
        local order = 0
        local prefix
        for _, slot in ipairs(CONSTANTS.INVENTORY_TYPES_SORTED) do
            prefix = slot.type:lower()
            args[prefix .. "_header"] = {
                type = "header",
                order = order,
                name = slot.name
            }
            order = order + 1
            args[prefix .. "_icon"] = {
                name = "",
                type = "description",
                image = slot.icon,
                order = order,
                width = 0.5
            }
            order = order + 1
            for _, ivalues in ipairs(valuesWithDesc) do
                args[prefix .. "_" .. ivalues.type] = {
                    type = "input",
                    order = order,
                    desc = ivalues.desc,
                    width = 0.5,
                    get = (function(i)
                        return tostring(roster:GetDefaultSlotTierValue(slot.type, ivalues.type))
                    end),
                    set = (function(i, v)
                        RosterManager:SetRosterDefaultSlotTierValue(roster, slot.type, ivalues.type, tonumber(v))
                    end),
                    name = (CONSTANTS.SLOT_VALUE_TIERS_GUI[ivalues.type] or ""),
                    pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                }
                order = order + 1
            end
        end
        return args
    end)()

    local item_value_overrides_args = (function()
        local items = roster:GetAllItemValues()
        local args = {}
        local order = 1
        for id,_ in pairs(items) do
            local _, _, _, _, icon = GetItemInfoInstant(id)
            if icon then
                local sid = tostring(id)
                local prefix = "i" .. sid
                args[prefix .. "icon"] = {
                        name = "",
                        type = "description",
                        image = icon,
                        order = order,
                        width = 0.5
                    }
                order = order + 1
                for _, ivalues in ipairs(valuesWithDesc) do
                    args[prefix .. "_" .. ivalues.type] = {
                        type = "input",
                        order = order,
                        -- desc = ivalues.desc,
                        width = 0.5,
                        set = (function(i, v)
                            if self.readOnly then return end
                            RosterManager:SetRosterItemTierValue(roster, id, ivalues.type, tonumber(v))
                        end),
                        get = (function(i)
                            local values = roster:GetItemValues(id)
                            return tostring(values[ivalues.type])
                        end),
                        name = (CONSTANTS.SLOT_VALUE_TIERS_GUI[ivalues.type] or ""),
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                    }
                    order = order + 1
                end
                -- args[b] = {
                --         name = CLM.L["Base"],
                --         type = "input",
                --         order = order + 1,
                --         itemLink = "item:" .. sid,
                --         set = (function(i, v)
                --             if self.readOnly then return end
                --             local value = roster:GetItemValue(id)
                --             RosterManager:SetRosterItemValue(roster, id, tonumber(v) or 0, value.max)
                --         end),
                --         get = (function(i)
                --             local value = roster:GetItemValue(id)
                --             return tostring(value.base)
                --         end)
                --     }
                -- args[m] = {
                --         name = CLM.L["Max"],
                --         type = "input",
                --         order = order + 2,
                --         itemLink = "item:" .. sid,
                --         set = (function(i, v)
                --             if self.readOnly then return end
                --             local value = roster:GetItemValue(id)
                --             RosterManager:SetRosterItemValue(roster, id, value.base, tonumber(v) or 0)
                --         end),
                --         get = (function(i)
                --             local value = roster:GetItemValue(id)
                --             return tostring(value.max)
                --         end)
                --     }
                order = order + 3
            end
        end
        return args
    end)()

    local boss_kill_award_values_args = (function()
        local args = {
            classic = {
                type = "group",
                name = CLM.L["Classic"],
                args = {}
            },
            tbc = {
                type = "group",
                name = CLM.L["TBC"],
                args = {}
            },
            wotlk10 = {
                type = "group",
                name = CLM.L["WotLK - 10"],
                args = {}
            },
            wotlk25 = {
                type = "group",
                name = CLM.L["WotLK - 25"],
                args = {}
            }
        }
        -- Common
        local order = 1
        for expansion,expansionEncounterData in pairs(CLM.EncounterIDs) do
            expansion = string.lower( expansion )
            for _, instanceData in ipairs(expansionEncounterData) do
                for _,difficultyId in ipairs(instanceData.difficulty) do
                    order = order + 1
                    local instanceName = instanceData.name .. " - " .. CLM.DifficultyIDsMap[difficultyId]
                    args[expansion].args["encounter_header_" .. instanceData.name .. difficultyId] = {
                        name = instanceName,
                        type = "header",
                        order = order,
                        width = "full"
                    }
                    for _, info in ipairs(instanceData.data) do
                        order = order + 1
                        args[expansion].args["encounter" .. info.id .. difficultyId] = {
                            name = info.name,
                            desc = instanceName,
                            type = "input",
                            width = "full",
                            order = order,
                            set = (function(i, v)
                                if self.readOnly then return end
                                RosterManager:SetRosterBossKillBonusValue(name, info.id, difficultyId, v)
                            end),
                            get = (function(i)
                                return tostring(roster:GetBossKillBonusValue(info.id, difficultyId))
                            end)
                        }
                    end
                end
            end
        end
        return args
    end)()

    local options = {
        type = "group",
        name = name,
        handler = self,
        set = "Setter",
        get = "Getter",
        -- hidden = "Hider",
        func = "Handler",
        childGroups = "select",
        args = {
            general = {
                name = CLM.L["General settings"],
                type = "group",
                order = 1,
                args = {
                    name = {
                        name = CLM.L["Name"],
                        desc = CLM.L["Change roster name."],
                        type = "input",
                        width = "full",
                        order = 0
                    },
                    point_type = { -- informative
                        name = CLM.L["Point type"],
                        desc = CLM.L["Currently only DKP supported."],
                        type = "select",
                        style = "radio",
                        get = (function(i)
                            local r = RosterManager:GetRosterByName(name)
                            if not r then return nil end
                            return r:GetPointType()
                        end),
                        order = 1,
                        -- disabled = true,
                        width = "half",
                        values = CONSTANTS.POINT_TYPES_GUI
                    },
                    round_decimals = {
                        name = CLM.L["Rounding"],
                        desc = CLM.L["Round to selected number of decimals"],
                        type = "select",
                        style = "radio",
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 2,
                        values = CONSTANTS.ALLOWED_ROUNDINGS_GUI
                    },
                    copy_header = {
                        name = CLM.L["Copy settings"],
                        type = "header",
                        order = 97,
                        width = "full"
                    },
                    copy = {
                        name = CLM.L["Copy settings"],
                        desc = CLM.L["Copy settings from selected roster."],
                        type = "execute",
                        confirm = true,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 98
                    },
                    copy_source = {
                        name = CLM.L["Copy source"],
                        desc = CLM.L["Copy settings from selected roster."],
                        type = "select",
                        values = (function()
                            local v = {}
                            local r = RosterManager:GetRosters()
                            for n, _ in pairs(r) do
                                v[n] = n
                            end
                            return v
                        end),
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 99
                    },
                    -- fill_profiles = {
                    --     name = CLM.L["Fill profiles"],
                    --     desc = CLM.L["Fills current roster with all profiles."],
                    --     type = "execute",
                    --     confirm = true,
                    --     disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                    --     order = 100
                    -- },
                    remove_header = {
                        name = CLM.L["Remove roster"],
                        type = "header",
                        order = 100,
                        width = "full"
                    },
                    remove = {
                        name = CLM.L["Remove"],
                        desc = CLM.L["Removes current roster."],
                        type = "execute",
                        confirm = true,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 101
                    },
                    --
                    bonuses_header = {
                        name = CLM.L["Bonuses"],
                        type = "header",
                        order = 4,
                        width = "full"
                    },
                    boss_kill_bonus = {
                        name = CLM.L["Boss Kill Bonus"],
                        type = "toggle",
                        order = 5,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    boss_kill_bonus_value = {
                        name = CLM.L["Default Boss Kill Bonus Value"],
                        type = "input",
                        order = 8,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    on_time_bonus = {
                        name = CLM.L["On Time Bonus"],
                        type = "toggle",
                        order = 6,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    on_time_bonus_value = {
                        name = CLM.L["On Time Bonus Value"],
                        type = "input",
                        order = 9,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    raid_completion_bonus = {
                        name = CLM.L["Raid Completion Bonus"],
                        type = "toggle",
                        order = 7,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    raid_completion_bonus_value = {
                        name = CLM.L["Raid Completion Value"],
                        type = "input",
                        order = 10,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    interval_bonus = {
                        name = CLM.L["Interval Bonus"],
                        type = "toggle",
                        order = 11,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    interval_bonus_time = {
                        name = CLM.L["Interval Time"],
                        desc = CLM.L["Interval in [minutes] to award bonus points"],
                        type = "input",
                        order = 12,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        -- width = 0.6
                    },
                    interval_bonus_value = {
                        name = CLM.L["Interval Value"],
                        type = "input",
                        order = 13,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        -- width = 0.6
                    },
                    auto_award_include_bench =  {
                        name = CLM.L["Include bench"],
                        desc = CLM.L["Include benched players in all auto-awards"],
                        type = "toggle",
                        order = 14,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        -- width = 2
                    },
                    auto_award_online_only =  {
                        name = CLM.L["Online only"],
                        desc = CLM.L["Award points only to online players"],
                        type = "toggle",
                        order = 15,
                        -- disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        disabled = true,
                        width = 1
                    },
                    auto_award_same_zone_only =  {
                        name = CLM.L["Same zone only"],
                        desc = CLM.L["Award points only to players in same zone"],
                        type = "toggle",
                        order = 16,
                        -- disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        disabled = true,
                        width = 1
                    },
                    point_caps_header = {
                        name = CLM.L["Point caps"],
                        type = "header",
                        order = 17,
                        width = "full"
                    },
                    weekly_reset_timezone = {
                        name = CLM.L["Weekly reset timezone"],
                        desc = CLM.L["Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT"],
                        type = "select",
                        style = "radio",
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 18,
                        values = CONSTANTS.WEEKLY_RESETS_GUI
                    },
                    weekly_cap = {
                        name = CLM.L["Weekly cap"],
                        desc = CLM.L["Maximum point cap player can receive per raid week. Set to 0 to disable."],
                        type = "input",
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 19,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        -- width = 0.6
                    },
                    hard_cap = {
                        name = CLM.L["Hard cap"],
                        desc = CLM.L["Maximum point cap that player can have. Set to 0 to disable."],
                        type = "input",
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        order = 20,
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        -- width = 0.6
                    },
                    bench_header = {
                        name = CLM.L["Bench"],
                        type = "header",
                        order = 21,
                        width = "full"
                    },
                    allow_self_bench_subscribe =  {
                        name = CLM.L["Allow subscription"],
                        desc = CLM.L["Allow players to subscribe to the bench through Raids menu"],
                        type = "toggle",
                        order = 22,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                    auto_bench_leavers =  {
                        name = CLM.L["Auto bench leavers"],
                        desc = CLM.L["Put players leaving raid on bench instead of removing them. To remove them completely they will need to be removed manually from the bench."],
                        type = "toggle",
                        order = 23,
                        disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                        width = 1
                    },
                },
            },
            auction = {
                name = CLM.L["Auction settings"],
                type = "group",
                order = 2,
                args = {
                    auction_type = {
                        name = CLM.L["Auction type"],
                        desc = CLM.L["|cff00ee44Open:|r English Auction with highest bidder announcement. Highest bidder wins. Two players can not bid same value. Additionally always allows bidding base to accomodate for Swedish Auction flavor.\n\n|cff00ee44Anonymous Open:|r Same as Open but highest bidder name is not disclosed.\n\n|cff00ee44Sealed:|r Bids are not announced. Highest bidder wins.\n\n|cff00ee44Vickrey:|r Same as sealed but winner pays with second-highest bid."],
                        type = "select",
                        style = "radio",
                        order = 4,
                        values = CONSTANTS.AUCTION_TYPES_GUI
                    },
                    item_value_mode = {
                        name = CLM.L["Item value mode"],
                        desc = CLM.L["|cff00ee44Single-Priced:|r Static value mode. Only bidding Base value is supported.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding any value in |cff44ee00<base, max>|r.\n\n|cff00ee44Ascending:|r Ranged value mode. Allows bidding only specific values. Up to 3 additional tiers are configurable in |cff44ee00<base, max>|r (including base and max). |cff44ee00base < small <= medium <= large < max|r"],
                        type = "select",
                        style = "radio",
                        order = 5,
                        values = CONSTANTS.ITEM_VALUE_MODES_GUI
                    },
                    zero_sum_bank = {
                        name = CLM.L["Zero-Sum Bank"],
                        desc = CLM.L["Enable paid value splitting amongst raiders."],
                        type = "toggle",
                        width = 1,
                        order = 6
                    },
                    zero_sum_bank_inflation_value = {
                        name = CLM.L["Zero-Sum Inflation Value"],
                        desc = CLM.L["Additional points to be given to players atop of the split value."],
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 6
                    },
                    allow_negative_standings = {
                        name = CLM.L["Allow Negative Standings"],
                        desc = CLM.L["Allow biding more than current standings and end up with negative values."],
                        type = "toggle",
                        width = "full",
                        order = 7
                    },
                    allow_negative_bidders = {
                        name = CLM.L["Allow Negative Bidders"],
                        desc = CLM.L["Allow biding when current standings are negative values."],
                        type = "toggle",
                        width = "full",
                        order = 8
                    },
                    minimal_increment = {
                        name = CLM.L["Minimal increment"],
                        desc = CLM.L["Minimal value increment for open auction mode."],
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 9
                    },
                    tax = {
                        name = CLM.L["Tax"],
                        desc = CLM.L["Additional cost (tax) to add to the award value."],
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 10
                    },
                    auction_time = {
                        name = CLM.L["Auction length"],
                        desc = CLM.L["Auction length in seconds."],
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 11
                    },
                    antisnipe_time = {
                        name = CLM.L["Anti-snipe time"],
                        desc = CLM.L["Time in seconds by which auction will be extended if bid is received during last 10 seconds."],
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 12
                    },
                }
            },
            default_slot_values = {
                name = CLM.L["Default slot values"],
                type = "group",
                order = 3,
                args = default_slot_values_args
            },
            item_value_overrides = {
                name = CLM.L["Item value overrides"],
                type = "group",
                order = 4,
                args = item_value_overrides_args
            },
            boss_kill_award_values = {
                name = CLM.L["Boss kill award values"],
                type = "group",
                order = 5,
                childGroups = "tab",
                args = boss_kill_award_values_args
            }
        }
    }
    return options
end

function RosterManagerOptions:UpdateOptions()
    local options = {
        new = { -- Global options -> Create New Roster
            name = CLM.L["Create"],
            desc = CLM.L["Creates new roster with default configuration"],
            type = "execute",
            func = function() RosterManager:NewRoster(self.pointType, self.rosterName); self.rosterName = RosterManager:GenerateName() end,
            disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
            order = 1
        },
        roster_name = {
            name = CLM.L["Roster name"],
            desc = CLM.L["Roster Name"],
            type = "input",
            set = (function(i, v) self.rosterName = v end),
            get = (function(i) return self.rosterName end),
            disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
            order = 2,
        },
        point_type = {
            name = CLM.L["Point type"],
            desc = CLM.L["Currently only DKP supported."],
            type = "select",
            set = (function(i, v) self.pointType = v end),
            get = (function(i) return self.pointType end),
            order = 3,
            disabled = true,--(function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
            values = CONSTANTS.POINT_TYPES_GUI
        },
    }
    local rosters = MODULES.RosterManager:GetRosters()
    for name, _ in pairs(rosters) do
        options[name] = self:GenerateRosterOptions(name)
    end
    MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.ROSTER, options, true)
end

OPTIONS.RosterManager = RosterManagerOptions
