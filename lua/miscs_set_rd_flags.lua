--[[
    This script sets the RD flag in the DNS query to enable recursion.
    It is used to ensure that the DNS server can handle recursive queries.
]]

setLocal("0.0.0.0:53", {})
newServer({address = "1.1.1.1:53", pool="default"})


declareMetric("cust-qflag-rd0", "counter", "QFlag RD0 counter")
local function setRecursiveDesired(dq)
    if not dq.dh:getRD() then
        dq.dh:setRD(true)
        incMetric("cust-qflag-rd0", 1)
    end
    return DNSAction.None, ""
end

addAction(AllRule(), LuaAction(setRecursiveDesired))