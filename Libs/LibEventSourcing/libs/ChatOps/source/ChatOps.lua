
if LibStub == nil then
    error("ChatOps requires LibStub")
end

local ChatOps, _ = LibStub:NewLibrary("ChatOps", 1)

if ChatOps == nil then return end

--[[ Stores the callbacks in chat links ]]
local callbackLinks = {}

local ChatOpsIndex = {}

function ChatOpsIndex.createCallbackLink(linkText, callback)
    callbackLinks[#callbackLinks+1] = callback
    return string.format("|HCallback:%s|h[%s]|h", #callbackLinks, linkText)
end

function ChatOpsIndex.colorize(text, argb)
    return string.format("|c%s%s|r", argb, text)
end

function ChatOpsIndex.createAutoCompleteLink(linkText, prefill)
    return string.format("|HAutoComplete:%s|h[%s]|h", prefill, linkText)
end


local ChatOpsMeta = {
    __metatable = false,
    __index = ChatOpsIndex,
    __newindex = function(table, key, value)
        error(string.format("Cannot write read-only or unknown property '%s'", key))
    end
}
setmetatable(ChatOps, ChatOpsMeta)


local handlers = {}

handlers["^AutoComplete:(.*)"] = function(text)
    local editBox = SELECTED_CHAT_FRAME.editBox
    editBox:Show()
    editBox:SetText(text)
    editBox:SetFocus()
end

handlers["^Callback:(%d+)"] = function(index)
    pcall(callbackLinks[tonumber(index)])
end

--[[ Hook hyperlinks ]]
local prevSetHyperlink = ItemRefTooltip.SetHyperlink

ItemRefTooltip.SetHyperlink = function(self, link, ...)
    for regex, handler in pairs(handlers) do
        local matches = string.match(link, regex)
        if (matches ~= nil) then
            handler(matches)
            return
        end
    end

    -- if none match execute original handler
    prevSetHyperlink(self, link, ...)
end