local _, CLM = ...

-- Local upvalues
local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULES = CLM.MODULES
local ACL_LEVEL = CONSTANTS.ACL.LEVEL
local LEDGER_ROSTER = CLM.MODELS.LEDGER.ROSTER
-- local UTILS = CLM.UTILS
local LedgerManager = MODULES.LedgerManager

-- local whoami = UTILS.WhoAmI

local Roster = CLM.MODELS.Roster
-- local RosterLedger = CLM.MODELS.LEDGER.Roster

local RosterManager = { } -- Roster Manager Module

local function GenerateName()
    local prefix = CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX[math.random(0, #CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX - 1)]
    local suffix = CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX[math.random(0, #CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX - 1)]
    return prefix:sub(1,1):upper()..prefix:sub(2).. " " .. suffix:sub(1,1):upper()..suffix:sub(2)
end

-- Controller Roster Manger
function RosterManager:Initialize()
    LOG:Info("RosterManager:Initialize()")
    -- Initialize DB
    self.db = MODULES.Database:Roster()
    if type(self.db.metadata) ~= "table" then
        self.db.metadata = {}
    end

    if type(self.db.rosters) ~= "table" then
        self.db.rosters = {}
    end
    -- Initialize Cache
    self.cache = {
        rostersUidMap = {},
        rosters = {}
    }

    -- self:LoadCache()
    -- Register mutators
    LedgerManager:RegisterEntryType(
        LEDGER_ROSTER.Create,
        (function(entry)
            local uid = entry:rosterUid()
            local name = entry:name()

            self.db.rosters[name] = {} -- temporary while still using storage
            local roster = Roster:New(self.db.rosters[name], uid)
            self.cache.rosters[name] = roster
            self.cache.rostersUidMap[uid] = name
        end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_ROSTER.Delete,
        (function(entry)
            local uid = entry:rosterUid()

            local roster = RosterManager:GetRosterByUid(uid)
            if roster == nil then return end

            local name = self.cache.rostersUidMap[uid]
            self.cache.rostersUidMap[uid] = nil
            self.cache.rosters[name] = nil
            self.db.rosters[name] = nil
        end),
        ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.Rename,
            (function(entry)
                local uid = entry:rosterUid()
                local name = entry:name()

                local o = RosterManager:GetRosterByUid(uid)
                if o == nil then return end
                local n = RosterManager:GetRosterByName(name)
                if n ~= nil then return end

                self.db.rosters[name] = {} -- temporary while still using storage
                local oldname = self.cache.rostersUidMap[uid]
                -- Attach roster to new name
                self.cache.rosters[name] = o
                self.cache.rostersUidMap[uid] = name

                -- Remove old assignments
                self.cache.rosters[oldname] = nil
                self.db.rosters[oldname] = nil

                -- TODO while using storage after rename the roster might not work properly
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.CopyData,
            (function(entry)
                local sourceUid = entry:sourceRosterUid()
                local targetUid = entry:targetRosterUid()

                local s = RosterManager:GetRosterByUid(sourceUid)
                if s == nil then return end
                local t = RosterManager:GetRosterByUid(targetUid)
                if t == nil then return end

                if entry:config() then
                    t:CopyConfiguration(s)
                end

                if entry:defaults() then
                    t:CopyDefaultSlotValues(s)
                end

                if entry:overrides() then
                    t:CopyItemValues(s)
                end

                if entry:profiles() then
                    t:CopyProfiles(s)
                end
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateConfigSingle,
            (function(entry)
                local rosterUid = entry:rosterUid()

                local roster = RosterManager:GetRosterByUid(rosterUid)
                if roster == nil then return end

                roster:SetConfiguration(entry:config(), entry:value())
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateDefaultSingle,
            (function(entry)
                local rosterUid = entry:rosterUid()

                local roster = RosterManager:GetRosterByUid(rosterUid)
                if roster == nil then return end

                roster:SetDefaultSlotValue(entry:config(), entry:min(), entry:max())
            end),
            ACL_LEVEL.OFFICER)

    MODULES.ConfigManager:RegisterUniversalExecutor("rm", "RosterManager", self)
end

function RosterManager:GetRosters()
    return self.cache.rosters
end

function RosterManager:GetRosterByName(name)
    return self.cache.rosters[name]
end

function RosterManager:GetRosterByUid(uid)
    return self.cache.rosters[self.cache.rostersUidMap[uid]]
end

function RosterManager:NewRoster()
    LOG:Info("RosterManager:NewRoster()")

    local name = GenerateName()
    while self.db.rosters[name] ~= nil do
        name = GenerateName()
    end

    LedgerManager:Submit(LEDGER_ROSTER.Create:new(GetServerTime(), name))
end

function RosterManager:DeleteRosterByName(name)
    LOG:Info("RosterManager:DeleteRosterByName()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return end
    LedgerManager:Submit(LEDGER_ROSTER.Delete:new(roster:UID()))
end

function RosterManager:RenameRoster(old, new)
    LOG:Info("RosterManager:RenameRoster()")
    local o = RosterManager:GetRosterByName(old)
    if o == nil then return end
    local n = RosterManager:GetRosterByName(new)
    if n ~= nil then return end

    LedgerManager:Submit(LEDGER_ROSTER.Rename:new(o:UID(), new))
end

function RosterManager:Copy(source, target, config, defaults, overrides, profiles)
    LOG:Info("RosterManager:Copy()")
    local s = RosterManager:GetRosterByName(source)
    if s == nil then return end
    local t = RosterManager:GetRosterByName(target)
    if t == nil then return end

    LedgerManager:Submit(LEDGER_ROSTER.CopyData:new(s:UID(), t:UID(), config, defaults, overrides, profiles))
end

function RosterManager:SetRosterConfiguration(name, option, value)
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateConfigSingle:new(roster:UID(), option, value))
end

function RosterManager:SetRosterDefaultSlotValue(name, slot, value, isMin)
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    local v = roster:GetDefaultSlotValue(slot)
    if isMin then v.min = value else v.max = value end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateDefaultSingle:new(roster:UID(), slot, v.min, v.max))
end

function RosterManager:WipeStandings()
    for _, roster in pairs(self.cache.rosters) do
        roster:WipeStandings()
    end
end

-- -- Publish API
MODULES.RosterManager = RosterManager

CONSTANTS.ROSTER_NAME_GENERATOR = {
    PREFIX = {
        "adorable",
        "adventurous",
        "aggressive",
        "agreeable",
        "alert",
        "alive",
        "amused",
        "angry",
        "annoyed",
        "annoying",
        "anxious",
        "arrogant",
        "ashamed",
        "attractive",
        "average",
        "awful",
        "bad",
        "beautiful",
        "better",
        "bewildered",
        "black",
        "bloody",
        "blue",
        "blue-eyed",
        "blushing",
        "bored",
        "brainy",
        "brave",
        "breakable",
        "bright",
        "busy",
        "calm",
        "careful",
        "cautious",
        "charming",
        "cheerful",
        "clean",
        "clear",
        "clever",
        "cloudy",
        "clumsy",
        "colorful",
        "combative",
        "comfortable",
        "concerned",
        "condemned",
        "confused",
        "cooperative",
        "courageous",
        "crazy",
        "creepy",
        "crowded",
        "cruel",
        "curious",
        "cute",
        "dangerous",
        "dark",
        "dead",
        "defeated",
        "defiant",
        "delightful",
        "depressed",
        "determined",
        "different",
        "difficult",
        "disgusted",
        "distinct",
        "disturbed",
        "dizzy",
        "doubtful",
        "drab",
        "dull",
        "eager",
        "easy",
        "elated",
        "elegant",
        "embarrassed",
        "enchanting",
        "encouraging",
        "energetic",
        "enthusiastic",
        "envious",
        "evil",
        "excited",
        "expensive",
        "exuberant",
        "fair",
        "faithful",
        "famous",
        "fancy",
        "fantastic",
        "fierce",
        "filthy",
        "fine",
        "foolish",
        "fragile",
        "frail",
        "frantic",
        "friendly",
        "frightened",
        "funny",
        "gentle",
        "gifted",
        "glamorous",
        "gleaming",
        "glorious",
        "good",
        "gorgeous",
        "graceful",
        "grieving",
        "grotesque",
        "grumpy",
        "handsome",
        "happy",
        "healthy",
        "helpful",
        "helpless",
        "hilarious",
        "homeless",
        "homely",
        "horrible",
        "hungry",
        "hurt",
        "ill",
        "important",
        "impossible",
        "inexpensive",
        "innocent",
        "inquisitive",
        "itchy",
        "jealous",
        "jittery",
        "jolly",
        "joyous",
        "kind",
        "lazy",
        "light",
        "lively",
        "lonely",
        "long",
        "lovely",
        "lucky",
        "magnificent",
        "misty",
        "modern",
        "motionless",
        "muddy",
        "mushy",
        "mysterious",
        "nasty",
        "naughty",
        "nervous",
        "nice",
        "nutty",
        "obedient",
        "obnoxious",
        "odd",
        "old-fashioned",
        "open",
        "outrageous",
        "outstanding",
        "panicky",
        "perfect",
        "plain",
        "pleasant",
        "poised",
        "poor",
        "powerful",
        "precious",
        "prickly",
        "proud",
        "putrid",
        "puzzled",
        "quaint",
        "real",
        "relieved",
        "repulsive",
        "rich",
        "scary",
        "selfish",
        "shiny",
        "shy",
        "silly",
        "sleepy",
        "smiling",
        "smoggy",
        "sore",
        "sparkling",
        "splendid",
        "spotless",
        "stormy",
        "strange",
        "stupid",
        "successful",
        "super",
        "talented",
        "tame",
        "tasty",
        "tender",
        "tense",
        "terrible",
        "thankful",
        "thoughtful",
        "thoughtless",
        "tired",
        "tough",
        "troubled",
        "ugliest",
        "ugly",
        "uninterested",
        "unsightly",
        "unusual",
        "upset",
        "uptight",
        "vast",
        "victorious",
        "vivacious",
        "wandering",
        "wear",
        "wicked",
        "wide-eyed",
        "wild",
        "witty",
        "worried",
        "worrisome",
        "wrong",
        "zany",
        "zealous",
        },
    SUFFIX = {
        "ants",
        "bats",
        "bears",
        "bees",
        "birds",
        "buffalloes",
        "cats",
        "chickens",
        "cattle",
        "dogs",
        "dolphins",
        "ducks",
        "elephants",
        "fishes",
        "foxes",
        "frogs",
        "geese",
        "goats",
        "horses",
        "kangaroos",
        "lions",
        "monkeys",
        "owls",
        "oxen",
        "penguins",
        "people",
        "pigs",
        "rabbits",
        "sheep",
        "tigers",
        "whales",
        "wolves",
        "zebras"
    }
}