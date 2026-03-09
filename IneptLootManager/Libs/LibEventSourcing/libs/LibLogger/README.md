# LibLogger

LibLogger is a Lua library for efficiently logging and storing logs in WoW.

It supports python-like logging mechanisms.


## Usage:

```lua
local LibLogger = LibStub("LibLogger")
local Logger = LibLogger:New()
```

## API:
* **`Logger:New(database)`**

    Arguments:
    * `database`: (optional) table object to hold the entries.
                  Intended for setting WoW Saved Variable object 

    Returns:
    * `Logger`: LibLogger logger object

* **`Logger:Message(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

* **`Logger:Trace(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

* **`Logger:Info(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

* **`Logger:Warning(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

* **`Logger:Error(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

* **`Logger:Fatal(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

* **`Logger:Fatal(message, ...)`**

    Arguments:
    * `message`: message with formatting (see below)
    * `...` : a variable number of arguments

Note that message can contain any number of arguments that can be formated.
Number of variables need to correspond to the number of arguments.

* **`Logger:SetSeverity(severity)`**

    Arguments:
    * `severity`: Set logging severity to one of the provided levels (see below)  
        `LibLogger.SEVERITY.TRACE`  
        `LibLogger.SEVERITY.DEBUG`  
        `LibLogger.SEVERITY.INFO`  
        `LibLogger.SEVERITY.WARNING`  
        `LibLogger.SEVERITY.ERROR`  
        `LibLogger.SEVERITY.FATAL`  

* **`function LibLogger:GetSeverity()`**

    Returns:
    * `severity`: returns current severity level

In addition to `LibLogger.SEVERITY` there is also `LibLogger.SEVERITY_LEVEL` array for use with GUI that contains severity value and name.

* **`function Logger:SetVerbosity(verbosity)`**

    Arguments:
    * `verbosity`: `true` to print messages during logging, `false` otherwise

* **`function Logger:GetVerbosity()`**

    Returns:
    * `verbosity`: `true` if printing messages during logging, `false` otherwise

* **`function Logger:SetPrefix(prefix))`**

    Arguments:
    * `prefix`: set printed prefix to `prefix`. Set to `nil` to ignore

* **`function Logger:GetPrefix()`**

    Returns:
    * `prefix`: currently set `prefix` or `nil` if not set

* **`function Logger:SetDatabase(object)`**
    
    Arguments:
    * `object`: set the logging database to object. Currently logged entries are retained.  
               Intended for setting WoW Saved Variable object 

* **`function Logger:GetDatabase()`**

    Returns:
    * `database`: database table reference