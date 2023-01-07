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

CLM:RegisterExternal("Integrations", Integrations)