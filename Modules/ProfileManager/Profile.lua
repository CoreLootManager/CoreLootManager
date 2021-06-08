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

CLM.MODELS.Profile = Profile