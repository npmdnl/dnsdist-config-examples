# Configurations for DNSdist

Configuration examples for DNSdist PowerDNS

**Default configuration provided**:

- Default configuration provided by PowerDNS [LUA](./lua/default_config.lua)

**Admin**:

- Enable web admin and console interfaces [YAML](./yaml/admin_config.yml) / [LUA](./lua/admin_config.lua)

**DoX services**:

- Enable DoT, DoH, DoQ, ... [YAML](./yaml/services_dox.yml) / [LUA](./lua/services_dox.lua)

**Routing DNS traffic**:

- Match Qname with regular expression [YAML](./yaml/routing_regex.yml) / [LUA](./lua/routing_regex.lua)
- Tag your traffic and applied specified rules on it [YAML](./yaml/routing_tag_traffic.yml) / [LUA](./lua/routing_tag_traffic.lua)
- Match your traffic from ECS client subnet [LUA](./lua/decode_ecs.lua)
- Passing source IP client with ProxyProtocol [LUA](./lua/routing_add_proxyprotocol.lua)

**Security configuration**:

- [Ads/Malwares blocking with external CDB database](./lua/security_blacklist_cdb.lua)
- [DNS tunneling blocking](./lua/security_blocking_dnstunneling.lua)
- [Blackhole/spoofing domains with external files](./lua/security_blackhole_domains.lua)
- [Blacklist IP addresses with DNS UPDATE control and dynamic blocking duration](./lua/security_blacklist_ip_dnsupdate.lua)
- [Blacklist IP during XX seconds, the list of IPs is managed with DNS notify and TTL for duration](./lua/security_blacklist_ip_notify.lua)
- [List of temporarily blocked domains, the list is managed with DNS notify](./lua/security_blocklist_domains.lua)
- [Spoofing DNS responses like TXT, A, AAAA, MX and more...](./lua/security_spoofing_qtype.lua)

**Logging DNS traffic with [DNS-collector](https://github.com/dmachard/DNS-collector)**:

- Remote DNS logging with DNSTAP protocol 
    * [YAML](./yaml/logging_dnstap.yml)
    * [LUA](./lua/logging_dnstap.lua)
- Add extra informations in DNStap field
    * [YAML](./yaml/logging_dnstap_extra.yml)
    * [LUA](./lua/logging_dnstap_extra.lua)
- Remote DNS logging with Protobuf protocol
    * [YAML](./yaml/logging_protobuf.yml)
    * [LUA](./lua/logging_protobuf.lua)

**Miscs**:

- [Full configuration with load balancing on public DNS resolvers](./lua/miscs_basic_config.lua)
- [Flush cache for domain with DNS NOTIFY](./lua/miscs_cache_flush_notify.lua)
- [Echo capability of ip address from domain name for development](./lua/miscs_echoip.lua)
- [Resolve hostname from config](./lua/miscs_resolve_hostname.lua)
- [Add uniq ID between queries and replies and send it through EDNS ](./lua/miscs_add_uniqid.lua)
- [Set RequestorID with FFI](./lua/miscs_ffi_requestorid.lua)

## Run config from docker

```bash
sudo docke compose up -d
```

Reload configuration

```bash
sudo docker compose restart
```

Display logs

```bash
sudo docker compose logs -f
dnsdist 1.8.0 comes with ABSOLUTELY NO WARRANTY. This is free software, and you are welcome to redistribute it according to the terms of the GPL version 2
Added downstream server 1.1.1.1:53
Listening on 0.0.0.0:53
ACL allowing queries from: 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.168.0.0/16, ::1/128, fc00::/7, fe80::/10
Console ACL allowing connections from: 127.0.0.0/8, ::1/128
Marking downstream 1.1.1.1:53 as 'up'
Polled security status of version 1.8.0 at startup, no known issues reported: OK
```

Testing DNS resolution

```bash
dig @127.0.0.1 -p 8053 +tcp google.com
```

Testing Web console access

```bash
curl -u admin:open http://127.0.0.1:8083
```
