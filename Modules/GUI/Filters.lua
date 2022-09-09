-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

---------------------------------
-- Filter is breaking MVC rule --
---------------------------------

local setmetatable = setmetatable
local ipairs, tonumber, tostring = ipairs, tonumber, tostring
local sfind, strlower, strlen = string.find, strlower, strlen

local filterInstanceId = 1

local supportedFilters = {
    "class",
    "inRaid",
    "inStandby",
    "inGuild",
    "external",
    "main",
    "locked",
    "online",
    "rank"
}

local supportedOptions = {
    "buttons",
    "search",
    "horizontal"
}

local Filters = {}
function Filters:New(refreshFn, usedFilters, usedOptions, prefix, filterOrderStartOffset)

    local o = {}

    setmetatable(o, self)
    self.__index = self


    o.anyFilter = false

    for _, name in ipairs(supportedFilters) do
        o[name] = usedFilters[name] and true or false
        o.anyFilter = o.anyFilter or o[name]
    end

    for _, name in ipairs(supportedOptions) do
        o[name] = usedOptions[name] and true or false
    end

    o.filterOrderStartOffset = tonumber(filterOrderStartOffset) or 0
    o.prefix = tostring(prefix or "filter") .. tostring(filterInstanceId)
    o.refreshFn = refreshFn

    o.filters = {}

    filterInstanceId = filterInstanceId + 1

    return o
end

CONSTANTS.FILTER = {
    IN_RAID      = 100,
    ONLINE       = 101,
    STANDBY      = 102,
    IN_GUILD     = 103,
    NOT_IN_GUILD = 104,
    MAINS_ONLY   = 105,
    LOCKED_ONLY  = 106
}

CONSTANTS.FILTERS_GUI = {
    [CONSTANTS.FILTER.IN_RAID] = CLM.L["In Raid"],
    [CONSTANTS.FILTER.ONLINE] = CLM.L["Online"],
    [CONSTANTS.FILTER.STANDBY] = CLM.L["Standby"],
    [CONSTANTS.FILTER.IN_GUILD] = CLM.L["In Guild"],
    [CONSTANTS.FILTER.NOT_IN_GUILD] = CLM.L["External"],
    [CONSTANTS.FILTER.MAINS_ONLY] = CLM.L["Mains"],
    [CONSTANTS.FILTER.LOCKED_ONLY] = CLM.L["Locked"]
}

local color = "FFD100"
local parameterToConstantMap = {
    inRaid = CONSTANTS.FILTER.IN_RAID,
    inStandby = CONSTANTS.FILTER.STANDBY,
    inGuild = CONSTANTS.FILTER.IN_GUILD,
    external = CONSTANTS.FILTER.NOT_IN_GUILD,
    main = CONSTANTS.FILTER.MAINS_ONLY,
    online = CONSTANTS.FILTER.ONLINE,
    locked = CONSTANTS.FILTER.LOCKED_ONLY,
}

local function SelectClasses(self, isSelect)
    for i=1,10 do
        self.filters[i] = isSelect and true or false
    end
end

local function HandleMutualExclusiveOptions(self, filterId, valueToSet)
    if not valueToSet then return end
    if filterId == CONSTANTS.FILTER.IN_RAID then
        self.filters[CONSTANTS.FILTER.STANDBY] = false
    elseif filterId == CONSTANTS.FILTER.STANDBY then
        self.filters[CONSTANTS.FILTER.IN_RAID] = false
    end
    if filterId == CONSTANTS.FILTER.IN_GUILD then
        self.filters[CONSTANTS.FILTER.NOT_IN_GUILD] = false
    elseif filterId == CONSTANTS.FILTER.NOT_IN_GUILD then
        self.filters[CONSTANTS.FILTER.IN_GUILD] = false
    end
end

local function GetSearchFunction(searchList)
    return (function(input)
        for _, searchString in ipairs(searchList) do
            searchString = UTILS.Trim(searchString)
            if strlen(searchString) >= 3 then
                searchString = ".*" .. strlower(searchString) .. ".*"
                if(sfind(strlower(input), searchString)) then
                    return true
                end
            end
        end
        return false
    end)
end

function Filters:GetAceOptions()
    if self.options then return self.options end
    local options = {}
    local filters = {}

    if self.class then
        UTILS.mergeDictsInline(filters, UTILS.ShallowCopy(UTILS.GetColorCodedClassList()))
        SelectClasses(self, true)
    else
        SelectClasses(self, false)
    end

    for param, constant in pairs(parameterToConstantMap) do
        if self[param] then
            filters[constant] = UTILS.ColorCodeText(CONSTANTS.FILTERS_GUI[constant], color)
        else
            self.filters[constant] = false
        end
    end

    if self.rank and self.inGuild then
        for index, info in pairs(CLM.MODULES.GuildInfoListener:GetRanks()) do
            local internalRankIndex = 1000 + index
            filters[internalRankIndex] = info.name
            self.filters[internalRankIndex] = true
        end
    end

    -- Header
    local order = self.filterOrderStartOffset
    -- Filters
    if self.anyFilter then
        options[self.prefix .. "display"] = {
            name = CLM.L["Filter"],
            type = "multiselect",
            set = function(i, k, v)
                self:SetFilterValue(k, v)
                self.refreshFn(true)
            end,
            get = function(i, v) return self.filters[tonumber(v)] end,
            values = filters,
            disabled = function() return self.searchFunction and true or false end,
            width = "half",
            order = order
        }
        order = order + 1
        if self.buttons and self.class then
            options[self.prefix .. "select_all"] = {
                name = CLM.L["All"],
                desc = CLM.L["Select all classes."],
                type = "execute",
                func = (function()
                    SelectClasses(self, true)
                    self.refreshFn(true)
                end),
                disabled = function() return self.searchFunction and true or false end,
                width = 0.49,
                order = order,
            }
            order = order + 1
            options[self.prefix .. "select_none"] = {
                name = CLM.L["None"],
                desc = CLM.L["Clear all classes."],
                type = "execute",
                func = (function()
                    SelectClasses(self, false)
                    self.refreshFn(true)
                end),
                disabled = function() return self.searchFunction and true or false end,
                width = 0.49,
                order = order,
            }
            order = order + 1
        end
    end
    if self.search then
        options[self.prefix .. "search"] = {
            name = CLM.L["Search"],
            desc = CLM.L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."],
            type = "input",
            set = (function(i, v)
                self.searchString = v
                if v and strlen(v) >= 3 then
                    self.searchFunction = GetSearchFunction({ strsplit(",", v) })
                else
                    self.searchFunction = nil
                end
                self.refreshFn(true)
            end),
            get = (function(i) return self.searchString end),
            width = self.horizontal and 1 or "full",
            order = order,
        }
    end

    self.options = options
    return options
end

function Filters:SetFilterValue(filterId, valueToSet)
    self.filters[tonumber(filterId) or 0] = valueToSet and true or false
    HandleMutualExclusiveOptions(self, filterId, valueToSet)
end

function Filters:Filter(playerName, playerClass, searchFieldsList)

    -- Check Search first, discard others
    if self.searchFunction then
        for _, field in ipairs(searchFieldsList) do
            if self.searchFunction(field) then
                return true
            end
        end
        return false
    end

    local status = true
    if self.class then
        for id, _class in pairs(UTILS.GetColorCodedClassList()) do
            if playerClass == _class then
                status = self.filters[id]
            end
        end
    end

    if self.inRaid and self.filters[CONSTANTS.FILTER.IN_RAID] then
        local isInRaid = {}
        for i=1,MAX_RAID_MEMBERS do
            local name = GetRaidRosterInfo(i)
            if name then
                name = UTILS.RemoveServer(name)
                isInRaid[name] = true
            end
        end
        status = status and isInRaid[playerName]
    elseif self.inStandby and self.filters[CONSTANTS.FILTER.STANDBY] then
        if CLM.MODULES.RaidManager:IsInProgressingRaid() then
            local profile = CLM.MODULES.ProfileManager:GetProfileByName(playerName)
            if profile then
                status = status and CLM.MODULES.RaidManager:GetRaid():IsPlayerOnStandby(profile:GUID())
            end
        elseif CLM.MODULES.RaidManager:IsInCreatedRaid() then
            local profile = CLM.MODULES.ProfileManager:GetProfileByName(playerName)
            if profile then
                status = status and CLM.MODULES.StandbyStagingManager:IsPlayerOnStandby(CLM.MODULES.RaidManager:GetRaid():UID(), profile:GUID())
            end
        else
            status = false
        end
    end

    local profile = CLM.MODULES.ProfileManager:GetProfileByName(playerName)
    if self.main and self.filters[CONSTANTS.FILTER.MAINS_ONLY] then
        if profile then
            status = status and (profile:Main() == "")
        end
    end
    local guildies = CLM.MODULES.GuildInfoListener:GetGuildies()
    local inGuild = (guildies[playerName] ~= nil)
    if self.rank and self.inGuild then
        if inGuild then
            status = status and self.filters[guildies[playerName] + 1000]
        end
    end

    if self.locked and self.filters[CONSTANTS.FILTER.LOCKED_ONLY] then
        if profile then
            status = status and profile:IsLocked()
        end
    end

    if self.external and self.filters[CONSTANTS.FILTER.NOT_IN_GUILD] then
        status = status and not inGuild
    end
    if self.inGuild and self.filters[CONSTANTS.FILTER.IN_GUILD] then
        status = status and inGuild
    end
    return status
end

CLM.MODELS.Filters = Filters