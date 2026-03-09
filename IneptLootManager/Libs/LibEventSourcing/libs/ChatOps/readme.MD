# LibChatOps

```lua
local ChatOps = LibStub("ChatOps")

ChatOps.createAutoCompleteLink(
    linkText, --[[ string: the text in the link]]
    prefill, --[[ string: the prefilled text that should be put in the input box when the user clicks the link ]]
)

ChatOps.createCallbackLink(
    linkText, --[[ string: the text in the link]]
    callback, --[[ function: the function callback ]]
)

ChatOps.colorize(
    text, --[[ string: the text to be colorized ]]
    color, --[[ string: the color to use ARGB hexadecimal notation]]
)

```