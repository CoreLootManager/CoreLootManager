local display = CreateFrame("SimpleHTML", nil, UIParent)
local template = [[
    <html>
    <body>
    <h1>Ledger status</h1>
    <p><a href="reset">|cFFFF0000Reset|r</a></p>
    <p><a href="send">|cFFFF0000Send data|r</a></p>
    <br/>
    %s


    </body></html>
]]

display:SetFont('Fonts\\FRIZQT__.TTF', 20)
display:SetPoint("CENTER", UIParent)
display:SetWidth(200)
display:SetHeight(200)
display:Show()
display:RegisterForDrag("Leftbutton")
display:EnableMouse(true)
display:SetMovable(true)
display:SetScript("OnDragStart", function(self) self:StartMoving() end)
display:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
local EventSourcing = LibStub("EventSourcing")

display:SetScript("OnHyperLinkClick", function(self, link)
    if link == "reset" then
        EventSourcing.ledger.reset()
    elseif link == "send" then
        EventSourcing.ledger.getListSync():fullSyncViaWhisper("samdev")
    end
end)

function EventSourcing.updateTestFrameStatus(...)
    local status = ""
    for _, v in ipairs({...}) do
        status = status .. string.format('<p>%s</p><br/>', v)
    end
    display:SetText(string.format(template, status))
end
