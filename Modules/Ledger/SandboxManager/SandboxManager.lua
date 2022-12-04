-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
-- local UTILS     = CLM.UTILS
-- ------------------------------- --
local SandboxManager = {}
function SandboxManager:Initialize()
    LOG:Trace("SandboxManager:Initialize()")
end

function SandboxManager:EnterSandbox()
    LOG:Trace("SandboxManager:EnterSandbox()")
    self.isSandbox = true
    CLM.MODULES.Comms:Disable()
    CLM.MODULES.LedgerManager:EnterSandbox()
end

local function ExitSandbox(self, apply)
    self.isSandbox = false
    CLM.MODULES.LedgerManager:ExitSandbox(apply)
    CLM.MODULES.Comms:Enable()
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

CLM.MODULES.SandboxManager = SandboxManager