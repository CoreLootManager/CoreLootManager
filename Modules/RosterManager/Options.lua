local _, CLM = ...
-- local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local OPTIONS = CLM.OPTIONS
local MODULES = CLM.MODULES
-- local UTILS = CLM.UTILS
local RosterManager = MODULES.RosterManager
local ProfileManager = MODULES.ProfileManager
local LedgerManager = MODULES.LedgerManager
local ConfigManager = MODULES.ConfigManager

local CBTYPE = {
    GETTER   = "get",
    SETTER   = "set",
    EXECUTOR = "execute"
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

local function GetDefaultSlotValue(name, slot, isMin)
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    local v = roster:GetDefaultSlotValue(slot)
    if isMin then return tostring(v.min) else return tostring(v.max) end
end

local function SetDefaultSlotValue(name, slot, value, isMin)
    RosterManager:SetRosterDefaultSlotValue(name, slot, value, isMin)
end

function RosterManagerOptions:Initialize()
    self.handlers = {
        name_get = (function(name)
            return name
        end),
        name_set = (function(old, new)
            RosterManager:RenameRoster(old, new)
            -- TODO: set to the newly renamed instead of first one. Doable?
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
            RosterManager:AddProfilesToRoster(name, profileList)
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
        point_type_get = (function(name)
            return GetRosterOption(name, "pointType")
        end),
        point_type_set = (function(name, value)
            SetRosterOption(name, "pointType", value)
        end),
        auction_type_get = (function(name)
            return GetRosterOption(name, "auctionType")
        end),
        auction_type_set = (function(name, value)
            SetRosterOption(name, "auctionType", value)
        end),
        item_value_mode_get = (function(name)
            return GetRosterOption(name, "itemValueMode")
        end),
        item_value_mode_set = (function(name, value)
            SetRosterOption(name, "itemValueMode", value)
        end),
        zero_sum_bank_get = (function(name)
            return GetRosterOption(name, "zeroSumBank")
        end),
        zero_sum_bank_set = (function(name, value)
            SetRosterOption(name, "zeroSumBank", value)
        end),
        allow_negative_standings_get = (function(name)
            return GetRosterOption(name, "allowNegativeStandings")
        end),
        allow_negative_standings_set = (function(name, value)
            SetRosterOption(name, "allowNegativeStandings", value)
        end),
        allow_negative_bidders_get = (function(name)
            return GetRosterOption(name, "allowNegativeBidders")
        end),
        allow_negative_bidders_set = (function(name, value)
            SetRosterOption(name, "allowNegativeBidders", value)
        end),
        simultaneous_auctions_get = (function(name)
            return GetRosterOption(name, "simultaneousAuctions")
        end),
        simultaneous_auctions_set = (function(name, value)
            SetRosterOption(name, "simultaneousAuctions", value)
        end)
    }
    -- Handlers for Minimum / Maximum setting
    local values = {minimum = true, maximum = false}
    for _, slot in ipairs(CONSTANTS.INVENTORY_TYPES_SORTED) do
        local prefix = slot.type:lower()
        for type, isMin in pairs(values) do
            local node = "default_slot_values_" .. prefix .. "_" .. type
            self.handlers[ node .."_get"] = (function(name)
                return GetDefaultSlotValue(name, slot.type, isMin)
            end)
            self.handlers[ node .."_set"] = (function(name, value)
                SetDefaultSlotValue(name, slot.type, value, isMin)
            end)
        end
    end

    self:UpdateOptions()

    LedgerManager:RegisterOnUpdate(function(lag, uncommited)
        if lag ~= 0 or uncommited ~= 0 then return end
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
    return nil
end

function RosterManagerOptions:Getter(info, ...)
   return self:_Handle(CBTYPE.GETTER, info, ...)
end

function RosterManagerOptions:Setter(info, ...)
    self:_Handle(CBTYPE.SETTER, info, ...)
end

function RosterManagerOptions:Handler(info, ...)
    self:_Handle(CBTYPE.EXECUTOR, info, ...)
end

function RosterManagerOptions:GenerateRosterOptions(name)

    local default_slot_values_args = (function()
        local values = {
            ["Minimum"] = "Minimum or actual value for Static-Priced auction. Set to 0 to ignore.",
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
                    pattern = "%d+",
                }
                order = order + 1
            end
        end
        return args
    end)()

    local item_value_overrides_args = (function()
        local args = {
            i22812d = {
                name = "",
                type = "description",
                image = 135541,
                order = 0,
                width = 0.25
            },
            i22812v = {
                name = "Nerubian Slavemaker",
                type = "input",
                order = 1,
                itemLink = "item:22812:0:0:0:0:0:0:0:0:0:0:0:0",
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
        func = "Handler",
        args = {
            name = {
                name = "Name",
                desc = "Change roster name.",
                type = "input",
                width = "full",
                order = 1
            },
            copy = {
                name = "Copy settings",
                desc = "Copy settings from selected roster.",
                type = "execute",
                confirm = true,
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
                order = 99
            },
            fill_profiles = {
                name = "Fill profiles",
                desc = "Fills current roster with all profiles.",
                type = "execute",
                confirm = true,
                order = 100
            },
            remove = {
                name = "Remove",
                desc = "Removes current roster.",
                type = "execute",
                confirm = true,
                order = 101
            },
            point_type = {
                name = "Point type",
                desc = "DKP or EPGP (currently not supported).",
                type = "select",
                style = "radio",
                order = 3,
                width = "half",
                disabled = true,
                confirm = true,
                values = {
                    [0] = "DKP",
                    [1] = "EPGP"
                }
            },
            auction_type = {
                name = "Auction type",
                desc = "Type of auction used: Open, Sealed, Vickrey (Sealed with second-highest pay price).",
                type = "select",
                style = "radio",
                order = 4,
                values = {
                    [0] = "Open",
                    [1] = "Sealed",
                    [2] = "Vickrey"
                }
            },
            item_value_mode = {
                name = "Item value mode",
                desc = "Single-Priced (static) or Ascending (in range of min-max) item value.",
                type = "select",
                style = "radio",
                order = 5,
                values = {
                    [0] = "Single-Priced",
                    [1] = "Ascending"
                }
            },
            zero_sum_bank = {
                name = "Zero-Sum Bank",
                desc = "Enable paid value splitting amongst raiders.",
                type = "toggle",
                width = "full",
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
            simultaneous_auctions = {
                name = "Simultaneous auctions",
                desc = "Allow multiple simultaneous auction happening at the same time.",
                type = "toggle",
                width = "full",
                order = 9
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
            func = function() RosterManager:NewRoster() end,
            order = 1
        },
        export = { -- Global options -> Export rosters
            name = "Export",
            desc = "Export rosters to SavedVariable for inspection",
            type = "execute",
            func = function() RosterManager:ExportRosters() end,
            confirm = true,
            order = 2
        }
    }
    local rosters = MODULES.RosterManager:GetRosters()
    for name, _ in pairs(rosters) do
        options[name] = self:GenerateRosterOptions(name)
    end
    MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.ROSTER, options, true)
end

OPTIONS.RosterManager = RosterManagerOptions


-- local function GameTooltip_OnTooltipSetItem(tooltip)
--     tooltip:AddLine("DUPA 8 DEBUG")
--     tooltip:Show()
-- end
-- tooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)