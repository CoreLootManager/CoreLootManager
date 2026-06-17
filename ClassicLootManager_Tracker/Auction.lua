-- ------------------------------- --
local _, PRIV = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local UTILS     = CLM.UTILS
-- ------------------------------- --

local dataColumn = {
    name = CLM.L["Count"],
    align = "CENTER", -- TODO this doesnt work
    width = 36
}

---@param auction AuctionItem
---@param item table
---@param name string
---@param response any
---@return table
local function dataCallback(auction, item, name, response)
    local count = PRIV.MODULES.Tracker:GetCount(auction:GetRoster(), item:GetItemID(), name)
    return {value = count or 0}
end

local function RegisterColumn()
    CLM.GUI.AuctionManager:RegisterExternalColumn(dataColumn, dataCallback)
end

---@class Auction
local Auction = {}
function Auction:Initialize()
    if not CLM.MODULES.ACL:IsTrusted() then return end
    if PRIV.Core:GetEnableAuctionColumn() then
        RegisterColumn()
    end
end

PRIV.MODULES.Auction = Auction