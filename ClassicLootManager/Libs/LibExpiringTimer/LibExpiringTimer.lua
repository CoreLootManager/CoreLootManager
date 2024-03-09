
assert(LibStub, "LibExpiringTimer requires LibStub")

local LibExpiringTimer = LibStub:NewLibrary("LibExpiringTimer", 1)
if not LibExpiringTimer then return end


ExpiringTimer = {
    __call = function(self) return self.Refresh(self) end
}

local function spawn(self)
    if not self.__expiration_callback then
        self.__expiration_callback = function()
            self.__expired = true
            if not self.__ticker:IsCancelled() then
                self.__ticker:Cancel()
            end
            self.callback()
        end
    end

    self.__expired = false
    self.__ticker = C_Timer.NewTicker(self.time, self.__expiration_callback)
end

function ExpiringTimer:Refresh()
    if not self.__expired and self.__ticker then
        self.__ticker:Cancel()
    end

    spawn(self)

    return self
end

local function NewTimer(time, callback)
    if type(time) ~= "number" then
        error(("Argument #1 to `NewTimer' must be a number, got %s."):format(type(time)), 2)
    end
    if type(callback) ~= "function" then
        error(("Argument #1 to `NewTimer' must be a function, got %s."):format(type(callback)), 2)
    end

    local o = {}

    setmetatable(o, ExpiringTimer)
    ExpiringTimer.__index = ExpiringTimer

    o.time = time
    o.callback = callback

    return o
end

setmetatable(LibExpiringTimer, { __call = function(_, ...) return NewTimer(...) end })