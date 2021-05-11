local _, CLM = ...

-- Local upvalues
local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local MODULES = CLM.MODULES
local MODELS = CLM.MODELS
local ACL_LEVEL = CONSTANTS.ACL.LEVEL
local LEDGER_ROSTER = CLM.MODELS.LEDGER.ROSTER
local UTILS = CLM.UTILS

local LedgerManager = MODULES.LedgerManager
local ProfileManager = MODULES.ProfileManager

local Profile = MODELS.Profile
local Loot = MODELS.Loot

-- local whoami = UTILS.whoami
local typeof = UTILS.typeof
local capitalize = UTILS.capitalize
local getGuidFromInteger = UTILS.getGuidFromInteger

local Roster = CLM.MODELS.Roster

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
            LOG:TraceAndCount("mutator(RosterCreate)")
            local uid = entry:rosterUid()
            local name = entry:name()
            local pointType = entry:pointType()
            if self.cache.rosters[name] or self.cache.rostersUidMap[uid] then
                LOG:Fatal("Roster [%s:%s] already exists. Verify data integrity with other officers.", name, uid)
                return
            end
            if not (pointType and CONSTANTS.POINT_TYPES[pointType] ~= nil) then return end
            local roster = Roster:New(uid, pointType)
            self.cache.rosters[name] = roster
            self.cache.rostersUidMap[uid] = name
        end),
        ACL_LEVEL.OFFICER)

    LedgerManager:RegisterEntryType(
        LEDGER_ROSTER.Delete,
        (function(entry)
            LOG:TraceAndCount("mutator(RosterDelete)")
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
                LOG:TraceAndCount("mutator(RosterRename)")
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
            (function(entry)
                LOG:TraceAndCount("mutator(RosterCopyData)")
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
                LOG:TraceAndCount("mutator(RosterUpdateConfigSingle)")
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
                LOG:TraceAndCount("mutator(RosterUpdateDefaultSingle)")
                local rosterUid = entry:rosterUid()

                local roster = self:GetRosterByUid(rosterUid)
                if roster == nil then
                    LOG:Warning("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetDefaultSlotValue(entry:config(), entry:base(), entry:max())
            end),
            ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
                LEDGER_ROSTER.UpdateOverrides,
                (function(entry)
                    LOG:TraceAndCount("mutator(RosterUpdateOverrides)")
                    local rosterUid = entry:rosterUid()

                    local roster = self:GetRosterByUid(rosterUid)
                    if roster == nil then
                        LOG:Warning("Updating non-existent roster [%s]", rosterUid)
                        return
                    end
                    local _, _, _, itemEquipLoc = GetItemInfoInstant(entry:itemId())
                    local default = roster:GetDefaultSlotValue(itemEquipLoc)
                    if default.base == entry:base() and default.max == entry:max() then
                        roster:ClearItemValue(entry:itemId())
                    else
                        roster:SetItemValue(entry:itemId(), entry:base(), entry:max())
                    end
                end),
                ACL_LEVEL.OFFICER)

        LedgerManager:RegisterEntryType(
            LEDGER_ROSTER.UpdateProfiles,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateProfiles)")
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
            ACL_LEVEL.MANAGER)

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

    name = name or GenerateName()
    while self.cache.rosters[name] ~= nil do
        name = GenerateName()
    end

    local uid = GetServerTime()
    while self.cache.rostersUidMap[uid] ~= nil do
        uid = uid +  1
    end

    if not (pointType and CONSTANTS.POINT_TYPES[pointType] ~= nil) then return end
    LedgerManager:Submit(LEDGER_ROSTER.Create:new(uid, name, pointType), true)
end

function RosterManager:DeleteRosterByName(name)
    LOG:Trace("RosterManager:DeleteRosterByName()")
    local roster = self:GetRosterByName(name)
    if roster == nil then return end
    LedgerManager:Submit(LEDGER_ROSTER.Delete:new(roster:UID()), true)
end

function RosterManager:RenameRoster(old, new)
    LOG:Trace("RosterManager:RenameRoster()")
    local o = self:GetRosterByName(old)
    if o == nil then return end
    local n = self:GetRosterByName(new)
    if n ~= nil then return end

    LedgerManager:Submit(LEDGER_ROSTER.Rename:new(o:UID(), new), true)
end

function RosterManager:Copy(source, target, config, defaults, overrides, profiles)
    LOG:Trace("RosterManager:Copy()")
    local s = self:GetRosterByName(source)
    if s == nil then return end
    local t = self:GetRosterByName(target)
    if t == nil then return end

    LedgerManager:Submit(LEDGER_ROSTER.CopyData:new(s:UID(), t:UID(), config, defaults, overrides, profiles), true)
end

function RosterManager:SetRosterConfiguration(name, option, value)
    LOG:Trace("RosterManager:SetRosterConfiguration()")
    local roster = self:GetRosterByName(name)
    if roster == nil then return nil end

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
    if roster == nil then
        LOG:Warning("RosterManager:SetRosterDefaultSlotValue(): Invalid roster object or name")
        return nil
    end
    local v = roster:GetDefaultSlotValue(slot)
    if isBase then v.base = value else v.max = value end

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
    if roster == nil then
        LOG:Warning("RosterManager:SetRosterItemValue(): Invalid roster object or name")
        return nil
    end

    LedgerManager:Submit(LEDGER_ROSTER.UpdateOverrides:new(roster:UID(), itemId, base, max), true)
end

function RosterManager:AddProfilesToRoster(roster, profiles)
    LOG:Trace("RosterManager:AddProfilesToRoster()")
    if not typeof(roster, Roster) then
        LOG:Warning("RosterManager:AddProfilesToRoster(): Invalid roster object")
        return
    end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Warning("Empty profiles table in AddProfilesToRoster()")
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.UpdateProfiles:new(roster:UID(), profiles, false), true)
end

function RosterManager:RemoveProfilesFromRoster(roster, profiles)
    LOG:Trace("RosterManager:RemoveProfilesFromRoster()")
    if not typeof(roster, Roster) then
        LOG:Warning("RosterManager:RemoveProfilesFromRoster(): Invalid roster object")
        return
    end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Warning("Empty profiles table in RemoveProfilesFromRoster()")
        return
    end
    LedgerManager:Submit(LEDGER_ROSTER.UpdateProfiles:new(roster:UID(), profiles, true), true)
end

function RosterManager:AddLootToRoster(roster, loot, profile)
    LOG:Trace("RosterManager:AddLootToRoster()")
    if not typeof(roster, Roster) then
        LOG:Warning("RosterManager:AddLootToRoster(): Invalid roster object")
        return
    end
    if not typeof(profile, Profile) then
        LOG:Warning("RosterManager:AddLootToRoster(): Invalid profile object")
        return
    end
    if not typeof(loot, Loot) then
        LOG:Warning("RosterManager:AddLootToRoster(): Invalid loot object")
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
    collectgarbage()
end

function RosterManager:ExportRosters()
    LOG:Trace("RosterManager:ExportRosters()")
    local db = CLM.MODULES.Database:Personal()
    db['rosters'] = self:GetRosters()
end

function RosterManager:ClearExportedRosters()
    LOG:Trace("RosterManager:ClearExportedRosters()")
    local db = CLM.MODULES.Database:Personal()
    db['rosters'] = nil
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
        -- print("=== We have " .. i .. " rosters ===")
    end)
    genRosterNames()
    local profiles = ProfileManager:GetProfiles()
    local actionHandlers = {
        ["create"] =  (function()
            self:NewRoster(CONSTANTS.POINT_TYPE.DKP)
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
            if math.random(0, 1) == 1 then config = true end
            local defaults = false
            if math.random(0, 1) == 1 then defaults = true end
            local overrides = false
            if math.random(0, 1) == 1 then overrides = true end
            local copyProfiles = false
            if math.random(0, 1) == 1 then copyProfiles = true end
            self:Copy(
                rosterNames[math.random(1, #rosterNames)],
                rosterNames[math.random(1, #rosterNames)],
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
            local isBase = false
            if math.random(0, 1) == 1 then
                isBase = true
            end
            self:SetRosterDefaultSlotValue(rosterNames[math.random(1, #rosterNames)], CONSTANTS.INVENTORY_TYPES[math.random(1, #CONSTANTS.INVENTORY_TYPES)], 1000000*math.random(), isBase)
        end),
        ["profile"] = (function()
            local profileList = {}
            for GUID, _ in pairs(profiles) do
                if math.random(0,1) == 1 then
                    table.insert(profileList, GUID)
                end
            end
            local _roster = self:GetRosterByName(rosterNames[math.random(1, #rosterNames)])
            if math.random(0,1) == 1 then
                self:AddProfilesToRoster(_roster, profileList)
            else
                self:RemoveProfilesFromRoster(_roster, profileList)
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

    -- for action, count in pairs(actionCount) do
    --     print(tostring(action) .. ": " .. tostring(count))
    -- end

end

function RosterManager:Debug2(N)
    N = N or 10
    local rosterNames = {}
    local genRosterNames = (function()
        rosterNames = {}
        local rosters = self:GetRosters()
        local i = 0
        for k,_ in pairs(rosters) do
            i = i+1
            table.insert(rosterNames, k)
        end
    end)
    genRosterNames()
    local name = rosterNames[math.random(1, #rosterNames)]
    local roster = self:GetRosterByName(name)
    print("Adding items to roster " .. name)
    for _=1,N do
        local id
        local icon
        while icon == nil do
            id = math.random(1100, 23328)
            _, _, _, _, icon = GetItemInfoInstant(id)
        end
        self:SetRosterItemValue(roster, id, math.random()*1000, math.random()*1000)
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