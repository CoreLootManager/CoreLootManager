local _, CLM = ...

local Profile = {}

function Profile:New(name, class, spec, main)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o._GUID = ""
    o.name  = (name ~= nil) and tostring(name) or ""
    o.class = (class ~= nil) and tostring(class) or ""
    o.spec  = (spec ~= nil) and tostring(spec) or ""
    o.main  = (main ~= nil) and tostring(main) or ""
    o.version = {
        major = 0,
        minor = 0,
        patch = 0,
        changeset = ""
    }
    self._versionString = "Unknown"

    return o
end

function Profile:Name()
    return self.name
end

function Profile:Class()
    return self.class
end

function Profile:Spec()
    return self.spec
end

function Profile:Main()
    return self.main
end

function Profile:SetMain(main)
    self.main = main
end

function Profile:ClearMain()
    self.main = ""
end

function Profile:SetGUID(GUID)
    self._GUID = GUID
end

function Profile:GUID()
    return self._GUID
end

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

CLM.MODELS.Profile = Profile