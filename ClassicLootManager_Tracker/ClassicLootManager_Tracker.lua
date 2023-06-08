local _, PRIV = ...

PRIV.MODULES = {}
PRIV.CONSTANTS = {}

local CLM = LibStub("ClassicLootManager").CLM

local Core = {}

local function InitializeDB()
    local db = CLM.MODULES.Database:Server()
    if not db.tracker then
        db.tracker = {
            tooltip = true,
            tooltipExtended = false,
            auction = true
        }
    end
    return db.tracker
end

local function SetEnableTooltip(self, value)
    self.db.tooltip = value and true or false
end

function Core:GetEnableTooltip()
    return self.db.tooltip
end

local function SetEnableTooltipExtended(self, value)
    self.db.tooltipExtended = value and true or false
end

function Core:GetEnableTooltipExtended()
    return self.db.tooltipExtended
end

local function SetEnableAuctionColumn(self, value)
    self.db.auction = value and true or false
end

function Core:GetEnableAuctionColumn()
    return self.db.auction
end

local function InitializeConfigs(self)
    local options = {
        tracker_enable_tooltip = {
            name = CLM.L["Enable tooltip display"],
            desc = CLM.L["Enable item tracking information in tooltip display."],
            type = "toggle",
            set = function(i, v) SetEnableTooltip(self, v) end,
            get = function(i) return self:GetEnableTooltip() end,
            width = "full",
            order = 1
        },
        tracker_extended_tooltip = {
            name = CLM.L["Extended tooltip"],
            desc = CLM.L["Extend tooltip with more specific loot information."],
            type = "toggle",
            set = function(i, v) SetEnableTooltipExtended(self, v) end,
            get = function(i) return self:GetEnableTooltipExtended() end,
            width = "full",
            order = 2
        },
        tracker_enable_auction = {
            name = CLM.L["Auction column"],
            desc = CLM.L["Extend auction bid list with received item count information."],
            type = "toggle",
            set = function(i, v) SetEnableAuctionColumn(self, v) end,
            get = function(i) return self:GetEnableAuctionColumn() end,
            width = "full",
            order = 3

        },
    }

    CLM.MODULES.ConfigManager:Register(PRIV.CONSTANTS.TRACKER, options)
end

function Core:Initialize()
    self.db = InitializeDB()
    InitializeConfigs(self)
    for _,module in pairs(PRIV.MODULES) do
        module:Initialize()
    end
end

PRIV.CONSTANTS.TRACKER = CLM.L["Tracker"]
PRIV.MODULES.Core = Core
CLM.MODULES.ConfigManager:AddGroup(PRIV.CONSTANTS.TRACKER, true)
CLM:RegisterExternal("Tracker", Core)