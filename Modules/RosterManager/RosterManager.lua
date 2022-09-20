local define = LibDependencyInjection.createContext(...)

define.module("RosterRegistry", {"Utils"}, function(resolve, Utils)
    local myGUID = Utils.whoamiGUID()
    local rosters = {}
    local nameIndex = {}


    resolve({
        Add = function(roster)
            rosters[roster:UID()] = roster
            nameIndex[strlower(roster:Name())] = roster
        end,
        Delete = function(uid)
            local roster = rosters[uid]
            if roster then
            rosters[uid]  = nil
            nameIndex[roster:Name()] = nil
            end
        end,
        Update = function(UID, callback)
            -- Select a profile by GUID, and update it in the callback.
            local roster = rosters[UID]
            if roster == nil then return false end
            nameIndex[strlower(roster:Name())] = nil
            rosters[roster:UID()] = nil
            callback(roster)
            rosters[roster:UID()] = roster
            nameIndex[strlower(roster:Name())] = roster
            return true
        end,
        Get = function(UID)
            return rosters[UID]
        end,
        GetByName = function(name)
            return nameIndex[strlower(name)]
        end,
        -- this leaks our table, we should implement a generator intead
        -- All = function() return profiles end

    })

end)

define.module("RosterManager", {
    "Log", "Constants", "Utils", "RosterManager/LedgerEntries", "Meta:ADDON_TABLE", "LedgerManager", "Database", "Models/Roster", "Models/Profile", "L", "ConfigManager", "Constants/PointTypes", "Constants/SlotValueTiersGui", "RosterRegistry"
}, function(resolve, LOG, CONSTANTS, UTILS, LedgerEntries, CLM, LedgerManager, Database, Roster, Profile, L, ConfigManager,  SlotValueTiersGui, RosterRegistry)

local pairs, ipairs = pairs, ipairs
local tonumber, tostring = tonumber, tostring
local type, MAX_RAID_MEMBERS, IsInRaid, GetRaidRosterInfo = type, MAX_RAID_MEMBERS, IsInRaid, GetRaidRosterInfo
local tinsert, slen, strsub = table.insert, string.len, strsub


local RosterManager = {}
function RosterManager:GenerateName()
    local prefix = CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX[math.random(1, #CONSTANTS.ROSTER_NAME_GENERATOR.PREFIX)]
    local suffix = CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX[math.random(1, #CONSTANTS.ROSTER_NAME_GENERATOR.SUFFIX)]
    return UTILS.capitalize(prefix).. " " .. UTILS.capitalize(suffix)
end

-- Controller Roster Manger
function RosterManager:Initialize()
    LOG:Trace("RosterManager:Initialize()")

    -- Register mutators
    LedgerManager:RegisterEntryType(
        LedgerEntries.Create,
        (function(entry)
            LOG:TraceAndCount("mutator(RosterCreate)")
            local uid = entry:rosterUid()
            local name = entry:name()
            local pointType = entry:pointType()
            if RosterRegistry.Get(uid) or RosterRegistry.GetByName(name) then
                LOG:Debug("Roster [%s:%s] already exists. Verify data integrity with other officers.", name, uid)
                return
            end
            if not (pointType and PointTypes[pointType] ~= nil) then return end
            local roster = Roster:New(name, uid, pointType, self.db.raidsForFullAttendance, self.db.attendanceWeeksWindow)
            RosterRegistry.Add(roster)
        end))

    LedgerManager:RegisterEntryType(
        LedgerEntries.Delete,
        (function(entry)
            LOG:TraceAndCount("mutator(RosterDelete)")
            local uid = entry:rosterUid()

            local roster = RosterRegistry.Get(uid)
            if not roster then
                LOG:Debug("Removing non-existent roster [%s]", uid)
                return
            end
            RosterRegistry.Delete(uid)
        end))

        LedgerManager:RegisterEntryType(
            LedgerEntries.Rename,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterRename)")
                local uid = entry:rosterUid()
                local name = entry:name()

                local o = RosterRegistry.Get(uid)
                if not o then
                    LOG:Debug("Renaming non-existent roster [%s]", uid)
                    return
                end
                local n = self:GetRosterByName(name)
                if n then
                    LOG:Debug("Roster named [%s] already exists", name)
                    return
                end

                RosterRegistry.Update(uid, function(roster)
                    roster.name = name
                end)
            end))

        LedgerManager:RegisterEntryType(
            LedgerEntries.CopyData,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterCopyData)")
                local sourceUid = entry:sourceRosterUid()
                local targetUid = entry:targetRosterUid()

                local s = RosterRegistry.Get(sourceUid)
                if not s then
                    LOG:Debug("Copying from non-existent roster [%s]", sourceUid)
                    return
                end
                local t = RosterRegistry.Get(targetUid)
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
            LedgerEntries.UpdateConfigSingle,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateConfigSingle)")
                local rosterUid = entry:rosterUid()

                local roster = RosterRegistry.Get(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetConfiguration(entry:config(), entry:value())
            end))

        LedgerManager:RegisterEntryType(
            LedgerEntries.UpdateDefaultSingle,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateDefaultSingle)")
                local rosterUid = entry:rosterUid()

                local roster = RosterRegistry.Get(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end

                roster:SetDefaultSlotTierValue(entry:slot(), entry:tier(), entry:value())
            end))

        LedgerManager:RegisterEntryType(
                LedgerEntries.UpdateOverrides,
                (function(entry)
                    LOG:TraceAndCount("mutator(RosterUpdateOverrides)")
                    local rosterUid = entry:rosterUid()

                    local roster = RosterRegistry.Get(rosterUid)
                    if not roster then
                        LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                        return
                    end

                    roster:SetItemValues(entry:itemId(), entry:values())
                end))

            LedgerManager:RegisterEntryType(
                LedgerEntries.UpdateOverridesSingle,
                (function(entry)
                    LOG:TraceAndCount("mutator(RosterUpdateOverridesSingle)")
                    local rosterUid = entry:rosterUid()

                    local roster = RosterRegistry.Get(rosterUid)
                    if not roster then
                        LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                        return
                    end

                    roster:SetItemTierValue(entry:itemId(), entry:tier(), entry:value())
                end))

        LedgerManager:RegisterEntryType(
            LedgerEntries.UpdateProfiles,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterUpdateProfiles)")
                local rosterUid = entry:rosterUid()

                local roster = RosterRegistry.Get(rosterUid)
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
                        local GUID = UTILS.getGuidFromInteger(iGUID)
                        local profile = ProfileRegistry.Get(GUID)
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
                        local GUID = UTILS.getGuidFromInteger(iGUID)
                        roster:AddProfileByGUID(GUID)
                        local profile = ProfileRegistry.Get(GUID)
                        if profile then
                            -- If it is an alt of a linked main - set its standings and gains from main
                            if profile:Main() ~= "" then
                                -- add main in case it isnt there
                                roster:AddProfileByGUID(profile:Main())
                                roster:MirrorStandings(profile:Main(), { GUID })
                                roster:MirrorWeeklyGains(profile:Main(), { GUID })
                                PointManager:AddFakePointHistory(roster, { GUID }, roster:Standings(profile:Main()), CONSTANTS.POINT_CHANGE_REASON.LINKING_OVERRIDE, entry:time(), entry:creator())
                            end
                        end
                    end
                end
            end))

        LedgerManager:RegisterEntryType(
            LedgerEntries.BossKillBonus,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterBossKillBonus)")
                local rosterUid = entry:rosterUid()

                local roster = RosterRegistry.Get(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end
                roster:SetBossKillBonusValue(entry:encounterId(), entry:difficultyId(), entry:value())
            end))

        LedgerManager:RegisterEntryType(
            LedgerEntries.FieldRename,
            (function(entry)
                LOG:TraceAndCount("mutator(RosterRenameField)")
                local rosterUid = entry:rosterUid()

                local roster = RosterRegistry.Get(rosterUid)
                if not roster then
                    LOG:Debug("Updating non-existent roster [%s]", rosterUid)
                    return
                end
                roster:SetFieldName(entry:tier(), entry:name())
            end))

        LedgerManager:RegisterOnRestart(function()
            self:WipeAll()
        end)

    self.db = Database:Personal('rosterManager', {
        raidsForFullAttendance = 2,
        attendanceWeeksWindow = 10
    })

    local options = {
        attendance_header = {
            type = "header",
            name = L["Attendance"],
            order = 20
        },
        attendance_max = {
            name = L["Raids needed in reset"],
            desc = L["Provide number of raids needed for 100% attendance in a weekly reset. Between 1 - 50 raids. Defaults to 2. Requires /reload."],
            type = "range",
            min = 1,
            max = 50,
            softMin = 1,
            softMax = 10,
            step = 1,
            set = function(i, v)
                v = tonumber(v) or 1
                if v < 1 then v = 1 end
                if v > 50 then v = 50 end
                self.db.raidsForFullAttendance = v
            end,
            get = function(i) return self.db.raidsForFullAttendance end,
            order = 21
          },
          attendance_window = {
            name = L["Average weeks"],
            desc = L["Provide number of weeks that will be accounted for attendance. Between 1 - 1000 weeks. Defaults to 10. Requires /reload."],
            type = "range",
            min = 1,
            max = 1000,
            softMin = 1,
            softMax = 54,
            step = 1,
            set = function(i, v)
                v = tonumber(v) or 1
                if v < 1 then v = 1 end
                if v > 1000 then v = 1000 end
                self.db.attendanceWeeksWindow = v
            end,
            get = function(i) return self.db.attendanceWeeksWindow end,
            order = 22
          }
    }
    ConfigManager:RegisterGlobal(options)


end

function RosterRegistry.All()
    return self.cache.rostersUidMap
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

    if not (pointType and PointTypes[pointType] ~= nil) then
        LOG:Error("RosterManager:NewRoster(): Invalid point type")
        return
    end
    LedgerManager:Submit(LedgerEntries.Create:new(uid, name, pointType), true)
end

function RosterManager:DeleteRosterByName(name)
    LOG:Trace("RosterManager:DeleteRosterByName()")
    local roster = self:GetRosterByName(name)
    if not roster then
        LOG:Error("RosterManager:RenameRoster(): Unknown roster name %s", name)
        return
    end
    LedgerManager:Submit(LedgerEntries.Delete:new(roster:UID()), true)
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

    LedgerManager:Submit(LedgerEntries.Rename:new(o:UID(), new), true)
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

    LedgerManager:Submit(LedgerEntries.CopyData:new(s:UID(), t:UID(), config, defaults, overrides, profiles), true)
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

    LedgerManager:Submit(LedgerEntries.UpdateConfigSingle:new(roster:UID(), option, value), true)
end

function RosterManager:SetRosterDefaultSlotTierValue(nameOrRoster, slot, tier, value)
    LOG:Trace("RosterManager:SetRosterDefaultSlotTierValue()")
    local roster
    if UTILS.typeof(nameOrRoster, Roster) then
        roster = nameOrRoster
    else
        roster = self:GetRosterByName(nameOrRoster)
    end
    if not roster then
        LOG:Error("RosterManager:SetRosterDefaultSlotTierValue(): Invalid roster object or name")
        return nil
    end
    if not value then
        LOG:Error("RosterManager:SetRosterDefaultSlotTierValue(): Missing value")
        return
    end
    if not slot or not CONSTANTS.INVENTORY_TYPES_SET[slot] then
        LOG:Error("RosterManager:SetRosterDefaultSlotTierValue(): Missing slot")
        return
    end
    if not tier or not CONSTANTS.SLOT_VALUE_TIERS[tier] then
        LOG:Error("RosterManager:SetRosterDefaultSlotTierValue(): Missing tier")
        return
    end
    if roster:GetDefaultSlotTierValue(slot, tier) == tonumber(value) then
        LOG:Debug("RosterManager:SetRosterDefaultSlotTierValue(): No change to value. Skipping.")
        return
    end

    LedgerManager:Submit(LedgerEntries.UpdateDefaultSingle:new(roster:UID(), slot, tier, value), true)
end

function RosterManager:SetFieldName(nameOrRoster, field, name)
    LOG:Trace("RosterManager:SetFieldName()")
    local roster
    if UTILS.typeof(nameOrRoster, Roster) then
        roster = nameOrRoster
    else
        roster = self:GetRosterByName(nameOrRoster)
    end
    if not roster then
        LOG:Error("RosterManager:SetFieldName(): Invalid roster object or name")
        return nil
    end
    if not name then
        LOG:Error("RosterManager:SetFieldName(): Missing name")
        return
    end
    if not field or not CONSTANTS.SLOT_VALUE_TIERS[field] then
        LOG:Error("RosterManager:SetFieldName(): Missing tier")
        return
    end
    name = tostring(name)
    if slen(name) > 16 then
        LOG:Warning("RosterManager:SetFieldName(): Truncating name %s for field %s to 16 chars.", name, field)
        name = strsub(name, 1, 16)
    end

    if name == roster:GetFieldName(field) then
        LOG:Debug("RosterManager:SetFieldName(): No change to name. Skipping.")
        return
    end

    LedgerManager:Submit(LedgerEntries.FieldRename:new(roster:UID(), field, name), true)
end

function RosterManager:CompareAndSanitizeSlotTierValues(current, new)
    local sanitizedValues = {}
    local allSame = true
    for key,_ in pairs(CONSTANTS.SLOT_VALUE_TIERS) do
        local value = tonumber(new[key])
        if not value then
            LOG:Error("RosterManager:CompareAndSanitizeSlotTierValues(): Missing valid value for tier %s", SlotValueTiersGui[key])
            return
        end
        if current[key] ~= value then
            allSame = false
        end
        sanitizedValues[key] = value
    end
    if allSame then
        LOG:Debug("RosterManager:CompareAndSanitizeSlotTierValues(): No change to value. Skipping.")
        return
    end
    return sanitizedValues
end

function RosterManager:SetRosterItemValues(nameOrRoster, itemId, values)
    LOG:Trace("RosterManager:SetRosterItemTierValue()")
    local roster
    if UTILS.typeof(nameOrRoster, Roster) then
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
    local sanitizedValues = self:CompareAndSanitizeSlotTierValues(roster:GetItemValues(itemId), values)
    if sanitizedValues then
        LedgerManager:Submit(LedgerEntries.UpdateOverrides:new(roster:UID(), itemId, sanitizedValues), true)
    end
end

function RosterManager:SetRosterItemTierValue(nameOrRoster, itemId, tier, value)
    LOG:Trace("RosterManager:SetRosterItemTierValue()")
    local roster
    if UTILS.typeof(nameOrRoster, Roster) then
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
    value = tonumber(value)
    if not value then
        LOG:Error("RosterManager:SetRosterItemTierValue(): Missing value")
        return
    end
    if not tier or not CONSTANTS.SLOT_VALUE_TIERS[tier] then
        LOG:Error("RosterManager:SetRosterItemTierValue(): Missing tier")
        return
    end
    LedgerManager:Submit(LedgerEntries.UpdateOverridesSingle:new(roster:UID(), itemId, tier, value), true)
end

function RosterManager:SetRosterBossKillBonusValue(nameOrRoster, encounterId, difficultyId, value)
    LOG:Trace("RosterManager:SetRosterBossKillBonusValue()")
    local roster
    if UTILS.typeof(nameOrRoster, Roster) then
        roster = nameOrRoster
    else
        roster = self:GetRosterByName(nameOrRoster)
    end
    if not roster then
        LOG:Error("RosterManager:SetRosterBossKillBonusValue(): Invalid roster object or name")
        return nil
    end
    if not tonumber(encounterId) then
        LOG:Error("RosterManager:SetRosterBossKillBonusValue(): Missing encounterId")
        return
    end
    if not tonumber(difficultyId) then
        LOG:Error("RosterManager:SetRosterBossKillBonusValue(): Missing difficultyId")
        return
    end
    if not tonumber(value) then
        LOG:Error("RosterManager:SetRosterBossKillBonusValue(): Missing value")
        return
    end
    local currentBonus = roster:GetBossKillBonusValue(encounterId)
    if currentBonus == value then
        LOG:Debug("RosterManager:SetRosterBossKillBonusValue(): No change to value. Skipping.")
        return
    end
    LedgerManager:Submit(LedgerEntries.BossKillBonus:new(roster:UID(), encounterId, difficultyId, value), true)
end

function RosterManager:AddProfilesToRoster(roster, profiles)
    LOG:Trace("RosterManager:AddProfilesToRoster()")
    if not UTILS.typeof(roster, Roster) then
        LOG:Error("RosterManager:AddProfilesToRoster(): Invalid roster object")
        return
    end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Warning("Empty profiles table in AddProfilesToRoster()")
        return
    end

    local entry = LedgerEntries.UpdateProfiles:new(roster:UID(), profiles, false)
    local t = entry:profiles()
    if not t or (#t == 0) then
        LOG:Error("RosterManager:AddProfilesToRoster(): Empty profiles list")
        return
    end

    LedgerManager:Submit(entry, true)
end

function RosterManager:RemoveProfilesFromRoster(roster, profiles)
    LOG:Trace("RosterManager:RemoveProfilesFromRoster()")
    if not UTILS.typeof(roster, Roster) then
        LOG:Error("RosterManager:RemoveProfilesFromRoster(): Invalid roster object")
        return
    end
    if profiles == nil or type(profiles) ~= "table" or #profiles == 0 then
        LOG:Error("Empty profiles table in RemoveProfilesFromRoster()")
        return
    end

    local entry = LedgerEntries.UpdateProfiles:new(roster:UID(), profiles, true)

    local t = entry:profiles()
    if not t or (#t == 0) then
        LOG:Error("RosterManager:RemoveProfilesFromRoster(): Empty profiles list")
        return
    end

    LedgerManager:Submit(entry, true)
end

function RosterManager:AddFromRaidToRoster(roster)
    LOG:Trace("RosterManager:AddFromRaidToRoster()")
    if not UTILS.typeof(roster, Roster) then
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
            local profile = ProfileRegistry.GetByName(name)
            if profile then
                local GUID = profile:GUID()
                if not roster:IsProfileInRoster(GUID) then
                    tinsert(missingProfiles, GUID)
                end
            else
                LOG:Debug("Missing [%s] profile after filling from raid. Weird.", name)
            end
        end
    end
    if #missingProfiles > 0 then
        LOG:Message(L["Adding missing %s players to current roster"], #missingProfiles)
        self:AddProfilesToRoster(roster, missingProfiles)
    end
end

function RosterManager:AddLootToRoster(roster, loot, profile)
    LOG:Trace("RosterManager:AddLootToRoster()")
    if not UTILS.typeof(roster, Roster) then
        LOG:Error("RosterManager:AddLootToRoster(): Invalid roster object")
        return
    end
    if not UTILS.typeof(profile, Profile) then
        LOG:Error("RosterManager:AddLootToRoster(): Invalid profile object")
        return
    end
    if not UTILS.typeof(loot, CLM.MODELS.Loot) then
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


RosterManager:Initialize()
RosterManager = RosterManager
resolve(RosterManager)

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


end)