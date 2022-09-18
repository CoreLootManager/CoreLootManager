-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

-- Libs
local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local function ImportSingle(roster, itemId, values)
    local sanitizedValues = CLM.MODULES.RosterManager:CompareAndSanitizeSlotTierValues(roster:GetItemValues(itemId), values)
    if sanitizedValues then
        CLM.MODULES.LedgerManager:Submit(CLM.MODELS.LEDGER.ROSTER.UpdateOverrides:new(roster:UID(), itemId, sanitizedValues))
        return true
    else
        LOG:Debug("ImportCSV:ImportSingle(): values not sanitized for %s", tostring(itemId))
    end
end

local function Import(self)
    LOG:Trace("ItemValueOverrideImporter:Import()")
    local roster = CLM.MODULES.RosterManager:GetRosterByUid(self.roster)
    if not roster then
        LOG:Warning("No roster selected.")
        return
    end
    local count = 0
    for _, data in ipairs(self.data) do
        if ImportSingle(roster, data.itemId, data.values) then
            count = count + 1
        end
    end
    LOG:Message("Import of %s overrides complete!", tostring(count))
end

local function ParseCSV(csvData)
    LOG:Trace("ItemValueOverrideImporter:ParseCSV()")
    local data = {}

    local lines = {strsplit("\n", string.gsub(csvData, "\r", "\n"))}
    for _,line in ipairs(lines) do
        if line and strlen(line) > 0 then
            local itemId, b, s, m, l, x = strsplit(",",line)
            itemId = tonumber(itemId)
            if GetItemInfoInstant(itemId) then
                data[#data+1] = {
                    itemId = itemId,
                    values = {
                        [CONSTANTS.SLOT_VALUE_TIER.BASE]    = tonumber(b) or 0,
                        [CONSTANTS.SLOT_VALUE_TIER.SMALL]   = tonumber(s) or 0,
                        [CONSTANTS.SLOT_VALUE_TIER.MEDIUM]  = tonumber(m) or 0,
                        [CONSTANTS.SLOT_VALUE_TIER.LARGE]   = tonumber(l) or 0,
                        [CONSTANTS.SLOT_VALUE_TIER.MAX]     = tonumber(x) or 0
                    }
                }
            else
                LOG:Warning("Unknown Item %s", tostring(itemId))
            end
        end
    end
    return data
end

local function UpdateOptions(self)
    local options = {
        type = "group",
        args = {
            import_data = {
                name = CLM.L["Input CSV Item value override data"],
                type = "input",
                multiline = 10,
                set = function(i, v)
                    self.importCSV = v
                    local status, data = pcall(ParseCSV, self.importCSV)
                    if status then
                        self.data = data
                    end
                    self.importExecuted = true
                    self.importedData = 0
                    UpdateOptions(self)
                end,
                get = function(i) return self.importCSV end,
                width = "full",
                order = 1
            },
            roster = {
                name = CLM.L["Roster"],
                type = "select",
                values = CLM.MODULES.RosterManager:GetRostersUidMap(),
                set = function(i, v) self.roster = v end,
                get = function(i) return self.roster end,
                width = 1.0,
                order = 2.5
            },
            execute_import = {
                name = CLM.L["Import"] .. " CSV",
                type = "execute",
                func = (function()
                    self.inProgress = true
                    Import(self)
                    self.inProgress = false
                    self.done = true
                end),
                disabled = (function() return not self.roster or not self.data or (#self.data == 0) or self.inProgress end),
                order = 3,
                width = 1.0
            }
        }
    }

    if self.importExecuted then
        if self.data then
            options.args.success_info = {
                name = "|cff00ee00" .. CLM.L["Success"] .. "|r" .. " (" .. tostring(#self.data) .. ")",
                type = "description",
                fontSize = "large",
                order = 2,
                width = "full"
            }
            local order = 10
            for _,data in ipairs(self.data) do
                local prefix = tostring(data.itemId)
                local _, _, _, _, icon = GetItemInfoInstant(data.itemId)
                local shortItemLink = "item:" .. prefix
                options.args[prefix .. "icon"] = {
                    name = "",
                    image = icon,
                    order = order,
                    width = 0.5,
                    type = "execute",
                    func = (function() end),
                    itemLink = shortItemLink,
                }
                order = order + 1
                for _, tier in ipairs(CONSTANTS.SLOT_VALUE_TIERS_ORDERED) do
                    options.args[prefix .. "tier" .. tostring(tier)] = {
                        type = "input",
                        order = order,
                        width = 0.35,
                        set = (function(i, v) data.values[tier] = tonumber(v) end),
                        get = (function(i) return tostring(data.values[tier]) end),
                        name = (CONSTANTS.SLOT_VALUE_TIERS_GUI[tier] or ""),
                    }
                    order = order + 1
                end
            end
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

    AceConfigRegistry:RegisterOptionsTable(CLM.L["Import"] .. " CSV", options)
    AceConfigDialog:Open(CLM.L["Import"] .. " CSV", self.options)
    self.scroll:DoLayout()
end

local ItemValueOverrideImporter = {}
function ItemValueOverrideImporter:Initialize()
    LOG:Trace("Import:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    self.importCSV = "itemId,base,small,medium,large,max"
    self:Create()
    self:RegisterSlash()

    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then
            if not self.inProgress and not self.done then
                UpdateOptions(self)
            end
        end
    end)

    self._initialized = true
end

function ItemValueOverrideImporter:Create()
    LOG:Trace("ItemValueOverrideImporter:Create()")
    local f = AceGUI:Create("Window")
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetTitle(CLM.L["Import"])
    f:SetWidth(460)
    f:SetHeight(500)

    local s = AceGUI:Create("ScrollFrame")
    s:SetWidth(440)
    s:SetHeight(450)
    local i = AceGUI:Create("SimpleGroup")
    i:SetWidth(400)
    s:AddChild(i)
    f:AddChild(s)
    self.data = {}
    self.top = f
    self.options = i
    self.scroll = s
    UpdateOptions(self)
    f:Hide()
end

function ItemValueOverrideImporter:RegisterSlash()
    LOG:Trace("ItemValueOverrideImporter:RegisterSlash()")
    local options = {
        importcsv = {
            type = "execute",
            name = "Item Values override import",
            desc = CLM.L["Toggle CSV import window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function ItemValueOverrideImporter:Toggle()
    LOG:Trace("ItemValueOverrideImporter:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self.top:Show()
    end
end

CLM.ItemValueOverrideImporter = ItemValueOverrideImporter