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

local getGuidFromInteger = CLM.UTILS.getGuidFromInteger

local Loot = {}

function Loot:New(entry, owner)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.entry = entry -- ledger entry reference
    o.owner = owner

    return o
end

function Loot:Owner()
    return self.owner
end

function Loot:Id()
    return self.entry:item()
end

function Loot:Value()
    return self.entry:value()
end

function Loot:Timestamp()
    return self.entry:time()
end

function Loot:OwnerGUID()
    return getGuidFromInteger(self.entry:profile())
end

function Loot:Creator()
    return self.entry:creator()
end

function Loot:Entry()
    return self.entry
end

function Loot:RaidUid()
    if not self.raidUid then
        if self.entry.raidUid then
            self.raidUid = self.entry:raidUid()
        end
    end
    return self.raidUid
end

CLM.MODELS.Loot = Loot