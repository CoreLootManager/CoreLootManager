-- ------------------------------- --
local _, PRIV = ...
local CLM = LibStub("ClassicLootManager").CLM
-- ------ CLM common cache ------- --
local CONSTANTS = CLM.CONSTANTS
local LOG       = CLM.LOG
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

-- Libs
local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local json = LibStub:GetLibrary("LibJsonLua")

local GenericImport = {}
function GenericImport:Initialize()
    LOG:Trace("GenericImport:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    self:Create()
    self:RegisterSlash()
    self._initialized = true
end

--[[
    1) Create all profiles
    2) Create all rosters
    3) Add profiles to rosters
    4) Set profile standings in rosters
]]

local function ParseImportData(self)
    local numRosters = #self.data.standings.roster
    local rosterMap = {}

    local numProfiles = 0
    local profileMap = {}

    local numStandingsToSet = 0
    local numSpentToSet = 0

    for _, roster in ipairs(self.data.standings.roster) do
        -- uid             1624382252
        -- name            Test table
        -- standings       table: 0x555b4a36d450
        rosterMap[roster.uid] = {
            name = roster.name,
            type = roster.type,
            config = roster.config,
            fieldNames = roster.fieldNames,
            standings = {},
            players = {},
            spent = {}
        }
        for _, player in ipairs(roster.standings.player) do
            -- name    Specified
            -- guid    Player-4454-031C7752
            -- class   Warlock
            -- spec    0/43/18
            -- dkp     13.445
            local guid = self.guidCache[player.name] or player.guid
            if guid then
                if not profileMap[guid] then
                    numProfiles = numProfiles + 1
                    profileMap[guid] = {
                        name = player.name,
                        class = player.class
                    }
                end
                rosterMap[roster.uid].players[#rosterMap[roster.uid].players+1] = guid
                if player.points and player.points ~= 0 then
                    numStandingsToSet = numStandingsToSet + 1
                    if not rosterMap[roster.uid].standings[player.points] then
                        rosterMap[roster.uid].standings[player.points] = {}
                    end
                    rosterMap[roster.uid].standings[player.points][#rosterMap[roster.uid].standings[player.points]+1] = guid
                end
                if player.spent and player.spent ~= 0 then
                    numSpentToSet = numSpentToSet + 1
                    if not rosterMap[roster.uid].spent[player.spent] then
                        rosterMap[roster.uid].spent[player.spent] = {}
                    end
                    rosterMap[roster.uid].spent[player.spent][#rosterMap[roster.uid].spent[player.spent]+1] = guid
                end
            end
        end
    end

    local actions = numRosters + numRosters + numProfiles + numStandingsToSet + numSpentToSet

    self.actionDescriptor = {
        numActions = actions,
        profileMap = profileMap,
        rosterMap = rosterMap
    }
end

local function Import_CreateRosters(self)
    local delay = 0
    for _, info in pairs(self.actionDescriptor.rosterMap) do
        if not CLM.MODULES.RosterManager:GetRosterByName(info.name) then
            delay = delay + 0.5
            C_Timer.After(delay, function()
                LOG:Message(CLM.L["New roster: %s"], info.name)
                CLM.MODULES.RosterManager:NewRoster(info.type or CONSTANTS.POINT_TYPE.DKP, info.name)
            end)
        end
    end
end

local function Import_ConfigureRosters(self)
    for _, info in pairs(self.actionDescriptor.rosterMap) do
        if CLM.MODULES.RosterManager:GetRosterByName(info.name) then
            for config, value in pairs(info.config) do
                CLM.MODULES.RosterManager:SetRosterConfiguration(info.name, config, value)
            end
            for field, name in pairs(info.fieldNames) do
                CLM.MODULES.RosterManager:SetFieldName(info.name, field, name)
            end
        end
    end
end

local function Import_CreateProfiles(self)
    for guid, info in pairs(self.actionDescriptor.profileMap) do
        CLM.MODULES.ProfileManager:NewProfile(guid, info.name, CLM.UTILS.CanonicalClass(info.class))
    end
end

local function Import_AddProfilesToRosters(self)
    for _, info in pairs(self.actionDescriptor.rosterMap) do
        local roster = CLM.MODULES.RosterManager:GetRosterByName(info.name)
        if CLM.MODULES.RosterManager:GetRosterByName(info.name) then
            CLM.MODULES.RosterManager:AddProfilesToRoster(roster, info.players)
        end
    end
end

local function Import_SetStandings(self)
    for _, info in pairs(self.actionDescriptor.rosterMap) do
        local roster = CLM.MODULES.RosterManager:GetRosterByName(info.name)
        if CLM.MODULES.RosterManager:GetRosterByName(info.name) then
            for standings, GUID in pairs(info.standings) do
                if standings ~= 0 then
                    CLM.MODULES.LedgerManager:Submit(CLM.MODELS.LEDGER.POINTS.Set:new(roster:UID(), GUID, standings, CONSTANTS.POINT_CHANGE_REASON.IMPORT))
                end
            end

            for spent, GUID in pairs(info.spent) do
                if spent ~= 0 then
                    CLM.MODULES.LedgerManager:Submit(CLM.MODELS.LEDGER.POINTS.Set:new(roster:UID(), GUID, spent, CONSTANTS.POINT_CHANGE_REASON.IMPORT, nil, true))
                end
            end
        end
    end
end

local function CacheNewGuidData(self)
    self.guidCache = {}
    for num=1, GetNumGuildMembers() do
        local name,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,guid = GetGuildRosterInfo(num)
        if name and guid then
            name = CLM.UTILS.Disambiguate(name)
            self.guidCache[name] = guid
        end
    end
end

local function Import(self)
    C_Timer.After(0.5, function()
        LOG:Message("1/5: ".. CLM.L["Create Rosters"])
        Import_CreateRosters(self)
        C_Timer.After(5, function()
            LOG:Message("2/5: " .. CLM.L["Configure Rosters"])
            Import_ConfigureRosters(self)
            C_Timer.After(5, function()
                LOG:Message("3/5: " .. CLM.L["Create Profiles"])
                Import_CreateProfiles(self)
                C_Timer.After(5, function()
                    LOG:Message("4/5: ".. CLM.L["Add Profiles to Rosters"])
                    Import_AddProfilesToRosters(self)
                    C_Timer.After(1, function()
                        LOG:Message("5/5: " .. CLM.L["Set Profiles standings in Rosters"])
                        Import_SetStandings(self)
                        self.inProgress = false
                    end)
                end)
            end)
        end)
    end)
end

local function UpdateOptions(self)
    local options = {
        type = "group",
        args = {
            import_data = {
                name = CLM.L["Input JSON exported standings"],
                type = "input",
                multiline = 10,
                set = function(_, v)
                    self.importJson = v
                    local status, data = pcall(json.decode, self.importJson)
                    if status then
                        self.data = data
                        CacheNewGuidData(self)
                        C_Timer.After(0.1, function()
                            ParseImportData(self)
                            C_Timer.After(0.1, function()
                                self.importExecuted = true
                                UpdateOptions(self)
                            end)
                        end)
                    end
                end,
                get = function(i) return self.importJson end,
                width = "full",
                order = 1
            },
            execute_import = {
                name = CLM.L["Import"],
                type = "execute",
                func = (function()
                    self.inProgress = true
                    Import(self)
                end),
                disabled = (function() return not self.actionDescriptor or self.inProgress end),
                order = 3,
                width = "full"
            }
        }
    }

    if self.importExecuted then
        if self.actionDescriptor then
            options.args.success_info = {
                name = "|cff00ee00" .. CLM.L["Success"] .. "|r" .. " (" .. tostring(self.actionDescriptor.numActions) .. ")",
                type = "description",
                fontSize = "large",
                order = 2,
                width = "full"
            }
        else
            options.args.ERROR = {
                name = "|cffee0000" .. CLM.L["ERROR - invalid import data"] .. "|r",
                type = "description",
                fontSize = "large",
                order = 2,
                width = "full"
            }
        end
    end

    AceConfigRegistry:RegisterOptionsTable(CLM.L["Import"], options)
    AceConfigDialog:Open(CLM.L["Import"], self.options)
end

function GenericImport:Create()
    local f = AceGUI:Create("Window")
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetTitle(CLM.L["Import"])
    f:SetWidth(330)
    f:SetHeight(330)

    local g = AceGUI:Create("SimpleGroup")
    f:AddChild(g)
    self.data = {}
    self.top = f
    self.options = g
    UpdateOptions(self)
    f:Hide()
end

function GenericImport:RegisterSlash()
    local options = {
        importgeneric = {
            type = "execute",
            name = "Generic Import",
            desc = CLM.L["Toggle import window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function GenericImport:Toggle()
    LOG:Trace("GenericImport:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self.top:Show()
    end
end

PRIV.MODULES.GenericImport = GenericImport