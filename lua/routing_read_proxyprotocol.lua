
-- list netmask or ip to 
setLocal('0.0.0.0:53', { reusePort=true, enableProxyProtocol=true })
setProxyProtocolACL({'192.168.1.17/32'})

nmg = newNMG()
nmg:addMask("192.168.1.251/32")

addAction(AndRule({NetmaskGroupRule(nmg,true,true),ProxyProtocolValueRule(1, "192.168.1.17")}), PoolAction("google"))
addAction(AllRule(), RCodeAction(DNSRCode.REFUSED))

