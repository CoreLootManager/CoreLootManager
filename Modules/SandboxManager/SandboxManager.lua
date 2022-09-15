local define = LibDependencyInjection.createContext(...)


define.module("SandboxManager", {
    "Log", "Comms", "LedgerManager"
}, function(resolve, LOG, Comms, LedgerManager)
local SandboxManager = {}
function SandboxManager:Initialize()
    LOG:Trace("SandboxManager:Initialize()")
end

function SandboxManager:EnterSandbox()
    LOG:Trace("SandboxManager:EnterSandbox()")
    self.isSandbox = true
    Comms:Disable()
    LedgerManager:EnterSandbox()
end

local function ExitSandbox(self, apply)
    self.isSandbox = false
    LedgerManager:ExitSandbox(apply)
    Comms:Enable()
end

function SandboxManager:ApplyChanges()
    LOG:Trace("SandboxManager:ApplyChanges()")
    if self:IsSandbox() then
        ExitSandbox(self, true)
    end
end

function SandboxManager:DiscardChanges()
    LOG:Trace("SandboxManager:DiscardChanges()")
    if self:IsSandbox() then
        ExitSandbox(self, false)
    end
end

function SandboxManager:IsSandbox()
    return self.isSandbox and true or false
end

resolve(SandboxManager)
end)