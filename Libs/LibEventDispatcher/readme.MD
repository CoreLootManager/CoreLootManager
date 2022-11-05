# LibEventDispatcher

```lua
-- This is a singleton.
local EventDispatcher = LibStub("EventDispatcher")

EventDispatcher.addEventListener(
    eventName , --[[ string: the name of the event ]]
    callbackFunc, --[[ function(table): the callback function, the argument is the data passed by the sender ]]
    prepend, --[[ bool: whether to prepend the event handler or append (default) it to the list of handlers ]]
)

EventDispatcher.dispatchEvent(
    eventName , --[[ string: the name of the event ]]
    data --[[ table|nil: data to make available to the event handlers, this is optional ]]
)

```

# Asynchronous events
While the current implementation handles events synchronously, this will change in the future.
Therefore a caller MUST NOT assume any or all handlers have executed when the function returns.
Future implementations will:
- Call the functions asynchronously
- Throttle event handlers to prevent frame lag

# Data
It is recommended that the data table passed to the event handler contains everything a handler might need:
- Relevant data
- Relevant functions if you want to expose some kind of API to the event handlers

## Example

Suppose we want to throw an event to indicate that an auction has started, the table might look like the code below.
Note: this code is for illustration purposes only, it is highly recommended that you properly encapsulate stuff to make it read only.
If you do not, one handler could change the data another handler sees. On the other hand this could also be seen as a feature.
One could for example register an event handler that hooks the `bid` function and logs it, so players may analyze their historical bid behavior or something like that.


```lua
local data = {
    item = someItemReference,
    min = 5,
    max = 15,
    bid = function(amount) ... end,
    pass = function() ... end,
    endTime = GetServerTime() + 30
}

EventDispatcher.dispatchEvent("AUCTION_STARTED", data))

```



