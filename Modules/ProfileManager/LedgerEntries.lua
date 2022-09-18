local define = LibDependencyInjection.createContext(...)


define.module("LedgerEntries/ProfileManager/Update", {"Utils", "LibStub:EventSourcing/LogEntry", "Log", "ProfileRegistry", "Models/Profile"},
function(resolve, UTILS, LogEntry, Log, ProfileRegistry, Profile, RosterManager)

local tostring = tostring

local mergeLists = UTILS.mergeLists
local ClassToNumber = UTILS.ClassToNumber
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry


local ProfileUpdate     = LogEntry:extend("P0")



-- ------------- --
-- ProfileUpdate --
-- ------------- --
function ProfileUpdate:new(GUID, name, class, spec, main)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.n = (name ~= nil) and tostring(name) or ""
    o.c = ClassToNumber(class)
    o.s = (spec ~= nil) and tostring(spec) or ""
    o.m = GetGUIDFromEntry(main or 0)
    return o
end

function ProfileUpdate:GUID()
    return self.g
end

function ProfileUpdate:name()
    return self.n
end

function ProfileUpdate:ingameClass()
    return self.c
end

function ProfileUpdate:spec()
    return self.s
end

function ProfileUpdate:main()
    return self.m
end

local ProfileUpdateFields = mergeLists(LogEntry:fields(), {"g", "n", "c", "s", "m"})
function ProfileUpdate:fields()
    return ProfileUpdateFields
end

local handler = function(entry)
    Log:TraceAndCount("mutator(ProfileUpdate)")
    local iGUID = entry:GUID()
    if type(iGUID) ~= "number" then return end
    local GUID = UTILS.getGuidFromInteger(iGUID)
    local name = entry:name()
    if UTILS.empty(name) then return end

    local class = UTILS.GetClassReadable(UTILS.NumberToClass(entry:ingameClass()))
    local main = entry:main()
    main =  (type(main) == "number" and main ~= 0) and UTILS.getGuidFromInteger(main) or ""
    -- Check if it's an update
    if not ProfileRegistry.Update(GUID, function(profile)
        if UTILS.empty(class) then
            class = profile:Class()
        end
        if UTILS.empty(main) then
            main = profile:Main()
        end
        profile.class = class
        profile.main = main
    end) then
        local profile = Profile:New(entry, name, class, main, GUID)
        ProfileRegistry.Add(profile)
        -- Check for conditional restore
        local rosters = RosterManager:GetRosters()
        for _, roster in pairs(rosters) do
            if roster:IsConditinallyRemoved(GUID) then
                roster:RestoreConditionallyRemoved(GUID)
            end
        end
    end
end


resolve({ProfileUpdate, handler})
end)


define.module("LedgerEntries/ProfileManager/Remove", {"Utils", "Log", "LibStub:EventSourcing/LogEntry", "ProfileRegistry", "RosterManager"},
function(resolve, UTILS, Log, LogEntry, ProfileRegistry, RosterManager)
    local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
    local ProfileRemove       = LogEntry:extend("P1")
    function ProfileRemove:new(GUID)
        local o = LogEntry.new(self);
        o.g = GetGUIDFromEntry(GUID or 0)
        return o
    end

    function ProfileRemove:GUID()
        return self.g
    end

    local ProfileRemoveFields = UTILS.mergeLists(LogEntry:fields(), {"g"})
    function ProfileRemove:fields()
        return ProfileRemoveFields
    end

    local handler = function(entry)
        Log:TraceAndCount("mutator(ProfileRemove)")
        local GUID = entry:GUID()
        if type(GUID) ~= "number" then return end
        GUID = UTILS.getGuidFromInteger(GUID)
        local profile = ProfileRegistry.Get(GUID)
        if profile then
            -- Check alt-main linking before removing
            if profile:HasAlts() then
                for altGUID in pairs(profile:Alts()) do
                    local altProfile = ProfileRegistry.Get(altGUID)
                    if altProfile then
                        altProfile:SetMain("")
                    end
                end
            elseif (profile:Main() ~= "") then
                local mainProfile = ProfileRegistry.Get(profile:Main())
                if mainProfile then
                    mainProfile:RemoveAlt(GUID)
                end
            end
            -- Remove
            ProfileManager:RemoveProfileFromCache(GUID)

            -- Conditonally remove for backwards compatibility
            local rosters = RosterManager:GetRosters()
            for _, roster in pairs(rosters) do
                if roster:IsProfileInRoster(GUID) then
                    roster:MarkAsConditionallyRemoved(GUID)
                end
            end
        end
    end

    resolve(ProfileRemove, handler)
end)

define.module("LedgerEntries/ProfileManager/Lock", {"Utils", "Log", "LibStub:EventSourcing/LogEntry", "ProfileRegistry"}, function(resolve, UTILS, Log, LogEntry, ProfileRegistry)
    local CreateGUIDList = UTILS.CreateGUIDList
    local ProfileLock       = LogEntry:extend("P3")
    function ProfileLock:new(playerList, lock)
        local o = LogEntry.new(self);
        o.p = CreateGUIDList(playerList)
        o.l = lock and true or false
        return o
    end

    function ProfileLock:targets()
        return self.p
    end

    function ProfileLock:lock()
        return self.l
    end

    local ProfileLockFields = UTILS.mergeLists(LogEntry:fields(), {"p", "l"})
    function ProfileLock:fields()
        return ProfileLockFields
    end

    local handler = function(entry)
        Log:TraceAndCount("mutator(ProfileLock)")
        local action
        if entry:lock() then
            action = (function(p) p:Lock() end)
        else
            action = (function(p) p:Unlock() end)
        end
        -- Same action for all alts and mains
        for _, target in ipairs(entry:targets()) do
            local profile = ProfileRegistry.Get(UTILS.getGuidFromInteger(target))
            if profile then
                action(profile) -- main lock/unlock
                if profile:HasAlts() then -- Is Main - has alts
                    for altGUID in pairs(profile:Alts()) do
                        local altProfile = ProfileRegistry.Get(altGUID)
                        if altProfile then action(altProfile) end
                    end
                elseif (profile:Main() ~= "") then -- is alt - has main
                    local mainProfile = ProfileRegistry.Get(profile:Main())
                    if mainProfile then
                        action(mainProfile)
                        for altGUID in pairs(mainProfile:Alts()) do
                            local altProfile = ProfileRegistry.Get(altGUID)
                            if altProfile then action(altProfile) end
                        end
                    end
                end
            end
        end
    end
    resolve(ProfileLock, handler)
end)

define.module("LedgerEntries/ProfileManager/Link", {"Utils", "Log", "LibStub:EventSourcing/LogEntry", "Constants/PointChangeReason", "PointManager", "ProfileRegistry", "Models/Profile", "RosterManager"},
function(resolve, UTILS, Log, LogEntry, PointChangeReason, PointManager, ProfileRegistry, Profile, RosterManager)
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry
local ProfileLink       = LogEntry:extend("P2")
-- ------------- --
-- ProfileLink --
-- ------------- --
function ProfileLink:new(GUID, main)
    local o = LogEntry.new(self);
    o.g = GetGUIDFromEntry(GUID or 0)
    o.m = GetGUIDFromEntry(main or 0)
    return o
end

function ProfileLink:GUID()
    return self.g
end

function ProfileLink:main()
    return self.m
end

local ProfileLinkFields = UTILS.mergeLists(LogEntry:fields(), {"g", "m"})
function ProfileLink:fields()
    return ProfileLinkFields
end

local handler = function(entry)
    Log:TraceAndCount("mutator(ProfileLink)")
    local altGUID = entry:GUID()
    if type(altGUID) ~= "number" then return end
    altGUID = UTILS.getGuidFromInteger(altGUID)
    local mainGUID = entry:main()
    if type(mainGUID) ~= "number" then return end
    if altGUID == mainGUID then return end
    mainGUID = UTILS.getGuidFromInteger(mainGUID)
    local altProfile = ProfileRegistry.Get(altGUID)
    if not UTILS.typeof(altProfile, Profile) then return end
    local mainProfile = ProfileRegistry.Get(mainGUID)
    if not UTILS.typeof(mainProfile, Profile) then -- Unlink
        -- Check if our main exists
        local currentMainProfile = ProfileRegistry.Get(altProfile:Main())
        if not UTILS.typeof(currentMainProfile, Profile) then return end
        -- Remove main from this alt
        altProfile:ClearMain()
        -- Remove alt count from main
        currentMainProfile:RemoveAlt(altGUID)
    else -- Link
        -- Sanity check if not setting existing one
        if altProfile:Main() == mainProfile:GUID() then return end
        -- Do not allow alt chaining if main is alt
        if UTILS.typeof(ProfileRegistry.Get(mainProfile:Main()), Profile) then return end
        -- Do not allow alt chaining if alt has alts
        if altProfile:HasAlts() then return end
        -- Set new main of this alt
        altProfile:SetMain(mainGUID)
        -- Add alt to our main
        mainProfile:AddAlt(altGUID)
        -- Handle consequences of linking:
        -- For each roster this alt is present in:
        local rosters = RosterManager:GetRosters()
        for _,roster in pairs(rosters) do
            if roster:IsProfileInRoster(altGUID) then
                -- 1) Add main if not present in roster
                roster:AddProfileByGUID(mainGUID)
                -- 2) Sum points of the pool and new alt
                local pointSum = roster:Standings(mainGUID) + roster:Standings(altGUID)
                -- 3) Set new Main standings
                roster:SetStandings(mainGUID, pointSum)
                -- 2a) Sum spent points of the pool and new alt
                local spentSum = roster:GetPointInfoForPlayer(mainGUID).spent + roster:GetPointInfoForPlayer(altGUID).spent
                -- 3a) Set new Main spent
                roster:SetSpent(mainGUID, spentSum)
                -- 4) Mirror standings (includes spent) from main to alts
                roster:MirrorStandings(mainGUID, mainProfile:Alts(), true)
                -- 5) Mirror weekly gains from main to alts
                roster:MirrorWeeklyGains(mainGUID, mainProfile:Alts(), true)
                -- 6) History entry
                local targets = UTILS.keys(mainProfile:Alts())
                table.insert(targets, 1, mainGUID)
                PointManager:AddFakePointHistory(roster, targets, pointSum, PointChangeReason.LINKING_OVERRIDE, entry:time(), entry:creator())
            end
        end
    end
end

resolve({ProfileLink, handler})
end)