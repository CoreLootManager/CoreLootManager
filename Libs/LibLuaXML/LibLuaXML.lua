--
-- Copyright (c) 2022 Lantis
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

-- To an extent leveraged json.lua encode flow with stack trace

if LibStub == nil then
    error("LibLuaXML requires LibStub")
end

local XML = LibStub:NewLibrary("LibLuaXML", 1)

if XML == nil then return end

-------------------------------------------------------------------------------
-- Encode
-------------------------------------------------------------------------------

local encode

local escape_char_map = {
    [ "<" ] = "&lt;",
    [ ">" ] = "&gt;",
    [ "&" ] = "&amp;",
    [ "\""] = "&quot;",
    [ "'" ] = "&apos;",
}

local escape_char_map_inv = {}
for k, v in pairs(escape_char_map) do
    escape_char_map_inv[v] = k
end

local function escape_char(c)
    return (escape_char_map[c] or string.format("u%04x", c:byte()))
end

local function set_node(val, node)
    return "<" .. node .. ">" .. val .. "</" .. node .. ">"
end

local function encode_nil(val, node)
    return set_node("", node)
end


local function encode_table(val, node, stack)
    local output = ""
    stack = stack or {}

    -- Circular reference?
    if stack[val] then error("circular reference") end

    stack[val] = true

    if rawget(val, 1) ~= nil or next(val) == nil then
        -- Treat as array -- check keys are valid and it is not sparse
        local n = 0
        for k in pairs(val) do
            if type(k) ~= "number" then
                error("invalid table: mixed or invalid key types")
            end
            n = n + 1
        end
        if n ~= #val then
            error("invalid table: sparse array")
        end
        -- Encode
        for i, v in ipairs(val) do
            output = output .. encode(v, node, stack)
        end
        stack[val] = nil
    else
        -- Treat as an object
        for k, v in pairs(val) do
            if type(k) ~= "string" then
                error("invalid table: mixed or invalid key types")
            end
            output = output .. encode(v, k, stack)
        end
        stack[val] = nil
        output = set_node(output, node)
    end
    return output
end


local function encode_string(val, node)
    return set_node(val:gsub('[%z\1-\31\\"\'<>&]', escape_char), node)
end


local function encode_number(val, node)
    -- Check for NaN, -inf and inf
    if val ~= val or val <= -math.huge or val >= math.huge then
        error("unexpected number value '" .. tostring(val) .. "'")
    end
    return set_node(string.format("%.14g", val), node)
end


local type_func_map = {
    [ "nil"     ] = encode_nil,
    [ "table"   ] = encode_table,
    [ "string"  ] = encode_string,
    [ "number"  ] = encode_number,
    [ "boolean" ] = tostring,
}


encode = function(val, node, stack)
    local t = type(val)
    local f = type_func_map[t]
    if f then
        return f(val, node, stack)
    end
    error("unexpected type '" .. t .. "'")
end


function XML.encode(val)
    return ( encode(val, "xml") )
end
