local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

-- local LIBS =  {
--     registry = LibStub("AceConfigRegistry-3.0"),
--     gui = LibStub("AceConfigDialog-3.0")
-- }

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS

-- local mergeDictsInline = UTILS.mergeDictsInline
-- local GetColorCodedClassDict = UTILS.GetColorCodedClassDict
local getGuidFromInteger = UTILS.getGuidFromInteger
-- local ColorCodeClass = UTILS.ColorCodeClass
local GetClassColor = UTILS.GetClassColor
local ColorCodeText = UTILS.ColorCodeText
local NumberToClass = UTILS.NumberToClass

local ACL = MODULES.ACL
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
-- local PointManager = MODULES.PointManager
-- local LedgerManager = MODULES.LedgerManager

local function safeToString(value)
    return tostring(value) or ""
end

local function boolToString(value)
    return value and "True" or "False"
end

local function CreateHistoryDisplay(self)
    local columns = {
        {name = "Num",          width = 75},
        {name = "UUID",         width = 150},
        {name = "Time",         width = 150},
        {name = "Type",         width = 50},
        {name = "Description",  width = 400},
        {name = "Author",       width = 100}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(600)
    StandingsGroup:SetWidth(950)
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 25, 15, nil, StandingsGroup.frame, false)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", StandingsGroup.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 0.1)

    return StandingsGroup
end

local configDecodeFunctions = {
    ["-"] = (function(value)
        return "", ""
    end),
    ---
    auctionType = (function(value)
        return "Auction Type", CONSTANTS.AUCTION_TYPES_GUI[value] or ""
    end),
    itemValueMode = (function(value)
        return "Item Value Mode", CONSTANTS.ITEM_VALUE_MODES_GUI[value] or ""
    end),
    zeroSumBank = (function(value)
        return "Zero-Sum Bank", boolToString(value)
    end),
    zeroSumBankInflation = (function(value)
        return "Zero-Sum Bank Inflation", safeToString(value)
    end),
    auctionTime = (function(value)
        return "Auction Time", safeToString(value)
    end),
    antiSnipe = (function(value)
        return "Anti-Snipe", safeToString(value)
    end),
    allowNegativeStandings = (function(value)
        return "Allow going below 0  DKP", boolToString(value)
    end),
    allowNegativeBidders = (function(value)
        return "Allow bidding below 0 DKP", boolToString(value)
    end),
    bossKillBonus = (function(value)
        return "Boss Kill Bonus", boolToString(value)
    end),
    bossKillBonusValue = (function(value)
        return "Default Boss Kill Bonus value", safeToString(value)
    end),
    onTimeBonus = (function(value)
        return "On-Time Bonus", boolToString(value)
    end),
    onTimeBonusValue = (function(value)
        return "On-Time Bonus value", safeToString(value)
    end),
    raidCompletionBonus = (function(value)
        return "Raid Completion Bonus", boolToString(value)
    end),
    raidCompletionBonusValue = (function(value)
        return "Raid Completion Bonus value", safeToString(value)
    end),
    intervalBonus = (function(value)
        return "Interval Bonus", boolToString(value)
    end),
    intervalBonusTime = (function(value)
        return "Interval Bonus time", safeToString(value)
    end),
    intervalBonusValue = (function(value)
        return "Interval Bonus value", safeToString(value)
    end),
    hardCap = (function(value)
        return "Hard DKP cap", safeToString(value)
    end),
    weeklyCap = (function(value)
        return "Weekly DKP cap", safeToString(value)
    end),
    weeklyReset = (function(value)
        return "Weekly reset", CONSTANTS.WEEKLY_RESETS_GUI[value] or ""
    end),
    roundDecimals = (function(value)
        return "Round to", safeToString(value)
    end),
    minimalIncrement = (function(value)
        return "Min bid increment", safeToString(value)
    end)
}

local function decodeRosterConfig(config, value)
    local fn = configDecodeFunctions[config] or configDecodeFunctions["-"]
    return fn(value)
end

local function decodeSlotValueConfig(slot, base, max)
    return CONSTANTS.INVENTORY_TYPES_GUI[slot] or "", safeToString(base), safeToString(max)
end

local function decodeItemValueOverride(itemId, base, max)
    local _, itemLink = GetItemInfo(itemId)
    return itemLink or safeToString(itemId), safeToString(base), safeToString(max)
end

local describeFunctions  = {
    -- Default
    ["-"] = (function(entry)
        local description = ""
        for _, field in ipairs(entry:fields()) do
            description = description .. (tostring(entry[field]) or "") .. " "
        end
        return description
    end),
    -- ["XXX"] = (function(entry)
    --     return ""
    -- end),
    -- Profiles
    ["P0"] = (function(entry)
        return "[Update Profile]: " ..
            ColorCodeText(getGuidFromInteger(entry:GUID()), "ebb434") ..
            " " ..
            ColorCodeText(entry:name(), GetClassColor(NumberToClass(entry:ingameClass())).hex)
    end),
    ["P1"] = (function(entry)
        local guid = getGuidFromInteger(entry:GUID())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return "[Remove Profile]: " ..
            ColorCodeText(profile and profile:Name() or guid,
                          profile and GetClassColor(profile:Class()).hex or "ebb434")
    end),
    ["P2"] = (function(entry)
        local guid = getGuidFromInteger(entry:GUID())
        local mainGuid = getGuidFromInteger(entry:main())
        local profile = ProfileManager:GetProfileByGUID(guid)
        local mainProfile = ProfileManager:GetProfileByGUID(mainGuid)
        if entry:main() ~= 0 then
            return "[Alt-Main Link]: " ..
                ColorCodeText(profile and profile:Name() or guid,
                            profile and GetClassColor(profile:Class()).hex or "ebb434") ..
                " alt of: " ..
                ColorCodeText(mainProfile and mainProfile:Name() or mainGuid,
                            mainProfile and GetClassColor(mainProfile:Class()).hex or "ebb434")
        else
            return "[Alt-Main Link]: Remove linking of " ..
                ColorCodeText(profile and profile:Name() or guid,
                            profile and GetClassColor(profile:Class()).hex or "ebb434")
        end
    end),
    -- Roster
    ["R0"] = (function(entry)
        return "[Create Roster]: " ..
            entry:rosterUid() ..
            " <" .. ColorCodeText(entry:name(), "ebb434") .. "> "  ..
            (CONSTANTS.POINT_TYPES_GUI[entry:pointType()] or "")
    end),
    ["R1"] = (function(entry)
        return "[Delete Roster]: " ..
            "<" .. ColorCodeText(entry:rosterUid(), "ebb434") ..">"
    end),
    ["R2"] = (function(entry)
        return "[Rename Roster]: " ..
            entry:rosterUid() ..
            " <" .. ColorCodeText(entry:name(), "ebb434") .. ">"
    end),
    ["R3"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[All Roster Configs]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">" .. " Too much data to display"

    end),
    ["R4"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local config, value = decodeRosterConfig(entry:config(), entry:value())
        return "[Roster Config]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            config .. ": " .. value
    end),
    ["R5"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[All Roster Default Slot Values]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">" .. " Too much data to display"

    end),
    ["R6"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local slot, base, max = decodeSlotValueConfig(entry:config(), entry:base(), entry:max())
        return "[Roster Default Slot Value]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            slot .. ": " .. base .. " / " .. max
    end),
    ["R7"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local link, base, max = decodeItemValueOverride(entry:itemId(), entry:base(), entry:max())
        return "[Roster Item Value Override]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            link .. ": " .. base .. " / " .. max

    end),
    ["R8"] = (function(entry)
        return "[Roster Item Value Override]: " .. " UNUSED"
    end),
    -- ["XXX"] = (function(entry)
    --     return ""
    -- end),
    -- ["XXX"] = (function(entry)
    --     return ""
    -- end),
    -- ["XXX"] = (function(entry)
    --     return ""
    -- end),
    -- ["XXX"] = (function(entry)
    --     return ""
    -- end),
    -- Loot
    -- Raid
}

local function describeEntry(entry)
    local fn = describeFunctions[entry:class()] or describeFunctions["-"]
    return fn(entry)
end

local function getEntryInfo(entry)
    -- Common info
    local uuid = entry:uuid()
    local time = date("%d/%m/%Y %H:%M:%S", entry:time())
    local type = entry:class()
    local profile = ProfileManager:GetProfileByGUID(getGuidFromInteger(entry:creator()))
    local author = profile and profile:Name() or ""
    -- Specialised info
    local description = describeEntry(entry)
    --
    return uuid, time, type, description, author
end

local function buildEntryRow(entry, id)
    local row = {cols = {}}
    local uuid, time, type, description, author = getEntryInfo(entry)
    table.insert(row.cols, {value = id})
    table.insert(row.cols, {value = uuid})
    table.insert(row.cols, {value = time})
    table.insert(row.cols, {value = type})
    table.insert(row.cols, {value = description})
    table.insert(row.cols, {value = author})
    return row
end

local AuditGUI = {}
function AuditGUI:Initialize()
    LOG:Trace("AuditGUI:Initialize()")
    if not ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER) then return end
    self:Create()
    self:RegisterSlash()
    self._initialized = true
end

function AuditGUI:Create()
    LOG:Trace("AuditGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Ledger Entries Inspection")
    f:SetStatusText("")
    f:SetLayout("Table")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(1000)
    f:SetHeight(600)
    self.top = f
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Ledger_Entries_Inspection_GUI")

    f:AddChild(CreateHistoryDisplay(self))

    -- Hide by default
    f:Hide()
end

function AuditGUI:Refresh()
    LOG:Trace("AuditGUI:Refresh()")
    if not self._initialized then return end

    local data = {}
    for i,entry in ipairs(MODULES.Database:Ledger()) do
        table.insert(data, buildEntryRow(entry, i))
    end

    self.st:SetData(data)
end


function AuditGUI:Toggle()
    LOG:Trace("AuditGUI:Toggle()")
    if not self._initialized then return end
    if self.top.frame:IsVisible() then
        self.top.frame:Hide()
    else
        self:Refresh()
        self.top.frame:Show()
    end
end

function AuditGUI:RegisterSlash()
    local options = {
        audit = {
            type = "execute",
            name = "audit",
            desc = "Toggle all ledger events audit window",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

CLM.GUI.Audit = AuditGUI