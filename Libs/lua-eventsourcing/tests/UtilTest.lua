beginTests()


local Util = LibStub("EventSourcing/Util")


local int = Util.getIntegerGuid("player")
local guid = Util.getGuidFromInteger(int)

assertSame(guid, UnitGUID("player"))
printResultsAndExit()
