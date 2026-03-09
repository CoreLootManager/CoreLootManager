local _, PRIV = ...

PRIV.MODULES = {}
PRIV.MODELS = {}
PRIV.GUI = {}
PRIV.CONSTANTS = {}

local Integrations = {}

function Integrations:Initialize()
    for _,module in pairs(PRIV.MODULES) do
        module:Initialize()
    end
    for _,gui in pairs(PRIV.GUI) do
        gui:Initialize()
    end
end
PRIV.CONSTANTS.INTEGRATIONS = ILM.L["Integrations"]
ILM.MODULES.ConfigManager:AddGroup(PRIV.CONSTANTS.INTEGRATIONS, true)
ILM.RegisterExternal("Integrations", Integrations)