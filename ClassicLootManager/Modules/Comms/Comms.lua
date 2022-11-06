-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local ssub, type = string.sub,type

local whoami = UTILS.whoami()

local serdes = LibStub("LibSerialize")
local codec = LibStub("LibDeflate")

local CommsPrefix = "CLM"

local Comms = CLM.CORE:NewModule("Comms", {}, "AceComm-3.0")
function Comms:Initialize()
    LOG:Trace("Comms:Initialize()")
    self.callbacks = {}
    self.securityCallbacks = {}
    self.allowSelfReceive = {}
    self.suspended = {}
    self.enabled = false
end

function Comms:Enable()
    self.enabled = true
end

function Comms:IsEnabled()
    return self.enabled
end

local function _prefix(prefix)
    return CommsPrefix .. ssub(prefix or "", 0, 12)
end

function Comms:Register(prefix, callback, securityCallbackOrLevel, allowSelfReceive)
    LOG:Trace("Comms:Register()")
    if type(callback) ~= "function" then
        LOG:Error("Comms:Register(): callback is not a function")
        return false
    end

    if type(prefix) ~= "string" then
        LOG:Error("Comms:Register(): prefix [%s] is not a string", prefix)
        return false
    end

    if string.len(prefix) > 12 then
        LOG:Warning("Comms:Register(): truncating prefix [%s] to 12 chars: ", prefix)
    end
    prefix = _prefix(prefix)

    if self.callbacks[prefix] ~= nil then
        LOG:Warning("Comms:Register(): Re-registering prefix %s", prefix)
    end

    if type(securityCallbackOrLevel) == "function" then
        self.securityCallbacks[prefix] = securityCallbackOrLevel
    elseif type(securityCallbackOrLevel) == "number" then
        self.securityCallbacks[prefix] = (function(name, _) return CLM.MODULES.ACL:CheckLevel(securityCallbackOrLevel, name) end)
    else
        LOG:Fatal("Comms:Register(): Unknown security callback or ACL Level. Setting to any.")
        self.securityCallbacks[prefix] = (function() return true end)
    end

    self.callbacks[prefix] = callback
    self.allowSelfReceive[prefix] = allowSelfReceive
    self:RegisterComm(prefix, "OnReceive")
end

function Comms:Suspend(prefix)
    LOG:Trace("Comms:Suspend()")
    if not self.enabled then return false end
    -- Prefix
    prefix = _prefix(prefix)
    LOG:Debug("Suspending %s", prefix)
    self.suspended[prefix] = true
end

function Comms:RevokeSuspension(prefix)
    prefix = _prefix(prefix)
    self.suspended[prefix] = nil
end

function Comms:Disable()
    LOG:Trace("Comms:Disable()")
    LOG:Info("Disabling Comms.")
    self.enabled = false
end

function Comms:Send(prefix, message, distribution, target, priority)
    -- LOG:Trace("Comms:Send()") -- SPAM
    if not self.enabled then
        LOG:Debug("Comms:Send(): Disabled")
        return false
    end
    -- Prefix
    prefix = _prefix(prefix)
    if type(self.callbacks[prefix]) ~= "function" then
        LOG:Error("Comms:Send() unregistered prefix: %s", prefix)
        return false
    end
    -- Check if prefix comms are suspended
    if self.suspended[prefix] then
        LOG:Debug("Comms:Send() blocked suspended prefix %s", prefix)
        return
    end
    -- Check ACL before working on data to prevent UI Freeze DoS
    if not self.securityCallbacks[prefix](whoami, message and #message or 0) then
        LOG:Warning("Trying to send privileged message [%s]", prefix)
        return false
    end
    -- Distribution
    if not CONSTANTS.COMMS.DISTRIBUTIONS[distribution] then
        LOG:Error("Comms:Send() invalid distribution: %s", distribution)
        return false
    end
    -- Priority
    if not CONSTANTS.COMMS.PRIORITIES[priority] then
        priority = CONSTANTS.COMMS.PRIORITY.NORMAL
    end
    -- Serialize
    local tmp = serdes:Serialize(message)
    if tmp == nil then
        LOG:Error("Comms:Send() unable to serialize message: %s", message)
        return false
    end
    -- Compress
    tmp = codec:CompressDeflate(tmp, { level = 4 })
    if tmp == nil then
        LOG:Error("Comms:Send() unable to compress message: %s", message)
        return false
    end
    -- Encode for WoW
    tmp = codec:EncodeForWoWAddonChannel(tmp)
    if tmp == nil then
        LOG:Error("Comms:Send() unable to encode message: %s", message)
        return false
    end
    LOG:Debug("Message on channel %s with size %s [B] ", prefix, tmp:len())
    self:SendCommMessage(prefix, tmp, distribution, target, priority)
    return true
end

function Comms:OnReceive(prefix, message, distribution, sender)
    -- LOG:Trace("Comms:OnReceive() %s", prefix) --  SPAM
    if not self.enabled then
        LOG:Debug("Comms:OnReceive(): Disabled")
        return false
    end
    -- Ignore messages from self if not allowing them specifically
    if not self.allowSelfReceive[prefix] and (sender == whoami) then
        return false
    end
    -- Validate prefix
    if self.callbacks[prefix] == nil then
        LOG:Warning("Comms:OnReceive() received message with unsupported prefix [%s] from [%s]", prefix, sender)
        return
    end
    -- Check if prefix comms are suspended
    if self.suspended[prefix] then
        LOG:Debug("Comms:OnReceive() ignoring suspended prefix %s", prefix)
        return
    end
    -- Check ACL before working on data to prevent UI Freeze DoS
    if not self.securityCallbacks[prefix](sender, message and #message or 0) then
        LOG:Warning("Comms:OnReceive() received privileged message [%s] from unprivileged sender [%s]", prefix, sender)
        return
    end
    -- Decode
    local tmp = codec:DecodeForWoWAddonChannel(message)
    if tmp == nil then
        LOG:Debug("Comms:OnReceive() unable to decode message [%s] from [%s]", prefix, sender)
        return
    end
    -- Decompress
    tmp = codec:DecompressDeflate(tmp)
    if tmp == nil then
        LOG:Debug("Comms:OnReceive() unable to decompress message [%s] from [%s]", prefix, sender)
        return
    end
    -- Deserialize
    local success;
    success, tmp = serdes:Deserialize(tmp)
    if not success then
        LOG:Debug("Comms:OnReceive() unable to deserialize message [%s] from [%s]", prefix, sender)
        return
    end
    -- Execute callback
    self.callbacks[prefix](tmp, distribution, sender)
end

-- Publish API
CLM.MODULES.Comms = Comms

-- Constants
CONSTANTS.COMMS = {
    SEPARATOR = "\t",
    PRIORITIES = UTILS.Set({
        "ALERT",
        "NORMAL",
        "BULK"
    }),
    PRIORITY = {
        ALERT = "ALERT",
        NORMAL = "NORMAL",
        BULK = "BULK"
    },
    DISTRIBUTIONS = UTILS.Set({
        "PARTY",
        "RAID",
        --"INSTANCE_CHAT",
        "GUILD",
        "MANAGER",
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