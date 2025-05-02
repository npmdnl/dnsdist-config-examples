
setLocal("0.0.0.0:53", {})

webserver("0.0.0.0:8080")
setWebserverConfig({  acl="0.0.0.0/0", password="changeme",  apiKey="changeme", hashPlaintextCredentials=true, apiRequiresAuthentication=false})

pool_resolv = "resolvers"

-- will result with dynamic pool creation 
-- 0	one.one.one.one#1.0.0.1	1.0.0.1:53	up	-	-	0	0	0.00	0	1	1	resolvers
-- 1	one.one.one.one#1.1.1.1	1.1.1.1:53	up	-	-	0	0	0.00	0	1	1	resolvers
-- 2	dns.google#8.8.4.4	8.8.4.4:53	up	-	-	0	0	0.00	0	1	1	resolvers
-- 3	dns.google#8.8.8.8	8.8.8.8:53	up	-	-	0	0	0.00	0	1	1	resolvers

resolver = require 'dnsdist-resolver'
resolver.servers['dns.google'] = {pool=pool_resolv}
resolver.servers['one.one.one.one'] = {pool=pool_resolv}

maintenance = resolver.maintenance


addAction( AllRule(),  PoolAction(pool_resolv) )
