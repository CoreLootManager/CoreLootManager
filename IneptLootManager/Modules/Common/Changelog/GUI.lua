-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
local CONSTANTS = ILM.CONSTANTS
local UTILS     = ILM.UTILS
-- ------------------------------- --

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local windowName = ILM.L["Inept Loot Manager"] .. " " .. ILM.L["Changelog"]

local function InitializeDB(self)
    self.db = ILM.MODULES.Database:GUI('changelog', {
        location = {nil, nil, "CENTER", 0, 0 },
        lastVersion = {
            major = 0,
            minor = 0,
            patch = 0
        },
        do_not_show = false,
        never_show = false
    })
end

local function CreateConfigs(self)
    local options = {
        changelog_header = {
            type = "header",
            name = windowName,
            order = 85
        },
        changelog_never_show = {
            name = ILM.L["Never show changelog"],
            desc = ILM.L["Disables display of the changelog for any new version."],
            type = "toggle",
            set = function(i, v) self.db.never_show = v and true or false end,
            get = function(i) return self.db.never_show end,
            width = "double",
            order = 86
        },
        changelog_toggle = {
            name = ILM.L["Toggle changelog"],
            desc = ILM.L["Toggle changelog window display"],
            type = "execute",
            handler = self,
            func = "Toggle",
            order = 87
          }
    }
    ILM.MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

local ChangelogGUI = {}
function ChangelogGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    InitializeDB(self)
    self:Create()
    CreateConfigs(self)
    self:RegisterSlash()
    self._initialized = true
    self.top:SetWidth(1200)
    self.top:SetHeight(700)
end

local function Create(self)
    local parent = AceGUI:Create("Window")
    parent:SetLayout("Flow")
    parent:SetWidth(780)

    local options = {
        type = "group",
        args = {}
    }
    options.args.do_not_show = {
        name = ILM.L["Do not show again"],
        desc = ILM.L["Suppresses changelog display until new version is released"],
        type = "toggle",
        set = function(i, v) self.db.do_not_show = v and true or false end,
        get = function(i) return self.db.do_not_show end,
        order = 1
    }
    local counter = options.args.do_not_show.order + 1

    for _,versionData in ipairs(ILM.ChangelogData) do
        local args = {}
        for _, group in ipairs(versionData.data) do
            local name = group.name or ""
            args[name..counter..versionData.version.."bar"] = {
                name = UTILS.capitalize(name),
                type = "header",
                order = counter
            }
            counter = counter + 1
            for i, data in pairs(group.data) do
                args[name..i..versionData.version.."header"] = {
                    name = UTILS.ColorCodeText(data.header,"6699ff"),
                    type = "description",
                    fontSize = "large",
                    order = counter
                }
                counter = counter + 1
                args[name..i..versionData.version.."body"] = {
                    name = data.body or "",
                    type = "description",
                    fontSize = "medium",
                    order = counter
                }
                counter = counter + 1
            end
        end
        options.args["version"..counter..versionData.version.."header"] = {
            name = versionData.version,
            type = "group",
            order = counter,
            args = args
        }
        counter = counter + 1
    end

    AceConfigRegistry:RegisterOptionsTable(windowName, options)
    AceConfigDialog:Open(windowName, parent)

    return parent
end

function ChangelogGUI:Create()
    LOG:Trace("ChangelogGUI:Create()")
    local f = Create(self)
    self.top = f

    -- Display based on config
    local version = ILM.MODULES.Version:Get()
    local sameVersion = (self.db.lastVersion.major == version.major) and (self.db.lastVersion.minor == version.minor) and (self.db.lastVersion.patch == version.patch)
    if self.db.never_show or (sameVersion and self.db.do_not_show) then
        f:Hide()
    end
    self.db.lastVersion = version
end

function ChangelogGUI:Toggle()
    LOG:Trace("ChangelogGUI:Toggle()")
    if not self._initialized then return end
    if self.top:IsVisible() then
        self.top:Hide()
    else
        self.top:Show()
    end
end

function ChangelogGUI:RegisterSlash()
    local options = {
        changelog = {
            type = "execute",
            name = "Changelog",
            desc = ILM.L["Toggle changelog window display"],
            handler = self,
            func = "Toggle",
        }
    }
    ILM.MODULES.ConfigManager:RegisterSlash(options)
end

function ChangelogGUI:Reset()
    LOG:Trace("ChangelogGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

ILM.GUI.Changelog = ChangelogGUI