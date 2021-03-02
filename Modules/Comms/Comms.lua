-- local  _, CLM = ...

-- local Comms = CLM.core:NewModule("Comms", {}, "AceComm-3.0", "LibSerialize", "LibDeflate")

Comms = LibStub:NewLibrary("CLM/Modules/Comms", 1)
if not Comms then return end

local aceComm = LibStub('AceComm-3.0')

function Comms:getSend(prefix)
    return function(text, distribution, target, prio, callbackFn, callbackArg)
        -- CLM internal proxy implementation here
        -- Note that there is no prefix here.
        aceComm:SendAddonMessage(prefix, text, distribution, target, prio, callbackFn, callbackArg)
    end
end

function Comms:getReceiveHandlerRegister(prefix)
    return function(callback)
        aceComm:RegisterComm(prefix, function(_, message, distribution, sender)
            -- Authorize sender

            -- Do something else


            -- Send data to module

            callback(message, distribution, sender)

            -- Do something else after sending it to module

        end)
    end
end
