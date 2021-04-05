local _, CLM = ...

-- Local upvalues
local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULES = CLM.MODULES
local ACL_LEVEL = CONSTANTS.ACL.LEVEL
local LEDGER_ROSTER = CLM.MODELS.LEDGER.ROSTER
local UTILS = CLM.UTILS

local capitalize = UTILS.capitalize

local LedgerManager = MODULES.LedgerManager
local ProfileManager = MODULES.ProfileManager

-- local whoami = UTILS.WhoAmI
local getGuidFromInteger = UTILS.getGuidFromInteger

local Roster = CLM.MODELS.Roster
-- local RosterLedger = CLM.MODELS.LEDGER.Roster

local RosterManager = { } -- Roster Manager Module

local function GenerateName()
    local prefix = CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX[math.random(1, #CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX)]
    local suffix = CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX[math.random(1, #CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX)]
    return capitalize(prefix).. " " .. capitalize(suffix)
end

-- Controller Roster Manger
function RosterManager:Initialize()
    LOG:Trace("RosterManager:Initialize()")

    -- Initialize Cache
    self.cache = {
        rostersUidMap = {},
        rosters = {}
    }

    -- Register mutators
    LedgerManager:RegisterEntryType(
        LEDGER_ROSTER.Create,
        (function(entry)
            LOG:Trace("mutator(RosterCreate)")
            local uid = entry:rosterUid()
            local name = entry:name()
            if self.cache.rosters[name] or self.cache.rosterUidMap[uid] then
                LOG:Fatal("Roster [%s:%s] already exists. Verify data integrity with other officers.", name, uid)
                return
            end
            local roster = Roster:New(uid)
            self.cache.rosters[name] = roster
            self.cache.rostersUidMap[uid] = name
        end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_ROSTER.Delete,
        (function(entry)
            LOG:Trace("mutator(RosterDelete)")
            local uid = entry:rosterUid()

            local roster = self:GetRosterByUid(uid)
            if roster == nil then
                LOG:Warning("Removing non-existent roster [%s]", uid)
                return
            end

            local name = self.cache.rostersUidMap[uid]
            self.cache.rostersUidMap[uid] = nil
            self.cache.rosters[name] = nil
        end),
        ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.Rename,
            (function(entry)
                LOG:Trace("mutator(RosterRename)")
                local uid = entry:rosterUid()
                local name = entry:name()

                local o = self:GetRosterByUid(uid)
                if o == nil then
                    LOG:Warning("Renaming non-existent roster [%s]", uid)
                    return
                end
                local n = self:GetRosterByName(name)
                if n ~= nil then
                    LOG:Error("Roster named [%s] already exists", name)
                    return
                end

                local oldname = self.cache.rostersUidMap[uid]
                -- Attach roster to new name
                self.cache.rosters[name] = o
                self.cache.rostersUidMap[uid] = name

                -- Remove old assignments
                self.cache.rosters[oldname] = nil
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.CopyData,
            LOG:Trace("mutator(RosterCopyData)")
            (function(entry)
                local sourceUid = entry:sourceRosterUid()
                local targetUid = entry:targetRosterUid()

                local s = self:GetRosterByUid(sourceUid)
                if s == nil then
                    LOG:Warning("Copying from non-existent roster [%s]", sourceUid)
                    return
                end
                local t = self:GetRosterByUid(targetUid)
                if t == nil then
                    LOG:Warning("Copying to non-existent roster [%s]", targetUid)
                    return
                end

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
                LOG:Trace("mutator(RosterUpdateConfigSingle)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if roster == nil then
                    LOG:Warning("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetConfiguration(entry:config(), entry:value())
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateDefaultSingle,
            (function(entry)
                LOG:Trace("mutator(RosterUpdateDefaultSingle)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if roster == nil then
                    LOG:Warning("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetDefaultSlotValue(entry:config(), entry:min(), entry:max())
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateProfiles,
            (function(entry)
                LOG:Trace("mutator(RosterUpdateProfiles)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if roster == nil then
                    LOG:Warning("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                local profiles = entry:profiles()
                if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
                    LOG:Warning("Empty profiles table in mutator(RosterUpdateProfiles)")
                    return
                end

                if entry:remove() then
                    for _, iGUID in ipairs(profiles) do
                        roster:RemoveProfileByGUID(getGuidFromInteger(iGUID))
                    end
                else
                    for _, iGUID in ipairs(profiles) do
                        roster:AddProfileByGUID(getGuidFromInteger(iGUID))
                    end
                end
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
    LOG:Trace("RosterManager:NewRoster()")

    local name = GenerateName()
    while self.cache.rosters[name] ~= nil do
        name = GenerateName()
    end

    local uid = GetServerTime()
    while self.cache.rostersUidMap[uid] ~= nil do
        uid = uid +  1
    end
    LedgerManager:Submit(LEDGER_ROSTER.Create:new(uid, name), true)
end

function RosterManager:DeleteRosterByName(name)
    LOG:Trace("RosterManager:DeleteRosterByName()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return end
    LedgerManager:Submit(LEDGER_ROSTER.Delete:new(roster:UID()), true)
end

function RosterManager:RenameRoster(old, new)
    LOG:Trace("RosterManager:RenameRoster()")
    local o = RosterManager:GetRosterByName(old)
    if o == nil then return end
    local n = RosterManager:GetRosterByName(new)
    if n ~= nil then return end

    LedgerManager:Submit(LEDGER_ROSTER.Rename:new(o:UID(), new), true)
end

function RosterManager:Copy(source, target, config, defaults, overrides, profiles)
    LOG:Trace("RosterManager:Copy()")
    local s = RosterManager:GetRosterByName(source)
    if s == nil then return end
    local t = RosterManager:GetRosterByName(target)
    if t == nil then return end

    LedgerManager:Submit(LEDGER_ROSTER.CopyData:new(s:UID(), t:UID(), config, defaults, overrides, profiles), true)
end

function RosterManager:SetRosterConfiguration(name, option, value)
    LOG:Trace("RosterManager:SetRosterConfiguration()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateConfigSingle:new(roster:UID(), option, value), true)
end

function RosterManager:SetRosterDefaultSlotValue(name, slot, value, isMin)
    LOG:Trace("RosterManager:SetRosterDefaultSlotValue()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    local v = roster:GetDefaultSlotValue(slot)
    if isMin then v.min = value else v.max = value end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateDefaultSingle:new(roster:UID(), slot, v.min, v.max), true)
end

function RosterManager:AddProfilesToRoster(name, profiles)
    LOG:Trace("RosterManager:AddProfilesToRoster()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Warning("Empty profiles table in AddProfilesToRoster()")
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.UpdateProfiles:new(roster:UID(), profiles, false), true)
end

function RosterManager:RemoveProfilesFromRoster(name, profiles)
    LOG:Trace("RosterManager:RemoveProfilesFromRoster()")
    local roster = RosterManager:GetRosterByName(name)
    if roster == nil then return nil end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Warning("Empty profiles table in RemoveProfilesFromRoster()")
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.UpdateProfiles:new(roster:UID(), profiles, true), true)
end

function RosterManager:WipeStandings()
    LOG:Trace("RosterManager:WipeStandings()")
    for _, roster in pairs(self.cache.rosters) do
        roster:WipeStandings()
    end
end

function RosterManager:ExportRosters()
    LOG:Trace("RosterManager:ExportRosters()")
    local db = CLM.MODULES.Database:Personal()
    db['rosters'] = self:GetRosters()
end

function RosterManager:Debug(N)
    N = N or 10
    local actions = {"create", --[["delete",]] "rename", "copy", "set", "override", "profile"}
    local rosterNames = {}
    local genRosterNames = (function()
        rosterNames = {}
        local rosters = self:GetRosters()
        local i = 0
        for k,_ in pairs(rosters) do
            i = i+ 1
            table.insert(rosterNames, k)
        end
        print("=== We have " .. i .. " rosters ===")
    end)
    genRosterNames()
    local profiles = ProfileManager:GetProfiles()
    local actionHandlers = {
        ["create"] =  (function()
            self:NewRoster()
            genRosterNames()
        end),
        ["delete"] =  (function()
            self:DeleteRosterByName(rosterNames[math.random(1, #rosterNames)])
            genRosterNames()
        end),
        ["rename"] =  (function()
            self:RenameRoster(rosterNames[math.random(1, #rosterNames)], GenerateName() .. tostring(math.random(1,999999999)))
            genRosterNames()
        end),
        ["copy"] =  (function()
            local config = false
            if math.random(0, 1) == 1 then
                config = true
            end
            local defaults = false
            if math.random(0, 1) == 1 then
                defaults = true
            end
            local overrides = false
            if math.random(0, 1) == 1 then
                overrides = true
            end
            local copyProfiles = false
            if math.random(0, 1) == 1 then
                copyProfiles = true
            end
            self:Copy(
                rosterNames[math.random(1, #rosterNames)], rosterNames[math.random(1, #rosterNames)],
                config, defaults, overrides, copyProfiles
            )
        end),
        ["set"] =  (function()
            local configList = {
                -- int
                "pointType",
                "auctionType",
                "itemValueMode",
                -- bool
                "zeroSumBank",
                "allowNegativeStandings",
                "allowNegativeBidders",
                "simultaneousAuctions"
            }
            local configs = {
                -- int
                ["pointType"] = 0, -- 0 1
                ["auctionType"] = 2, -- 0 1 2
                ["itemValueMode"] = 0, -- 0 1
                -- bool
                ["zeroSumBank"] = 1,
                ["allowNegativeStandings"] = 1,
                ["allowNegativeBidders"] = 1,
                ["simultaneousAuctions"] = 1
            }
            local config = configList[math.random(1, #configList)]
            local value
            if configs[config] == 0 then
                value = math.random(0, 1)
            elseif configs[config] == 1 then
                if math.random(0,1) == 1 then
                    value = true
                else
                    value = false
                end
            elseif configs[config] == 2 then
                value = math.random(0, 2)
            else
                return
            end
            self:SetRosterConfiguration(rosterNames[math.random(1, #rosterNames)], config, value)
        end),
        ["override"] =  (function()
            local isMin = false
            if math.random(0, 1) == 1 then
                isMin = true
            end
            self:SetRosterDefaultSlotValue(rosterNames[math.random(1, #rosterNames)], CONSTANTS.INVENTORY_TYPES[math.random(1, #CONSTANTS.INVENTORY_TYPES)], 1000000*math.random(), isMin)
        end),
        ["profile"] = (function()
            local profileList = {}
            for GUID, _ in pairs(profiles) do
                if math.random(0,1) == 1 then
                    table.insert(profileList, GUID)
                end
            end
            if math.random(0,1) == 1 then
                self:AddProfilesToRoster(rosterNames[math.random(1, #rosterNames)], profileList)
            else
                self:RemoveProfilesFromRoster(rosterNames[math.random(1, #rosterNames)], profileList)
            end
        end),
    }

    print("Generating total of  " .. N .. " roster operation entries")

    local actionCount = {}
    -- pregenerate 1 roster
    if #rosterNames == 0 then
        actionHandlers["create"]()
    end

    for _=1,N do
        local action = actions[math.random(1, #actions)]
        if actionCount[action] == nil then
            actionCount[action] = 1
        else
            actionCount[action] = actionCount[action] +  1
        end
        actionHandlers[action]()
    end

    for action, count in pairs(actionCount) do
        print(tostring(action) .. ": " .. tostring(count))
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