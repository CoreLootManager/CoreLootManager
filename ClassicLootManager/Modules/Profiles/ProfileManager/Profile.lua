-- ------------------------------- --
local CLM = select(2, ...) ---@class CLM
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

---@class Profile
---@field entry ProfileUpdate
---@field name string
---@field class canonicalClass
---@field main playerGuid
---@field role playerRole
---@field version VersionTable
---@field alts playerSet
local Profile = {}

---comment
---@param entry ProfileUpdate?
---@param name string
---@param class canonicalClass?
---@param main playerGuid?
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
    o:SetRole()
    o.alts = {}
    o.locked = false

    o._versionString = CLM.L["Unknown"]

    return o
end

function Profile:Name()
    return self.name
end

function Profile:Class()
    return self.class
end

function Profile:ClassInternal()
    return UTILS.NumberToClass(self.entry:ingameClass())
end

---@param role playerRole
function Profile:SetRole(role)
    self.role = role or ""
end

function Profile:Role()
    return self.role
end

function Profile:Main()
    return self.main
end

---@param main playerGuid
function Profile:SetMain(main)
    self.main = main
end

function Profile:ClearMain()
    self.main = "" ---@diagnostic disable-line: assign-type-mismatch
end

---@return playerSet
function Profile:Alts()
    return self.alts
end

function Profile:HasAlts()
    return not rawequal(next(self.alts), nil)
end

---@param GUID playerGuid
function Profile:AddAlt(GUID)
    if not self.alts[GUID] then
        self.alts[GUID] = true
    end
end

---@param GUID playerGuid
function Profile:RemoveAlt(GUID)
    if self.alts[GUID] then
        self.alts[GUID] = nil
    end
end

---@param GUID playerGuid
function Profile:SetGUID(GUID)
    self._GUID = GUID
end

---@return playerGuid
function Profile:GUID()
    return self._GUID
end

function Profile:Lock()
    self.locked = true
end

function Profile:Unlock()
    self.locked = false
end

function Profile:IsLocked()
    return self.locked
end

---@param major integer?
---@param minor integer?
---@param patch integer?
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

function Profile:Version()
    return self.version
end

function Profile:VersionString()
    return self._versionString
end

function Profile:Entry()
    return self.entry
end

CONSTANTS.PROFILE_ROLES_GUI = {
    ["TANK"] = CLM.L["Tank"],
    ["HEALER"] = CLM.L["Healer"],
    ["DAMAGER"] = CLM.L["DPS"],
}

CLM.MODELS.Profile = Profile