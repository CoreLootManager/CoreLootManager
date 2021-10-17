local  _, CLM = ...

local LOG = CLM.LOG
local MODULES = CLM.MODULES
local CONSTANTS = CLM.CONSTANTS
local UTILS = CLM.UTILS

local ACL = MODULES.ACL
local EventManager = MODULES.EventManager
local AuctionManager = MODULES.AuctionManager
local ProfileManager = MODULES.ProfileManager
local RosterManager = MODULES.RosterManager
local RaidManager = MODULES.RaidManager

local GlboalChatMessageHandlers = {}

function GlboalChatMessageHandlers:Initialize()
    if not ACL:IsTrusted() then return end
    EventManager.RegisterWoWEvent({"CHAT_MSG_WHISPER", "CHAT_MSG_RAID"},
    (function(event, text, playerName, ...)
        playerName = UTILS.RemoveServer(playerName)
        local params = { strsplit(" ", text) }
        local command = params[1]
        if command then
            local responseChannel
            if event == "CHAT_MSG_RAID" then
                responseChannel = "RAID"
            else -- fallback to whisper always - safer option
                responseChannel = "WHISPER"
            end

            if command == "!bid" then
                local value = params[2]
                if not AuctionManager:IsAuctionInProgress() then
                    LOG:Debug("Received submit bid from %s while no auctions are in progress", playerName)
                    return
                end
                local accept, reason = false, "Invalid value provided"
                if value == "cancel" then
                    accept, reason = AuctionManager:UpdateBid(playerName, nil)
                elseif value == "pass" then
                    accept, reason = AuctionManager:UpdateBid(playerName, CONSTANTS.AUCTION_COMM.BID_PASS)
                else
                    value = tonumber(value)
                    if type(value) == "number" then
                        accept, reason = AuctionManager:UpdateBid(playerName, value)
                    end
                end

                SendChatMessage(
                    "CLM: Your bid (" .. tostring(value) .. ") was " .. (accept and "accepted" or ("denied:" .. reason)) .. ".",
                    responseChannel
                )

            elseif command == "!dkp" then
                local player, rosterName = UTILS.whoami(), ""
                if #params > 1 then
                    for _,param in ipairs(params) do
                        local var,val = strsplit("=",param)
                        if var == "player" then
                            player = val or ""
                        elseif var == "roster" then
                            rosterName = val or ""
                        end
                    end
                end
                local profile = ProfileManager:GetProfileByName(player)
                if not profile then
                    SendChatMessage("CLM: Missing profile for player" .. tostring(player) .. ".", responseChannel)
                    return
                end
                local roster
                if rosterName == "" then
                    if RaidManager:IsInRaid() then
                        local raid = RaidManager:GetRaid()
                        if raid then
                            roster = raid:Roster()
                        end
                    end
                else
                    roster = RosterManager:GetRosterByName(rosterName)
                end
                if not roster then
                    SendChatMessage("CLM: Missing roster information.", responseChannel)
                    return
                end
                if not roster:IsProfileInRoster(profile:GUID()) then
                    SendChatMessage("CLM: " .. profile:Name() .. " not in " .. RosterManager:GetRosterNameByUid(roster:UID()) .. "roster.", responseChannel)
                    return
                end
                local standings = roster:Standings(profile:GUID())
                local weeklyGains = roster:GetCurrentGainsForPlayer(profile:GUID())
                local weeklyCap = roster:GetConfiguration("weeklyCap")
                if weeklyCap > 0 then
                    weeklyGains = weeklyGains .. " / " .. weeklyCap
                end
                SendChatMessage("CLM: " .. profile:Name() .. ":  " .. standings .. " DKP (" .. weeklyGains .. " this week).", responseChannel)
            end
        end
    end))
end

CLM.GlboalChatMessageHandlers = GlboalChatMessageHandlers