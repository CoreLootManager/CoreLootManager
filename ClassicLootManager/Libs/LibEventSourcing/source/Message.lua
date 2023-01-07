local Message, _ = LibStub:NewLibrary("EventSourcing/Message", 1)
if not Message then
    return
end


local Util = LibStub("EventSourcing/Util")

Message.__index = Message
Message._types = {}

-- private constructor
local function constructor(self)
    local o = {}
    setmetatable(o, self)
    return o
end

function Message:extend(identifier)
    if Message._types[identifier] ~= nil then
        error("Duplicate message type")
    end

    local o = constructor(self)
    o.__index = o

    -- static properties (won't appear on instances)
    o._type = identifier
    Message._types[identifier] = o
    return o

end

function Message:new()
    local o = constructor(self)

    o.type = self._type
    o.created = Util.time()
    return o
end

function Message:validate()
    Util.assertString(self.type)
    Util.assertNumber(self.created, 'created')
end

function Message.cast(message)
    if type(message) == "table" and message.type ~= nil and Message._types[message.type] ~= nil then
        setmetatable(message, Message._types[message.type])
        local result, error = pcall(message.validate, message)
        if not result then
            print(error)

        end
        return result
    end
    return false
end
