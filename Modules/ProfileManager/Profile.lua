local _, CLM = ...

local UTILS =  CLM.UTILS

local Profile = {}

function Profile:New(storage, params)
    local o = UTILS.NewStorageQualifiedObject(storage, self)

    o.persistent.name  = tostring(params.name)
    o.persistent.class = params.class or ""
    o.persistent.spec  = params.spec  or ""
    o.persistent.main  = params.main  or ""

    o.volatile = {}

    return o
end

function Profile:Restore(storage)
    local profile = UTILS.NewStorageQualifiedObject(storage, self)
    profile.volatile = {}
    return profile
end

function Profile:Name()
    return self.persistent.name
end

function Profile:Class()
    return self.persistent.class
end

function Profile:Spec()
    return self.persistent.spec
end

function Profile:Main()
    return self.persistent.main
end

function Profile:SetMain(main)
    self.persistent.main = main
end

function Profile:ClearMain()
    self.persistent.main = ""
end

function Profile:SetGUID(GUID)
    self.volatile.GUID = GUID
end

function Profile:GUID()
    return self.volatile.GUID
end

CLM.MODELS.Profile = Profile