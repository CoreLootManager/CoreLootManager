local _, CLM = ...

local Comms = CLM.Interconnect.Comms

local BIST = {
    Comms = {
        status = { executed = false, passed = false },
        data = {
            message = "DUPA.8 1234567890 `~!@#$%^&*()_+=-[]{}'\"\\|;:/?.,><",
            distribution = CLM.CONSTANTS.COMMS.DISTRIBUTION.GUILD,
            sender = GetUnitName("player", false)
        }
    }
}

function BIST.Comms:Run()
    CLM.LOG:Info("BIST.Comms:Run()")
    Comms:Register("BIST_Comms", function(m,d,s) BIST.Comms:Complete(m, d, s) end, 0)
    Comms:Send("BIST_Comms", self.data.message, self.data.distribution)
    self.status.executed = true
end

function BIST.Comms:Complete(message, distribution, sender)
    CLM.LOG:Info("BIST.Comms:Complete()")
    if self.data.message == message and
       self.data.distribution == distribution and
       self.data.sender == sender then
        self.status.passed = true
    else
        local s = self.data.message .. " != " .. message .. "\n"
        s = s .. self.data.distribution .. " != " .. distribution .. "\n"
        s = s..self.data.sender .. " != " .. sender .. "\n"
        LOG:Warning(s)
    end
end

function BIST.Comms:Report()
    local report = "  Comms: "
    if self.status.executed then
        report = report .. "executed " .. (self.status.passed and "PASS" or "FAIL")
    else
        report = report .. "not executed"
    end
    return report .. "\n" 
end

function BIST:Report()
    local report = "BIST Report:\n"
    report = report .. self.Comms:Report()
    CLM.LOG:Info(report)
end

function BIST:Run()
    CLM.LOG:Info("BIST:Run()")
    self.Comms:Run()
end

CLM.Interconnect.BIST = BIST