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

local function GetDefaultSlotValue(name, slot, isBase)
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    local v = roster:GetDefaultSlotValue(slot)
    if isBase then return tostring(v.base) else return tostring(v.max) end
end

local function SetDefaultSlotValue(name, slot, value, isBase)
    RosterManager:SetRosterDefaultSlotValue(name, slot, value, isBase)
end

function RosterManagerOptions:Initialize()
    self.pointType = CONSTANTS.POINT_TYPE.DKP
    self.rosterName = RosterManager:GenerateName()
    self.readOnly = not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    self.handlers = {
        name_get = (function(name)
            return name
        end),
        name_set = (function(old, new)
            RosterManager:RenameRoster(old, new)
        end),
        remove_execute = (function(name)
            RosterManager:DeleteRosterByName(name)
        end),
        fill_profiles_execute = (function(name)
            local profiles = ProfileManager:GetProfiles()
            local profileList = {}
            for GUID, _ in pairs(profiles) do
                table.insert(profileList, GUID)
            end
            local roster = RosterManager:GetRosterByName(name)
            RosterManager:AddProfilesToRoster(roster, profileList)
        end),
        copy_execute = (function(name)
            if self.copy_source_name == nil then return end
            RosterManager:Copy(self.copy_source_name, name, true, true, true, false)
        end),
        copy_source_get = (function(name)
            return self.copy_source_name
        end),
        copy_source_set = (function(name, value)
            self.copy_source_name = value
        end),
        -- Bonuses
        boss_kill_bonus_get = (function(name)
            return GetRosterOption(name, "bossKillBonus")
        end),
        boss_kill_bonus_set = (function(name, value)
            SetRosterOption(name, "bossKillBonus", value)
        end),
        on_time_bonus_get = (function(name)
            return GetRosterOption(name, "onTimeBonus")
        end),
        on_time_bonus_set = (function(name, value)
            SetRosterOption(name, "onTimeBonus", value)
        end),
        on_time_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "onTimeBonusValue"))
        end),
        raid_completion_bonus_get = (function(name)
            return GetRosterOption(name, "raidCompletionBonus")
        end),
        raid_completion_bonus_set = (function(name, value)
            SetRosterOption(name, "raidCompletionBonus", value)
        end),
        raid_completion_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "raidCompletionBonusValue"))
        end),
        raid_completion_bonus_value_set = (function(name, value)
            SetRosterOption(name, "raidCompletionBonusValue", value)
        end),
        on_time_bonus_value_set = (function(name, value)
            SetRosterOption(name, "onTimeBonusValue", value)
        end),
        interval_bonus_get = (function(name)
            return GetRosterOption(name, "intervalBonus")
        end),
        interval_bonus_set = (function(name, value)
            SetRosterOption(name, "intervalBonus", value)
        end),
        interval_bonus_value_get = (function(name)
            return tostring(GetRosterOption(name, "intervalBonusValue"))
        end),
        interval_bonus_value_set = (function(name, value)
            SetRosterOption(name, "intervalBonusValue", value)
        end),
        interval_bonus_time_get = (function(name)
            return tostring(GetRosterOption(name, "intervalBonusTime"))
        end),
        interval_bonus_time_set = (function(name, value)
            SetRosterOption(name, "intervalBonusTime", value)
        end),
        -- Caps
        weekly_reset_timezone_get = (function(name)
            return GetRosterOption(name, "weeklyReset")
        end),
        weekly_reset_timezone_set = (function(name, value)
            SetRosterOption(name, "weeklyReset", value)
        end),
        weekly_cap_get = (function(name)
            return tostring(GetRosterOption(name, "weeklyCap"))
        end),
        weekly_cap_set = (function(name, value)
            SetRosterOption(name, "weeklyCap", value)
        end),
        hard_cap_get = (function(name)
            return tostring(GetRosterOption(name, "hardCap"))
        end),
        hard_cap_set = (function(name, value)
            SetRosterOption(name, "hardCap", value)
        end),
        round_decimals_get = (function(name)
            return GetRosterOption(name, "roundDecimals")
        end),
        round_decimals_set = (function(name, value)
            SetRosterOption(name, "roundDecimals", value)
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
    local values = {base = true, maximum = false}
    for _, slot in ipairs(CONSTANTS.INVENTORY_TYPES_SORTED) do
        local prefix = slot.type:lower()
        for type, isBase in pairs(values) do
            local node = "default_slot_values_" .. prefix .. "_" .. type
            self.handlers[ node .."_get"] = (function(name)
                return GetDefaultSlotValue(name, slot.type, isBase)
            end)
            self.handlers[ node .."_set"] = (function(name, value)
                SetDefaultSlotValue(name, slot.type, value, isBase)
            end)
        end
    end

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

function RosterManagerOptions:GenerateRosterOptions(name)
    local roster = RosterManager:GetRosterByName(name)
    local default_slot_values_args = (function()
        local values = {
            ["Base"] = "Base value for Static-Priced auction. Minimum value for Ascending auction. Set to 0 to ignore.",
            ["Maximum"] = "Maximum value for Ascending auction. Set to 0 to ignore."
        }
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
                width = 0.25
            }
            order = order + 1
            for type, desc in pairs(values) do
                args[prefix .. "_" .. type:lower()] = {
                    type = "input",
                    order = order,
                    desc = desc,
                    name = type,
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
                local d = "i" .. sid .. "d"
                local b = "i" .. sid .. "b"
                local m = "i" .. sid .. "m"
                args[d] = {
                        name = "",
                        type = "description",
                        image = icon,
                        order = order,
                        width = 0.25
                    }
                args[b] = {
                        name = "Base",
                        type = "input",
                        order = order + 1,
                        itemLink = "item:" .. sid,
                        set = (function(i, v)
                            if self.readOnly then return end
                            local value = roster:GetItemValue(id)
                            RosterManager:SetRosterItemValue(roster, id, tonumber(v) or 0, value.max)
                        end),
                        get = (function(i)
                            local value = roster:GetItemValue(id)
                            return tostring(value.base)
                        end)
                    }
                args[m] = {
                        name = "Max",
                        type = "input",
                        order = order + 2,
                        itemLink = "item:" .. sid,
                        set = (function(i, v)
                            if self.readOnly then return end
                            local value = roster:GetItemValue(id)
                            RosterManager:SetRosterItemValue(roster, id, value.base, tonumber(v) or 0)
                        end),
                        get = (function(i)
                            local value = roster:GetItemValue(id)
                            return tostring(value.max)
                        end)
                    }
                order = order + 3
            end
        end
        return args
    end)(roster)

    local boss_kill_award_values_args = (function()
        local args = {
            classic = {
                type = "group",
                name = "Classic",
                args = {}
            },
            tbc = {
                type = "group",
                name = "TBC",
                args = {}
            }
        }
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
        args = {
            name = {
                name = "Name",
                desc = "Change roster name.",
                type = "input",
                width = "full",
                order = 1
            },
            point_type = { -- informative
                name = "Point type",
                desc = "Currently only DKP supported.",
                type = "select",
                style = "radio",
                get = (function(i)
                    local r = RosterManager:GetRosterByName(name)
                    if not r then return nil end
                    return r:GetPointType()
                end),
                order = 2,
                disabled = true,
                width = "half",
                values = CONSTANTS.POINT_TYPES_GUI
            },
            copy = {
                name = "Copy settings",
                desc = "Copy settings from selected roster.",
                type = "execute",
                confirm = true,
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 98
            },
            copy_source = {
                name = "Copy source",
                --desc = "Copy settings from selected roster.",
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
            fill_profiles = {
                name = "Fill profiles",
                desc = "Fills current roster with all profiles.",
                type = "execute",
                confirm = true,
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 100
            },
            remove = {
                name = "Remove",
                desc = "Removes current roster.",
                type = "execute",
                confirm = true,
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 101
            },
            --
            bonuses_header = {
                name = "Bonuses",
                type = "header",
                order = 4,
                width = "full"
            },
            boss_kill_bonus = {
                name = "Boss Kill Bonus",
                type = "toggle",
                order = 5,
                disabled = true,
                width = "full"
            },
            on_time_bonus = {
                name = "On Time Bonus",
                type = "toggle",
                order = 6,
                width = 1
            },
            on_time_bonus_value = {
                name = "On Time Bonus Value",
                type = "input",
                order = 7,
                pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                width = 1
            },
            raid_completion_bonus = {
                name = "Raid Completion Bonus",
                type = "toggle",
                order = 8,
                width = 1
            },
            raid_completion_bonus_value = {
                name = "Raid Completion Value",
                type = "input",
                order = 9,
                pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                width = 1
            },
            interval_bonus = {
                name = "Interval Bonus",
                type = "toggle",
                order = 10,
                disabled = true,
                width = 1
            },
            interval_bonus_time = {
                name = "Interval Time",
                type = "input",
                order = 11,
                pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                disabled = true,
                width = 0.6
            },
            interval_bonus_value = {
                name = "Interval Bonus Value",
                type = "input",
                order = 12,
                pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                disabled = true,
                width = 0.6
            },
            --
            point_caps_header = {
                name = "Point caps",
                type = "header",
                order = 13,
                width = "full"
            },
            weekly_reset_timezone = {
                name = "Weekly reset timezone",
                desc = "Select weekly reset timezone. EU: Wed 07:00 GMT or US: Tue 15:00 GMT",
                type = "select",
                style = "radio",
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 14,
                values = CONSTANTS.WEEKLY_RESETS_GUI
            },
            weekly_cap = {
                name = "Weekly cap",
                desc = "Maximum point cap player can receive per raid week. Set to 0 to disable.",
                type = "input",
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 15,
                pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                -- width = 0.6
            },
            hard_cap = {
                name = "Hard cap",
                desc = "Maximum point cap that player can have. Set to 0 to disable.",
                type = "input",
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 16,
                pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                -- width = 0.6
            },
            round_decimals = {
                name = "Rounding",
                desc = "Round to selected number of decimals",
                type = "select",
                style = "radio",
                disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
                order = 17,
                values = CONSTANTS.ALLOWED_ROUNDINGS_GUI
            },
            --
            auction = {
                name = "Auction settings",
                type = "group",
                args = {
                    auction_type = {
                        name = "Auction type",
                        desc = "Type of auction used: Open, Sealed, Vickrey (Sealed with second-highest pay price).",
                        type = "select",
                        style = "radio",
                        order = 4,
                        values = CONSTANTS.AUCTION_TYPES_GUI
                    },
                    item_value_mode = {
                        name = "Item value mode",
                        desc = "Single-Priced (static) or Ascending (in range of min-max) item value.",
                        type = "select",
                        style = "radio",
                        order = 5,
                        values = CONSTANTS.ITEM_VALUE_MODES_GUI
                    },
                    zero_sum_bank = {
                        name = "Zero-Sum Bank",
                        desc = "Enable paid value splitting amongst raiders.",
                        type = "toggle",
                        width = 1,
                        disabled = true,
                        order = 6
                    },
                    zero_sum_bank_inflation_value = {
                        name = "Zero-Sum Inflation Value",
                        desc = "Enable paid value splitting amongst raiders.",
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        disabled = true,
                        order = 6
                    },
                    allow_negative_standings = {
                        name = "Allow Negative Standings",
                        desc = "Allow biding more than current standings and end up with negative values.",
                        type = "toggle",
                        width = "full",
                        order = 7
                    },
                    allow_negative_bidders = {
                        name = "Allow Negative Bidders",
                        desc = "Allow biding when current standings are negative values.",
                        type = "toggle",
                        width = "full",
                        order = 8
                    },
                    auction_time = {
                        name = "Auction length",
                        desc = "Auction length in seconds.",
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 10
                    },
                    antisnipe_time = {
                        name = "Anti-snipe time",
                        desc = "Time in seconds by which auction will be extended if bid is received during last 10 seconds.",
                        type = "input",
                        pattern = CONSTANTS.REGEXP_FLOAT_POSITIVE,
                        width = 1,
                        order = 11
                    },
                }
            },
            default_slot_values = {
                name = "Default slot values",
                type = "group",
                args = default_slot_values_args
            },
            item_value_overrides = {
                name = "Item value overrides",
                type = "group",
                args = item_value_overrides_args
            },
            boss_kill_award_values = {
                name = "Boss kill award values",
                type = "group",
                args = boss_kill_award_values_args
            }
        }
    }
    return options
end

function RosterManagerOptions:UpdateOptions()
    local options = {
        new = { -- Global options -> Create New Roster
            name = "Create",
            desc = "Creates new roster with default configuration",
            type = "execute",
            func = function() RosterManager:NewRoster(self.pointType, self.rosterName); self.rosterName = RosterManager:GenerateName() end,
            disabled = (function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
            order = 1
        },
        roster_name = {
            name = "Roster name",
            desc = "Roster Name",
            type = "input",
            set = (function(i, v) self.rosterName = v end),
            get = (function(i) return self.rosterName end),
            pattern = ".+",
            order = 2,
            -- disabled = true,--(function() return not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) end),
        },
        point_type = {
            name = "Point type",
            desc = "Currently only DKP supported.",
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
