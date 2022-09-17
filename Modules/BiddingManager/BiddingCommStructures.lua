-- ------------------------------- --
local define = LibDependencyInjection.createContext(...)

define.module("Models/BiddingCommSubmitBid", {"Constants/BidType", "Utils"}, function(resolve, BidType, Utils)

    local tonumber, setmetatable, type = tonumber, setmetatable, type


    local BiddingCommSubmitBid = {}
    function BiddingCommSubmitBid:New(valueOrObject, bidType)
        local isCopyConstructor = (type(valueOrObject) == "table")
        local o = isCopyConstructor and valueOrObject or {}

        setmetatable(o, self)
        self.__index = self

        if isCopyConstructor then return o end

        o.d = valueOrObject
        o.b = Utils.contains(BidType, bidType) and bidType or BidType.MAIN_SPEC

        return o
    end

    function BiddingCommSubmitBid:Bid()
        return self.d or 0
    end

    function BiddingCommSubmitBid:Type()
        return self.b or BidType.MAIN_SPEC
    end

    resolve(BiddingCommSubmitBid)
end)


define.module("Models/BiddingCommStructure", {"Models/BiddingCommSubmitBid", "Constants/BiddingCommType"}, function(resolve, BiddingCommSubmitBid, BiddingCommType)
local BiddingCommStructure = {}
function BiddingCommStructure:New(typeOrObject, data)
    local isCopyConstructor = (type(typeOrObject) == "table")

    local o = isCopyConstructor and typeOrObject or {}

    setmetatable(o, self)
    self.__index = self

    if isCopyConstructor then
        if o.t == BiddingCommType.SUBMIT_BID then
            o.d = BiddingCommSubmitBid:New(o.d)
        end
        return o
    end

    o.t = tonumber(typeOrObject) or 0
    o.d = data

    return o
end

function BiddingCommStructure:Type()
    return self.t or 0
end

function BiddingCommStructure:Data()
    return self.d
end
resolve(BiddingCommStructure)
end)