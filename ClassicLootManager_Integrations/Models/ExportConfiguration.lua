local _, PRIV = ...
local CLM = LibStub("ClassicLootManager").CLM

local setmetatable = setmetatable

local ExportConfiguration = {}
function ExportConfiguration:New(format, jobs, timerange, rosters, profiles)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.format = PRIV.CONSTANTS.FORMAT_VALUES[format] and format or PRIV.CONSTANTS.FORMAT_VALUE.XML
    o.jobs = jobs
    o.timerange = {
        begin = timerange.begin or 0,
        finish = timerange.finish or 0
    }
    o.rosters = rosters
    o.profiles = profiles

    return o
end


PRIV.MODELS.ExportConfiguration = ExportConfiguration