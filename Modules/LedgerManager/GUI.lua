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
local SandboxManager = MODULES.SandboxManager

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
    return value and CLM.L["True"] or CLM.L["False"]
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
        {name = CLM.L["Num"],          width = 75, sort = ScrollingTable.SORT_DSC},
        {name = CLM.L["Time"],         width = 150},
        {name = CLM.L["Type"],         width = 50},
        {name = CLM.L["Description"],  width = 550},
        {name = CLM.L["Author"],       width = 100}
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
        return CLM.L["Auction Type"], CONSTANTS.AUCTION_TYPES_GUI[value] or ""
    end),
    itemValueMode = (function(value)
        return CLM.L["Item Value Mode"], CONSTANTS.ITEM_VALUE_MODES_GUI[value] or ""
    end),
    zeroSumBank = (function(value)
        return CLM.L["Zero-Sum Bank"], boolToString(value)
    end),
    zeroSumBankInflation = (function(value)
        return CLM.L["Zero-Sum Bank Inflation"], safeToString(value)
    end),
    auctionTime = (function(value)
        return CLM.L["Auction Time"], safeToString(value)
    end),
    antiSnipe = (function(value)
        return CLM.L["Anti-snipe"], safeToString(value)
    end),
    allowBelowMinStandings = (function(value)
        return CLM.L["Allow going below minimum points"], boolToString(value)
    end),
    allowNegativeBidders = (function(value)
        return CLM.L["Allow bidding below minimum points"], boolToString(value)
    end),
    bossKillBonus = (function(value)
        return CLM.L["Boss Kill Bonus"], boolToString(value)
    end),
    bossKillBonusValue = (function(value)
        return CLM.L["Default Boss Kill Bonus value"], safeToString(value)
    end),
    onTimeBonus = (function(value)
        return CLM.L["On Time Bonus"], boolToString(value)
    end),
    onTimeBonusValue = (function(value)
        return CLM.L["On Time Bonus value"], safeToString(value)
    end),
    raidCompletionBonus = (function(value)
        return CLM.L["Raid Completion Bonus"], boolToString(value)
    end),
    raidCompletionBonusValue = (function(value)
        return CLM.L["Raid Completion Bonus value"], safeToString(value)
    end),
    intervalBonus = (function(value)
        return CLM.L["Interval Bonus"], boolToString(value)
    end),
    intervalBonusTime = (function(value)
        return CLM.L["Interval Bonus time"], safeToString(value)
    end),
    intervalBonusValue = (function(value)
        return CLM.L["Interval Value"], safeToString(value)
    end),
    hardCap = (function(value)
        return CLM.L["Hard DKP cap"], safeToString(value)
    end),
    weeklyCap = (function(value)
        return CLM.L["Weekly DKP cap"], safeToString(value)
    end),
    weeklyReset = (function(value)
        return CLM.L["Weekly reset"], CONSTANTS.WEEKLY_RESETS_GUI[value] or ""
    end),
    roundDecimals = (function(value)
        return CLM.L["Round to"], safeToString(value)
    end),
    minimalIncrement = (function(value)
        return CLM.L["Min bid increment"], safeToString(value)
    end),
    autoBenchLeavers = (function(value)
        return CLM.L["Auto bench leavers"], safeToString(value)
    end),
    autoAwardIncludeBench = (function(value)
        return CLM.L["Include bench"], safeToString(value)
    end),
    autoAwardOnlineOnly = (function(value)
        return CLM.L["Online only"], safeToString(value)
    end),
    autoAwardSameZoneOnly = (function(value)
        return CLM.L["Same zone only"], safeToString(value)
    end),
    selfBenchSubscribe = (function(value)
        return CLM.L["Allow subscription"], safeToString(value)
    end),
    tax = (function(value)
        return CLM.L["Tax"], safeToString(value)
    end),
}

local function decodeRosterConfig(config, value)
    local fn = configDecodeFunctions[config] or configDecodeFunctions["-"]
    return fn(value)
end

local function decodeSlotValueConfig(entry)
    return CONSTANTS.INVENTORY_TYPES_GUI[entry:slot()] or "", safeToString(CONSTANTS.SLOT_VALUE_TIERS_GUI[entry:tier()]) .. ": " .. safeToString(entry:value())
end

local function decodeItemValueOverride(entry)
    local value = ""
    local values = entry:values()
    for key,_ in pairs(CLM.CONSTANTS.SLOT_VALUE_TIERS) do
        value = value .. safeToString(CONSTANTS.SLOT_VALUE_TIERS_GUI[key]) .. ": " .. safeToString(values[key]or "?")
    end
    return safeItemIdToLink(entry:itemId()), value
end

local function decodeItemValueOverrideSingle(entry)
    return safeItemIdToLink(entry:itemId()), safeToString(CONSTANTS.SLOT_VALUE_TIERS_GUI[entry:tier()]) .. ": " .. safeToString(entry:value())
end

local function decodeBossKillBonus(encounterId, difficultyId, value)
    local encounter = CLM.L["Unknown"]
    value = tonumber(value) or 0
    if value == 0 then
        return encounter, "", ""
    end
    for _, expack in pairs(CLM.EncounterIDs) do
        for _,instance in ipairs(expack) do
            for _,encounterInfo in ipairs(instance.data) do
                if encounterInfo.id == encounterId then
                    return safeToString(encounterInfo.name), safeToString(CLM.DifficultyIDsMap[difficultyId]), safeToString(value)
                end
            end
        end
    end
    return "", safeToString(CLM.DifficultyIDsMap[difficultyId]), safeToString(value)
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
        return CLM.L["[Update Profile]: "] ..
            ColorCodeText(getGuidFromInteger(entry:GUID()), "6699ff") ..
            " " ..
            ColorCodeText(entry:name(), GetClassColor(NumberToClass(entry:ingameClass())).hex)
    end),
    ["P1"] = (function(entry)
        local guid = getGuidFromInteger(entry:GUID())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return CLM.L["[Remove Profile]: "] ..
            ColorCodeText(profile and profile:Name() or guid,
                          profile and GetClassColor(profile:Class()).hex or "6699ff")
    end),
    ["P2"] = (function(entry)
        local guid = getGuidFromInteger(entry:GUID())
        local mainGuid = getGuidFromInteger(entry:main())
        local profile = ProfileManager:GetProfileByGUID(guid)
        local mainProfile = ProfileManager:GetProfileByGUID(mainGuid)
        if entry:main() ~= 0 then
            return CLM.L["[Alt-Main Link]: "] ..
                ColorCodeText(profile and profile:Name() or guid,
                            profile and GetClassColor(profile:Class()).hex or "6699ff") ..
                CLM.L[" alt of: "] ..
                ColorCodeText(mainProfile and mainProfile:Name() or mainGuid,
                            mainProfile and GetClassColor(mainProfile:Class()).hex or "6699ff")
        else
            return CLM.L["[Alt-Main Link]: "] .. CLM.L["Remove linking of "] ..
                ColorCodeText(profile and profile:Name() or guid,
                            profile and GetClassColor(profile:Class()).hex or "6699ff")
        end
    end),
    -- Roster
    ["R0"] = (function(entry)
        return CLM.L["[Create Roster]: "] ..
            entry:rosterUid() ..
            " <" .. ColorCodeText(entry:name(), "ebb434") .. "> "  ..
            (CONSTANTS.POINT_TYPES_GUI[entry:pointType()] or "")
    end),
    ["R1"] = (function(entry)
        return CLM.L["[Delete Roster]: "] ..
            "<" .. ColorCodeText(entry:rosterUid(), "ebb434") ..">"
    end),
    ["R2"] = (function(entry)
        return CLM.L["[Rename Roster]: "] ..
            entry:rosterUid() ..
            " <" .. ColorCodeText(entry:name(), "ebb434") .. ">"
    end),
    ["R3"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[All Roster Configs]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">" .. CLM.L[" Too much data to display"]

    end),
    ["R4"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local config, value = decodeRosterConfig(entry:config(), entry:value())
        return CLM.L["[Roster Config]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            config .. ": " .. value
    end),
    ["R5"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[All Roster Default Slot Values]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. ">" .. CLM.L[" Too much data to display"]

    end),
    ["R6"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local slot, values = decodeSlotValueConfig(entry)
        return CLM.L["[Roster Default Slot Value]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            slot .. ": " .. values
    end),
    ["R7"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local link, values = decodeItemValueOverride(entry)
        return CLM.L["[Roster Item Value Override]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            link .. ": " .. values

    end),
    ["R8"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local link, values = decodeItemValueOverrideSingle(entry)
        return CLM.L["[Roster Item Value Override Single]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            link .. ": " .. values
    end),
    ["R9"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Roster Update Profiles]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            (entry:remove() and CLM.L["Remove"] or CLM.L["Add"]) .. " " .. safeToString(#entry:profiles()) .. CLM.L[" profile(s)"]

    end),
    ["RC"] = (function(entry)
        local source = RosterManager:GetRosterNameByUid(entry:sourceRosterUid())
        local target = RosterManager:GetRosterNameByUid(entry:targetRosterUid())
        return CLM.L["[Roster Copy]: "] ..
            "From <" .. ColorCodeText(source or entry:sourceRosterUid(), "ebb434") .. "> " ..
            "to <" .. ColorCodeText(target or entry:targetRosterUid(), "ebb434") .. ">: " ..
            (entry:config() and CLM.L["[config] "] or "") ..
            (entry:defaults() and CLM.L["[slot defaults] "] or "") ..
            (entry:overrides() and CLM.L["[item values] "] or "") ..
            (entry:profiles() and CLM.L["[profiles] "] or "")

    end),
    ["RB"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local encounter, difficulty, value = decodeBossKillBonus(entry:encounterId(), entry:difficultyId(), entry:value())
        return CLM.L["[Roster Boss Kill Bonus]: "] ..
            "<" .. ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            encounter .. " - ".. difficulty .. ": " .. value

    end),
    -- Points
    ["DM"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Point Award]: "] ..
            string.format(CLM.L["Awarded %s DKP to %s players for %s in <%s>"],
                safeToString(entry:value()), safeToString(#entry:targets()),
                decodeReason(entry:reason()), ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DD"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Point Decay]: "] ..
            string.format(CLM.L["Decayed %s%% DKP to %s players in <%s>"],
                safeToString(entry:value()), safeToString(#entry:targets()),
                ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DO"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Point Award to roster]: "] ..
            string.format(CLM.L["Awarded %s DKP to all players for %s in <%s>"],
                safeToString(entry:value()), decodeReason(entry:reason()),
                ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DR"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raidUid())
        return CLM.L["[Point Award to raid]: "] ..
            string.format(CLM.L["Awarded %s DKP for %s to all players in raid %s"],
                safeToString(entry:value()), decodeReason(entry:reason()),
                (raid and ("(" .. ColorCodeText(raid:Name(), "d99212") .. ")") or "")
            )
    end),
    ["DT"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Point Decay for roster]: "] ..
            string.format(CLM.L["Decayed %s%% DKP to all players %sin <%s>"],
                safeToString(entry:value()), (entry:ignoreNegatives() and CLM.L["excluding negatives "] or ""),
                ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DS"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Point Set]: "] ..
            string.format(CLM.L["Set %s DKP to %s players for %s in <%s>"],
                safeToString(entry:value()), safeToString(#entry:targets()),
                decodeReason(entry:reason()), ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    -- Loot
    ["IA"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        local guid = getGuidFromInteger(entry:profile())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return CLM.L["[Item Award]: "] ..
            string.format(CLM.L["%s to %s for %s in <%s>"],
                safeItemIdToLink(entry:item()), (profile and profile:Name() or guid),
                safeToString(entry:value()), ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["II"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raidUid())
        local guid = getGuidFromInteger(entry:profile())
        local profile = ProfileManager:GetProfileByGUID(guid)
        return CLM.L["[Item Award in Raid]: "] ..
            string.format(CLM.L["%s to %s for %s in <%s>"],
                safeItemIdToLink(entry:item()), (profile and profile:Name() or guid),
                safeToString(entry:value()), ColorCodeText(raid and raid:Name() or entry:raidUid(), "ebb434")
            )
    end),
    -- Raid
    ["AC"] = (function(entry)
        local name = RosterManager:GetRosterNameByUid(entry:rosterUid())
        return CLM.L["[Raid Create]: "] ..
            string.format(
                CLM.L["Create raid %s %s in <%s>"],
                ColorCodeText(entry:name(), "d99212"), safeToString(entry:uuid()),
                ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["AS"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raid())
        return CLM.L["[Raid Start]: "] ..
            string.format(CLM.L["Started raid %s"],
                ColorCodeText(safeToString(raid and raid:Name() or entry:raid()), "d99212")
            )
    end),
    ["AU"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raid())
        return CLM.L["[Raid Update]: "] ..
            string.format(CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"],
                ColorCodeText(raid and raid:Name() or entry:raid(), "d99212"),
                safeToString(#entry:joiners()), safeToString(#entry:leavers()),
                safeToString(#entry:standby()), safeToString(#entry:removed())
            )
    end),
    ["AE"] = (function(entry)
        local raid = RaidManager:GetRaidByUid(entry:raid())
        return CLM.L["[Raid Finish]: "] ..
            string.format(CLM.L["Finished raid %s"],
                ColorCodeText(raid and raid:Name() or entry:raid(), "d99212")
            )
        end),
    ["IGN"] = (function(entry)
        return CLM.L["[IGNORE]: Ignoring entry"]
    end),
}

local function describeEntry(entry)
    local fn = describeFunctions[entry:class()] or describeFunctions["-"]
    return fn(entry)
end

local function getEntryInfo(entry)
    -- Common info
    local time = date(CLM.L["%d/%m/%Y %H:%M:%S"], entry:time())
    local type = entry:class()
    local guid = getGuidFromInteger(entry:creator())
    local profile = ProfileManager:GetProfileByGUID(guid)
    local author = profile and profile:Name() or guid
    local description = describeEntry(entry)
    return time, type, description, author
end

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
            name = CLM.L["Enter sandbox"],
            desc = CLM.L["In sandbox mode all communication is disabled and changes are local until applied. Click Apply changes to store changes and exit sandbox mode. Click Discard to undo changes and exit sandbox mode. /reload will discard changes. Entering sandbox mode will cancel time travel."],
            type = "execute",
            func = (function(i) SandboxManager:EnterSandbox() end),
            order = 1,
            disabled = (function() return SandboxManager:IsSandbox() end)
        },
        apply_changes = {
            name = CLM.L["Apply changes"],
            desc = CLM.L["Applies all changes and exits sandbox mode"],
            type = "execute",
            func = (function(i) SandboxManager:ApplyChanges() end),
            order = 2,
            disabled = (function() return not SandboxManager:IsSandbox() end)
        },
        discard_changes = {
            name = CLM.L["Discard changes"],
            desc = CLM.L["Discards all changes and exits sandbox mode"],
            type = "execute",
            func = (function() SandboxManager:DiscardChanges() end),
            order = 3,
            disabled = (function() return not SandboxManager:IsSandbox() end)
        },
        sandbox_info = {
            name = (function() return ColorCodeText(SandboxManager:IsSandbox() and CLM.L[" Sandbox"] or "", "FFFFFF") end),
            fontSize = "large",
            width = 0.5,
            order = 4,
            type = "description"
        },
        timetravel_info = {
            name = (function()
                local info = ""
                if self.timeTravelInProgress then
                    info = ColorCodeText(CLM.L["Loading..."], "eeee00")
                elseif LedgerManager:IsTimeTraveling() then
                    info = ColorCodeText(CLM.L["Time Travel"], "eeee00")
                end
                return info
            end),
            fontSize = "large",
            width = 0.75,
            order = 5,
            type = "description"
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
    RightClickMenu = CLM.UTILS.GenerateDropDownMenu({
        {
            title = CLM.L["Timetravel"],
            func = (function()
                local row = self.st:GetRow(self.st:GetSelection())
                if row then
                    self.timeTravelInProgress = true
                    LedgerManager:TimeTravel(ST_GetEntry(row):time())
                    LIBS.gui:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
                end
            end),
            trustedOnly = true,
            color = "eeee00"
        },
        {
            title = CLM.L["End Timetravel"],
            func = (function()
                if LedgerManager:IsTimeTraveling() then
                    self.timeTravelInProgress = true
                    LedgerManager:EndTimeTravel()
                    LIBS.gui:Open(REGISTRY, self.ManagementOptions) -- Refresh the config gui panel
                end
            end),
            trustedOnly = true,
            color = "eeee00"
        },
        {
            title = CLM.L["Remove selected"],
            func = (function()
                local row = self.st:GetRow(self.st:GetSelection())
                if row then
                    LedgerManager:Remove(ST_GetEntry(row), true)
                end
            end),
            trustedOnly = true,
            color = "cc0000"
        },
    },
    CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
    CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )
    LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self._initialized = true
        self.timeTravelInProgress = false
        self:Refresh(true)
    end)

end

function AuditGUI:Create()
    LOG:Trace("AuditGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Ledger Entries Audit"])
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
    local ignoreCache = {}
    local fillIGNData = (function(i, entry)
        local ignCacheId = ignoreCache[entry:uuid()]
        if entry:class() == "IGN" then
            ignoreCache[entry.ref] = i
        end
        if ignCacheId then
            local description = data[ignCacheId].cols[4].value
            description = description .. ColorCodeText(safeToString(i), "44ff44")
            data[ignCacheId].cols[4].value  = description
        end
    end)

    if LedgerManager:IsTimeTraveling() then
        local timeTravelTarget = LedgerManager:GetTimeTravelTarget()
        for i,entry in ipairs(MODULES.LedgerManager:GetData()) do
            if entry:time() > timeTravelTarget then
                break
            end
            table.insert(data, buildEntryRow(entry, i))
            fillIGNData(i, entry)
        end
    else
        for i,entry in ipairs(MODULES.LedgerManager:GetData()) do
            table.insert(data, buildEntryRow(entry, i))
            fillIGNData(i, entry)
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
            desc = CLM.L["Toggle all ledger events audit window"],
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

function AuditGUI:Reset()
    LOG:Trace("AuditGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.Audit = AuditGUI