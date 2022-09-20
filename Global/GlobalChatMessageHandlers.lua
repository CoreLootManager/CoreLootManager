-- ------------------------------- --
local  _, CLM = ...
-- ------ CLM common cache ------- --
local LOG       = CLM.LOG
local CONSTANTS = CLM.CONSTANTS
local UTILS     = CLM.UTILS
-- ------------------------------- --

local pairs, ipairs = pairs, ipairs
local tostring = tostring
local tinsert, sformat, sfind, slower, strsplit = table.insert, string.format, string.find, string.lower, strsplit
local SendChatMessage = SendChatMessage
local ChatFrame_AddMessageEventFilter = ChatFrame_AddMessageEventFilter

local GlboalChatMessageHandlers = {}
function GlboalChatMessageHandlers:Initialize()
    if not Acl:IsTrusted() then return end
    if not CLM.GlobalConfigs:GetAllowChatCommands() then return end
    EventManager:RegisterWoWEvent({"CHAT_MSG_WHISPER", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER"},
    (function(addon, event, text, playerName, ...)
        playerName = UTILS.RemoveServer(playerName)
        local params = { strsplit(" ", text) }
        local command = params[1]
        if command then
            command = slower(command)
            local responseChannel, target
            if event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER" then
                responseChannel = "RAID"
                target = nil
            else -- fallback to whisper always - safer option
                responseChannel = "WHISPER"
                target = playerName
            end

            if command == L["!bid"] then
                local value
                if params[2] then
                    value = UTILS.Trim(params[2])
                end
                if not AuctionManager:IsAuctionInProgress() then
                    LOG:Debug("Received submit bid from %s while no auctions are in progress", playerName)
                    return
                end
                local accept, reason = false, nil
                if value == L["cancel"] then
                    accept, reason = AuctionManager:UpdateBid(playerName, nil)
                elseif value == L["pass"] then
                    accept, reason = AuctionManager:UpdateBid(playerName, CONSTANTS.AUCTION_COMM.BID_PASS)
                else
                    local numericValue = tonumber(value)
                    if type(numericValue) == "number" then
                        accept, reason = AuctionManager:UpdateBid(playerName, numericValue)
                    end
                end
                local reasonString = CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[reason] or L["Invalid value provided"]
                local message = sformat(L["<CLM> Your bid (%s) was %s%s."],
                    tostring(value),
                    accept and L["accepted"] or L["denied"],
                    accept and "" or (": ".. reasonString))
                SendChatMessage(message, responseChannel, nil, target)

            elseif command == L["!dkp"] then
                responseChannel = "WHISPER" -- always respond in whisper to protect from spam
                target = playerName
                local player
                if params[2] then
                    params[2] = UTILS.Trim(params[2])
                end
                if not params[2] or params[2] == "" then
                    player = playerName
                else
                    player = params[2]
                end
                local profile = ProfileRegistry.GetByName(player)
                if not profile then
                    SendChatMessage(sformat(L["<CLM> Missing profile for player %s."], tostring(player)), responseChannel, nil, target)
                    return
                end
                local rosters = {}
                if RaidManager:IsInActiveRaid() then
                    local raid = RaidManager:GetRaid()
                    if raid then
                        rosters["_"] = raid:Roster()
                    end
                else
                    rosters = RosterRegistry.All()
                end
                local rostersWithPlayer = {}
                for _, roster in pairs(rosters) do
                    if roster and roster:IsProfileInRoster(profile:GUID()) then
                        tinsert(rostersWithPlayer, roster)
                    end
                end
                if #rostersWithPlayer == 0 then
                    SendChatMessage(sformat(L["<CLM> %s not present in any roster."], profile:Name()), responseChannel, nil, target)
                else
                    SendChatMessage(sformat(L["<CLM> %s standings in %d %s:"], profile:Name(), #rostersWithPlayer, (#rostersWithPlayer == 1) and L["roster"] or L["rosters"]), responseChannel, nil, target)
                end
                for _, roster in ipairs(rostersWithPlayer) do
                    local standings = roster:Standings(profile:GUID())
                    local weeklyGains = roster:GetCurrentGainsForPlayer(profile:GUID())
                    local weeklyCap = roster:GetConfiguration("weeklyCap")
                    if weeklyCap > 0 then
                        weeklyGains = weeklyGains .. " / " .. weeklyCap
                    end
                    SendChatMessage(sformat(L["<CLM> %s: %d DKP (%d this week)."], roster:Name(), standings, weeklyGains), responseChannel, nil, target)
                end
            end
        end
    end))
    -- Suppress incoming chat commands
    if CLM.GlobalConfigs:GetSuppressIncomingChatCommands() then
        ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", (function(_, _, message, ...)
            message = slower(message)
            if sfind(message, "!dkp") or sfind(message, "!bid") then
                return true
            end
            return false
        end))
    end
    -- Suppress outgoing CLM responses
    if CLM.GlobalConfigs:GetSuppressOutgoingChatCommands() then
        ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", (function(_, _, message, ...)
            if sfind(message, "<CLM>") then
                return true
            end
            return false
        end))
    end
end

CLM.GlboalChatMessageHandlers = GlboalChatMessageHandlers