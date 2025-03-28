
-- dnsdist edge

-- enable proxy protocol
newServer({ 
	useProxyProtocol=true,
})

-- add more value, ex: local ip of the dnsdist
function addProxyProtocolValues(dq)
  dq:addProxyProtocolValue(1, dq.localaddr:tostring() )
  return DNSAction.None
end

-- add proxy value on all queries
addAction(AllRule(),LuaAction(addProxyProtocolValues))
