
local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local mergeLists = UTILS.mergeLists
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

local ACLUpdateAssistants = LogEntry:extend("AM")
local ACLUpdateManagers = LogEntry:extend("AO")

-- -------------------- --
-- ACLUpdateAssistants --
-- -------------------- --
function ACLUpdateAssistants:new(profiles, remove)
    local o = LogEntry.new(self);
    o.p = CreateGUIDList(profiles)
    o.e = remove and true or false
    return o
end

function ACLUpdateAssistants:profiles()
    return self.p
end

function ACLUpdateAssistants:remove()
    return self.e
end

local ACLUpdateAssistantsFields = mergeLists(LogEntry:fields(), {"p", "e"})
function ACLUpdateAssistants:fields()
    return ACLUpdateAssistantsFields
end

-- -------------------- --
-- ACLUpdateManagers --
-- -------------------- --
function ACLUpdateManagers:new(profiles, remove)
    local o = LogEntry.new(self);
    o.p = CreateGUIDList(profiles)
    o.e = remove and true or false
    return o
end

function ACLUpdateManagers:profiles()
    return self.p
end

function ACLUpdateManagers:remove()
    return self.e
end

local ACLUpdateManagersFields = mergeLists(LogEntry:fields(), {"p", "e"})
function ACLUpdateManagers:fields()
    return ACLUpdateManagersFields
end

MODELS.LEDGER.ACL = {
    UpdateAssistants          = ACLUpdateAssistants,
    UpdateManagers          = ACLUpdateManagers
}