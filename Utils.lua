local _, CLM = ...

local LOG = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS

local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")
UTILS.LibDD = LibDD
local DumpTable = LibStub("EventSourcing/Util").DumpTable
local assertType = LibStub("EventSourcing/Util").assertType

local pairs, ipairs = pairs, ipairs
local ssub, supper, slower, sformat, sfind = string.sub, string.upper, string.lower, string.format, string.find
local sgsub = string.gsub
local mfloor = math.floor
local tostring, tonumber = tostring, tonumber
local tinsert = table.insert
local print, type, setmetatable, getmetatable, rawequal = print, type, setmetatable, getmetatable, rawequal
local GetUnitName, UnitGUID, GetTalentTabInfo = GetUnitName, UnitGUID, GetTalentTabInfo
local GetTalentGroupRole, GetActiveTalentGroup = GetTalentGroupRole, GetActiveTalentGroup

local function capitalize(string)
    string = string or ""
    return supper(ssub(string, 1,1)) .. slower(ssub(string, 2))
end

local classOrdered = {
    "Death Knight", "Druid", "Hunter", "Mage", "Priest", "Rogue", "Shaman", "Paladin", "Warlock", "Warrior"
}

local classColors = {
    ["deathknight"]     = { a = 1, r = 0.77, g = 0.12, b = 0.23, hex = "C41E3A" },
    ["druid"]           = { a = 1, r = 1,    g = 0.49, b = 0.04, hex = "FF7D0A" },
    ["hunter"]          = { a = 1, r = 0.67, g = 0.83, b = 0.45, hex = "ABD473" },
    ["mage"]            = { a = 1, r = 0.25, g = 0.78, b = 0.92, hex = "40C7EB" },
    ["priest"]          = { a = 1, r = 1,    g = 1,    b = 1,    hex = "FFFFFF" },
    ["rogue"]           = { a = 1, r = 1,    g = 0.96, b = 0.41, hex = "FFF569" },
    ["shaman"]          = { a = 1, r = 0.01, g = 0.44, b = 0.87, hex = "0270DD" },
    ["paladin"]         = { a = 1, r = 0.96, g = 0.55, b = 0.73, hex = "F58CBA" },
    ["warlock"]         = { a = 1, r = 0.53, g = 0.53, b = 0.93, hex = "8787ED" },
    ["warrior"]         = { a = 1, r = 0.78, g = 0.61, b = 0.43, hex = "C79C6E" },
    ["death knight"]    = { a = 1, r = 0.77, g = 0.12, b = 0.23, hex = "C41E3A" }
}

function UTILS.GetClassColor(className)
    local color = classColors[slower(className)]
    return (color or { r = 0.627, g = 0.627, b = 0.627, hex = "A0A0A0" })
end
local GetClassColor = UTILS.GetClassColor

function UTILS.ColorCodeText(text, color)
    return sformat("|cff%s%s|r", color, text);
end
local ColorCodeText = UTILS.ColorCodeText

function UTILS.ColorCodeClass(className)
    return ColorCodeText(CLM.L[className], GetClassColor(className).hex);
end

local colorCodedClassList = {}
do
    for _,class in pairs(classOrdered) do
        tinsert(colorCodedClassList, UTILS.ColorCodeClass(class))
    end
end
function UTILS.GetColorCodedClassList()
    return colorCodedClassList
end

function UTILS.GetClassList()
    return classOrdered
end

function UTILS.ColorCodeByPercentage(percentage)
    percentage = tonumber(percentage) or 0
    if percentage < 0 then percentage = 0 end
    if percentage > 100 then percentage = 100 end

    local red, green, blue = 255, 255, 0
    if percentage < 50 then
        green = UTILS.round(255*(percentage * 2)/100, 0)
    elseif percentage > 50 then
        red = UTILS.round(255*(100 - percentage)/100, 0)
    end
    return sformat("|cff%s%s|r", sformat("%02x%02x%02x", red, green, blue), percentage)
end

function UTILS.RemoveColorCode(s)
    return ssub(s or "", 11, -3)
end

local RemoveColorCode = UTILS.RemoveColorCode

-- formats:
-- s: string  "AARRGGBB"
-- a: string array  = {a = "AA", r = "RR", g = "GG", b = "BB"}
-- i: integer array = {a = AA, r = RR, g = GG, b = BB } from 0 to 255
-- f: float array   = {a = AA, r = RR, g = GG, b = BB } from 0 to 1
function UTILS.GetColorFromLink(itemLink, format)
    local _, _, a, r, g, b = sfind(itemLink, "|c(%x%x)(%x%x)(%x%x)(%x%x)|.*")
    local color = {
        a = a or "",
        r = r or "",
        g = g or "",
        b = b or ""
    }
    if format == "s" then
        return sformat("%s%s%s%s", color.a, color.r, color.g, color.b)
    else
        if format ~= "s" then
            for k,v in pairs(color) do
                color[k] = tonumber("0x" .. v) or 0
            end
            if format == "f" then
                for k,v in pairs(color) do
                    color[k] = v / 255
                end
            end
        end

        return color
    end
end

function UTILS.GetItemIdFromLink(itemLink)
    -- local _, _, Color, Ltype, Id, Enchant, Gem1, Gem2, Gem3, Gem4, Suffix, Unique, LinkLvl, Name = sfind(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
    itemLink = itemLink or ""
    local _, _, _, _, itemId = sfind(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+).*")
    return tonumber(itemId) or 0
end

function UTILS.UniversalCliMethodExecutor(name, object, cli)
    local values = {strsplit(" ", cli)}
    local method, args, parameters = values[1], {}, ""
    for i=2,#values do
        args[i - 1] = values[i]
        parameters = parameters .. tostring(values[i]) ..  ", "
    end

    if type(object[method]) == "function" then
        LOG:Info("Execute [%s(%s(%s)]", name, method, parameters)
        local result = object[method](object, unpack(args))
        if type(result) == 'table' then
            UTILS.DumpTable(result)
        else
            print(result)
        end

    else
        print("Available methods:")
        for methodName,ref in pairs(object) do
            if type(ref) == "function" then
                print(methodName)
            end
        end
    end
end

local StorageQualifiedObject = {}
function StorageQualifiedObject:New(storage)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    -- Virtual profile that is not stored
    -- It's not a bug. It's a feature.
    if storage == nil then
        LOG:Warning("Virtual storage qualified object. Is this intended?")
        local s = {}
        o.persistent = s
    else
        o.persistent = storage
    end

    o.volatile = {}

    return o
end

function UTILS.NewStorageQualifiedObject(storage, o)
    local sqo = StorageQualifiedObject:New(storage)
    o = o or {}
    setmetatable(sqo, o)
    o.__index = o
    return sqo
end

function UTILS.GenerateItemLink(itemId)
    return sformat("item:%d:0:0:0:0:0:0:0:0:0:0:0:0", itemId)
end

function UTILS.Set(t)
    local s = {}
    for _,v in pairs(t) do s[v] = true end
    return s
end

-- http://lua-users.org/wiki/CopyTable
function UTILS.ShallowCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- http://lua-users.org/wiki/CopyTable
function UTILS.DeepCopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[UTILS.DeepCopy(orig_key, copies)] = UTILS.DeepCopy(orig_value, copies)
            end
            setmetatable(copy, UTILS.DeepCopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function UTILS.RemoveServer(name)
    name, _ = strsplit("-", name or "")
    return name
end

function UTILS.GetUnitName(unit)
    local name = GetUnitName(unit)
    name = name or ""
    return UTILS.RemoveServer(name)
end

function UTILS.typeof(object, objectType)
    if not object or not objectType then
        return false
    end
    if type(object) ~= "table" then
        return false
    end
    local mo = getmetatable(object)
    if not mo then
        return false
    end
    return (mo == objectType)
end
local typeof = UTILS.typeof

function UTILS.empty(object)
    if object == "" or object == nil then
        return true
    end
    return false
end

function UTILS.getIntegerGuid(GUID)
    return tonumber(ssub(GUID, -8), 16)
end
local getIntegerGuid = UTILS.getIntegerGuid

local playerGUID = UnitGUID("player")
local GUIDPrefix = ssub(playerGUID, 1, -9)
function UTILS.getGuidFromInteger(int)
    return GUIDPrefix .. sformat("%08X", tonumber(int) or 0)
end

local playerName = UTILS.GetUnitName("player")
function UTILS.whoami()
    return playerName
end

function UTILS.whoamiGUID()
    return playerGUID
end

function UTILS.GetGUIDFromEntry(e)
    if typeof(e, CLM.MODELS.Profile) then
        return getIntegerGuid(e:GUID())
    elseif type(e) == "number" then
        return e
    elseif type(e) == "string" then
        return getIntegerGuid(e)
    else
        return nil
    end
end
local GetGUIDFromEntry = UTILS.GetGUIDFromEntry

function UTILS.CreateGUIDList(playerList)
    local playerGUIDList = {}
    local GUID
    -- We expect list of either: GUID in string/integer form or profile
    -- List is expected always
    for _, p in ipairs(playerList) do
        GUID = GetGUIDFromEntry(p)
        if GUID ~= nil then
            playerGUIDList[#playerGUIDList+1] = GUID
        end
    end
    return playerGUIDList
end

function UTILS.DumpTable(t)
    return DumpTable(t)
end

function UTILS.assertType(arg, name, expectedType, optional)
    return assertType(arg, name, expectedType, optional)
end

function UTILS.inflate(object, data)
    for i, key in ipairs(object:fields(data.v)) do
        object[key] = data[i]
    end
end

function UTILS.deflate(object, version)
    local result = {}
    for _, key in ipairs(object:fields(version)) do
        tinsert(result, object[key])
    end
    result.v = version
    return result
end

function UTILS.keys(object)
    local keyList = {}
    local n = 0

    for k,_ in pairs(object) do
      n = n + 1
      keyList[n] = k
    end
    return keyList
end

function UTILS.method2function(handler, method)
    return (function(...) handler[method](handler, ...) end)
end

function UTILS.mergeLists(t1, t2, t)
    t = t or {}
    local n = 0
    for _,v in ipairs(t1) do n = n+1; t[n] = v end
    for _,v in ipairs(t2) do n = n+1; t[n] = v end
    return t
end

function UTILS.mergeDicts(t1, t2, t)
    t = t or {}
    for k,v in pairs(t1) do t[k] = v end
    for k,v in pairs(t2) do t[k] = v end
    return t
end

function UTILS.mergeDictsInline(t, s)
    for k,v in pairs(s) do t[k] = v end
end

local classToNumber = {
    ["WARRIOR"] = 1,
    ["PALADIN"] = 2,
    ["HUNTER"] = 3,
    ["ROGUE"] = 4,
    ["PRIEST"] = 5,
    ["DEATHKNIGHT"] = 6,
    ["SHAMAN"] = 7,
    ["MAGE"] = 8,
    ["WARLOCK"] = 9,
    ["MONK"] = 10,
    ["DRUID"] = 11,
    ["DEMONHUNTER"] = 12
}
function UTILS.ClassToNumber(class)
    return classToNumber[(class or ""):upper()] or 0
end

local numberToClass = {
    [1]  = "WARRIOR",
    [2]  = "PALADIN",
    [3]  = "HUNTER",
    [4]  = "ROGUE",
    [5]  = "PRIEST",
    [6]  = "DEATHKNIGHT",
    [7]  = "SHAMAN",
    [8]  = "MAGE",
    [9]  = "WARLOCK",
    -- [10] = "MONK",
    [11] = "DRUID",
    -- [12] = "DEMONHUNTER"
}
function UTILS.NumberToClass(number)
    return supper((numberToClass[number] or ""))
end

function UTILS.GetClassReadable(class)
    if class == "DEATHKNIGHT" then return CLM.L["Death Knight"] end
    return capitalize(class or "")
end

function UTILS.capitalize(string)
    return capitalize(string)
end

function UTILS.stringifyList(list)
    if not list then return "" end
    local string = ""
    for _,v in ipairs(list) do
        string = string .. tostring(v) .. ", "
    end
    return string:sub(1, -3)
end

function UTILS.stringifyDict(dict)
    if not dict then return "" end
    local string = ""
    for k,v in pairs(dict) do
        string = string .. tostring(k) .. ": " .. tostring(v) .. ", "
    end
    return string:sub(1, -3)
end

function UTILS.MakeFrameCloseOnEsc(frame, name)
    _G[name] = frame
    tinsert(UISpecialFrames, name)
end

function UTILS.GetCutoffTimestamp()
    -- 25 Aug 2019 00:00:00 small bit before Wow Classic release Time
    return 1566684000
end

function UTILS.buildPlayerListForTooltip(profiles, tooltip, inLine, maxProfiles)
    inLine = inLine or 5
    maxProfiles = maxProfiles or 25
    local profilesInLine = 0
    local line = ""
    local separator = ", "
    local numProfiles = #profiles
    local profilesLeft
    local notIncludedProfiles = 0
    if numProfiles > maxProfiles then
        notIncludedProfiles = numProfiles - maxProfiles
        numProfiles = maxProfiles
    end
    profilesLeft = numProfiles

    while (profilesLeft > 0) do
        local currentProfile = profiles[numProfiles - profilesLeft + 1]
        profilesLeft = profilesLeft - 1
        if profilesLeft == 0 then
            separator = ""
        end
        line = line .. ColorCodeText(currentProfile:Name(), GetClassColor(currentProfile:Class()).hex) .. separator
        profilesInLine = profilesInLine + 1
        if profilesInLine >= inLine or profilesLeft == 0 then
            tooltip:AddLine(line)
            line = ""
            profilesInLine = 0
        end
    end

    if notIncludedProfiles > 0 then
        tooltip:AddLine(notIncludedProfiles .. CLM.L[" more"])
    end
end

local greenYes = ColorCodeText(CLM.L["Yes"], "00cc00")
function UTILS.GreenYes()
    return greenYes
end

local redNo = ColorCodeText(CLM.L["No"], "cc0000")
function UTILS.RedNo()
    return redNo
end

local menuCounter = 0
function UTILS.GenerateDropDownMenu(structure, isAssistant, isManager, frame)
    frame = frame or CreateFrame("Frame", "CLM_Generic_Menu_DropDown" .. tostring(menuCounter), UIParent, "UIDropDownMenuTemplate")
    menuCounter = menuCounter + 1
    local isTrusted = isAssistant or isManager
    LibDD:UIDropDownMenu_Initialize(frame, (function(_, level)
        for _,k in ipairs(structure) do
            local include = not k.trustedOnly
            if k.trustedOnly then
                if k.managerOnly then
                    include = isManager
                else
                    include = isTrusted
                end
            end
            if include then
                local placeholder = LibDD:UIDropDownMenu_CreateInfo()
                placeholder.notCheckable = true
                placeholder.text = k.title
                placeholder.isTitle = k.isTitle and true or false
                if k.func then
                    placeholder.func = k.func
                end
                if k.icon then
                    placeholder.icon = k.icon
                end
                if k.color then
                    placeholder.colorCode = "|cFF" .. k.color
                end
                if k.separator then
                    placeholder.isTitle = true
                    placeholder.disabled = true
                    placeholder.icon = "Interface\\Common\\UI-TooltipDivider-Transparent"
                    placeholder.iconOnly = true
                    placeholder.iconInfo = {
                        tCoordLeft = 0,
                        tCoordRight = 1,
                        tCoordTop = 0,
                        tCoordBottom = 1,
                        tSizeX = 0,
                        tSizeY = 8,
                        tFitDropDownSizeX = true
                    }
                end
                LibDD:UIDropDownMenu_AddButton(placeholder, level)
            end
        end
    end), "MENU")

    return frame
end

function UTILS.WeekNumber(unixtimestamp, offset)
    offset = offset or 0
    local week = 1 + mfloor((unixtimestamp - offset) / 604800)
    if week < 1 then week = 1 end
    return week
end

function UTILS.WeekStart(week, offset)
    return ((week * 604800) + (offset or 0))
end

function UTILS.GetWeekOffsetEU()
    return 543600
end

function UTILS.GetWeekOffsetUS()
    return 486000
end

function UTILS.round(number, decimals)
    local factor = 10 ^ decimals
    return mfloor(number * factor + 0.5) / factor
end

function UTILS.GetMyTalents()
    local one, two, three
    _, _, one   = GetTalentTabInfo(1)
    _, _, two   = GetTalentTabInfo(2)
    _, _, three = GetTalentTabInfo(3)
    return one, two, three
end

function UTILS.GetMyRole()
    return GetTalentGroupRole(GetActiveTalentGroup())
end

function UTILS.IsTooltipTextRed(text)
    if text and text:GetText() then
        local r,g,b = text:GetTextColor()
        return mfloor(r*256) == 255 and mfloor(g*256) == 32 and mfloor(b*256) == 32
    end
    return false
end

function UTILS.Trim(text)
    text = text or ""
    return (sgsub(text, "^[%s,]*(.-)[%s,]*$", "%1"))
end

function UTILS.LibStCompareSortWrapper(modifierFn)
    return (function(s, rowa, rowb, sortbycol)
        -- Get data
        local a1, b1 = s:GetCell(rowa, sortbycol), s:GetCell(rowb, sortbycol)
        local a1_value, b1_value = a1.value, b1.value
        -- Modify Data
        a1.value, b1.value = modifierFn(a1.value, b1.value)
        -- sort
        local result = s:CompareSort(rowa, rowb, sortbycol)
        -- restore
        a1.value, b1.value  = a1_value, b1_value
        -- return
        return result
    end)
end

function UTILS.LibStModifierFn(a1, b1)
    return RemoveColorCode(a1), RemoveColorCode(b1)
end

function UTILS.LibStModifierFnNumber(a1, b1)
    return (tonumber(RemoveColorCode(a1)) or 0), (tonumber(RemoveColorCode(b1)) or 0)
end

-- Convert version string to number for comparision (e.g., "v2.5.4" to "20504")
function UTILS.VersionStringToNumber(s)
    local version = UTILS.ParseVersionString(s)
    return version.major*10000 + version.minor*100 + version.patch
end

function UTILS.LibStModifierFnVersion(a1, b1)
    return UTILS.VersionStringToNumber(a1), UTILS.VersionStringToNumber(b1)
end

function UTILS.LibStClickHandler(st, dropdownMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
    local leftClick = (button == "LeftButton")
    local rightClick = (button == "RightButton")
    local isCtrlKeyDown = IsControlKeyDown()
    local isShiftKeyDown = IsShiftKeyDown()
    local isAdditiveSelect = leftClick and isCtrlKeyDown
    local isContinuousSelect = leftClick and isShiftKeyDown
    local isSingleSelect = leftClick and not isCtrlKeyDown and not isShiftKeyDown

    local isSelected = st.selected:IsSelected(realrow)

    if not isSelected then
        if isAdditiveSelect or rightClick then
            st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, "LeftButton", ...)
        elseif isContinuousSelect then
            local first, last, selected
            for _row, _realrow in ipairs(st.filtered) do
                if not first then
                    if st.selected:IsSelected(_realrow) then first = _row end
                end
                if st.selected:IsSelected(_realrow) then last = _row end
                if _realrow == realrow then selected = _row end
            end

            st:ClearSelection()
            if selected <= first then -- clicked above first
                for _row=selected,last do
                    st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, _row, st.filtered[_row], column, table, "LeftButton", ...)
                end
            elseif selected >= last then -- clicked below last
                for _row=first,selected do
                    st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, _row, st.filtered[_row], column, table, "LeftButton", ...)
                end
            else -- clicked in between
                for _row=first,last do
                    st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, _row, st.filtered[_row], column, table, "LeftButton", ...)
                end
            end
        end
    else
        if isAdditiveSelect then
            st.selected._storage[realrow] = nil
        end
    end
    if isSingleSelect then
        st:ClearSelection()
        st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, "LeftButton", ...)
    end
    if dropdownMenu and rightClick then
        UTILS.LibDD:CloseDropDownMenus()
        UTILS.LibDD:ToggleDropDownMenu(1, nil, dropdownMenu, cellFrame, -20, 0)
    end
end

function UTILS.LibStSingleSelectClickHandler(st, dropdownMenu, rowFrame, cellFrame, data, cols, row, realrow, column, table, button, ...)
    local rightClick = (button == "RightButton")

    st:ClearSelection()
    st.DefaultEvents["OnClick"](rowFrame, cellFrame, data, cols, row, realrow, column, table, "LeftButton", ...)

    if dropdownMenu and rightClick then
        UTILS.LibDD:CloseDropDownMenus()
        UTILS.LibDD:ToggleDropDownMenu(1, nil, dropdownMenu, cellFrame, -20, 0)
    end
end

function UTILS.LibStItemCellUpdate(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
    local itemId = data[realrow].cols[column].value
    local _, _, _, _, icon = GetItemInfoInstant(itemId or 0)
    if icon then
        frame:SetNormalTexture(icon)
        frame:Show()
        frame:SetScript("OnEnter", function()
            GameTooltip:SetOwner(rowFrame, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:" .. tostring(itemId))
            GameTooltip:Show()
        end)
        frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
    else
        frame:Hide()
    end
end

function UTILS.LibStClassCellUpdate(rowFrame, frame, data, cols, row, realrow, column, fShow, table, ...)
    local class = data[realrow].cols[column].value
    if class then
        frame:SetNormalTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES") -- this is the image containing all class icons
        local coords = CLASS_ICON_TCOORDS[class]
        frame:GetNormalTexture():SetTexCoord(unpack(coords))
        frame:Show()
    else
        frame:Hide()
    end
end

function UTILS.getHighlightMethod(highlightColor, multiselect)
    return (function(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, table, ...)
        table.DoCellUpdate(rowFrame, cellFrame, data, cols, row, realrow, column, fShow, table, ...)
        local color
        local selected
        if multiselect then
            selected = table.selected:IsSelected(realrow)
        else
            selected = (table.selected == realrow)
        end
        if selected then
            color = table:GetDefaultHighlight()
        else
            color = highlightColor
        end

        table:SetHighLightColor(rowFrame, color)
    end)
end

function UTILS.OnePassRemove(t, fnKeep)
    local j, n = 1, #t;
    fnKeep = fnKeep or (function(tab, idx)
        return tab[idx] ~= nil
    end)
    for i=1,n do
        if (fnKeep(t, i, j)) then
            -- Move i's kept value to j's position, if it's not already there.
            if (i ~= j) then
                t[j] = t[i];
                t[i] = nil;
            end
            j = j + 1; -- Increment position of where we'll place the next kept value.
        else
            t[i] = nil;
        end
    end

    return t;
end

-- https://stackoverflow.com/a/32660766
function UTILS.TableCompare(o1, o2, check_mt)
    if o1 == o2 then return true end
    local o1Type = type(o1)
    local o2Type = type(o2)
    if o1Type ~= o2Type then return false end
    if o1Type ~= 'table' then return false end

    if check_mt then
        local mt1 = getmetatable(o1)
        if mt1 and mt1.__eq then
            --compare using built in method
            return o1 == o2
        end
    end

    local keySet = {}

    for key1, value1 in pairs(o1) do
        local value2 = o2[key1]
        if value2 == nil or UTILS.TableCompare(value1, value2, check_mt) == false then
            return false
        end
        keySet[key1] = true
    end

    for key2, _ in pairs(o2) do
        if not keySet[key2] then return false end
    end
    return true
end

function UTILS.DictNotEmpty(dict)
    return not rawequal(next(dict), nil)
end

function UTILS.ResizeFrame(frame, up, scale)
    if up then
        scale = scale + 0.1
        if scale > 2 then scale = 2 end
    else
        scale = scale - 0.1
        if scale < 0.5 then scale = 0.5 end
    end
    frame:SetScale(scale)
    return scale
end



CONSTANTS.ITEM_QUALITY = {
    [0] = ColorCodeText(CLM.L["Poor"], "9d9d9d"),
    [1] = ColorCodeText(CLM.L["Common"], "ffffff"),
    [2] = ColorCodeText(CLM.L["Uncommon"], "1eff00"),
    [3] = ColorCodeText(CLM.L["Rare"], "0070dd"),
    [4] = ColorCodeText(CLM.L["Epic"], "a335ee"),
    [5] = ColorCodeText(CLM.L["Legendary"], "ff8000"),
}
CONSTANTS.REGEXP_FLOAT = "^-?%d+%.?%d*$"
CONSTANTS.REGEXP_FLOAT_POSITIVE = "^%d+%.?%d*$"
