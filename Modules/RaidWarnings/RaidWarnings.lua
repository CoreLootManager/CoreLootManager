local  _, CLM = ...

local LOG = CLM.LOG

local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS

local RaidWarnings = {}

local function InitializeDB(self)
    self.db = MODULES.Database:Personal('warnings', {
        raid = true,
        auction = true,
        countdown = true,
        bids = true,
        loot = true,
        commands = false
    })
end

function RaidWarnings:Initialize()
    LOG:Trace("RaidWarnings:Initialize()")

    InitializeDB(self)

    local options = {
        raid_warnings_header = {
            type = "header",
            name = CLM.L["Raid Warnings"],
            order = 40
        },
        raid_warnings_raid = {
            name = CLM.L["Raid Start/End"],
            desc = CLM.L["Enables announcing raid start and end."],
            type = "toggle",
            set = function(i, v) self:SetRaid(v) end,
            get = function(i) return self:GetRaid() end,
            width = "double",
            order = 41
        },
        raid_warnings_auction = {
            name = CLM.L["Auction Start/End"],
            desc = CLM.L["Enable announcing auction start and end."],
            type = "toggle",
            set = function(i, v) self:SetAuction(v) end,
            get = function(i) return self:GetAuction() end,
            -- width = "double",
            order = 42
        },
        raid_warnings_commands = {
            name = CLM.L["Chat Commands"],
            desc = CLM.L["Enables announcing chat commands at auction start."],
            type = "toggle",
            set = function(i, v) self:SetCommands(v) end,
            get = function(i) return self:GetCommands() end,
            width = "double",
            order = 43
        },
        raid_warnings_countdown = {
            name = CLM.L["Auction End Countdown"],
            desc = CLM.L["Enables raid-warning countdown for auctions."],
            type = "toggle",
            set = function(i, v) self:SetCountdown(v) end,
            get = function(i) return self:GetCountdown() end,
            -- width = "double",
            order = 44
        },
        raid_warnings_loot = {
            name = CLM.L["Loot Awards"],
            desc = CLM.L["Enables announcing loot awards."],
            type = "toggle",
            set = function(i, v) self:SetLoot(v) end,
            get = function(i) return self:GetLoot() end,
            width = "double",
            order = 45
        },
        raid_warnings_bids = {
            name = CLM.L["Bids"],
            desc = CLM.L["Enables announcing new highest bid (when applicable)."],
            type = "toggle",
            set = function(i, v) self:SetBids(v) end,
            get = function(i) return self:GetBids() end,
            -- width = "double",
            order = 46
        }
    }
    MODULES.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.GLOBAL, options)

    MODULES.ConfigManager:RegisterUniversalExecutor("warnings", "RaidWarnings", self)

    self._initialized = true
end

function RaidWarnings:SetRaid(value)
    self.db.raid = value and true or false
end

function RaidWarnings:GetRaid()
    return self.db.raid
end

function RaidWarnings:SetAuction(value)
    self.db.auction = value and true or false
end

function RaidWarnings:GetAuction()
    return self.db.auction
end

function RaidWarnings:SetCommands(value)
    self.db.commands = value and true or false
end

function RaidWarnings:GetCommands()
    return self.db.commands
end

function RaidWarnings:SetCountdown(value)
    self.db.countdown = value and true or false
end

function RaidWarnings:GetCountdown()
    return self.db.countdown
end

function RaidWarnings:SetLoot(value)
    self.db.loot = value and true or false
end

function RaidWarnings:GetLoot()
    return self.db.loot
end

function RaidWarnings:SetBids(value)
    self.db.bids = value and true or false
end

function RaidWarnings:GetBids()
    return self.db.bids
end

MODULES.RaidWarnings = RaidWarnings