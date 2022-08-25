local proxy = {
    __metatable = false,
    __newindex = function ()
        error("Can't write to proxy table!")
    end,

    __index = function(table, key)
        local result = _G[key]
        if (result == nil) then
            error(string.format("Attempt to access undefined global %s"), key)
        end
        return result
    end

}

local timeInMs
-- if (type(os.clock) == 'function') then
--     timeInMs = function()
--         return os.clock()
--     end
-- else
    timeInMs = function()
        return debugprofilestop()
    end
-- end

local function profileFunction(f, dataStore, functionName)
    return function(...)
        dataStore.count = dataStore.count + 1
        local start = timeInMs()
        local result = {f(...)}
        local duration = timeInMs() - start
        dataStore.totalTime = dataStore.totalTime + duration
        if dataStore.max < duration then
            dataStore.max = duration
        end
        if dataStore.min > duration then
            dataStore.min = duration
        end

        return unpack(result)
    end

end

local profilingProxy

profilingProxy = {
    __metatable = false,
    -- __newindex = function ()
    --     error("Can't write to proxy table!")
    -- end,
    __newindex = function(table, key, value)
        table.__reference[key] = value
    end,
    __index = function(table, key)
        -- print("PP __index", table, key)
        local value = table.__reference[key]
        -- if (value == nil) then
            -- error(string.format("Attempt to access undefined value %s", key))
        -- end
        local result = value

        --use profiling
        local valueType = type(value)
        local profileKey = table.__keyprefix .. '.'  .. tostring(key)
        if (valueType == "function") then
            local store = table.__profiling[profileKey]
            if (store == nil) then
                store = {
                    count = 0,
                    totalTime = 0,
                    min = 1000000,
                    max = -1
                }
                table.__profiling[profileKey] = store
            end
            result = profileFunction(value, store, key)

        elseif (valueType == "table") then
            -- simple recursion, we create a proxy for the table
            -- we set the profiling data table to be the primary one.
            local proxyTable = {
                __profiling = table.__profiling,
                __keyprefix = table.__keyprefix .. '.' .. key,
                __reference = value
            }
            setmetatable(proxyTable, profilingProxy);
            result = proxyTable
        end


        -- cache the proxied value
        -- rawset(table, key, result)
        return result
    end

}


function ProfilerProxy_CreateProxy()
    local result = {}
    setmetatable(result, proxy);
    return result
end

function ProfilerProxy_CreateProfilingProxy(tableToProxy)
    local result = {
        __profiling = {},
        __keyprefix = "",
        __reference = tableToProxy or _G
    }
    setmetatable(result, profilingProxy);
    return result
end

local profilingProxyNonRecursive = {
    __metatable = false,
    __newindex = function(table, key, value)
        table.__reference[key] = value
    end,
    __index = function(table, key)
        local value = table.__reference[key]
        -- if (value == nil) then
            -- error(string.format("Attempt to access undefined value %s", key))
        -- end
        local result = value
    
        local profileKey = table.__keyprefix .. '.'  .. tostring(key)
        if (type(value) == "function") then
            local store = table.__profiling[profileKey]
            if (store == nil) then
                store = {
                    count = 0,
                    totalTime = 0,
                    min = 1000000,
                    max = -1
                }
                table.__profiling[profileKey] = store
            end
            result = profileFunction(value, store, key)
        end

        return result
    end

}

function ProfilerProxy_CreateProfilingProxyNonRecursive(tableToProxy)
    local result = {
        __profiling = {},
        __keyprefix = "",
        __reference = tableToProxy or {}
    }
    setmetatable(result, profilingProxyNonRecursive)
    return result
end