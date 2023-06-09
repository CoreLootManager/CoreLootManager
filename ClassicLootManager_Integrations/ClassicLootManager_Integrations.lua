local _, PRIV = ...

PRIV.MODULES = {}
PRIV.MODELS = {}
PRIV.GUI = {}
PRIV.CONSTANTS = {}

local CLM = LibStub("ClassicLootManager").CLM

local Integrations = {}

function Integrations:Initialize()
    for _,module in pairs(PRIV.MODULES) do
        module:Initialize()
    end
    for _,gui in pairs(PRIV.GUI) do
        gui:Initialize()
    end
end
PRIV.CONSTANTS.INTEGRATIONS = CLM.L["Integrations"]
CLM.MODULES.ConfigManager:AddGroup(PRIV.CONSTANTS.INTEGRATIONS, true)
CLM.RegisterExternal("Integrations", Integrations)