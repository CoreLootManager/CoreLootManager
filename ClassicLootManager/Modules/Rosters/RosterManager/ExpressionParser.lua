-- ------------------------------- --
local  _, CLM = ...
-- ------------------------------- --

-- Constants
local OPERATION_TYPE = {
    OR = 1,
    AND = 2
}


-- Private Methods
local function verifyPattern(expression, operationType, patterns, errorMessage, errors)
    if operationType == OPERATION_TYPE.OR then
        for _, pattern in ipairs(patterns) do
            if expression:match(pattern) then
                errors[#errors + 1] = errorMessage
                return
            end
        end
    elseif operationType == OPERATION_TYPE.AND then
        for _, pattern in ipairs(patterns) do
            if not expression:match(pattern) then
                return
            end
        end
        errors[#errors + 1] = errorMessage
    else
        error("Invalid operation type: " .. operationType)
    end
end

local function verifyConditions(expression, conditions, errors)
    for _, condition in ipairs(conditions) do
        verifyPattern(expression, condition[1], condition[2], condition[3], errors)
    end
end

local function verifyAllTextIsVariableNames(expression, variables, errors)
    local errorMessage = CLM.L["Expression may only contain the pre-defined variables"]

    local variableValues = {}
    for _, value in pairs(variables) do
        variableValues[value] = true
    end

    local nonOperatorParenthesisOrNumber = "[^%+%-%/%*%^%(%)%d%.]+"
    for word in expression:gmatch(nonOperatorParenthesisOrNumber) do
        if not variableValues[word] then
            errors[#errors + 1] = errorMessage
            return
        end
    end
end

local function verifyParenthesisAreBalanced(expression, errors)
    local errorMessage = CLM.L["Expression has unbalanced parentheses"]

    local nestDepth = 0
    for i = 1, #expression do
        local c = expression:sub(i, i)
        if c == '(' then
            nestDepth = nestDepth + 1
        elseif c == ')' then
            nestDepth = nestDepth - 1
        end
        if nestDepth < 0 then
            errors[#errors + 1] = errorMessage
            return
        end
    end
    if nestDepth ~= 0 then
        errors[#errors + 1] = errorMessage
    end
end

local function tokenize(input)
    local tokens = {}
    local currentToken = ""
    local index = 1;
    for char in input:gmatch(".") do
        if char:match("[%d%.]") or (char:match("-") and not currentToken:match("[%d]$")) then
            -- gathering token parts
            currentToken = currentToken .. char
        else
            -- write current token
            currentToken = currentToken:gsub("%-%-", "") -- correction for negative numbers
            tokens[index] = currentToken
            currentToken = ""
            index = index + 1

            -- write new token
            tokens[index] = char
            index = index + 1
        end
    end
    if currentToken ~= "" then
        tokens[index] = currentToken
    end
    return tokens
end

local function processOperator(tokens, process)
    for i, token in ipairs(tokens) do
        if process[token] then
            local j = i - 1
            while tokens[j] == "" do
                j = j - 1
            end
            local left = tonumber(tokens[j])
            local right = tonumber(tokens[i + 1])
            local result = process[token](left, right)
            tokens[j] = result
            tokens[i] = ""
            tokens[i + 1] = ""
        end
    end
end

local function solve(eq)

    while eq:find("%b()") do
        eq = eq:gsub("%b()", function(block)
            local inner = block:sub(2, -2)
            return tostring(solve(inner))
        end)
    end

    local tokens = tokenize(eq)
    processOperator(tokens, {
        ["^"] = function(left, right) return left ^ right end
    })
    processOperator(tokens, {
        ["*"] = function(left, right) return left * right end,
        ["/"] = function(left, right) return left / right end
    })
    processOperator(tokens, {
        ["+"] = function(left, right) return left + right end,
        ["-"] = function(left, right) return left - right end
    })

    return tonumber(tokens[1])
end

local function replaceVariablesWithValues(expression, variables)
    -- Sort the variables by length to avoid replacing substrings
    local variableNames = {}
    for variableName in pairs(variables) do
        table.insert(variableNames, variableName)
    end
    table.sort(variableNames, function(a, b)
        return #a > #b
    end)
    for _, variableName in ipairs(variableNames) do
        local value = variables[variableName]
        expression = expression:gsub(variableName, value)
    end
    return expression
end


-- Public methods
ExpressionParser = {}
function ExpressionParser:IsValidExpression(expression, variables)
    local cleanedExpression = string.lower(expression:gsub("%s+", ""))
    local errors = {}

    if #cleanedExpression == 0 then
        errors[#errors + 1] = CLM.L["Expression is empty."]
        return false, errors
    end

    local failureConditions = {
        { OPERATION_TYPE.OR, { "^[%+%/%*%^]", "^[%-][%-]" },                                        CLM.L["Expression may not start on an operator."] },
        { OPERATION_TYPE.OR, { "[%+%-%/%*%^]$" },                                                   CLM.L["Expression may not end on an operator."] },
        { OPERATION_TYPE.OR, { "[%+%-%/%*%^][%+%/%*%^]", "[%+%-%/%*%^][%+%-%/%*%^][%+%-%/%*%^]" },  CLM.L["Expression may not contain more than one operator in a row."] },
        { OPERATION_TYPE.OR, { "[%+%-%/%*%^][%)]" },                                                CLM.L["Expression may not contain an operator before a closing parenthesis."] },
        { OPERATION_TYPE.OR, { "[%(][%)]" },                                                        CLM.L["Expression may not contain empty parenthesis."] },
        { OPERATION_TYPE.OR, { "[%d%a][%(]" },                                                      CLM.L["Expression may not contain a non-operator/non-parenthesis before an opening parenthesis."] },
        { OPERATION_TYPE.OR, { "^%.", "[^%d]%." },                                                  CLM.L["A decimal point must be preceded by a digit."] },
        { OPERATION_TYPE.OR, { "%.$", "%.[^%d]" },                                                  CLM.L["A decimal point must be followed by a digit."] },
        { OPERATION_TYPE.OR, { "%d+%.%d+%." },                                                      CLM.L["A number cannot contain multiple decimal points."] }
    }

    verifyConditions(cleanedExpression, failureConditions, errors)
    verifyAllTextIsVariableNames(cleanedExpression, variables, errors)
    verifyParenthesisAreBalanced(cleanedExpression, errors)

    return #errors == 0, errors
end

function ExpressionParser:Evaluate(expression, variables)
    local cleanedExpression = string.lower(expression:gsub("%s+", ""))
    return solve(replaceVariablesWithValues(cleanedExpression, variables))
end




-- Testing

local function testIsValidExpression(showPassedTests)
    local function toResultText(result)
        if result then
            return "PASSED"
        else
            return "FAILED"
        end
    end

    local variables = {
        ["a"] = "a",
        ["b"] = "b",
        ["ab"] = "ab",
        ["hello"] = "hello"
    }
    local tests = {
        -- start with, end with, or only operator
        ["+"] = false,
        ["+a"] = false,
        ["a+"] = false,
        ["-"] = false,
        ["-a"] = true,
        ["--a"] = false,
        ["---a"] = false,
        ["a-"] = false,
        ["/"] = false,
        ["/a"] = false,
        ["a/"] = false,
        ["*"] = false,
        ["*a"] = false,
        ["a*"] = false,
        ["^"] = false,
        ["^a"] = false,
        ["a^"] = false,

        -- Repeating operator
        ["a++b"] = false,
        ["a--b"] = true,
        ["a---b"] = false,
        ["a+--b"] = false,
        ["a--+b"] = false,
        ["a//b"] = false,
        ["a**b"] = false,
        ["a^^b"] = false,
        ["a+-b"] = true,
        ["a^-b"] = true,
        ["a*-b"] = true,
        ["a/-b"] = true,
        ["a-/b"] = false,
        ["a/*b"] = false,
        ["a*^b"] = false,
        ["a^+b"] = false,

        -- operator before closing parenthesis
        ["(a+)"] = false,
        ["(a-)"] = false,
        ["(a/)"] = false,
        ["(a*)"] = false,
        ["(a^)"] = false,

        -- empty parenthesis
        ["()"] = false,
        ["a^()"] = false,
        ["ab+()"] = false,
        ["(a)"] = true,
        ["(a+b)"] = true,

        -- non-operator before opening parenthesis
        ["a(b)"] = false,
        ["1(1)"] = false,
        ["a+(b)"] = true,
        ["1+(1)"] = true,

        -- text
        ["abc"] = false,
        ["ab+c"] = false,
        ["c"] = false,
        ["ab"] = true,
        ["a+b"] = true,
        ["a"] = true,

        -- parenthesis balancing
        [")("] = false,
        ["(a"] = false,
        ["a)"] = false,
        ["(a))"] = false,
        ["((a)"] = false,
        ["((a))"] = true,

        -- special characters
        ["d_e"] = false,
        ["§"] = false,

        -- empty expression
        [""] = false,

        -- floating point
        ["1.1"] = true,
        ["1.1+1.1"] = true,
        ["1.1+(1.1)"] = true,
        ["(1.1)"] = true,
        ["(1.1+1.1)"] = true,
        ["(1.1+(1.1))"] = true,
        [".1"] = false,
        ["1."] = false,
        ["."] = false,
        ["1.1."] = false,
        ["1.1.1"] = false,
        ["1.1.1+1.1.1"] = false,
        ["1.1.1+(1.1.1)"] = false,
        ["(1.1.1)"] = false,
        ["(1.1.1+1.1.1)"] = false,
        ["(1.1.1+(1.1.1))"] = false,

        -- negative numbers
        ["-1"] = true,
        ["1--1"] = true,
        ["1*-1"] = true,
        ["1^-1"] = true,
        ["1/-1"] = true,
        ["1+-1"] = true,
        ["(-1)"] = true,

        -- random positive cases
        ["a+b"] = true,
        ["ab"] = true,
        ["b^(a)"] = true,
        ["b^(1)"] = true,
        ["10^(1)"] = true,
        ["((3)/1)"] = true,
        ["ab+(b)"] = true,
        ["(a)"] = true,
        ["-1+1*2^3+4/5-6+(3-4)^((5+6)+(2^(-3+9)))+a"] = true
    }

    local maxTestLength = 0
    for test, _ in pairs(tests) do
        if #test > maxTestLength then
            maxTestLength = #test
        end
    end
    local headerPadding = string.rep(" ", maxTestLength - #("TEST"))

    print("TEST" .. headerPadding, "OUTPUT", "TEST RESULT")
    print("----" .. headerPadding, "------", "-----------")

    local passedTestsCount = 0
    local totalTestsCount = 0
    for _ in pairs(tests) do
        totalTestsCount = totalTestsCount + 1
    end
    for test, expected in pairs(tests) do
        local result, errors = ExpressionParser:IsValidExpression(test, variables)
        local pass = result == expected
        if pass then
            passedTestsCount = passedTestsCount + 1
        end

        if not pass or showPassedTests then
            local padding = string.rep(" ", maxTestLength - #test)
            print(test .. padding, result, toResultText(pass))
            print(table.concat(errors, ", "))
        end
    end

    print("Passed tests: " .. passedTestsCount .. "/" .. totalTestsCount)
end

local function testEvaluate(showPassedTests)
    local function toResultText(result)
        if result then
            return "PASSED"
        else
            return "FAILED"
        end
    end

    local variables = {
        ["a"] = "1",
        ["b"] = "2",
        ["c"] = "3"
    }
    local tests = {
        ["1+1"] = 2,
        ["1+1*2"] = 3,
        ["-1+1*2^3+4/5-6+(3-4)^((5+6)+(2^(-3+9)))+a"] = 1.8,
        ["-(1-3)*2"] = 4
    }

    local maxTestLength = 0
    for test, _ in pairs(tests) do
        if #test > maxTestLength then
            maxTestLength = #test
        end
    end
    local headerPadding = string.rep(" ", maxTestLength - #("TEST"))

    print("TEST" .. headerPadding, "OUTPUT", "TEST RESULT")
    print("----" .. headerPadding, "------", "-----------")

    local passedTestsCount = 0
    local totalTestsCount = 0
    for _ in pairs(tests) do
        totalTestsCount = totalTestsCount + 1
    end
    for test, expected in pairs(tests) do
        local result = ExpressionParser:Evaluate(test, variables)
        local pass = tostring(result) == tostring(expected)
        if pass then
            passedTestsCount = passedTestsCount + 1
        end

        if not pass or showPassedTests then
            local padding = string.rep(" ", maxTestLength - #test)
            print(test .. padding, result, toResultText(pass))
        end
    end

    print("Passed tests: " .. passedTestsCount .. "/" .. totalTestsCount)

end

-- testIsValidExpression(false)
-- testEvaluate(false)