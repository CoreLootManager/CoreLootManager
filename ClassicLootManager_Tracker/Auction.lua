-- ------------------------------- --
local _, PRIV = ...
local CLM = LibStub("ClassicLootManager").CLM
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local UTILS     = CLM.UTILS
-- ------------------------------- --

local dataColumn = {
    name = CLM.L["Count"],
    width = 36
}

local function dataCallback(auction, item, name, response)
    local count = PRIV.MODULES.Tracker:GetCount(auction:GetRoster(), item:GetItemID(), name)
    return {value = count or 0}
end

local function RegisterColumn()
    CLM.GUI.AuctionManager:RegisterExternalColumn(dataColumn, dataCallback)
end

local Auction = {}
function Auction:Initialize()
    if PRIV.Core:GetEnableAuctionColumn() then
        RegisterColumn()
    end
end

PRIV.MODULES.Auction = Auction