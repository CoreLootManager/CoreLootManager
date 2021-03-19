local _, CLM = ...

-- Local upvalues
local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local Roster = CLM.MODELS.Roster

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
        self.db.metadata = {
            next_roster_uid = 0,
            lastUpdate = {
                time = 0,
                source = ""
            }
        }
    end

    if type(self.db.rosters) ~= "table" then
        self.db.rosters = {}
    end
    -- Initialize Cache
    self.cache = {
        rostersUidMap = {},
        rosters = {}
    }

    self:LoadCache()
    MODULES.ConfigManager:RegisterUniversalExecutor("rm", "RosterManager", self)
end

function RosterManager:UpdateDbChangeMetadata()
    self.db.metadata.lastUpdate.time   = time()
    self.db.metadata.lastUpdate.source = whoami()
end

function RosterManager:LoadCache()
    LOG:Info("RosterManager:LoadCache()")
    local max_uid = 0
    for name, _ in pairs(self.db.rosters) do
        local roster = Roster:Restore(self.db.rosters[name])
        local uid = roster:UID()
        -- Duplication issue check
        if self.cache.rosters[uid] ~= nil then
            LOG:Fatal("Duplicate roster uid: " .. uid .. ".  Please report this issue to authors and attach SavedVariable file.")
        end

        -- Restore Roster
        self.cache.rosters[name] = roster
        self.cache.rostersUidMap[uid] = name

        -- Contol uid
        if uid > max_uid then
            max_uid = uid
        end
    end
    -- Update uid in case it is needed
    if max_uid >= self.db.metadata.next_roster_uid then
        self.db.metadata.next_roster_uid = max_uid + 1
    end
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

    self.db.rosters[name] = {}
    local roster = Roster:New(self.db.rosters[name], self.db.metadata.next_roster_uid)
    self.cache.rosters[name] = roster
    self.cache.rostersUidMap[self.db.metadata.next_roster_uid] = name

    self.db.metadata.next_roster_uid = self.db.metadata.next_roster_uid + 1
    self:UpdateDbChangeMetadata()
end

function RosterManager:DeleteRosterByName(name)
    LOG:Info("RosterManager:DeleteRosterByName()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return end
    self.cache.rostersUidMap[roster:UID()] = nil
    self.cache.rosters[name] = nil
    self.db.rosters[name] = nil
    self:UpdateDbChangeMetadata()
end

function RosterManager:RenameRoster(old, new)
    LOG:Info("RosterManager:RenameRoster()")
    local o = RosterManager:GetRosterByName(old)
    if o == nil then return end
    local n = RosterManager:GetRosterByName(new)
    if n ~= nil then return end

    self.db.rosters[new] = self.db.rosters[old]
    self.cache.rosters[new] = self.cache.rosters[old]
    self.cache.rostersUidMap[self.cache.rosters[new]:UID()] = new

    self:DeleteRosterByName(old)
    self:UpdateDbChangeMetadata()
end

function RosterManager:CopyProfiles(source, target)
    LOG:Info("RosterManager:CopyProfiles()")
    local s = RosterManager:GetRosterByName(source)
    if s == nil then return end
    local t = RosterManager:GetRosterByName(target)
    if t == nil then return end

    t:CopyProfiles(s)
end

function RosterManager:CopyConfiguration(source, target)
    LOG:Info("RosterManager:CopyConfiguration()")
    local s = RosterManager:GetRosterByName(source)
    if s == nil then return end
    local t = RosterManager:GetRosterByName(target)
    if t == nil then return end

    t:CopyConfiguration(s)
end

function RosterManager:CopyDefaultSlotValues(source, target)
    LOG:Info("RosterManager:CopyDefaultSlotValues()")
    local s = RosterManager:GetRosterByName(source)
    if s == nil then return end
    local t = RosterManager:GetRosterByName(target)
    if t == nil then return end

    t:CopyDefaultSlotValues(s)
end

function RosterManager:CopyItemValues(source, target)
    LOG:Info("RosterManager:CopyItemValues()")
    local s = RosterManager:GetRosterByName(source)
    if s == nil then return end
    local t = RosterManager:GetRosterByName(target)
    if t == nil then return end

    t:CopyItemValues(s)
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