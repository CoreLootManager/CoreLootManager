local _, _, _, isElvUI = GetAddOnInfo("ElvUI")

if not isElvUI then return end
if not ElvUI then return end

local E = unpack(ElvUI)
local S = E:GetModule('Skins')

hooksecurefunc(S, "Ace3_RegisterAsWidget", function(_, widget)
    if widget.type == "CLMButtonDropDown" then
        S:HandleButton(widget.frame)
    end
end)