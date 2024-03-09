
assert(LibStub, "LibExpiringTimer requires LibStub")

local LibExpiringTimer = LibStub:NewLibrary("LibExpiringTimer", 1)
if not LibExpiringTimer then return end


ExpiringTimer = {
    __call = function(self) return self.Refresh(self) end,
}

local function spawn(self)
    self.__ticker = C_Timer.NewTimer(self.time, function()
        self.__ticker = nil
        self.callback()
    end)
end

function ExpiringTimer:Refresh()
    if self.__ticker then
        self.__ticker:Cancel()
        self.__ticker = nil
    end

    spawn(self)

    return self
end

local function NewExpiringTimer(time, callback)
    if type(time) ~= "number" then
        error(("Argument #1 to `NewTimer' must be a number, got %s."):format(type(time)), 2)
    end
    if type(callback) ~= "function" then
        error(("Argument #2 to `NewTimer' must be a function, got %s."):format(type(callback)), 2)
    end
    local o = {}
    setmetatable(o, ExpiringTimer)
    ExpiringTimer.__index = ExpiringTimer
    o.time = time
    o.callback = callback
    return o
end

LibExpiringTimer.New = NewExpiringTimer

setmetatable(LibExpiringTimer, {
    __call = function(_, ...)
        return NewExpiringTimer(...)
    end
})