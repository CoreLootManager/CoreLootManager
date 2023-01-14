-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local LibCandyBar = LibStub("LibCandyBar-3.0")

local setmetatable, GetAddOnInfo  = setmetatable, GetAddOnInfo

local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

local BiddingTimerBar = {} -- BiddingTimerBar
BiddingTimerBar.__index = BiddingTimerBar

local function RecolorBar(self)
    local currentPercentageLeft = (self.bar.remaining / self.duration)
    local percentageChange = self.previousPercentageLeft - currentPercentageLeft
    if percentageChange >= 0.01 or percentageChange < 0 then
        -- if (currentPercentageLeft >= 0.5) then
        --     self.bar:SetColor(0, 0.80, 0, 1)        -- green
        -- elseif (currentPercentageLeft >= 0.2) then
        --     self.bar:SetColor(0.92, 0.70, 0.20, 1)  -- gold
        -- else
        --     self.bar:SetColor(0.8, 0, 0, 1)         -- red
        -- end
        local r, g, b, a = UTILS.GetColorByPercentage(currentPercentageLeft * 100)
        self.bar:SetColor(r, g, b, a)
        self.previousPercentageLeft = currentPercentageLeft
    end
end

local function Create(self, parent, item, auction, options)
    self.bar = LibCandyBar:New(
        "Interface\\AddOns\\ClassicLootManager\\Media\\Bars\\AceBarFrames.tga",
        tonumber(options.width) or 100,
        tonumber(options.height) or 25)

    local duration = auction:GetEndTime() - GetServerTime()
    self.bar:SetDuration(duration)
    self.duration = duration

    self:UpdateInfo(item)

    if type(options.callback) == 'function' then
        self.callback = options.callback
    else
        self.callback = (function() end)
    end

    self.bar:SetColor(0, 1, 0, 1)
    self.bar:AddUpdateFunction(function()
        RecolorBar(self)
    end)

    -- self.bar:SetParent(parent) -- makes the bar disappear
    self.bar:SetPoint("CENTER", parent, "TOP", 0, (isElvUI and 15 or 10))

    self.bar.candyBarBar:SetScript("OnMouseDown", function (_, button)
        if button == 'LeftButton' then
            self:callback()
        end
    end)

    -- if self.db.scale then
    --     RescaleLibCandyBar(self.bar, self.db.scale)
    -- end

    self.bar:Start(auction:GetTime())
end

function BiddingTimerBar:New(parent, item, auction, options)
    local o = {}
    setmetatable(o, self)

    Create(o, parent, item, auction, options)
    o.previousPercentageLeft = 1

    return o
end

function BiddingTimerBar:UpdateInfo(item)
    local note = ""
    if item:GetNote():len() > 0 then
        note = "(" .. item:GetNote() .. ")"
    end
    self.bar:SetLabel(item:GetItemLink() .. " " .. note)

    local _, _, _, _, icon = GetItemInfoInstant(item:GetItemLink())
    self.bar:SetIcon(icon)
end

function BiddingTimerBar:UpdateTime(time)
    self.bar.exp = (self.bar.exp + time) -- trick to extend bar
end

function BiddingTimerBar:Stop()
    if self.bar.running then
        self.bar:Stop()
    end
end

CLM.MODELS.BiddingTimerBar = BiddingTimerBar