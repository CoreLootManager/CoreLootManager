--[[
    UIFade.lua Copyright (c) 2022 Sebastian Lindfors (Munk)
    https://github.com/seblindfors/ConsolePort/blob/master/ConsolePort/Utils/UIFade.lua
]]

local  _, CLM = ...

local FADE = CreateFrame('Frame')

function FADE:Remove(frame)
    tDeleteItem(self, frame)
end

function FADE:Add(frame, fadeInfo)
    frame:SetAlpha(fadeInfo.startAlpha)
    frame.fadeInfo = fadeInfo

    local index = 1
    while self[index] do
        -- If frame is already set to fade then return
        if self[index] == frame then
            return
        end
        index = index + 1
    end
    tinsert(self, frame)
    self:SetScript('OnUpdate', self.Update)
end

function FADE:Update(elapsed)
    local index = 1
    local frame, fadeInfo
    while self[index] do
        frame = self[index]
        fadeInfo = self[index].fadeInfo
        -- Reset the timer if there isn't one, this is just an internal counter
        if ( not fadeInfo.fadeTimer ) then
            fadeInfo.fadeTimer = 0
        end
        fadeInfo.fadeTimer = fadeInfo.fadeTimer + elapsed

        -- If the fadeTimer is less then the desired fade time then set the alpha otherwise hold the fade state, call the finished function, or just finish the fade
        if fadeInfo.fadeTimer < fadeInfo.timeToFade then
            if fadeInfo.mode == 'IN' then
                frame:SetAlpha((fadeInfo.fadeTimer / fadeInfo.timeToFade) * (fadeInfo.endAlpha - fadeInfo.startAlpha) + fadeInfo.startAlpha)
            elseif fadeInfo.mode == 'OUT' then
                frame:SetAlpha(((fadeInfo.timeToFade - fadeInfo.fadeTimer) / fadeInfo.timeToFade) * (fadeInfo.startAlpha - fadeInfo.endAlpha)  + fadeInfo.endAlpha)
            end
        else
            frame:SetAlpha(fadeInfo.endAlpha)
            -- If there is a fadeHoldTime then wait until its passed to continue on
            if fadeInfo.fadeHoldTime and fadeInfo.fadeHoldTime > 0  then
                fadeInfo.fadeHoldTime = fadeInfo.fadeHoldTime - elapsed
            else
                -- Complete the fade and call the finished function if there is one
                self:Remove(frame)
                if fadeInfo.finishedFunc then
                    fadeInfo.finishedFunc(fadeInfo.finishedArg1, fadeInfo.finishedArg2, fadeInfo.finishedArg3, fadeInfo.finishedArg4)
                    fadeInfo.finishedFunc = nil
                end
            end
        end

        index = index + 1
    end

    if #self == 0 then
        self:SetScript('OnUpdate', nil)
    end
end

-- -- Convenience function for simple fade in
-- db('Alpha/FadeIn', function (frame, timeToFade, startAlpha, endAlpha, info)
--     if not frame then return end
--     local fadeInfo = info or {}
--     fadeInfo.mode = 'IN'
--     fadeInfo.timeToFade = timeToFade
--     fadeInfo.startAlpha = startAlpha or 0.0
--     fadeInfo.endAlpha = endAlpha or 1.0
--     FADE:Add(frame, fadeInfo)
-- end)

-- -- Convenience function for simple fade out
-- db('Alpha/FadeOut', function (frame, timeToFade, startAlpha, endAlpha, info)
--     if not frame then return end
--     local fadeInfo = info or {}
--     fadeInfo.mode = 'OUT'
--     fadeInfo.timeToFade = timeToFade
--     fadeInfo.startAlpha = startAlpha or 1.0
--     fadeInfo.endAlpha = endAlpha or 0.0
--     FADE:Add(frame, fadeInfo)
-- end)

CLM.UTILS.FadeIn = (function (frame, timeToFade, startAlpha, endAlpha, info)
    if not frame then return end
    local fadeInfo = info or {}
    fadeInfo.mode = 'IN'
    fadeInfo.timeToFade = timeToFade
    fadeInfo.startAlpha = startAlpha or 0.0
    fadeInfo.endAlpha = endAlpha or 1.0
    FADE:Add(frame, fadeInfo)
end)

CLM.UTILS.FadeOut = (function (frame, timeToFade, startAlpha, endAlpha, info)
    if not frame then return end
    local fadeInfo = info or {}
    fadeInfo.mode = 'OUT'
    fadeInfo.timeToFade = timeToFade
    fadeInfo.startAlpha = startAlpha or 1.0
    fadeInfo.endAlpha = endAlpha or 0.0
    FADE:Add(frame, fadeInfo)
end)

-- -- Convenience function for localizing both faders
-- db('Alpha/Fader', setmetatable({
--         In  = db('Alpha/FadeIn');
--         Out = db('Alpha/FadeOut');
--         Toggle = function(region, timeToFade, toggle)
--             if toggle then
--                 region:Show()
--                 db('Alpha/FadeIn')(region, timeToFade, region:GetAlpha(), 1)
--             else
--                 db('Alpha/FadeOut')(region, timeToFade * 2, region:GetAlpha(), 0, {
--                     finishedFunc = region.Hide;
--                     finishedArg1 = region;
--                 })
--             end
--         end;
--     }, {
--     __call = function(self, type, ...)
--         local func = type == 'in' and self.In or type == 'out' and self.Out
--         return func(...)
--     end;
-- }))

---------------------------------------------------------------
-- Flash: Taint-free flash functions
---------------------------------------------------------------
local FLASH = CreateFrame('FRAME')

local FlashTimers = {}
local FlashTimerRefCount = {}

-- Function to stop flashing
function FLASH:Stop(frame, alpha)
    tDeleteItem(self, frame)
    frame:SetAlpha(alpha or 1.0)
    frame.flashTimer = nil
    if frame.syncId then
        FlashTimerRefCount[frame.syncId] = FlashTimerRefCount[frame.syncId]-1
        if FlashTimerRefCount[frame.syncId] == 0 then
            FlashTimers[frame.syncId] = nil
            FlashTimerRefCount[frame.syncId] = nil
        end
        frame.syncId = nil
    end
    if frame.showWhenDone then
        frame:Show()
    else
        frame:Hide()
    end
end

-- Called every frame to update flashing frames
function FLASH:Update(elapsed)
    local frame
    local index = #self

    -- Update timers for all synced frames
    for syncId, timer in pairs(FlashTimers) do
        FlashTimers[syncId] = timer + elapsed
    end

    while index > 0 and self[index] do
        frame = self[index]
        frame.flashTimer = frame.flashTimer + elapsed

        if (frame.flashTimer > frame.flashDuration) and frame.flashDuration ~= -1 then
            self:Stop(frame)
        else
            local flashTime = frame.flashTimer
            local alpha

            if frame.syncId then
                flashTime = FlashTimers[frame.syncId]
            end

            flashTime = flashTime%(frame.fadeInTime+frame.fadeOutTime+(frame.flashInHoldTime or 0)+(frame.flashOutHoldTime or 0))
            if flashTime < frame.fadeInTime then
                alpha = flashTime/frame.fadeInTime
            elseif flashTime < frame.fadeInTime+(frame.flashInHoldTime or 0) then
                alpha = 1
            elseif flashTime < frame.fadeInTime+(frame.flashInHoldTime or 0)+frame.fadeOutTime then
                alpha = 1 - ((flashTime - frame.fadeInTime - (frame.flashInHoldTime or 0))/frame.fadeOutTime)
            else
                alpha = 0
            end

            frame:SetAlpha(alpha)
            frame:Show()
        end

        -- Loop in reverse so that removing frames is safe
        index = index - 1
    end

    if #self == 0 then
        self:SetScript('OnUpdate', nil)
    end
end

CLM.UTILS.StopFlash = FLASH.Stop
-- db('Alpha/Stop', function(frame, alpha)
--     FLASH:Stop(frame, alpha)
-- end)

-- -- Function to start a frame flashing
CLM.UTILS.StartFlash = function(frame, fadeInTime, fadeOutTime, flashDuration, showWhenDone, flashInHoldTime, flashOutHoldTime, syncId)
    if frame then
        local index = 1
        -- If frame is already set to flash then return
        while FLASH[index] do
            if FLASH[index] == frame then
                return
            end
            index = index + 1
        end

        if syncId then
            frame.syncId = syncId
            if FlashTimers[syncId] == nil then
                FlashTimers[syncId] = 0
                FlashTimerRefCount[syncId] = 0
            end
            FlashTimerRefCount[syncId] = FlashTimerRefCount[syncId]+1
        else
            frame.syncId = nil
        end

        -- Time it takes to fade in a flashing frame
        frame.fadeInTime = fadeInTime
        -- Time it takes to fade out a flashing frame
        frame.fadeOutTime = fadeOutTime
        -- How long to keep the frame flashing
        frame.flashDuration = flashDuration
        -- Show the flashing frame when the fadeOutTime has passed
        frame.showWhenDone = showWhenDone
        -- Internal timer
        frame.flashTimer = 0
        -- How long to hold the faded in state
        frame.flashInHoldTime = flashInHoldTime
        -- How long to hold the faded out state
        frame.flashOutHoldTime = flashOutHoldTime

        tinsert(FLASH, frame)

        FLASH:SetScript('OnUpdate', FLASH.Update)
    end
end