-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
-- local LOG       = CLM.LOG
-- local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local CLM_ICON_DARK = "Interface\\AddOns\\ClassicLootManager\\Media\\Icons\\clm-dark-32.png"
local CLM_TEXTURE = string.format("|T%s:0|t", CLM_ICON_DARK)

local function subsituteWithIcon(message)
    return string.gsub(message, "%[CLM%]", CLM_TEXTURE)
end

local function filterSubsituteWithIcon(_, _, message, ...)
    return false, subsituteWithIcon(message), ...
end

local CHAT_MESSAGE_CHANNELS = {"CHAT_MSG_GUILD", "CHAT_MSG_OFFICER", "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_PARTY_GUIDE", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER", "CHAT_MSG_RAID_WARNING",
"CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_CHANNEL", "CHAT_MSG_BN_WHISPER", "CHAT_MSG_BN_WHISPER_INFORM", "CHAT_MSG_BN_CONVERSATION", "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER"}

local GlobalChatMessageHandlers = {}
function GlobalChatMessageHandlers:Initialize()
    -- Substitute [CLM] with an icon
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

CLM.GlobalChatMessageHandlers = GlobalChatMessageHandlers