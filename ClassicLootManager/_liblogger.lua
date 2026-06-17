-- Project-local LuaLS annotations for LibLogger.
-- Not loaded at runtime.

---@meta _

---@class LibLoggerSeverity
---@field TRACE number
---@field DEBUG number
---@field INFO number
---@field WARNING number
---@field ERROR number
---@field FATAL number

---@class LibLoggerInstance
---@field SEVERITY LibLoggerSeverity
---@field SEVERITY_LEVEL table
local LibLoggerInstance = {}

---@param fmt string
---@param ... any
function LibLoggerInstance:Message(fmt, ...) end

---@param fmt string
---@param ... any
function LibLoggerInstance:Trace(fmt, ...) end

---@param fmt string
---@param ... any
function LibLoggerInstance:Debug(fmt, ...) end

---@param fmt string
---@param ... any
function LibLoggerInstance:Info(fmt, ...) end

---@param fmt string
---@param ... any
function LibLoggerInstance:Warning(fmt, ...) end

---@param fmt string
---@param ... any
function LibLoggerInstance:Error(fmt, ...) end

---@param fmt string
---@param ... any
function LibLoggerInstance:Fatal(fmt, ...) end

---@param severity number
function LibLoggerInstance:SetSeverity(severity) end

---@return number
function LibLoggerInstance:GetSeverity() end

---@param verbosity boolean
function LibLoggerInstance:SetVerbosity(verbosity) end

---@return boolean
function LibLoggerInstance:GetVerbosity() end

---@param prefix string?
function LibLoggerInstance:SetPrefix(prefix) end

---@return string?
function LibLoggerInstance:GetPrefix() end

---@param object table
function LibLoggerInstance:SetDatabase(object) end

---@return table
function LibLoggerInstance:GetDatabase() end

---@param database table?
---@return LibLoggerInstance
function LibLoggerInstance:New(database) end
