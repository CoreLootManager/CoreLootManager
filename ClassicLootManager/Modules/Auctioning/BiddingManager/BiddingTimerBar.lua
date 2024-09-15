-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local LibCandyBar = LibStub("LibCandyBar-3.0")
local SharedMedia = LibStub("LibSharedMedia-3.0")

local _, _, _, isElvUI = UTILS.GetAddOnInfo("ElvUI")

local DEFAULT_WIDTH = 345
local DEFAULT_HEIGHT = 30
local DEFAULT_TEXTURE = "Interface\\AddOns\\ClassicLootManager\\Media\\Bars\\Ruben.tga"
local DEFAULT_TEXTURE_NAME = "CLM Default"
local DEFAULT_FONT_NAME, DEFAULT_FONT_SIZE = GameFontHighlightSmallOutline:GetFont()

SharedMedia:Register("statusbar", DEFAULT_TEXTURE_NAME, DEFAULT_TEXTURE)

local BiddingTimerBar = {} -- BiddingTimerBar
BiddingTimerBar.__index = BiddingTimerBar

local function RecolorBar(self)
    local currentPercentageLeft = (self.bar.remaining / self.duration)
    local percentageChange = self.previousPercentageLeft - currentPercentageLeft
    if percentageChange >= 0.01 or percentageChange < 0 then
        local r, g, b, a = UTILS.GetColorByPercentage(currentPercentageLeft * 100)
        self.bar:SetColor(r, g, b, a)
        self.previousPercentageLeft = currentPercentageLeft
    end
end

local function Create(self, item, auction, options)
    self.options = {
        texture = SharedMedia:Fetch("statusbar", options.texture) or DEFAULT_TEXTURE,
        width = tonumber(options.width) or DEFAULT_WIDTH,
        height = tonumber(options.height) or DEFAULT_HEIGHT,
        fontName = options.fontName or DEFAULT_FONT_NAME,
        fontSize = tonumber(options.fontSize) or DEFAULT_FONT_SIZE
    }
    self.bar = LibCandyBar:New(self.options.texture, self.options.width, self.options.height)

    self.bar:SetFont(SharedMedia:Fetch("font", self.options.fontName), self.options.fontSize)

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

    self.parent = CreateFrame("Frame", nil, UIParent)
    -- local tint = self.parent:CreateTexture(nil, "BACKGROUND")
    -- tint:SetAllPoints()
    -- tint:SetColorTexture(math.random(0.5,1), math.random(0.5,1), math.random(0.5,1), 0.7)

    self.bar:SetPoint("CENTER", self.parent, "CENTER", 0, 0)

    self.parent:ClearAllPoints()
    self.parent:SetFrameLevel(self.bar:GetFrameLevel() + 1)
    self.parent:SetWidth(self.bar:GetWidth())
    self.parent:SetHeight(self.bar:GetHeight())
    if options.anchor then
        self.parent:SetPoint(options.anchor[3], options.anchor[4], options.anchor[5])
    else
        self.parent:SetPoint("CENTER", 0, 185 + (isElvUI and 15 or 0))
    end
    self.parent:Show()
    self.parent:RegisterForDrag("LeftButton")
    self.parent:EnableMouse(true)
    self.parent:SetMovable(true)
    self.parent:SetScript("OnDragStart", function(frame) frame:StartMoving() end)
    self.parent:SetScript("OnDragStop",  function(frame) frame:StopMovingOrSizing() end)

    self.parent:SetScript("OnMouseDown", function (_, button)
        if button == 'LeftButton' then
            self:callback()
        end
    end)

    self.bar:Start(auction:GetTime())
end

function BiddingTimerBar:New(item, auction, options)
    local o = {}
    setmetatable(o, self)

    Create(o, item, auction, options)
    o.previousPercentageLeft = 1

    return o
end

function BiddingTimerBar:Test(options)
    local item = {
        GetItemLink = function() return "|cffa335ee|Hitem:39468::::::::80:::::::::|h[The Stray]|h|r" end,
        GetNote = function() return "Test Bar" end
    }
    local auction = {
        GetEndTime = function() return GetServerTime() + 300 end,
        GetTime = function() return 300 end,
    }
    options.callback = function() CLM.LOG:Message("Test Bar Clicked") end
    return BiddingTimerBar:New(item, auction, options)
end

function BiddingTimerBar:GetPoint()
    return self.parent:GetPoint()
end

function BiddingTimerBar:UpdateInfo(item)
    if not item then return end
    local note = ""
    if item:GetNote():len() > 0 then
        note = "(" .. item:GetNote() .. ")"
    end
    local link = item:GetItemLink() or ""
    self.bar:SetLabel(link .. " " .. note)

    local _, _, _, _, icon = UTILS.GetItemInfoInstant(link)
    self.bar:SetIcon(icon)
end

function BiddingTimerBar:UpdateTime(time)
    self.bar.exp = (self.bar.exp + time) -- trick to extend bar
end

function BiddingTimerBar:SetWidth(width)
    self.options.width = tonumber(width) or DEFAULT_WIDTH
    self.bar:SetWidth(self.options.width)
end

function BiddingTimerBar:SetHeight(height)
    self.options.height = tonumber(height) or DEFAULT_WIDTH
    self.bar:SetHeight(self.options.height)
end

function BiddingTimerBar:SetTexture(texture)
    self.options.texture = texture and tostring(texture) or DEFAULT_TEXTURE
    self.bar.candyBarBar:SetStatusBarTexture(self.options.texture)
    self.bar.candyBarBackground:SetTexture(self.options.texture)
end

function BiddingTimerBar:SetFontName(fontName)
    self.options.fontName = fontName and tostring(fontName) or DEFAULT_FONT_NAME
    local _, _fontSize = self.bar.candyBarLabel:GetFont()
    self.bar:SetFont(self.options.fontName, _fontSize)
end

function BiddingTimerBar:SetFontSize(fontSize)
    self.options.fontSize = tonumber(fontSize) or DEFAULT_FONT_SIZE
    local _fontName, _ = self.bar.candyBarLabel:GetFont()
    self.bar:SetFont(_fontName, self.options.fontSize)
end

function BiddingTimerBar:Default()
    self:SetWidth(DEFAULT_WIDTH)
    self:SetHeight(DEFAULT_HEIGHT)
    self:SetTexture(DEFAULT_TEXTURE)
    self:SetFontName(DEFAULT_FONT_NAME)
    self:SetFontSize(DEFAULT_FONT_SIZE)
end

function BiddingTimerBar:GetOptions()
    return self.options
end

function BiddingTimerBar:Stop()
    self.parent:Hide()
    if self.bar.running then
        self.bar:Stop()
    end
end

CLM.MODELS.BiddingTimerBar = BiddingTimerBar