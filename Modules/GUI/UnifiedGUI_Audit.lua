-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local strsub = strsub

local function ST_GetDescription(row)
    return row.cols[4].value
end

local function ST_GetEntry(row)
    return row.cols[6].value
end

local function ST_GetName(row)
    return row.cols[7].value
end

local function ST_GetExtendedDescription(row)
    return row.cols[8].value
end


local function refreshFn(...)
    CLM.GUI.Unified:Refresh(...)
end

------

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
        return CLM.L["Hard cap"], safeToString(value)
    end),
    weeklyCap = (function(value)
        return CLM.L["Weekly cap"], safeToString(value)
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
    minimumPoints = (function(value)
        return CLM.L["Minimum points (DKP / EP)"], safeToString(value)
    end),
    minGP = (function(value)
        return CLM.L["Minimum GP"], safeToString(value)
    end),
    namedButtons = (function(value)
        return CLM.L["Named Buttons"], safeToString(value)
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

local nameFunctions  = {
    -- Default
    ["-"] = (function(entry)
        return ""
    end),
    -- Profile
    ["P0"] = (function(entry)
        return CLM.L["[Update Profile]: "]
    end),
    ["P1"] = (function(entry)
        return CLM.L["[Remove Profile]: "]
    end),
    ["P2"] = (function(entry)
            return CLM.L["[Alt-Main Link]: "]
    end),
    ["P3"] = (function(entry)
        return CLM.L["[Profile Lock]: "]
    end),
    -- Roster
    ["R0"] = (function(entry)
        return CLM.L["[Create Roster]: "]
    end),
    ["R1"] = (function(entry)
        return CLM.L["[Delete Roster]: "]
    end),
    ["R2"] = (function(entry)
        return CLM.L["[Rename Roster]: "]
    end),
    ["R3"] = (function(entry)
        return CLM.L["[All Roster Configs]: "]
    end),
    ["R4"] = (function(entry)
        return CLM.L["[Roster Config]: "]
    end),
    ["R5"] = (function(entry)
        return CLM.L["[All Roster Default Slot Values]: "]
    end),
    ["R6"] = (function(entry)
        return CLM.L["[Roster Default Slot Value]: "]
    end),
    ["R7"] = (function(entry)
        return CLM.L["[Roster Item Value Override]: "]
    end),
    ["R8"] = (function(entry)
        return CLM.L["[Roster Item Value Override Single]: "]
    end),
    ["R9"] = (function(entry)
        return CLM.L["[Roster Update Profiles]: "]
    end),
    ["RC"] = (function(entry)
        return CLM.L["[Roster Copy]: "]
    end),
    ["RB"] = (function(entry)
        return CLM.L["[Roster Boss Kill Bonus]: "]
    end),
    ["RF"] = (function(entry)
        return CLM.L["[Roster Field Rename]: "]
    end),
    -- Points
    ["DM"] = (function(entry)
        return CLM.L["[Point Award]: "]
    end),
    ["DD"] = (function(entry)
        return CLM.L["[Point Decay]: "]
    end),
    ["DO"] = (function(entry)
        return CLM.L["[Point Award to roster]: "]
    end),
    ["DR"] = (function(entry)
        return CLM.L["[Point Award to raid]: "]
    end),
    ["DT"] = (function(entry)
        return CLM.L["[Point Decay for roster]: "]
    end),
    ["DS"] = (function(entry)
        return CLM.L["[Point Set]: "]
    end),
    -- Loot
    ["IA"] = (function(entry)
        return CLM.L["[Item Award]: "]
    end),
    ["II"] = (function(entry)
        return CLM.L["[Item Award in Raid]: "]
    end),
    -- Raid
    ["AC"] = (function(entry)
        return CLM.L["[Raid Create]: "]
    end),
    ["AS"] = (function(entry)
        return CLM.L["[Raid Start]: "]
    end),
    ["AU"] = (function(entry)
        return CLM.L["[Raid Update]: "]
    end),
    ["AE"] = (function(entry)
        return CLM.L["[Raid Finish]: "]
        end),
    ["IGN"] = (function(entry)
        return CLM.L["[IGNORE]: Ignoring entry"]
    end),
}

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
        return
            UTILS.ColorCodeText(UTILS.getGuidFromInteger(entry:GUID()), "6699ff") ..
            " " ..
            UTILS.ColorCodeText(entry:name(), UTILS.GetClassColor(UTILS.NumberToClass(entry:ingameClass())).hex)
    end),
    ["P1"] = (function(entry)
        local guid = UTILS.getGuidFromInteger(entry:GUID())
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(guid)
        return
            UTILS.ColorCodeText(profile and profile:Name() or guid,
                          profile and UTILS.GetClassColor(profile:Class()).hex or "6699ff")
    end),
    ["P2"] = (function(entry)
        local guid = UTILS.getGuidFromInteger(entry:GUID())
        local mainGuid = UTILS.getGuidFromInteger(entry:main())
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(guid)
        local mainProfile = CLM.MODULES.ProfileManager:GetProfileByGUID(mainGuid)
        if entry:main() ~= 0 then
            return
                UTILS.ColorCodeText(profile and profile:Name() or guid,
                            profile and UTILS.GetClassColor(profile:Class()).hex or "6699ff") ..
                CLM.L[" alt of: "] ..
                UTILS.ColorCodeText(mainProfile and mainProfile:Name() or mainGuid,
                            mainProfile and UTILS.GetClassColor(mainProfile:Class()).hex or "6699ff")
        else
            return
                UTILS.ColorCodeText(profile and profile:Name() or guid,
                            profile and UTILS.GetClassColor(profile:Class()).hex or "6699ff")
        end
    end),
    ["P3"] = (function(entry)
        return safeToString(entry:lock())
    end),
    -- Roster
    ["R0"] = (function(entry)
        return
            entry:rosterUid() ..
            " <" .. UTILS.ColorCodeText(entry:name(), "ebb434") .. "> "  ..
            (CONSTANTS.POINT_TYPES_GUI[entry:pointType()] or "")
    end),
    ["R1"] = (function(entry)
        return
            "<" .. UTILS.ColorCodeText(entry:rosterUid(), "ebb434") ..">"
    end),
    ["R2"] = (function(entry)
        return
            entry:rosterUid() ..
            " <" .. UTILS.ColorCodeText(entry:name(), "ebb434") .. ">"
    end),
    ["R3"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " .. CLM.L["Too much data to display"]

    end),
    ["R4"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        local config, value = decodeRosterConfig(entry:config(), entry:value())
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            config .. ": " .. value
    end),
    ["R5"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " .. CLM.L["Too much data to display"]

    end),
    ["R6"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        local slot, values = decodeSlotValueConfig(entry)
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            slot .. ": " .. values
    end),
    ["R7"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        local link, values = decodeItemValueOverride(entry)
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            link .. ": " .. values

    end),
    ["R8"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        local link, values = decodeItemValueOverrideSingle(entry)
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            link .. ": " .. values
    end),
    ["R9"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            (entry:remove() and CLM.L["Remove"] or CLM.L["Add"]) .. " " .. safeToString(#entry:profiles()) .. CLM.L[" profile(s)"]

    end),
    ["RC"] = (function(entry)
        local source = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:sourceRosterUid())
        local target = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:targetRosterUid())
        return
            "From <" .. UTILS.ColorCodeText(source or entry:sourceRosterUid(), "ebb434") .. "> " ..
            "to <" .. UTILS.ColorCodeText(target or entry:targetRosterUid(), "ebb434") .. ">: " ..
            (entry:config() and CLM.L["[config] "] or "") ..
            (entry:defaults() and CLM.L["[slot defaults] "] or "") ..
            (entry:overrides() and CLM.L["[item values] "] or "") ..
            (entry:profiles() and CLM.L["[profiles] "] or "")

    end),
    ["RB"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        local encounter, difficulty, value = decodeBossKillBonus(entry:encounterId(), entry:difficultyId(), entry:value())
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            encounter .. " - ".. difficulty .. ": " .. value

    end),
    ["RF"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            "<" .. UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434") .. "> " ..
            safeToString(CONSTANTS.SLOT_VALUE_TIERS_GUI[entry:tier()]) .. ": " .. safeToString(entry:name())
    end),
    -- Points
    ["DM"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            string.format(CLM.L["Awarded %s points to %s players for %s in <%s>"],
                safeToString(entry:value()), safeToString(#entry:targets()),
                decodeReason(entry:reason()), UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DD"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            string.format(CLM.L["Decayed %s%% points to %s players in <%s>"],
                safeToString(entry:value()), safeToString(#entry:targets()),
                UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DO"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            string.format(CLM.L["Awarded %s points to all players for %s in <%s>"],
                safeToString(entry:value()), decodeReason(entry:reason()),
                UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DR"] = (function(entry)
        local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raidUid())
        return
            string.format(CLM.L["Awarded %s points for %s to all players in raid %s"],
                safeToString(entry:value()), decodeReason(entry:reason()),
                (raid and ("(" .. UTILS.ColorCodeText(raid:Name(), "d99212") .. ")") or "")
            )
    end),
    ["DT"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            string.format(CLM.L["Decayed %s%% points to all players %s in <%s>"],
                safeToString(entry:value()), (entry:ignoreNegatives() and CLM.L["excluding negatives "] or ""),
                UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["DS"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            string.format(CLM.L["Set %s points to %s players for %s in <%s>"],
                safeToString(entry:value()), safeToString(#entry:targets()),
                decodeReason(entry:reason()), UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    -- Loot
    ["IA"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        local guid = UTILS.getGuidFromInteger(entry:profile())
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(guid)
        return
            string.format(CLM.L["%s to %s for %s in <%s>"],
                safeItemIdToLink(entry:item()), (profile and profile:Name() or guid),
                safeToString(entry:value()), UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["II"] = (function(entry)
        local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raidUid())
        local guid = UTILS.getGuidFromInteger(entry:profile())
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(guid)
        return
            string.format(CLM.L["%s to %s for %s in <%s>"],
                safeItemIdToLink(entry:item()), (profile and profile:Name() or guid),
                safeToString(entry:value()), UTILS.ColorCodeText(raid and raid:Name() or entry:raidUid(), "ebb434")
            )
    end),
    -- Raid
    ["AC"] = (function(entry)
        local name = CLM.MODULES.RosterManager:GetRosterNameByUid(entry:rosterUid())
        return
            string.format(
                CLM.L["Create raid %s %s in <%s>"],
                UTILS.ColorCodeText(entry:name(), "d99212"), safeToString(entry:uuid()),
                UTILS.ColorCodeText(name or entry:rosterUid(), "ebb434")
            )
    end),
    ["AS"] = (function(entry)
        local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raid())
        return
            string.format(CLM.L["Started raid %s"],
                UTILS.ColorCodeText(safeToString(raid and raid:Name() or entry:raid()), "d99212")
            )
    end),
    ["AU"] = (function(entry)
        local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raid())
        return
            string.format(CLM.L["Updated raid <%s> %s joined, %s left, %s benched, %s removed"],
                UTILS.ColorCodeText(raid and raid:Name() or entry:raid(), "d99212"),
                safeToString(#entry:joiners()), safeToString(#entry:leavers()),
                safeToString(#entry:standby()), safeToString(#entry:removed())
            )
    end),
    ["AE"] = (function(entry)
        local raid = CLM.MODULES.RaidManager:GetRaidByUid(entry:raid())
        return
            string.format(CLM.L["Finished raid %s"],
                UTILS.ColorCodeText(raid and raid:Name() or entry:raid(), "d99212")
            )
        end),
    ["IGN"] = (function(entry)
        return CLM.L["[IGNORE]: Ignoring entry"]
    end),
}

local function concatenateNameFromList(list)
    local names = ""
    for _,iGUID in ipairs(list) do
        local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(UTILS.getGuidFromInteger(iGUID))
        if profile then
            names = names .. profile:Name() .. ","
        end
    end
    return names
end

local extendFunctions  = {
    -- Default
    ["-"] = (function(entry)
        return ""
    end),
    -- Profiles
    ["P3"] = (function(entry)
        return concatenateNameFromList(entry:targets())
    end),
    -- Points
    ["DM"] = (function(entry)
        return concatenateNameFromList(entry:targets())
    end),
    ["DD"] = (function(entry)
        return concatenateNameFromList(entry:targets())
    end),
    ["DS"] = (function(entry)
        return concatenateNameFromList(entry:targets())
    end),
    ["AU"] = (function(entry)
        local names = ""
        names = names .. concatenateNameFromList(entry:joiners())
        names = names .. concatenateNameFromList(entry:leavers())
        names = names .. concatenateNameFromList(entry:standby())
        names = names .. concatenateNameFromList(entry:removed())
        return names
    end),
}

local function describeEntry(entry)
    local fn = describeFunctions[entry:class()] or describeFunctions["-"]
    return fn(entry)
end

local function nameEntry(entry)
    local fn = nameFunctions[entry:class()] or nameFunctions["-"]
    return fn(entry)
end

local function extendEntryData(entry)
    local fn = extendFunctions[entry:class()] or extendFunctions["-"]
    return fn(entry)
end

local function getEntryInfo(entry)
    -- Common info
    local name = nameEntry(entry)
    local time = date(CLM.L["%d/%m/%Y %H:%M:%S"], entry:time())
    local type = entry:class()
    local guid = UTILS.getGuidFromInteger(entry:creator())
    local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(guid)
    local author = profile and profile:Name() or guid
    local description = describeEntry(entry)
    local extendedEntryData = extendEntryData(entry)
    return name, time, type, description, extendedEntryData, author
end

local function buildEntryRow(entry, id)
    local name, time, type, description, metadata, author = getEntryInfo(entry)
    local row = {cols = {
        {value = tonumber(id)},
        {value = time},
        {value = type},
        {value = description},
        {value = author},
        -- Hidden
        {value = entry},
        {value = name},
        {value = metadata}
    }}
    return row
end

local UnifiedGUI_Audit = {
    name = "audit",
    filter = CLM.MODELS.Filters:New(
    refreshFn,
    {},
    UTILS.Set({
        "search", "horizontal"
    }),
    nil, 3),
    tooltip = CreateFrame("GameTooltip", "CLMUnifiedGUIAuditDialogTooltip", UIParent, "GameTooltipTemplate"),
}

function UnifiedGUI_Audit:GetSelection()
    LOG:Trace("UnifiedGUI_Audit:GetSelection()")
    local st = CLM.GUI.Unified:GetScrollingTable()

    local _, selection = next(st:GetSelection())
    return st:GetRow(selection)
end

local function GenerateUntrustedOptions(self)
    return self.filter:GetAceOptions()
end

local function horizontalOptionsFeeder()
    local options = {
        type = "group",
        args = { }
    }
    UTILS.mergeDictsInline(options.args, GenerateUntrustedOptions(UnifiedGUI_Audit))
    return options
end

local tableStructure = {
    rows = 22,
    -- columns - structure of the ScrollingTable
    columns = {
        {name = CLM.L["Num"],          width = 40, sort = LibStub("ScrollingTable").SORT_DSC},
        {name = CLM.L["Time"],         width = 140},
        {name = CLM.L["Type"],         width = 30},
        {name = CLM.L["Description"],  width = 330},
        {name = CLM.L["Author"],       width = 80}
    },
    -- Function to filter ScrollingTable
    filter = (function(stobject, row)
        return UnifiedGUI_Audit.filter:Filter("", "", { ST_GetDescription(row), ST_GetName(row), ST_GetExtendedDescription(row) })
    end),
    -- Events to override for ScrollingTable
    events = {
        -- OnEnter handler -> on hover
        OnEnter = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnEnter"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local rowData = table:GetRow(realrow)
            if not rowData or not rowData.cols then return status end
            local tooltip = UnifiedGUI_Audit.tooltip
            if not tooltip then return end
            tooltip:SetOwner(rowFrame, "ANCHOR_RIGHT")
            tooltip:AddLine(ST_GetName(rowData))
            tooltip:AddLine(ST_GetDescription(rowData))
            tooltip:AddLine(strsub(ST_GetExtendedDescription(rowData), 1, 100))
            tooltip:Show()
            return status
        end),
        -- OnLeave handler -> on hover out
        OnLeave = (function (rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            local status = table.DefaultEvents["OnLeave"](rowFrame, cellFrame, data, cols, row, realrow, column, table, ...)
            UnifiedGUI_Audit.tooltip:Hide()
            return status
        end),
        -- OnClick handler -> click
        OnClick = function(rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            UTILS.LibStSingleSelectClickHandler(table, UnifiedGUI_Audit.RightClickMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
            return true
        end
    }
}

local function tableDataFeeder()
    LOG:Trace("UnifiedGUI_Audit tableDataFeeder()")
    local data = {}
    local ignoreCache = {}
    local fillIGNData = (function(i, entry)
        local ignCacheId = ignoreCache[entry:uuid()]
        if entry:class() == "IGN" then
            ignoreCache[entry.ref] = i
        end
        if ignCacheId then
            local description = data[ignCacheId].cols[4].value
            description = description .. UTILS.ColorCodeText(safeToString(i), "44ff44")
            data[ignCacheId].cols[4].value  = description
        end
    end)

    if CLM.MODULES.LedgerManager:IsTimeTraveling() then
        local timeTravelTarget = CLM.MODULES.LedgerManager:GetTimeTravelTarget()
        for i,entry in ipairs(CLM.MODULES.LedgerManager:GetData()) do
            if entry:time() > timeTravelTarget then
                break
            end
            data[#data+1] = buildEntryRow(entry, i)
            fillIGNData(i, entry)
        end
    else
        for i,entry in ipairs(CLM.MODULES.LedgerManager:GetData()) do
            data[#data+1] = buildEntryRow(entry, i)
            fillIGNData(i, entry)
        end
    end
    return data
end

local function initializeHandler()
    LOG:Trace("UnifiedGUI_Audit initializeHandler()")
    UnifiedGUI_Audit.RightClickMenu = CLM.UTILS.GenerateDropDownMenu(
        {
            {
                title = CLM.L["Timetravel"],
                func = (function()
                    local row = UnifiedGUI_Audit:GetSelection()
                    if row then
                        CLM.MODULES.LedgerManager:TimeTravel(ST_GetEntry(row):time())
                    end
                end),
                trustedOnly = true,
                color = "eeee00"
            },
            {
                title = CLM.L["End Timetravel"],
                func = (function()
                    if CLM.MODULES.LedgerManager:IsTimeTraveling() then
                        CLM.MODULES.LedgerManager:EndTimeTravel()
                    end
                end),
                trustedOnly = true,
                color = "eeee00"
            },
            {
                title = CLM.L["Remove selected"],
                func = (function()
                    local row = UnifiedGUI_Audit:GetSelection()
                    if row then
                        CLM.MODULES.LedgerManager:Remove(ST_GetEntry(row), true)
                    end
                end),
                trustedOnly = true,
                color = "cc0000"
            },
        },
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.ASSISTANT),
        CLM.MODULES.ACL:CheckLevel(CONSTANTS.ACL.LEVEL.MANAGER)
    )
end

CLM.GUI.Unified:RegisterTab(
    UnifiedGUI_Audit.name, 5,
    tableStructure,
    tableDataFeeder,
    horizontalOptionsFeeder,
    nil,
    {
        initialize = initializeHandler,
        -- refresh = refreshHandler,
        -- beforeShow = beforeShowHandler,
        -- store = storeHandler,
        -- restore = restoreHandler,
        -- dataReady = dataReadyHandler
    }
)
