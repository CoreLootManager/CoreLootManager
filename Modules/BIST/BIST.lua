local _, CLM = ...

local Comms = CLM.Interconnect.Comms
local OptionsData = {
    bist_input = "BIST",
    bist_input_multiline = "BIST",
    bist_select_values = { "NOJS OBDION"},
    bist_select_values_selected = "A",
    bist_select_values_count = 1,
    bist_select_values_substring = "ABCDEFGHIJKLMNOPQRSTUVW1234567890"
}

local BIST = {
    Comms = {
        status = { executed = false, passed = false },
        data = {
            message = "DUPA.8 1234567890 `~!@#$%^&*()_+=-[]{}'\"\\|;:/?.,><",
            distribution = CLM.CONSTANTS.COMMS.DISTRIBUTION.GUILD,
            sender = GetUnitName("player", false)
        }
    },
    Options = {
        options = {
            bist_header_1 = {
                type = "header",
                name = "hed0rzzz"
            },
            bist_input = {
                name = "some input",
                type = "input",
                set = function(i, v) OptionsData.bist_input = v end,
                get = function(i) return OptionsData.bist_input end
            },
            bist_description = {
                type = "description",
                name = "MY DESC",
                fontSize = "medium"
            },
            bist_input_multiline = {
                name = "some input multiline",
                type = "input",
                multiline = 5,
                set = function(i, v) OptionsData.bist_input_multiline = v end,
                get = function(i) return OptionsData.bist_input_multiline end
            },
            bist_header_2 = {
                type = "header",
                name = "A HEADER 123 qwertty"
            },
            bist_execute = {
                type = "execute",
                name = "EXECUTE ME",
                width = "full",
                func = function(i, v) print("EXECUTOR") end
            },
            bist_group = {
                type = "group",
                name = "Subgroup 1",
                args = {
                    bist_select =  {
                        type = "select",
                        name = "SELECT ME",
                        values = OptionsData.bist_select_values,
                        set = function(i, v) print("SELECT SETTER: " .. tostring(v)) OptionsData.bist_select_values_selected = v end,
                        get = function(i) print("SELECT GETTER") return OptionsData.bist_select_values_selected end
                    },
                    bist_execute_plus = {
                        type = "execute",
                        name = "+",
                        func = (function(i, v)
                            OptionsData.bist_select_values_count = OptionsData.bist_select_values_count + 1
                            if OptionsData.bist_select_values_count > 33 then
                                OptionsData.bist_select_values_count = 33
                            end
                            print(OptionsData.bist_select_values_count)
                            OptionsData.bist_select_values = {}
                            for j=1,OptionsData.bist_select_values_count do
                                local t = string.sub(OptionsData.bist_select_values_substring, j, j)
                                OptionsData.bist_select_values[j] = t
                                print(t)
                            end
                            CLM.Interconnect.ConfigManager:Refresh(CLM.CONSTANTS.CONFIGS.GROUP.BIST)
                        end)
                    },
                    bist_execute_minus = {
                        type = "execute",
                        name = "-",
                        func = (function(i, v)
                            OptionsData.bist_select_values_count = OptionsData.bist_select_values_count - 1
                            if OptionsData.bist_select_values_count < 1 then
                                OptionsData.bist_select_values_count = 1
                            end
                            print(OptionsData.bist_select_values_count)
                            OptionsData.bist_select_values = {}
                            for j=1,OptionsData.bist_select_values_count do
                                local t = string.sub(OptionsData.bist_select_values_substring, j, j)
                                OptionsData.bist_select_values[i] = t
                                print(t)
                            end
                            CLM.Interconnect.ConfigManager:Refresh(CLM.CONSTANTS.CONFIGS.GROUP.BIST)
                        end)
                    }
                }
            },
            bist_group2 = {
                type = "group",
                name = "Beniz",
                args = {
                    bist_header_ = {
                        type = "header",
                        name = "hed0rzzz"
                    },
                    bist_input = {
                        name = "Moar inputs",
                        type = "input",
                        set = function(i, v) OptionsData.bist_input = v end,
                        get = function(i) return OptionsData.bist_input end
                    },
                }
            },
            bist_group3 = {
                type = "group",
                name = "HAHAHA",
                args = {
                    bist_header_ = {
                        type = "header",
                        name = "hed0rzzz"
                    },
                    bist_input = {
                        name = "Moar inputs",
                        type = "input",
                        set = function(i, v) OptionsData.bist_input = v end,
                        get = function(i) return OptionsData.bist_input end
                    },
                }
            }
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
        CLM.LOG:Warning(s)
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

function BIST.Options:Run()
    CLM.LOG:Info("BIST.Options:Run()")
    CLM.Interconnect.ConfigManager:Register(CLM.CONSTANTS.CONFIGS.GROUP.BIST, self.options)
end

function BIST:Report()
    local report = "BIST Report:\n"
    report = report .. self.Comms:Report()
    CLM.LOG:Info(report)
end

function BIST:Run()
    CLM.LOG:Info("BIST:Run()")
    self.Comms:Run()
    self.Options:Run()
end

CLM.Interconnect.BIST = BIST