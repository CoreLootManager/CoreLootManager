local  _, CLM = ...

local function Set(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

CLM.CONSTANTS.COMMS = {
    SEPARATOR = "\t",
    PRIORITIES = Set({
        "ALERT",
        "NORMAL",
        "BULK"
    }),
    PRIORITY = {
        ALERT = "ALERT",
        NORMAL = "NORMAL",
        BULK = "BULK"
    },
    DISTRIBUTIONS = Set({
        "PARTY",
        "RAID",
        --"INSTANCE_CHAT",
        "GUILD",
        "OFFICER",
        "WHISPER",
        --"SAY",
        --"YELL"
    }),
    DISTRIBUTION = {
        PARTY = "PARTY",
        RAID = "RAID",
        --INSTANCE = "INSTANCE_CHAT",
        GUILD = "GUILD",
        OFFICER = "OFFICER",
        WHISPER = "WHISPER",
        --SAY = "SAY",
        --YELL = "YELL"
    }
}

local Comms = CLM.CORE:NewModule("Comms", {}, "AceComm-3.0")
local serdes = LibStub("LibSerialize")
local codec = LibStub("LibDeflate")

local CONSTANTS = CLM.CONSTANTS.COMMS

local LOG = CLM.LOG
local CommsPrefix = "CLM"

function Comms:Initialize()
    LOG:Info("Comms:Initialize()")
    self.callbacks = {}
    self.aclLevel = {}
    self.enabled = false
end

function Comms:Enable()
    self.enabled = true
end

local function _prefix(prefix)
    return CommsPrefix .. string.sub(prefix, 0, 12)
end

function Comms:Register(prefix, callback, aclLevel)
    LOG:Info("Comms:Register()")
    if type(callback) ~= "function" then
        LOG:Fatal("Comms:Register(): callback is not a function")
        return false
    end

    if type(prefix) ~= "string" then
        LOG:Fatal("Comms:Register(): prefix is not a string: " .. tostring(prefix))
        return false
    end

    if string.len(prefix) > 12 then
        LOG:Warning("Comms:Register(): truncating prefix to 12 chars: " .. prefix)
    end
    prefix = _prefix(prefix)

    if self.callbacks[prefix] ~= nil then
        LOG:Warning("Comms:Register(): Re-registering prefix " .. prefix)
    end

    if type(aclLevel) ~= "number" then
        LOG:Warning("Comms:Register(): Unknown ACL Level  " .. tostring(aclLevel) .. ". Setting to any.")
        aclLevel = 0
    end

    self.callbacks[prefix] = callback
    self.aclLevel[prefix] = aclLevel
    self:RegisterComm(prefix, "OnReceive")
end

function Comms:Send(prefix, message, distribution, target, priority)
    LOG:Info("Comms:Send()")
    if not self.enabled then return false end
    -- Sanity
    prefix = _prefix(prefix)
    if not type(self.callbacks[prefix]) == "function" then
        LOG:Error("Comms:Send() unregistered prefix: " .. tostring(prefix))
        return false
    end

    if not CONSTANTS.DISTRIBUTIONS[distribution] then
        LOG:Error("Comms:Send() invalid distribution: " .. tostring(distribution))
        return false
    end
    if not CONSTANTS.PRIORITIES[priority] then
        priority = CONSTANTS.PRIORITY.NORMAL
    end
    -- Serialize
    local tmp = serdes:Serialize(message)
    if tmp == nil then
        LOG:Error("Comms:Send() unable to serialize message: " .. tostring(message))
        return false
    end
    -- Compress
    tmp = codec:CompressDeflate(tmp, { level = 9 })
    if tmp == nil then
        LOG:Error("Comms:Send() unable to compress message: " .. tostring(message))
        return false
    end
    -- Encode for WoW
    tmp = codec:EncodeForWoWAddonChannel(tmp)
    if tmp == nil then
        LOG:Error("Comms:Send() unable to encode message: " .. tostring(message))
        return false
    end
    self:SendCommMessage(prefix, tmp, distribution, target, priority)
    return true
end

function Comms:OnReceive(prefix, message, distribution, sender)
    LOG:Info("Comms:OnReceive()")
    if not self.enabled then return false end
    -- Validate prefix
    if self.callbacks[prefix] == nil then
        LOG:Warning("Comms:OnReceive() received message with unsupported prefix")
        return
    end
    -- Decode
    local tmp = codec:DecodeForWoWAddonChannel(message)
    if tmp == nil then
        LOG:Error("Comms:OnReceive() unable to decode received message")
        return
    end
    -- Decompress
    tmp = codec:DecompressDeflate(tmp)
    if tmp == nil then
        LOG:Error("Comms:Send() unable to decompress message")
        return
    end
    -- Deserialize
    local success;
    success, tmp = serdes:Deserialize(tmp)
    if not success then
        LOG:Error("Comms:Send() unable to deserialize message: " .. tostring(tmp))
        return
    end
    -- Get ACL level
    --local aclLevel = CLM.Interconnect.ACL:Get(sender)
    local aclLevel = 0
    -- Execute callback
    if aclLevel >= self.aclLevel[prefix] then
        self.callbacks[prefix](tmp, distribution, sender)
    else
        LOG:Warning("Received privileged message [" .. prefix .."] from unprivileged sender: " .. sender)
    end
end

CLM.Interconnect.Comms = Comms