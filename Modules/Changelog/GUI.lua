-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local windowName = CLM.L["Classic Loot Manager"] .. " " .. CLM.L["Changelog"]

local function InitializeDB(self)
    self.db = CLM.MODULES.Database:GUI('changelog', {
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
            order = 80
        },
        changelog_never_show = {
            name = CLM.L["Never show changelog"],
            desc = CLM.L["Disables display of the changelog for any new version."],
            type = "toggle",
            set = function(i, v) self.db.never_show = v and true or false end,
            get = function(i) return self.db.never_show end,
            width = "double",
            order = 81
        },
        changelog_toggle = {
            name = CLM.L["Toggle changelog"],
            desc = CLM.L["Toggle changelog window display"],
            type = "execute",
            handler = self,
            func = "Toggle",
            order = 82
          }
    }
    CLM.MODULES.ConfigManager:Register(CONSTANTS.CONFIGS.GROUP.GLOBAL, options)
end

local ChangelogGUI = {}
function ChangelogGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    InitializeDB(self)
    self:Create()
    CreateConfigs(self)
    self:RegisterSlash()
    self._initialized = true
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
        name = CLM.L["Do not show again"],
        desc = CLM.L["Suppresses changelog display until new version is released"],
        type = "toggle",
        set = function(i, v) self.db.do_not_show = v and true or false end,
        get = function(i) return self.db.do_not_show end,
        order = 1
    }
    local counter = options.args.do_not_show.order + 1

    for _,versionData in ipairs(CLM.ChangelogData) do
        local args = {}
        for _, group in ipairs(versionData.data) do
            local name = group.name
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
                    name = data.body,
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
    local version = CLM.CORE:GetVersion()
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
            desc = CLM.L["Toggle changelog window display"],
            handler = self,
            func = "Toggle",
        }
    }
    CLM.MODULES.ConfigManager:RegisterSlash(options)
end

function ChangelogGUI:Reset()
    LOG:Trace("ChangelogGUI:Reset()")
    self.top:ClearAllPoints()
    self.top:SetPoint("CENTER", 0, 0)
end

CLM.GUI.Changelog = ChangelogGUI