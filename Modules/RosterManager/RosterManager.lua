local _, CLM = ...

local Roster = { }
local RosterOptions = { }
local RosterManager = { }
function RosterManager:Initialize()
    -- Initialize DB
    self.db = CLM.Interconnect.Database:Roster()
    if type(self.db.metadata) ~= "table" then
        self.db.metadata = {
            next_roster_id = 0
        }
    end
    if type(self.db.rosters) ~= "table" then
        self.db.rosters = {}
    end
    -- Rebuild Cache
    self:RebuildCache()
    -- Initialize options
    self.options = {
        roster_new = {
            name = "New",
            desc = "Creates new roster",
            type = "execute",
            handler = self,
            func = "New"
        }
    }
    -- Refresh GUI
    self:Refresh()
end

function RosterManager:RebuildCache()
    local max_uid = 0
    self.metadata = { rosters = {} }
    for name, roster in pairs(self.db.rosters) do
        if self.metadata.rosters[roster.uid] ~= nil then
            CLM.LOG:Fatal("Duplicate roster uid: " .. roster.uid .. ".  Please report this issue to authors and attach SavedVariable file.")
        end
        self.metadata.rosters[roster.uid] = name
        if roster.uid > max_uid then
            max_uid = roster.uid
        end
    end
    if max_uid >= self.db.metadata.next_roster_id then
        self.db.metadata.next_roster_id = max_uid + 1
    end
end

local function GenerateName()
    local prefix = CLM.CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX[math.random(0, #CLM.CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX - 1)]
    local suffix = CLM.CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX[math.random(0, #CLM.CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX - 1)]
    return prefix:sub(1,1):upper()..prefix:sub(2).. " " .. suffix:sub(1,1):upper()..suffix:sub(2)
end

function RosterManager:New(i)
    CLM.LOG:Info("RosterManager:New()")

    local name = GenerateName()
    while self.db.rosters[name] ~= nil do
        name = GenerateName()
    end

    self.db.rosters[name] = Roster:New(self.db.metadata.next_roster_id)
    self.metadata.rosters[self.db.rosters[name].uid] = name

    self.db.metadata.next_roster_id = self.db.metadata.next_roster_id + 1

    self:Refresh()
end

function RosterManager:Remove(name)
    CLM.LOG:Info("RosterManager:Remove(): " .. name)
    self.metadata.rosters[self.db.rosters[name].uid] = nil
    self.db.rosters[name] = nil
    self.options[name] = nil
    self:Refresh()
end


local function RosterManager_Remove(i)
    RosterManager:Remove(i[#i-1])
end

function RosterManager:Rename(old, new)
    self.db.rosters[new] = self.db.rosters[old]
    self.metadata.rosters[self.db.rosters[old].uid] = new
    self:Remove(old)
end

local function RosterManager_Rename(i, v)
    RosterManager:Rename(i[#i-1], v)
end

function RosterManager:Refresh()
    for name, roster in pairs(self.db.rosters) do
        local rosterOptions = RosterOptions:New(name, roster)
        self.options[name] = rosterOptions.options
    end
    CLM.Interconnect.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.ROSTER, self.options, true)
end

function Roster:New(uid)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o.uid = uid
    o.description = "The super duper description"

    return o
 end

 function RosterOptions:New(name, roster)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    self.options = {
        type = "group",
        name = name,
        args = {
            roster_name = {
                name = "Name",
                type = "input",
                set = RosterManager_Rename,
                get = function(i) return i[#i-1] end
            },
            roster_description = {
                name = "Description",
                type = "input",
                multiline = 4,
                set = function (i, v) RosterManager.db.rosters[i[#i-1]].description = v end,
                get = function(i) return RosterManager.db.rosters[i[#i-1]].description end
            },
            remove_self = {
                name = "Remove",
                desc = "Removes selected roster",
                type = "execute",
                func = RosterManager_Remove,
                confirm = true,
                order = -1
            },
        }
    }

    return o
 end

--function RosterManager:Copy(source, target)
--end




CLM.Interconnect.RosterManager = RosterManager

