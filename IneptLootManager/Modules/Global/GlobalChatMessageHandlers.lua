-- ------------------------------- --
local  _, ILM = ...
-- ------ ILM common cache ------- --
-- local LOG       = ILM.LOG
-- local CONSTANTS = ILM.CONSTANTS
-- local UTILS     = ILM.UTILS
-- ------------------------------- --

local ILM_ICON_DARK = "Interface\\AddOns\\IneptLootManager\\Media\\Icons\\ilm-dark-32.png"
local ILM_TEXTURE = string.format("|T%s:0|t", ILM_ICON_DARK)

local function subsituteWithIcon(message)
    return string.gsub(message, "%[ILM%]", ILM_TEXTURE)
end

local function filterSubsituteWithIcon(_, _, message, ...)
    return false, subsituteWithIcon(message), ...
end

local CHAT_MESSAGE_CHANNELS = {"CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_PARTY_GUIDE", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_RAID_WARNING",
"CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_CHANNEL", "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_WHISPER_INFORM", "CHAT_MSG_BN_CONVERSATION", "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER"}

local GlobalChatMessageHandlers = {}
function GlobalChatMessageHandlers:Initialize()
    -- Substitute [ILM] with an icon
    for _, channel in ipairs(CHAT_MESSAGE_CHANNELS) do
        ChatFrame_AddMessageEventFilter(channel, filterSubsituteWithIcon)
    end
    RaidWarningFrame:SetScript("OnEvent", function(s, event, message)
        if ( event == "CHAT_MSG_RAID_WARNING" ) then
            message = subsituteWithIcon(message)
            RaidWarningFrame_OnEvent(s, event, message)
        end
    end)
end

ILM.GlobalChatMessageHandlers = GlobalChatMessageHandlers