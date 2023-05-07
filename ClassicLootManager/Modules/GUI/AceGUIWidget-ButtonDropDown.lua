--[[
	Dropdown from AceGUI but in a button-like style with arrow instead of text
]]--
local AceGUI = LibStub("AceGUI-3.0")
local NOP = function() end

do
	local widgetType = "CLMButtonDropDown"
	local widgetVersion = 1

	--[[ AceGUIWidget-DropDown inherited functions hack ]]--
	local dummyDropdown = AceGUI:Create("Dropdown")

	local OnRelease 		= dummyDropdown.OnRelease
	local OnAcquire 		= dummyDropdown.OnAcquire
	local ClearFocus 		= dummyDropdown.ClearFocus
	local SetValue 			= dummyDropdown.SetValue
	local GetValue 			= dummyDropdown.GetValue
	local SetList 			= dummyDropdown.SetList
	local AddItem 			= dummyDropdown.AddItem
	local SetMultiselect 	= dummyDropdown.SetMultiselect
	local GetMultiselect 	= dummyDropdown.GetMultiselect
	local SetItemValue 		= dummyDropdown.SetItemValue
	local SetItemDisabled 	= dummyDropdown.SetItemDisabled
	local SetPulloutWidth	= dummyDropdown.SetPulloutWidth

	AceGUI:Release(dummyDropdown)

	--[[ UI event handler ]]--

	local function Control_OnEnter(this)
		this.obj:Fire("OnEnter")
	end

	local function Control_OnLeave(this)
		this.obj:Fire("OnLeave")
	end

	local function Dropdown_OnHide(this)
		local self = this.obj
		if self.open then
			self.pullout:Close()
		end
	end

	local function Arrow_SetOpen(self)
		self.arrow:ClearAllPoints()
		self.arrow:SetPoint("CENTER", self.frame, "CENTER", 0, 2)
		self.arrow:SetTexture("Interface\\Buttons\\Arrow-Up-Up")
	end

	local function Arrow_SetClosed(self)
		self.arrow:ClearAllPoints()
		self.arrow:SetPoint("CENTER", self.frame, "CENTER", 0, -5)
		self.arrow:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
	end

	local function Arrow_SetDisabled(self)
		self.arrow:ClearAllPoints()
		self.arrow:SetPoint("CENTER", self.frame, "CENTER", 0, -5)
		self.arrow:SetTexture("Interface\\Buttons\\Arrow-Down-Disabled")
	end

	local function Dropdown_TogglePullout(this)
		local self = this.obj
		if self.open then
			self.open = nil
			self.pullout:Close()
			AceGUI:ClearFocus()
		else
			self.open = true
			self.pullout:SetWidth(self.pulloutWidth or self.frame:GetWidth())
			-- self.pullout:Open("TOPLEFT", self.frame, "BOTTOMLEFT", 0, self.label:IsShown() and -2 or 0)
			-- self.pullout:Open("TOPLEFT", self.frame, "BOTTOMLEFT", 0, 0)
			self.pullout:Open("TOPRIGHT", self.frame, "BOTTOMRIGHT", 0, 0)
			AceGUI:SetFocus(self)
			Arrow_SetOpen(self)
		end
	end
	-- -- exported
	local function SetDisabled(self, disabled)
		self.disabled = disabled
		if disabled then
			self.frame:Disable()
			Arrow_SetDisabled(self)
			-- self.text:SetTextColor(0.5,0.5,0.5)
			-- self.button:Disable()
			-- self.button_cover:Disable()
			-- self.label:SetTextColor(0.5,0.5,0.5)
		else
			self.frame:Enable()
			Arrow_SetClosed(self)
			-- self.button:Enable()
			-- self.button_cover:Enable()
			-- self.label:SetTextColor(1,.82,0)
			-- self.text:SetTextColor(1,1,1)
		end
	end

	-- -- exported
	-- local function ClearFocus(self)
	-- 	if self.open then
	-- 		self.pullout:Close()
	-- 	end
	-- end

	-- -- exported
	-- local function SetLabel(self, text)
	-- 	if text and text ~= "" then
	-- 		self.label:SetText(text)
	-- 		self.label:Show()
	-- 		self.dropdown:SetPoint("TOPLEFT",self.frame,"TOPLEFT",-15,-14)
	-- 		self:SetHeight(40)
	-- 		self.alignoffset = 26
	-- 	else
			-- self.label:SetText("")
			-- self.label:Hide()
			-- self.dropdown:SetPoint("TOPLEFT",self.frame,"TOPLEFT",-15,0)
			-- self:SetHeight(26)
			-- self:SetHeight(24)
			-- self.alignoffset = 12
	-- 	end
	-- end

	local minWidth = 50

	local function OnWidthSet(self, width)
		local max = 0
		for _, item in pairs(self.pullout.items or {}) do
			if item and item.text then
				max = math.max(max, item.text:GetStringWidth())
			end
		end
		self:SetPulloutWidth(max + minWidth)
	end

	local function OnAcquireInternal(self)
		OnAcquire(self)
		local OnHide = self.pullout.frame:GetScript("OnHide") or NOP
		self.pullout.frame:SetScript("OnHide", function(...)
---@diagnostic disable-next-line: redundant-parameter
			OnHide(...)
			Arrow_SetClosed(self)
		end)

		self:SetPulloutWidth(minWidth)
		self:SetHeight(24)
	end

	--[[ Constructor ]]--

	local function Constructor()
		local count = AceGUI:GetNextWidgetNum(widgetType)
		local frame = CreateFrame("Button", "CLMAceGUI30ButtonDropDown"..count, UIParent, "UIPanelButtonTemplate")--"UIDropDownMenuTemplate")
		local arrow = frame:CreateTexture(nil, "ARTWORK")
		local self = {}
		self.type = widgetType
		self.frame = frame
		self.dropdown = frame -- hack for ElvUI reskin of the dropdown
		self.arrow = arrow
		self.count = count
		frame.obj = self

		Arrow_SetClosed(self)

		self.OnRelease   		= OnRelease
		self.OnAcquire   		= OnAcquireInternal
		self.ClearFocus  		= ClearFocus
		self.SetText 	 		= NOP
		self.SetValue    		= SetValue
		self.GetValue    		= GetValue
		self.SetList     		= SetList
		self.SetLabel    		= NOP
		self.SetDisabled 		= SetDisabled
		self.AddItem     		= AddItem
		self.SetMultiselect 	= SetMultiselect
		self.GetMultiselect 	= GetMultiselect
		self.SetItemValue 		= SetItemValue
		self.SetItemDisabled	= SetItemDisabled
		self.SetPulloutWidth 	= SetPulloutWidth
		self.OnWidthSet         = OnWidthSet

		-- self.alignoffset = 26

		frame:SetScript("OnHide", Dropdown_OnHide)

		-- dropdown:ClearAllPoints()
		-- dropdown:SetPoint("TOPLEFT",frame,"TOPLEFT",-15,0)
		-- dropdown:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",17,0)
		-- dropdown:SetScript("OnHide", nil)

		frame:Hide()

		frame:EnableMouse(true)
		frame:SetScript("OnClick", Dropdown_TogglePullout)
		frame:SetScript("OnEnter", Control_OnEnter)
		frame:SetScript("OnLeave", Control_OnLeave)

		-- local label = frame:CreateFontString(nil,"OVERLAY","GameFontNormalSmall")
		-- label:SetPoint("TOPLEFT",frame,"TOPLEFT",0,0)
		-- label:SetPoint("TOPRIGHT",frame,"TOPRIGHT",0,0)
		-- label:SetJustifyH("LEFT")
		-- label:SetHeight(18)
		-- label:Hide()
		-- self.label = label

		AceGUI:RegisterAsWidget(self)
		return self
	end

	AceGUI:RegisterWidgetType(widgetType, Constructor, widgetVersion)
end

-- ElvUI reskin of the button
if not ElvUI then return end

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

hooksecurefunc(S, "Ace3_RegisterAsWidget", function(_, widget)
    if widget.type == "CLMButtonDropDown" then
        S:HandleButton(widget.frame)
    end
end)