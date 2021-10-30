local _, CLM = ...

-- Libs
local ScrollingTable = LibStub("ScrollingTable")
local AceGUI = LibStub("AceGUI-3.0")

local LOG = CLM.LOG
local UTILS = CLM.UTILS
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS

local getGuidFromInteger = UTILS.getGuidFromInteger
local GetClassColor = UTILS.GetClassColor
local ColorCodeText = UTILS.ColorCodeText
local NumberToClass = UTILS.NumberToClass
local mergeDictsInline = UTILS.mergeDictsInline

local ACL = MODULES.ACL
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local RaidManager = MODULES.RaidManager
local LedgerManager = MODULES.LedgerManager

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}
local REGISTRY = "clm_audit_management_gui_options"

local RightClickMenu

local function safeToString(value)
    return tostring(value) or ""
end

local function boolToString(value)
    return value and "True" or "False"
end

local function safeItemIdToLink(itemId)
    local _, itemLink = GetItemInfo(itemId)
    return itemLink or safeToString(itemId)
end

local function decodeReason(reason)
    return CONSTANTS.POINT_CHANGE_REASONS.ALL[reason] or ""
end

local function CreateHistoryDisplay(self)
    local columns = {
        {name = "Num",          width = 75, sort = ScrollingTable.SORT_DSC},
        {name = "Time",         width = 150},
        {name = "Type",         width = 50},
        {name = "Description",  width = 550},
        {name = "Author",       width = 100}
    }
    local StandingsGroup = AceGUI:Create("SimpleGroup")
    StandingsGroup:SetLayout("Flow")
    StandingsGroup:SetHeight(500)
    StandingsGroup:SetWidth(950)
    -- Standings
    self.st = ScrollingTable:CreateST(columns, 25, 15, nil, StandingsGroup.frame, false)
    self.st:EnableSelection(true)
    self.st.frame:SetPoint("TOPLEFT", StandingsGroup.frame, "TOPLEFT", 0, -60)
    self.st.frame:SetBackdropColor(0.1, 0.1, 0.1, 1)

    local OnClickHandler = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
        local rightButton = (button == "RightButton")
        local status
        local selected = self.st:GetSelection()
        if selected ~= realrow then
            status = self.st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, rightButton and "LeftButton" or button, ...)
        end
        if rightButton then
            UTILS.LibDD:CloseDropDownMenus()
            UTILS.LibDD:ToggleDropDownMenu(1, nil, RightClickMenu, cellFrame, -20, 0)
        end
        return status
    end

    self.st:RegisterEvents({
        OnClick = OnClickHandler
    })

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
    return safeItemIdToLink(itemId), safeToString(base), safeToString(max)
end

local function decodeBossKillBonus(encounterId, value)
    local encounter = "Unknown"
    value = tonumber(value) or 0
    if value == 0 then
        return encounter, ""
    end
    for _, expack in pairs(CLM.EncounterIDs) do
        for _,instance in ipairs(expack) do
            for _,encounterInfo in ipairs(instance.data) do
                if encounterInfo.id == encounterId then
                    return safeToString(encounterInfo.name), safeToString(value)
                end
            end
        end
    end
    return "", safeToString(value)
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
    -- Profile
    ["P0"] = (function(entry)
        return "[Update Profile]: " ..
            ColorCodeText(getGuidFromInteger(entry:GUID()), "6699ff") ..
            " " ..
            ColorCodeText(entry:name(), GetClassColor(NumberToClass(entry:ingameClass())).hex)
    end),
    ["P1"] = (function(entry)
        local guid = getGuidFromInteger(entry:GUID())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return "[Remove Profile]: " ..
            ColorCodeText(profile and profile:Name() or guid,
                          profile and GetClassColor(profile:Class()).hex or "6699ff")
    end),
    ["P2"] = (function(entry)
        local guid = getGuidFromInteger(entry:GUID())
        local mainGuid = getGuidFromInteger(entry:main())
        local profile = ProfileManager:GetProfileByGUID(guid)
        local mainProfile = ProfileManager:GetProfileByGUID(mainGuid)
        if entry:main() ~= 0 then
            return "[Alt-Main Link]: " ..
                ColorCodeText(profile and profile:Name() or guid,
                            profile and GetClassColor(profile:Class()).hex or "6699ff") ..
                " alt of: " ..
                ColorCodeText(mainProfile and mainProfile:Name() or mainGuid,
                            mainProfile and GetClassColor(mainProfile:Class()).hex or "6699ff")
        else
            return "[Alt-Main Link]: Remove linking of " ..
                ColorCodeText(profile and profile:Name() or guid,
                            profile and GetClassColor(profile:Class()).hex or "6699ff")
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
    ["R9"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Roster Update Profiles]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            (entry:remove() and "Remove" or "Add") .. " " .. safeToString(#entry:profiles()) .. " profile(s)"

    end),
    ["RC"] = (function(entry)
        local source = RosterManager:GetRosterNameByUid(entry:sourceRosterUid())
        local target = RosterManager:GetRosterNameByUid(entry:targetRosterUid())
        return "[Roster Copy]: " ..
            "From <" .. ColorCodeText(source or entry:sourceRosterUid(), "ebb434") .. "> " ..
            "to <" .. ColorCodeText(target or entry:targetRosterUid(), "ebb434") .. ">: " ..
            (entry:config() and "[config] " or "") ..
            (entry:defaults() and "[slot defaults] " or "") ..
            (entry:overrides() and "[item values] " or "") ..
            (entry:profiles() and "[profiles] " or "")

    end),
    ["RB"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local encounter, value = decodeBossKillBonus(entry:encounterId(), entry:value())
        return "[Roster Boss Kill Bonus]: " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            encounter .. ": " .. value

    end),
    -- Points
    ["DM"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Point Award]: " ..
            "Awarded " .. safeToString(entry:value()) .. " DKP to " ..
            safeToString(#entry:targets()) .. " players for " ..
            decodeReason(entry:reason()) .. " in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    ["DD"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Point Decay]: " ..
            "Decayed " .. safeToString(entry:value()) .. "% DKP to " ..
            safeToString(#entry:targets()) .. " players in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    ["DO"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Point Award to roster]: " ..
            "Awarded " .. safeToString(entry:value()) .. " DKP to all players for " ..
            decodeReason(entry:reason()) .. " in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    ["DR"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raidUid())

        return "[Point Award to raid]: " ..
            "Awarded " .. safeToString(entry:value()) .. " DKP for " ..
            decodeReason(entry:reason()) .." to all players in raid " ..
            (raid and ("(" .. ColorCodeText(raid:Name(), "d99212") .. ")") or "")
    end),
    ["DT"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Point Decay for roster]: " ..
            "Decayed " .. safeToString(entry:value()) .. "% DKP to all players " ..
            (entry:ignoreNegatives() and "excluding negatives " or "") .. "in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    ["DS"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Point Set]: " ..
            "Set " .. safeToString(entry:value()) .. " DKP to " ..
            safeToString(#entry:targets()) .. " players for " ..
            decodeReason(entry:reason()) .. " in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    -- Loot
    ["IA"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local guid = getGuidFromInteger(entry:profile())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return "[Item Award]: " ..
            safeItemIdToLink(entry:item()) .. " to " ..
            (profile and profile:Name() or guid) .. " for " ..
            safeToString(entry:value()) .. " in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    ["II"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raidUid())
        local guid = getGuidFromInteger(entry:profile())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return "[Item Award in Raid]: " ..
            safeItemIdToLink(entry:item()) .. " to " ..
            (profile and profile:Name() or guid) .. " for " ..
            safeToString(entry:value()) .. " in " ..
            "<" .. ColorCodeText(raid and raid:Name() or entry:raidUid(), "ebb434") .. ">"
    end),
    -- Raid
    ["AC"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return "[Raid Create]: Create raid " ..
            ColorCodeText(entry:name(), "d99212") ..
            " " .. safeToString(entry:uuid()) ..
            " in " ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">"
    end),
    ["AS"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raid())
        return "[Raid Start]: Started raid " ..
            ColorCodeText(raid and raid:Name() or entry:raid(), "d99212")
    end),
    ["AU"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raid())
        return "[Raid Update]: Updated raid " ..
            ColorCodeText(raid and raid:Name() or entry:raid(), "d99212") .. " " ..
            safeToString(#entry:joiners()) .. " players joined, " ..
            safeToString(#entry:leavers()) .. " players left "
    end),
    ["AE"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raid())
        return "[Raid Finish]: Finished raid " ..
            ColorCodeText(raid and raid:Name() or entry:raid(), "d99212")
    end),
    ["IGN"] = (function(entry)
        return "[IGNORE]: Ignoring entry  "
    end),
}

local function describeEntry(entry)
    local fn = describeFunctions[entry:class()] or describeFunctions["-"]
    return fn(entry)
end

local function getEntryInfo(entry)
    -- Common info
    local time = date("%d/%m/%Y %H:%M:%S", entry:time())
    local type = entry:class()
    local profile = ProfileManager:GetProfileByGUID(getGuidFromInteger(entry:creator()))
    local author = profile and profile:Name() or ""
    local description = describeEntry(entry)
    return time, type, description, author
end

local ignoreCache = {}

local function buildEntryRow(entry, id)
    local row = {cols = {}}
    local time, type, description, author = getEntryInfo(entry)
    row.cols[1] = {value = tonumber(id)}
    row.cols[2] = {value = time}
    row.cols[3] = {value = type}
    row.cols[4] = {value = description}
    row.cols[5] = {value = author}
    -- Hidden
    row.cols[6] = {value = entry}
    return row
end

local function ST_GetEntry(row)
    return row.cols[6].value
end

local function GenerateOfficerOptions(self)
    return {
        toggle_sandbox = {
            name = (function() return CLM.CORE:IsSandbox() and "Disable Sandbox" or "Enable Sandbox" end),
            type = "execute",
            func = (function(i)
                if CLM.CORE:IsSandbox() then
                    CLM.CORE:DisableSandbox()
                else
                    CLM.CORE:EnableSandbox()
                end
            end),
            order = 1,
            disabled = true
        },
        apply_changes = {
            name = "Apply changes",
            type = "execute",
            func = (function(i) end),
            order = 2,
            disabled = (function() return not CLM.CORE:IsSandbox() end)
        },
        discard_changes = {
            name = "Discard changes",
            type = "execute",
            func = (function(i) end),
            order = 3,
            disabled = (function() return not CLM.CORE:IsSandbox() end)
        }
    }
end

local function CreateManagementOptions(self, container)
    local ManagementOptions = AceGUI:Create("SimpleGroup")
    ManagementOptions:SetLayout("Flow")
    ManagementOptions:SetWidth(950)
    self.ManagementOptions = ManagementOptions

    local options = {
        type = "group",
        args = {}
    }

    if ACL:IsTrusted() then
        mergeDictsInline(options.args, GenerateOfficerOptions(self))
    end
    LIBS.registry:RegisterOptionsTable(REGISTRY, options)
    LIBS.gui:Open(REGISTRY, ManagementOptions)
    return ManagementOptions
end

local AuditGUI = {}
function AuditGUI:Initialize()
    LOG:Trace("AuditGUI:Initialize()")
    self:Create()
    self:RegisterSlash()
    RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            -- {
            --     title = "Timetravel",
            --     func = (function()
            --     end),
            --     trustedOnly = true,
            --     color = "00cc00"
            -- },
            {
                title = "Remove selected",
                func = (function()
                    local row = self.st:GetRow(self.st:GetSelection())
                    if row then
                        LedgerManager:Remove(ST_GetEntry(row), true)
                    end
                end),
                trustedOnly = true,
                color = "cc0000"
            }
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self._initialized = true
        self:Refresh(true)
    end)
end

function AuditGUI:Create()
    LOG:Trace("AuditGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Frame")
    f:SetTitle("Ledger Entries Audit")
    f:SetStatusText("")
    f:SetLayout("flow")
    f:SetUserData("table", { columns = {0, 0}, alignV =  "top" })
    f:EnableResize(false)
    f:SetWidth(1000)
    f:SetHeight(550)
    self.top = f

    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Ledger_Entries_Audit_GUI")

    f:AddChild(CreateManagementOptions(self))
    f:AddChild(CreateHistoryDisplay(self))

    -- Hide by default
    f:Hide()
end

function AuditGUI:Refresh(visible)
    LOG:Trace("AuditGUI:Refresh()")
    if not self._initialized then return end
    if visible and not self.top:IsVisible() then return end
    local data = {}
    for i,entry in ipairs(MODULES.Database:Ledger()) do
        table.insert(data, buildEntryRow(entry, i))
        local ignCacheId = ignoreCache[entry:uuid()]
        if entry:class() == "IGN" then
            ignoreCache[entry.ref] = i
        end
        if ignCacheId then
            local description = data[ignCacheId].cols[4].value
            description = description .. ColorCodeText(safeToString(i), "44ff44")
            data[ignCacheId].cols[4].value  = description
        end
    end

    self.st:SetData(data)

    LIBS.gui:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
end


function AuditGUI:Toggle()
    LOG:Trace("AuditGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Refresh()
        self.top:Show()
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