local _, CLM = ...

-- Local upvalues
local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local LEDGER_ROSTER = CLM.MODELS.LEDGER.ROSTER
local UTILS = CLM.UTILS

local LedgerManager = MODULES.LedgerManager
local ProfileManager = MODULES.ProfileManager

local Profile = MODELS.Profile
local Loot = MODELS.Loot

local typeof = UTILS.typeof
local capitalize = UTILS.capitalize
local getGuidFromInteger = UTILS.getGuidFromInteger

local Roster = CLM.MODELS.Roster

local RosterManager = { } -- Roster Manager Module

function RosterManager:GenerateName()
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
            LOG:TraceAndCount("mutator(RosterCreate)")
            local uid = entry:rosterUid()
            local name = entry:name()
            local pointType = entry:pointType()
            if self.cache.rosters[name] or self.cache.rostersUidMap[uid] then
                LOG:Debug("Roster [%s:%s] already exists. Verify data integrity with other officers.", name, uid)
                return
            end
            if not (pointType and CONSTANTS.POINT_TYPES[pointType] ~= nil) then return end
            local roster = Roster:New(uid, pointType)
            self.cache.rosters[name] = roster
            self.cache.rostersUidMap[uid] = name
        end))

    LedgerManager:RegisterEntryType(
        LEDGER_ROSTER.Delete,
        (function(entry)
            LOG:TraceAndCount("mutator(RosterDelete)")
            local uid = entry:rosterUid()

            local roster = self:GetRosterByUid(uid)
            if not roster then
                LOG:Debug("Removing non-existent roster [%s]", uid)
                return
            end

            local name = self.cache.rostersUidMap[uid]
            self.cache.rostersUidMap[uid] = nil
            self.cache.rosters[name] = nil
        end))

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.Rename,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterRename)")
                local uid = entry:rosterUid()
                local name = entry:name()

                local o = self:GetRosterByUid(uid)
                if not o then
                    LOG:Debug("Renaming non-existent roster [%s]", uid)
                    return
                end
                local n = self:GetRosterByName(name)
                if n then
                    LOG:Debug("Roster named [%s] already exists", name)
                    return
                end

                local oldname = self.cache.rostersUidMap[uid]
                -- Attach roster to new name
                self.cache.rosters[name] = o
                self.cache.rostersUidMap[uid] = name

                -- Remove old assignments
                self.cache.rosters[oldname] = nil
            end))

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.CopyData,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterCopyData)")
                local sourceUid = entry:sourceRosterUid()
                local targetUid = entry:targetRosterUid()

                local s = self:GetRosterByUid(sourceUid)
                if not s then
                    LOG:Debug("Copying from non-existent roster [%s]", sourceUid)
                    return
                end
                local t = self:GetRosterByUid(targetUid)
                if not t then
                    LOG:Debug("Copying to non-existent roster [%s]", targetUid)
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
            end))

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateConfigSingle,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateConfigSingle)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetConfiguration(entry:config(), entry:value())
            end))

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateDefaultSingle,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateDefaultSingle)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetDefaultSlotValue(entry:config(), entry:base(), entry:max())
            end))

        LedgerManager:RegisterEntryType(
                LEDGER_ROSTER.UpdateOverrides,
                (function(entry)
                    LOG:TraceAndCount("mutator(RosterUpdateOverrides)")
                    local rosterUid = entry:rosterUid()

                    local roster = self:GetRosterByUid(rosterUid)
                    if not roster then
                        LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                        return
                    end

                    local _, _, _, itemEquipLoc = GetItemInfoInstant(entry:itemId())
                    local default = roster:GetDefaultSlotValue(itemEquipLoc)
                    if default.base == entry:base() and default.max == entry:max() then
                        roster:ClearItemValue(entry:itemId())
                    else
                        roster:SetItemValue(entry:itemId(), entry:base(), entry:max())
                    end
                end))

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateProfiles,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateProfiles)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                local profiles = entry:profiles()
                if not profiles or type(profiles) ~= "table" or #profiles == 0 then
                    LOG:Debug("Empty profiles table in mutator(RosterUpdateProfiles)")
                    return
                end

                if entry:remove() then
                    for _, iGUID in ipairs(profiles) do
                        local GUID = getGuidFromInteger(iGUID)
                        local profile = ProfileManager:GetProfileByGUID(GUID)
                        if profile then
                            roster:RemoveProfileByGUID(GUID)
                            -- If it is a main with linked alts - remove all alts
                            if profile:HasAlts() then
                                for altGUID, _ in pairs(profile:Alts()) do
                                    roster:RemoveProfileByGUID(altGUID)
                                end
                            end
                        end
                    end
                else
                    for _, iGUID in ipairs(profiles) do
                        local GUID = getGuidFromInteger(iGUID)
                        local profile = ProfileManager:GetProfileByGUID(GUID)
                        if profile then
                            roster:AddProfileByGUID(GUID)
                            -- If it is an alt of a linked main - set its standings and gains from main
                            if profile:Main() != "" then
                                roster:MirrorStandings(GUID, { profile:Main() })
                                roster:MirrorWeeklyGains(GUID, { profile:Main() })
                            end
                        end
                    end
                end
            end))

        LedgerManager:RegisterOnRestart(function()
            self:WipeAll()
        end)

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


function RosterManager:GetRosterNameByUid(uid)
    return self.cache.rostersUidMap[uid]
end

function RosterManager:NewRoster(pointType, name)
    LOG:Trace("RosterManager:NewRoster()")

    name = name or self:GenerateName()
    while self.cache.rosters[name] ~= nil do
        name = self:GenerateName()
    end

    local uid = GetServerTime()
    while self.cache.rostersUidMap[uid] ~= nil do
        uid = uid +  1
    end

    if not (pointType and CONSTANTS.POINT_TYPES[pointType] ~= nil) then
        LOG:Error("RosterManager:NewRoster(): Invalid point type")
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.Create:new(uid, name, pointType), true)
end

function RosterManager:DeleteRosterByName(name)
    LOG:Trace("RosterManager:DeleteRosterByName()")
    local roster = self:GetRosterByName(name)
    if not roster then
        LOG:Error("RosterManager:RenameRoster(): Unknown roster name %s", name)
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.Delete:new(roster:UID()), true)
end

function RosterManager:RenameRoster(old, new)
    LOG:Trace("RosterManager:RenameRoster()")
    local o = self:GetRosterByName(old)
    if not o then
        LOG:Error("RosterManager:RenameRoster(): Unknown roster name %s", old)
        return
    end
    local n = self:GetRosterByName(new)
    if n then
        LOG:Error("RosterManager:RenameRoster(): Roster with name %s already exists", new)
        return
    end

    LedgerManager:Submit(LEDGER_ROSTER.Rename:new(o:UID(), new), true)
end

function RosterManager:Copy(source, target, config, defaults, overrides, profiles)
    LOG:Trace("RosterManager:Copy()")
    local s = self:GetRosterByName(source)
    if not s then
        LOG:Error("RosterManager:Copy(): Unknown roster name %s", source)
        return
    end
    local t = self:GetRosterByName(target)
    if not t then
        LOG:Error("RosterManager:Copy(): Unknown roster name %s", target)
        return
    end

    LedgerManager:Submit(LEDGER_ROSTER.CopyData:new(s:UID(), t:UID(), config, defaults, overrides, profiles), true)
end

function RosterManager:SetRosterConfiguration(name, option, value)
    LOG:Trace("RosterManager:SetRosterConfiguration()")
    local roster = self:GetRosterByName(name)
    if not roster then
        LOG:Error("RosterManager:SetRosterConfiguration(): Unknown roster name %s", name)
        return
    end
    if not option then
        LOG:Error("RosterManager:SetRosterConfiguration(): Missing option")
        return
    end
    if value == nil then
        LOG:Error("RosterManager:SetRosterConfiguration(): Missing value")
        return
    end
    local current = roster:GetConfiguration(option)
    if current == nil then
        LOG:Error("RosterManager:SetRosterConfiguration(): Invalid option [%s]", option)
        return
    end
    if type(current) == "number" then
        value = tonumber(value)
    elseif type(current) == "string" then
        value = tostring(value)
    elseif type(current) == "boolean" then
        value = value and true or false
    end
    if value == nil then
        LOG:Fatal("RosterManager:SetRosterConfiguration(): Invalid value type")
        return
    end
    if current == value then
        LOG:Debug("RosterManager:SetRosterConfiguration(): No change to option [%s]. Skipping.", option)
        return
    end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateConfigSingle:new(roster:UID(), option, value), true)
end

function RosterManager:SetRosterDefaultSlotValue(nameOrRoster, slot, value, isBase)
    LOG:Trace("RosterManager:SetRosterDefaultSlotValue()")
    local roster
    if typeof(nameOrRoster, Roster) then
        roster = nameOrRoster
    else
        roster = self:GetRosterByName(nameOrRoster)
    end
    if not roster then
        LOG:Error("RosterManager:SetRosterDefaultSlotValue(): Invalid roster object or name")
        return nil
    end
    if not value then
        LOG:Error("RosterManager:SetRosterDefaultSlotValue(): Missing value")
        return
    end
    if not slot then
        LOG:Error("RosterManager:SetRosterDefaultSlotValue(): Missing slot")
        return
    end
    local v = roster:GetDefaultSlotValue(slot)
    if isBase then
        if v.base == tonumber(value) then
            LOG:Debug("RosterManager:SetRosterDefaultSlotValue(): No change to value. Skipping.")
            return
        end
        v.base = value
    else
        if v.max == tonumber(value) then
            LOG:Debug("RosterManager:SetRosterDefaultSlotValue(): No change to value. Skipping.")
            return
        end
        v.max = value
    end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateDefaultSingle:new(roster:UID(), slot, v.base, v.max), true)
end

function RosterManager:SetRosterItemValue(nameOrRoster, itemId, base, max)
    LOG:Trace("RosterManager:SetRosterItemValue()")
    local roster
    if typeof(nameOrRoster, Roster) then
        roster = nameOrRoster
    else
        roster = self:GetRosterByName(nameOrRoster)
    end
    if not roster then
        LOG:Error("RosterManager:SetRosterItemValue(): Invalid roster object or name")
        return nil
    end
    if not itemId then
        LOG:Error("RosterManager:SetRosterItemValue(): Missing itemId")
        return
    end
    if not tonumber(base) then
        LOG:Error("RosterManager:SetRosterItemValue(): Missing base")
        return
    end
    if not tonumber(max) then
        LOG:Error("RosterManager:SetRosterItemValue(): Missing max")
        return
    end
    local itemValue = roster:GetItemValue(itemId)
    if (itemValue.base == base) and (itemValue.max == max) then
        LOG:Debug("RosterManager:SetRosterItemValue(): No change to value. Skipping.")
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.UpdateOverrides:new(roster:UID(), itemId, base, max), true)
end

function RosterManager:AddProfilesToRoster(roster, profiles)
    LOG:Trace("RosterManager:AddProfilesToRoster()")
    if not typeof(roster, Roster) then
        LOG:Error("RosterManager:AddProfilesToRoster(): Invalid roster object")
        return
    end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Warning("Empty profiles table in AddProfilesToRoster()")
        return
    end

    local entry = LEDGER_ROSTER.UpdateProfiles:new(roster:UID(), profiles, false)
    local t = entry:profiles()
    if not t or (#t == 0) then
        LOG:Error("RosterManager:AddProfilesToRoster(): Empty profiles list")
        return
    end

    LedgerManager:Submit(entry, true)
end

function RosterManager:RemoveProfilesFromRoster(roster, profiles)
    LOG:Trace("RosterManager:RemoveProfilesFromRoster()")
    if not typeof(roster, Roster) then
        LOG:Error("RosterManager:RemoveProfilesFromRoster(): Invalid roster object")
        return
    end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Error("Empty profiles table in RemoveProfilesFromRoster()")
        return
    end

    local entry = LEDGER_ROSTER.UpdateProfiles:new(roster:UID(), profiles, true)

    local t = entry:profiles()
    if not t or (#t == 0) then
        LOG:Error("RosterManager:RemoveProfilesFromRoster(): Empty profiles list")
        return
    end

    LedgerManager:Submit(entry, true)
end

function RosterManager:AddFromRaidToRoster(roster)
    LOG:Trace("RosterManager:AddFromRaidToRoster()")
    if not typeof(roster, Roster) then
        LOG:Error("RosterManager:AddFromRaidToRoster(): Invalid roster object")
        return
    end
    if not IsInRaid() then return end
    -- Lazy fill profiles
    ProfileManager:FillFromRaid()
    local missingProfiles = {}
    for i=1,MAX_RAID_MEMBERS do
        local name  = GetRaidRosterInfo(i)
        if name then
            name = UTILS.RemoveServer(name)
            local profile = ProfileManager:GetProfileByName(name)
            if profile then
                local GUID = profile:GUID()
                if not roster:IsProfileInRoster(GUID) then
                    table.insert(missingProfiles, GUID)
                end
            else
                LOG:Debug("Missing [%s] profile after filling from raid. Weird.", name)
            end
        end
    end
    if #missingProfiles > 0 then
        LOG:Message("Adding missing %s players to current roster", #missingProfiles)
        self:AddProfilesToRoster(roster, missingProfiles)
    end
end

function RosterManager:AddLootToRoster(roster, loot, profile)
    LOG:Trace("RosterManager:AddLootToRoster()")
    if not typeof(roster, Roster) then
        LOG:Error("RosterManager:AddLootToRoster(): Invalid roster object")
        return
    end
    if not typeof(profile, Profile) then
        LOG:Error("RosterManager:AddLootToRoster(): Invalid profile object")
        return
    end
    if not typeof(loot, Loot) then
        LOG:Error("RosterManager:AddLootToRoster(): Invalid loot object")
        return
    end
    LOG:Debug("RosterManager:AddLootToRoster(): Roster [%s] Loot Id [%s] Profile [%s]", roster:UID(), loot:Id(), profile:GUID())
    roster:AddLoot(loot, profile)
end

function RosterManager:WipeStandings()
    LOG:Trace("RosterManager:WipeStandings()")
    for _, roster in pairs(self.cache.rosters) do
        roster:WipeStandings()
    end
end

function RosterManager:WipeAll()
    LOG:Trace("RosterManager:WipeAll()")
    self.cache = {
        rostersUidMap = {},
        rosters = {}
    }
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