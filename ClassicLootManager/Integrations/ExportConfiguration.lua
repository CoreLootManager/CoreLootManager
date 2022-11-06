local _, CLM = ...

local setmetatable = setmetatable

local ExportConfiguration = {}
function ExportConfiguration:New(format, jobs, timerange, rosters, profiles)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.format = CLM.CONSTANTS.FORMAT_VALUES[format] and format or CLM.CONSTANTS.FORMAT_VALUE.XML
    o.jobs = jobs
    o.timerange = {
        begin = timerange.begin or 0,
        finish = timerange.finish or 0
    }
    o.rosters = rosters
    o.profiles = profiles

    return o
end


CLM.MODELS.ExportConfiguration = ExportConfiguration