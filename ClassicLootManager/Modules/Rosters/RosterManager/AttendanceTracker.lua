-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, GetServerTime = pairs, GetServerTime

local WeekNumber = UTILS.WeekNumber
local weekOffsetEU = UTILS.GetWeekOffsetEU()
local weekOffsetUS = UTILS.GetWeekOffsetUS()

local AttendanceTracker = {}

function AttendanceTracker:New(raidsPerWeekForFullAttendance, averageWindowWeeks, weeklyReset)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    -- Config
    o.raidsPerWeekForFullAttendance = raidsPerWeekForFullAttendance or 2
    o.averageWindowWeeks = averageWindowWeeks or 10
    o.weeklyReset = weeklyReset or CONSTANTS.WEEKLY_RESET.EU
    o.currentWeek = WeekNumber(GetServerTime(), (weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS)
    -- Attendance Gathered
    o.weeklyAttendance = {}
    -- Attendance Percentage calculated
    o.attendancePercentage = {}

    return o
end

function AttendanceTracker:UpdateWeeklyReset(weeklyReset)
    self.weeklyReset = weeklyReset or CONSTANTS.WEEKLY_RESET.EU
    self.currentWeek = WeekNumber(GetServerTime(), (weeklyReset == CONSTANTS.WEEKLY_RESET.EU) and weekOffsetEU or weekOffsetUS)
end

function AttendanceTracker:Update(GUID, raidId, timestamp)
    local week = WeekNumber(timestamp or 0, self.weeklyReset)
    if (self.currentWeek - week) < self.averageWindowWeeks then
        if not self.weeklyAttendance[GUID] then
            self.weeklyAttendance[GUID] = {}
        end
        if not self.weeklyAttendance[GUID][week] then
            self.weeklyAttendance[GUID][week] = {}
        end
        self.weeklyAttendance[GUID][week][raidId] = true
    end
end

function AttendanceTracker:Get(GUID)
    if not self.weeklyAttendance[GUID] then return 0 end
    if not self.attendancePercentage[GUID] then
        local attendance = 0
        for _,raidDict in pairs(self.weeklyAttendance[GUID]) do
            local raids = 0
            for _,_ in pairs(raidDict) do raids = raids + 1 end
            local weeklyAttendance = (raids / self.raidsPerWeekForFullAttendance)
            if weeklyAttendance > 1 then weeklyAttendance = 1 end
            if weeklyAttendance < 0 then weeklyAttendance = 0; LOG:Fatal("Weekly attendance < 0???") end
            attendance = attendance + weeklyAttendance
        end
        self.attendancePercentage[GUID] = 100*(attendance / self.averageWindowWeeks)
    end
    return self.attendancePercentage[GUID]
end

CLM.MODELS.AttendanceTracker = AttendanceTracker