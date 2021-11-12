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

local whoami = UTILS.whoami() --luacheck: ignore

local function trim(s)
    return string.gsub(s, "^%s*(.-)%s*$", "%1")
end

function GlboalChatMessageHandlers:Initialize()
    if not ACL:IsTrusted() then return end
    if not CLM.GlobalConfigs:GetAllowChatCommands() then return end
    EventManager:RegisterWoWEvent({"CHAT_MSG_WHISPER", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER"},
    (function(addon, event, text, playerName, ...)
        playerName = UTILS.RemoveServer(playerName)
        --[===[@non-debug@
        if playerName == whoami then return end
        --@end-non-debug@]===]
        local params = { strsplit(" ", text) }
        local command = params[1]
        if command then
            local responseChannel, target
            if event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER" then
                responseChannel = "RAID"
                target = nil
            else -- fallback to whisper always - safer option
                responseChannel = "WHISPER"
                target = playerName
            end

            if command == "!bid" then
                local value
                if params[2] then
                    value = trim(params[2])
                end
                -- if not AuctionManager:IsAuctionInProgress() then
                --     LOG:Debug("Received submit bid from %s while no auctions are in progress", playerName)
                --     return
                -- end
                local accept, reason = false, nil
                if value == "cancel" then
                    accept, reason = AuctionManager:UpdateBid(playerName, nil)
                elseif value == "pass" then
                    accept, reason = AuctionManager:UpdateBid(playerName, CONSTANTS.AUCTION_COMM.BID_PASS)
                else
                    local numericValue = tonumber(value)
                    if type(numericValue) == "number" then
                        accept, reason = AuctionManager:UpdateBid(playerName, numericValue)
                    end
                end

                SendChatMessage(
                    "<CLM> Your bid (" .. tostring(value) .. ") was " .. (accept and "accepted" or ("denied: " .. (CONSTANTS.AUCTION_COMM.DENY_BID_REASONS_STRING[reason] or "Invalid value provided"))) .. ".",
                    responseChannel, nil, target
                )

            elseif command == "!dkp" then
                responseChannel = "WHISPER" -- always respond in whisper to protect from spam
                local player
                if params[2] then
                    params[2] = trim(params[2])
                end
                if not params[2] or params[2] == "" then
                    player = playerName
                else
                    player = params[2]
                end
                local profile = ProfileManager:GetProfileByName(player)
                if not profile then
                    SendChatMessage("<CLM> Missing profile for player" .. tostring(player) .. ".", responseChannel, nil, target)
                    return
                end
                local rosters = {}
                if RaidManager:IsInActiveRaid() then
                    local raid = RaidManager:GetRaid()
                    if raid then
                        rosters["_"] = raid:Roster()
                    end
                else
                    rosters = RosterManager:GetRosters()
                end
                local rostersWithPlayer = {}
                for _, roster in pairs(rosters) do
                    if roster and roster:IsProfileInRoster(profile:GUID()) then
                        table.insert(rostersWithPlayer, roster)
                    end
                end
                if #rostersWithPlayer == 0 then
                    SendChatMessage("<CLM> " .. profile:Name() .. " not present in any roster.", responseChannel, nil, target)
                else
                    SendChatMessage("<CLM> " .. profile:Name() .. " standings in " .. #rostersWithPlayer .. " roster" .. ((#rostersWithPlayer == 1) and "" or "s") ..  ":", responseChannel, nil, target)
                end
                for _, roster in ipairs(rostersWithPlayer) do
                    local standings = roster:Standings(profile:GUID())
                    local weeklyGains = roster:GetCurrentGainsForPlayer(profile:GUID())
                    local weeklyCap = roster:GetConfiguration("weeklyCap")
                    if weeklyCap > 0 then
                        weeklyGains = weeklyGains .. " / " .. weeklyCap
                    end
                    SendChatMessage("<CLM> " .. RosterManager:GetRosterNameByUid(roster:UID()) .. ":  " .. standings .. " DKP (" .. weeklyGains .. " this week).", responseChannel, nil, target)
                end
            end
        end
    end))
end

CLM.GlboalChatMessageHandlers = GlboalChatMessageHandlers