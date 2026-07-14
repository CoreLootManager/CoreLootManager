-- ------------------------------- --
local  _, CLM = ...
---@cast CLM CLMNamespace
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

---@class Profile
---@field _GUID string
---@field _versionString string
---@field locked boolean
---@field main string
local Profile = {}

---@param entry table?
---@param name string?
---@param class string?
---@param main string?
---@return Profile
function Profile:New(entry, name, class, main)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o._GUID = ""
    o.entry = entry
    o.name  = (name ~= nil) and tostring(name) or ""
    o.class = (class ~= nil) and tostring(class) or ""
    o.main  = (main ~= nil) and tostring(main) or ""
    o.version = {
        major = 0,
        minor = 0,
        patch = 0,
        changeset = ""
    }
    o.alts = {}
    o.locked = false

    o._versionString = CLM.L["Unknown"]

    return o
end

---@return string
function Profile:Name()
    return self.name
end

---@return string
function Profile:ShortName()
    return Ambiguate(self.name or "", "none")
end

---@return string
function Profile:Class()
    return self.class
end

---@return string
function Profile:ClassInternal()
    return UTILS.NumberToClass(self.entry:ingameClass())
end

---@return string
function Profile:Main()
    return self.main
end

---@param main string
function Profile:SetMain(main)
    self.main = main
end

function Profile:ClearMain()
    self.main = ""
end

---@return table
function Profile:Alts()
    return self.alts
end

---@return boolean
function Profile:HasAlts()
    return not rawequal(next(self.alts), nil)
end

---@param GUID string
function Profile:AddAlt(GUID)
    if not self.alts[GUID] then
        self.alts[GUID] = true
    end
end

---@param GUID string
function Profile:RemoveAlt(GUID)
    if self.alts[GUID] then
        self.alts[GUID] = nil
    end
end

---@param GUID string
function Profile:SetGUID(GUID)
    self._GUID = GUID
end

---@return string
function Profile:GUID()
    return self._GUID
end

function Profile:Lock()
    self.locked = true
end

function Profile:Unlock()
    self.locked = false
end

---@return boolean
function Profile:IsLocked()
    return self.locked
end

---@param major number
---@param minor number
---@param patch number
---@param changeset string?
function Profile:SetVersion(major, minor, patch, changeset)
    self.version.major = tonumber(major) or 0
    self.version.minor = tonumber(minor) or 0
    self.version.patch = tonumber(patch) or 0
    changeset = changeset or ""
    self.version.changeset = tostring(changeset)

    if self.version.changeset == "" then
        self._versionString = string.format("v%d.%d.%d", self.version.major, self.version.minor, self.version.patch)
    else
        self._versionString = string.format("v%d.%d.%d-%s", self.version.major, self.version.minor, self.version.patch, self.version.changeset)
    end

end

---@return table
function Profile:Version()
    return self.version
end

---@return string
function Profile:VersionString()
    return self._versionString
end

---@return table
function Profile:Entry()
    return self.entry
end

CONSTANTS.PROFILE_ROLES_GUI = {
    ["TANK"] = CLM.L["Tank"],
    ["HEALER"] = CLM.L["Healer"],
    ["DAMAGER"] = CLM.L["DPS"],
}

CLM.MODELS.Profile = Profile