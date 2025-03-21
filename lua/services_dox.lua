setLocal("0.0.0.0:53", {})
setACL({"0.0.0.0/0", "::/0"})

addTLSLocal('0.0.0.0:853', '/etc/dnsdist/cert.pem', '/etc/dnsdist/key.pem')
addDOQLocal('0.0.0.0:853', '/etc/dnsdist/cert.pem', '/etc/dnsdist/key.pem')
addDOH3Local('0.0.0.0:443', '/etc/dnsdist/cert.pem', '/etc/dnsdist/key.pem')

newServer({address = "8.8.8.8", pool = "default"})

addAction(AllRule(),PoolAction("default"))
