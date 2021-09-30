local  _, CLM = ...


local LOG = CLM.LOG
local MODULES = CLM.MODULES
local UTILS = CLM.UTILS

local capitalize = UTILS.capitalize
local ColorCodeText = UTILS.ColorCodeText

-- Libs
local AceGUI = LibStub("AceGUI-3.0")

local LIBS =  {
    registry = LibStub("AceConfigRegistry-3.0"),
    gui = LibStub("AceConfigDialog-3.0")
}

local function InitializeDB(self)
    local db = MODULES.Database:GUI()
    if not db.changelog then
        db.changelog = {
            lastVersion = {
                major = 0,
                minor = 0,
                patch = 0
            },
            do_not_show = false
    }
    end
    self.db = db.changelog
end

local ChangelogGUI = {}
function ChangelogGUI:Initialize()
    LOG:Trace("AuctionManagerGUI:Initialize()")
    InitializeDB(self)
    self:Create()
    self:RegisterSlash()
    self._initialized = true
end

local function Create(self)
    local parent = AceGUI:Create("Frame")
    parent:SetLayout("Flow")
    parent:SetWidth(780)

    local options = {
        type = "group",
        args = {}
    }
    options.args.clm_header = {
        name = "Classic Loot Manager " .. CLM.CORE:GetVersionString(),
        type = "header",
        order = 1
    }
    options.args.do_not_show = {
        name = "Do not show again",
        desc = "Suppresses changelog display until new version is released",
        type = "toggle",
        set = function(i, v) self.db.do_not_show = v and true or false end,
        get = function(i) return self.db.do_not_show end,
        order = options.args.clm_header.order + 1
    }
    local counter = options.args.do_not_show.order + 1

    for _, group in ipairs(CLM.ChangelogData) do
        local name = group.name
        options.args[name.."header"] = {
            name = capitalize(name),
            type = "header",
            order = counter
        }
        counter = counter + 1
        for i, data in pairs(group.data) do
            options.args[name..i.."header"] = {
                name = ColorCodeText(data.header,"6699ff"),
                type = "description",
                fontSize = "large",
                order = counter
            }
            counter = counter + 1
            options.args[name..i.."body"] = {
                name = data.body,
                type = "description",
                fontSize = "medium",
                order = counter
            }
            counter = counter + 1
        end
    end

    LIBS.registry:RegisterOptionsTable("Changelog", options)
    LIBS.gui:Open("Changelog", parent)

    return parent
end

function ChangelogGUI:Create()
    LOG:Trace("ChangelogGUI:Create()")
    local f = Create(self)
    self.top = f


    -- Display based on config
    local version = CLM.CORE:GetVersion()
    local sameVersion = (self.db.lastVersion.major == version.major) and (self.db.lastVersion.minor == version.minor) and (self.db.lastVersion.patch == version.patch)
    if sameVersion and self.db.do_not_show then
        f:Hide()
    end
    self.db.lastVersion = version
end

function ChangelogGUI:Toggle()
    LOG:Trace("StandingsGUI:Toggle()")
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
            desc = "Toggle changelog window display",
            handler = self,
            func = "Toggle",
        }
    }
    MODULES.ConfigManager:RegisterSlash(options)
end

CLM.GUI.Changelog = ChangelogGUI