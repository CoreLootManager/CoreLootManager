-- MIT License
--
-- Copyright (c) 2021 Lantis / Classic Loot Manager team
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local _, CLM = ...

local MODELS = CLM.MODELS
local UTILS = CLM.UTILS

local mergeLists = UTILS.mergeLists
-- local typeof = UTILS.typeof
-- local getIntegerGuid = UTILS.getIntegerGuid
-- local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local CreateGUIDList = UTILS.CreateGUIDList

local LogEntry  = LibStub("EventSourcing/LogEntry")

-- Point DKP X
local Modify        = LogEntry:extend("DM")
local ModifyRaid    = LogEntry:extend("DR");
local Set           = LogEntry:extend("DS")
local Decay         = LogEntry:extend("DD")

function Modify:new(rosterUid, playerList, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    return o
end

function Modify:rosterUid()
    return self.r
end

function Modify:targets()
    return self.p
end

function Modify:value()
    return self.v
end

function Modify:reason()
    return self.e
end

local modifyFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e"})
function Modify:fields()
    return modifyFields
end

function ModifyRaid:new(raidUid, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(raidUid) or 0
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    return o
end

function ModifyRaid:raidUid()
    return self.r
end

function ModifyRaid:value()
    return self.v
end

function ModifyRaid:reason()
    return self.e
end

local modifyRaidFields = mergeLists(LogEntry:fields(), {"r", "v", "e"})
function ModifyRaid:fields()
    return modifyRaidFields
end

function Set:new(rosterUid, playerList, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    return o
end

function Set:rosterUid()
    return self.r
end

function Set:targets()
    return self.p
end

function Set:value()
    return self.v
end

function Set:reason()
    return self.e
end

local setFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e"})
function Set:fields()
    return setFields
end

function Decay:new(rosterUid, playerList, value, reason)
    local o = LogEntry.new(self);
    o.r = tonumber(rosterUid) or 0
    o.p = CreateGUIDList(playerList)
    value = tonumber(value) or 0
    if value > 100 then value = 100 end
    if value < 0 then value = 0 end
    o.v = tonumber(value) or 0
    o.e = tonumber(reason) or 0
    return o
end

function Decay:rosterUid()
    return self.r
end

function Decay:targets()
    return self.p
end

function Decay:value()
    return self.v
end

function Decay:reason()
    return self.e
end

local decayFields = mergeLists(LogEntry:fields(), {"r", "p", "v", "e"})
function Decay:fields()
    return decayFields
end

MODELS.LEDGER.DKP = {
    Modify = Modify,
    Set = Set,
    Decay = Decay,
    ModifyRaid = ModifyRaid
}
