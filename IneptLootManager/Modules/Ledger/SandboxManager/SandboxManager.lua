-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --
local SandboxManager = {}
function SandboxManager:Initialize()
    LOG:Trace("SandboxManager:Initialize()")
end

function SandboxManager:EnterSandbox()
    LOG:Trace("SandboxManager:EnterSandbox()")
    self.isSandbox = true
    ILM.MODULES.Comms:Disable()
    ILM.MODULES.LedgerManager:EnterSandbox()
end

local function ExitSandbox(self, apply)
    self.isSandbox = false
    ILM.MODULES.LedgerManager:ExitSandbox(apply)
    ILM.MODULES.Comms:Enable()
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

ILM.MODULES.SandboxManager = SandboxManager