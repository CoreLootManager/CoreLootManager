local _, PRIV = ...

---@class ExportConfiguration
---@field format number
---@field jobs table
---@field timerange { begin: number, finish: number }
---@field rosters table
---@field profiles table
local ExportConfiguration = {}

---@param format number
---@param jobs table
---@param timerange { begin: number?, finish: number? }
---@param rosters table
---@param profiles table
---@return ExportConfiguration
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