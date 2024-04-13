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

local REGISTRY = "clm_reg_altmainlinkinggui_opt"

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")
local BASE_WIDTH  = 375 + (isElvUI and 15 or 0)

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('altmainlinking', {
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

local function UpdateOptions(self)
    local profileNameMap = {}
    local profileList = {}
    for _, profile in pairs(CLM.MODULES.ProfileManager:GetProfiles()) do
        profileNameMap[profile:Name()] = UTILS.ColorCodeText(profile:ShortName(), UTILS.GetClassColor(profile:ClassInternal()).hex)
        profileList[#profileList + 1] = profile:Name()
    end
    table.sort(profileList)

    options.args = {
        alt = {
            name = CLM.L["Alt"],
            type = "select",
            set = function(i, v) self.alt = v end,
            get = function(i) return self.alt end,
            values = profileNameMap,
            sorting = profileList,
            order = 1,
        },
        main = {
            name = CLM.L["Main"],
            type = "select",
            set = function(i, v) self.main = v end,
            get = function(i) return self.main end,
            values = profileNameMap,
            sorting = profileList,
            order = 2,
        },
        link = {
            name = CLM.L["Link Alt to Main"],
            type = "execute",
            func = (function()
                CLM.MODULES.ProfileManager:MarkAsAltByNames(self.alt, self.main)
                self:Refresh()
            end),
            confirm = (function()
                return string.format(
                    CLM.L["Are you sure, you want to link %s as alt of %s?"],
                    UTILS.ColorCodeText(Ambiguate(self.alt, "none"), "FFD100"),
                    UTILS.ColorCodeText(Ambiguate(self.main, "none"), "FFD100")
                )
            end),
            order = 3,
            disabled = (function() return (not self.alt or not self.main) end)
        },
        unlink = {
            name = CLM.L["Unlink Alt"],
            type = "execute",
            func = (function()
                CLM.MODULES.ProfileManager:MarkAsAltByNames(self.alt, "")
                self:Refresh()
            end),
            confirm = (function()
                return string.format(
                    CLM.L["Are you sure, you want to unlink %s from its main?"],
                    UTILS.ColorCodeText(Ambiguate(self.alt, "none"), "FFD100")
                )
            end),
            order = 4,
            disabled = (function() return (not self.alt) end)
        },
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
    LOG:Trace("AltMainLinkingGUI:Create()")
    -- Main Frame
    local f = AceGUI:Create("Window")
    f:SetTitle(CLM.L["Link Alt to Main"])
    f:SetStatusText("")
    f:SetLayout("Flow")
    f:EnableResize(false)
    f:SetWidth(BASE_WIDTH)
    f:SetHeight(125)
    self.top = f

    self.itemId = 0
    self.itemLink = nil
    self.awardValue = 0
    self.awardName = ""

    f:AddChild(CreateOptions(self))
    RestoreLocation(self)
    -- Hide by default
    UTILS.MakeFrameCloseOnEsc(f.frame, "CLM_AltMainLink_GUI")
    f:Hide()
end

local function RegisterSlash(self)
    local slash = {
        link = {
            type = "input",
            name = "Link",
            desc = CLM.L["Link Alt to Main"],
            handler = self,
            set = "Show",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(slash)
end
local AltMainLinkingGUI = {}
function AltMainLinkingGUI:Initialize()
    LOG:Trace("AltMainLinkingGUI:Initialize()")
    if not CLM.MODULES.ACL:IsTrusted() then return end
    InitializeDB(self)
    Create(self)
    RegisterSlash(self)

    CLM.MODULES.EventManager:RegisterWoWEvent({"PLAYER_LOGOUT"}, (function() StoreLocation(self) end))
    CLM.MODULES.LedgerManager:RegisterOnUpdate(function(lag, uncommitted)
        if lag ~= 0 or uncommitted ~= 0 then return end
        self:Refresh()
    end)

    self._initialized = true
end

function AltMainLinkingGUI:Refresh()
    LOG:Trace("AltMainLinkingGUI:Refresh()")

    UpdateOptions(self)
    AceConfigRegistry:NotifyChange(REGISTRY)
    AceConfigDialog:Open(REGISTRY, self.OptionsGroup) -- Refresh the config gui panel
end

function AltMainLinkingGUI:Toggle()
    LOG:Trace("AltMainLinkingGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self:Show()
    end
end

function AltMainLinkingGUI:Show()
    LOG:Trace("AltMainLinkingGUI:Show()")
    if not self._initialized then return end
    self:Refresh()
    if not self.top:IsVisible() then
        self.top:Show()
    end
end

function AltMainLinkingGUI:Reset()
    LOG:Trace("AltMainLinkingGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end


CLM.GUI.AltMainLinking = AltMainLinkingGUI