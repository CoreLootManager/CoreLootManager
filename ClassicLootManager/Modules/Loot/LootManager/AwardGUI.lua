-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local REGISTRY = "clm_reg_awardgui_opt"

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")
local BASE_WIDTH  = 375 + (isElvUI and 15 or 0)

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('award', {
        location = {nil, nil, "CENTER", 0, 0 }
    })
end

local function StoreLocation(self)
    self.db.location = { self.top:GetPoint() }
    self.db.location[2] = nil
end

local function RestoreLocation(self)
    if self.db.location then
        self.top:ClearAllPoints()
        self.top:SetPoint(self.db.location[3], self.db.location[4], self.db.location[5])
    end
end

local options = {
    type = 'group',
    args = {}
}

local override = false
local function UpdateOptions(self)
    local icon = "Interface\\Icons\\INV_Misc_QuestionMark"
    self.itemId = 0
    if self.itemLink then
        self.itemId, _, _, _, icon = GetItemInfoInstant(self.itemLink)
    end

    if CLM.MODULES.RaidManager:IsInRaid() and not override then
        local roster = CLM.MODULES.RaidManager:GetRaid():Roster()
        if roster then
            self.rosterId = roster:UID()
        end
    end

    local profileNameMap = {}
    local profileList = {}
    local rosterList = {}
    for name, roster in pairs(CLM.MODULES.RosterManager:GetRosters()) do
        rosterList[roster:UID()] = name
        if roster:UID() == self.rosterId then
            self.roster = roster
            local profiles = roster:Profiles()
            for _, GUID in ipairs(profiles) do
                local profile = CLM.MODULES.ProfileManager:GetProfileByGUID(GUID)
                if profile then
                    profileNameMap[profile:Name()] = profile:Name()
                    profileList[#profileList + 1] = profile:Name()
                end
            end
            table.sort(profileList)
        end
    end

    local itemLink = "item:" .. tostring(self.itemId)
    options.args = {
        icon = {
            name = "",
            type = "execute",
            image = icon,
            func = (function() end),
            width = 0.50,
            order = 1,
            tooltipHyperlink = itemLink,
        },
        item = {
            name = CLM.L["Item"],
            type = "input",
            get = (function(i)
                return self.itemLink or ""
            end),
            set = (function(i,v)
                if v and GetItemInfoInstant(v) then
                    self.itemLink = v
                else
                    self.itemLink = nil
                end
                self:Refresh()
            end),
            width = 1.4,
            order = 2,
            tooltipHyperlink = itemLink,
        },
        roster = {
            name = CLM.L["Roster"],
            type = "select",
            set = function(i, v)
                self.rosterId = v
                override = true
                self:Refresh()
            end,
            get = function(i) return self.rosterId end,
            -- style = "radio",
            values = rosterList,
            order = 3,
        },
        profile = {
            name = CLM.L["Player"],
            type = "select",
            set = function(i, v) self.awardPlayer = v end,
            get = function(i) return self.awardPlayer end,
            values = profileNameMap,
            sorting = profileList,
            order = 4,
        },
        padding = {
            name = "",
            type = "description",
            order = 5,
            width = 0.9
        },
        award_value = {
            name = CLM.L["Award value"],
            type = "input",
            set = (function(i,v) self.awardValue = tonumber(v) or 0 end),
            get = (function(i) return tostring(self.awardValue) end),
            width = 0.55,
            pattern = CONSTANTS.REGEXP_FLOAT,
            order = 17
        },
        award = {
            name = CLM.L["Award"],
            type = "execute",
            func = (function()
                local awardTarget = self.roster
                if CLM.MODULES.RaidManager:IsInRaid() then
                    local raid = CLM.MODULES.RaidManager:GetRaid()
                    local roster = raid:Roster()
                    if self.roster == roster then
                        awardTarget = raid
                    end
                end
                local success, _ = CLM.MODULES.LootManager:AwardItem(awardTarget, self.awardPlayer, self.itemLink, self.itemId, self.awardValue)
                if success then
                    CLM.MODULES.AutoAssign:Handle(self.itemId, self.awardPlayer)
                end
                self.itemLink = nil
                self.itemId = 0
                self.awardValue = 0
                self.awardPlayer = ""
                self:Refresh()
            end),
            confirm = (function()
                return string.format(
                    CLM.L["Are you sure, you want to award %s to %s for %s %s?"],
                    self.itemLink,
                    UTILS.ColorCodeText(self.awardPlayer, "FFD100"),
                    tostring(self.awardValue),
                    (self.roster and self.roster:GetPointType() == CONSTANTS.POINT_TYPE.EPGP) and CLM.L["GP"] or CLM.L["DKP"]
                )
            end),
            width = 0.55,
            order = 18,
            disabled = (function() return (not (self.itemLink or false)) end)
        }
    }
end

local function CreateOptions(self)
    local OptionsGroup = AceGUI:Create("SimpleGroup")
    OptionsGroup:SetLayout("Flow")
    OptionsGroup:SetWidth(BASE_WIDTH)
    self.OptionsGroup = OptionsGroup
    UpdateOptions(self)
    AceConfigRegistry:RegisterOptionsTable(REGISTRY, options)
    AceConfigDialog:Open(REGISTRY, OptionsGroup)

    return OptionsGroup
end

local function Create(self)
    LOG:Trace("AwardGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Award"])
    f:SetStatusText("")
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetWidth(BASE_WIDTH)
    f:SetHeight(205)
    self.top = f

    self.itemId = 0
    self.itemLink = nil
    self.awardValue = 0
    self.awardName = ""

    f:AddChild(CreateOptions(self))
    RestoreLocation(self)
    -- Hide by default
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_Award_GUI")
    f:Hide()
end

local function RegisterSlash(self)
    local slash = {
        award = {
            type = "input",
            name = "Award",
            desc = CLM.L["Show Award window"],
            handler = self,
            set = "Show",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(slash)
end

local function CreateConfig()
    local config = {
        awarding_header = {
            type = "header",
            name = CLM.L["Award"],
            order = 60
        },
        awarding_config_modifier_header = {
            name = CLM.L["Modifier combination"],
            desc = CLM.L["Select modifier combination for awarding."],
            type = "select",
            values = CONSTANTS.MODIFIER_COMBINATIONS_GUI,
            sorting = CONSTANTS.MODIFIER_COMBINATIONS_SORTED,
            set = function(i, v) CLM.GlobalConfigs:SetAwardModifierCombination(v) end,
            get = function(i) return CLM.GlobalConfigs:GetAwardModifierCombination() end,
            order = 61
        },
    }
    CLM.MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, config)
end

local function SetItemLink(self, args)
    local itemId = UTILS.GetItemIdFromLink(args)
    if GetItemInfoInstant(itemId) then
        self.itemLink = args
    end
end

local function HookAwardFilling(self)
    CLM.MODULES.Hooks:RegisterModifiedItemLinkClickHandler(function(modifiers, itemLink)
        if CLM.GlobalConfigs:GetAwardModifierCombination() ~= modifiers then return end
        if not itemLink then return end
        self:Show(_, itemLink)
    end)
end

local AwardGUI = {}
function AwardGUI:Initialize()
    LOG:Trace("AwardGUI:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    InitializeDB(self)
    Create(self)
    CreateConfig(self)
    RegisterSlash(self)
    HookAwardFilling(self)

    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function() StoreLocation(self) end))
    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh()
    end)

    self._initialized = true
end

function AwardGUI:Refresh()
    LOG:Trace("AwardGUI:Refresh()")

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(REGISTRY)
    AceConfigDialog:Open(REGISTRY, self.OptionsGroup) -- Refresh the config gui panel
end

function AwardGUI:Toggle()
    LOG:Trace("AwardGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Show()
    end
end

function AwardGUI:Show(_, args)
    LOG:Trace("AwardGUI:Show()")
    if not self._initialized then return end
    SetItemLink(self, args)
    override = false
    self:Refresh()
    if not self.top:IsVisible() then
        self.top:Show()
    end
end

function AwardGUI:Reset()
    LOG:Trace("AwardGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end


CLM.GUI.Award = AwardGUI