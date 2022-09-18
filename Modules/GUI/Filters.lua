local define = LibDependencyInjection.createContext(...)

define.module("Models/Filter", {"L", "Utils", "Constants/FilterType", "GuildInfoListener", "RaidManager", "ProfileRegistry", "StandbyStagingManager"},
function(resolve, L, Utils, FilterType, GuildInfoListener, RaidManager, ProfileRegistry, StandbyStagingManager)

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

local FILTERS_GUI = {
    [FilterType.IN_RAID] = L["In Raid"],
    [FilterType.ONLINE] = L["Online"],
    [FilterType.STANDBY] = L["Standby"],
    [FilterType.IN_GUILD] = L["In Guild"],
    [FilterType.NOT_IN_GUILD] = L["External"],
    [FilterType.MAINS_ONLY] = L["Mains"],
    [FilterType.LOCKED_ONLY] = L["Locked"]
}

local color = "FFD100"
local parameterToConstantMap = {
    inRaid = FilterType.IN_RAID,
    inStandby = FilterType.STANDBY,
    inGuild = FilterType.IN_GUILD,
    external = FilterType.NOT_IN_GUILD,
    main = FilterType.MAINS_ONLY,
    online = FilterType.ONLINE,
    locked = FilterType.LOCKED_ONLY,
}

local function SelectClasses(self, isSelect)
    for i=1,10 do
        self.filters[i] = isSelect and true or false
    end
end

local function HandleMutualExclusiveOptions(self, filterId, valueToSet)
    if not valueToSet then return end
    if filterId == FilterType.IN_RAID then
        self.filters[FilterType.STANDBY] = false
    elseif filterId == FilterType.STANDBY then
        self.filters[FilterType.IN_RAID] = false
    end
    if filterId == FilterType.IN_GUILD then
        self.filters[FilterType.NOT_IN_GUILD] = false
    elseif filterId == FilterType.NOT_IN_GUILD then
        self.filters[FilterType.IN_GUILD] = false
    end
end

local function GetSearchFunction(searchList)
    return (function(input)
        for _, searchString in ipairs(searchList) do
            searchString = Utils.Trim(searchString)
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
        Utils.mergeDictsInline(filters, Utils.ShallowCopy(Utils.GetColorCodedClassList()))
        SelectClasses(self, true)
    else
        SelectClasses(self, false)
    end

    for param, constant in pairs(parameterToConstantMap) do
        if self[param] then
            filters[constant] = Utils.ColorCodeText(FILTERS_GUI[constant], color)
        else
            self.filters[constant] = false
        end
    end

    if self.rank and self.inGuild then
        for index, info in pairs(GuildInfoListener:GetRanks()) do
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
            name = L["Filter"],
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
                name = L["All"],
                desc = L["Select all classes."],
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
                name = L["None"],
                desc = L["Clear all classes."],
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
            name = L["Search"],
            desc = L["Search for player names. Separate multiple with a comma ','. Minimum 3 characters. Overrides filtering."],
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
        for id, _class in pairs(Utils.GetColorCodedClassList()) do
            if playerClass == _class then
                status = self.filters[id]
            end
        end
    end

    if self.inRaid and self.filters[FilterType.IN_RAID] then
        local isInRaid = {}
        for i=1,MAX_RAID_MEMBERS do
            local name = GetRaidRosterInfo(i)
            if name then
                name = Utils.RemoveServer(name)
                isInRaid[name] = true
            end
        end
        status = status and isInRaid[playerName]
    elseif self.inStandby and self.filters[FilterType.STANDBY] then
        if RaidManager:IsInProgressingRaid() then
            local profile = ProfileRegistry.GetByName(playerName)
            if profile then
                status = status and RaidManager:GetRaid():IsPlayerOnStandby(profile:GUID())
            end
        elseif RaidManager:IsInCreatedRaid() then
            local profile = ProfileRegistry.GetByName(playerName)
            if profile then
                status = status and StandbyStagingManager:IsPlayerOnStandby(RaidManager:GetRaid():UID(), profile:GUID())
            end
        else
            status = false
        end
    end

    local profile = ProfileRegistry.GetByName(playerName)
    if self.main and self.filters[FilterType.MAINS_ONLY] then
        if profile then
            status = status and (profile:Main() == "")
        end
    end
    local guildies = GuildInfoListener:GetGuildies()
    local inGuild = (guildies[playerName] ~= nil)
    if self.rank and self.inGuild then
        if inGuild then
            status = status and self.filters[guildies[playerName] + 1000]
        end
    end

    if self.locked and self.filters[FilterType.LOCKED_ONLY] then
        if profile then
            status = status and profile:IsLocked()
        end
    end

    if self.external and self.filters[FilterType.NOT_IN_GUILD] then
        status = status and not inGuild
    end
    if self.inGuild and self.filters[FilterType.IN_GUILD] then
        status = status and inGuild
    end
    return status
end

resolve(Filters)

end)

define.module("Constants/FilterType", {}, function(resolve)
return resolve({
    IN_RAID      = 100,
    ONLINE       = 101,
    STANDBY      = 102,
    IN_GUILD     = 103,
    NOT_IN_GUILD = 104,
    MAINS_ONLY   = 105,
    LOCKED_ONLY  = 106
})

end)