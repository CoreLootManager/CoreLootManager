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

local CreateGUIDList = UTILS.CreateGUIDList
local mergeLists = UTILS.mergeLists

local LogEntry  = LibStub("EventSourcing/LogEntry")

local Create    = LogEntry:extend("AC")
local Start     = LogEntry:extend("AS")
local End       = LogEntry:extend("AE")
local Update    = LogEntry:extend("AU")

MODELS.LEDGER.RAID = {
    Create = Create,
    Start = Start,
    End = End,
    Update = Update
}

function Create:new(rosterUid, name, config)
    local o = LogEntry.new(self)
    o.r = tonumber(rosterUid) or 0
    o.n = name or ""
    o.c = config:deflate()
    return o
end

function Create:rosterUid()
    return self.r
end

function Create:name()
    return self.n
end

function Create:config()
    return self.c
end

local CreateFields = mergeLists(LogEntry:fields(), {"r", "n", "c"})
function Create:fields()
    return CreateFields
end

function Start:new(raidUid, players)
    local o = LogEntry.new(self)
    o.r = raidUid
    o.p = CreateGUIDList(players)
    return o
end

function Start:raid()
    return self.r
end

function Start:players()
    return self.p
end

local StartFields = mergeLists(LogEntry:fields(), {"r", "p"})
function Start:fields()
    return StartFields
end

function End:new(raidUid)
    local o = LogEntry.new(self)
    o.r = raidUid
    return o
end

function End:raid()
    return self.r
end

local EndFields = mergeLists(LogEntry:fields(), {"r"})
function End:fields()
    return EndFields
end

function Update:new(raidUid, leavers, joiners)
    local o = LogEntry.new(self)
    o.r = raidUid or 0
    o.l = CreateGUIDList(leavers)
    o.j = CreateGUIDList(joiners)
    if #o.l + #o.j == 0 then
        error("Must provide at least one leaver or joiner")
    end
    return o
end

function Update:raid()
    return self.r
end

function Update:leavers()
    return self.l
end

function Update:joiners()
    return self.j
end

local updateFields = mergeLists(LogEntry:fields(), {"r", "l", "j"})
function Update:fields()
    return updateFields
end
