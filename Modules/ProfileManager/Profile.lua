local _, CLM = ...

local UTILS =  CLM.UTILS

local Profile = {}

function Profile:New(storage, params)
    local o = UTILS.NewStorageQualifiedObject(storage, self)

    o.persistent.name  = tostring(params.name)
    o.persistent.class = params.class or ""
    o.persistent.spec  = params.spec  or ""
    o.persistent.main  = params.main  or ""

    return o
end

function Profile:Restore(storage)
    return UTILS.NewStorageQualifiedObject(storage, self)
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

CLM.MODELS.Profile = Profile