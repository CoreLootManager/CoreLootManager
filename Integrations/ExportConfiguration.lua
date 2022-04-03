local _, CLM = ...

local MODELS = CLM.MODELS

local ExportConfiguration = {}
function ExportConfiguration:New(format, jobs, timeframe, rosters, profiles)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.format = CLM.CONSTANTS.FORMAT_VALUES[format] and format or CLM.CONSTANTS.FORMAT_VALUE.XML
    o.jobs = jobs
    o.timeframe = {}
    o.timeframe.value = tonumber(timeframe.value) or 0
    if o.timeframe.value <= 0 then o.timeframe.value = 1 end
    o.timeframe.scale = CLM.CONSTANTS.TIMEFRAME_SCALE_VALUES[timeframe.scale] and timeframe.scale or CLM.CONSTANTS.TIMEFRAME_SCALE_VALUE.WEEKS
    o.rosters = rosters
    o.profiles = profiles

    return o
end


MODELS.ExportConfiguration = ExportConfiguration