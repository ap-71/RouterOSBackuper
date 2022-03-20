# mar/06/2022 02:01:14 by RouterOS 6.49.2
# software id = Y2RQ-LRFR
#
# model = RB1100x4
# serial number = CE9A0B314431
/interface bridge
add arp=reply-only igmp-snooping=yes name=br-cam protocol-mode=none
add name=br-loopback
add admin-mac=FE:8A:B9:FA:45:F4 auto-mac=no dhcp-snooping=yes igmp-snooping=\
    yes name=br-mng protocol-mode=none
/interface ethernet
set [ find default-name=ether3 ] disabled=yes
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether6 ] arp=reply-only comment=CRS125
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] disabled=yes
set [ find default-name=ether12 ] disabled=yes
set [ find default-name=ether13 ] disabled=yes
/interface eoip
add allow-fast-path=no ipsec-secret=737005b517ee9a17fd3a0cf64f351d4aa74b8347 \
    local-address=192.168.181.253 loop-protect=on mac-address=\
    FE:8A:B9:FA:45:F4 name=eoip-data-mvd remote-address=192.168.181.251 \
    tunnel-id=2181
add allow-fast-path=no ipsec-secret=1f5a1e7ef2083e0496f4b240f209904c7dcd3fc1 \
    local-address=192.168.26.253 loop-protect=on mac-address=\
    02:EA:16:95:E1:BC name=eoip-mng remote-address=192.168.2.253 tunnel-id=26
add allow-fast-path=no ipsec-secret=737005b517ee9a17fd3a0cf64f351d4aa74b8347 \
    local-address=192.168.181.253 loop-protect=on mac-address=\
    FE:8A:B9:FA:45:F4 name=eoip-mng-mvd remote-address=192.168.181.251 \
    tunnel-id=1181
add allow-fast-path=no disabled=yes ipsec-secret=\
    776a57f97ff742e632a992980dc09ea4511bb6cc local-address=192.168.181.253 \
    loop-protect=on mac-address=FE:8A:B9:FA:45:F4 name=eoip-mng-obj \
    remote-address=192.168.181.252 tunnel-id=181
/interface vlan
add arp=reply-only interface=ether6 name=V26 vlan-id=26
add arp=reply-only interface=ether6 name=V58 vlan-id=58
add arp=reply-only interface=ether6 name=V81 vlan-id=81
add arp=reply-only interface=ether6 name=V255-MNG vlan-id=255
/interface ethernet switch port
set 0 default-vlan-id=0
set 1 default-vlan-id=0
set 2 default-vlan-id=0
set 3 default-vlan-id=0
set 4 default-vlan-id=0
set 5 default-vlan-id=0
set 6 default-vlan-id=0
set 7 default-vlan-id=0
set 8 default-vlan-id=0
set 9 default-vlan-id=0
set 13 default-vlan-id=0
set 14 default-vlan-id=0
/interface list
add name=IL-NEIGHBORS
add name=IL-IN-DNS
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.16.26.10-172.16.26.250
add name=dhcp_pool1 ranges=172.16.58.10-172.16.58.250
add name=dhcp_pool2 ranges=192.168.81.102-192.168.81.200
add name=pool-mvd ranges=172.16.181.100-172.16.181.250
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 disabled=no interface=V26 \
    lease-script=":local dnsRemoveAllByIp \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"schekino.video.local\"\r\
    \n# DNS TTL to set for DNS entries\r\
    \n:local dnsTtl \"00:15:00\"\r\
    \n# Source of DHCP client hostname, can be \"lease-hostname\" or any other\
    \_lease attribute, like \"host-name\" or \"comment\"\r\
    \n:local leaseClientHostnameSource \"lease-hostname\"\r\
    \n\r\
    \n:local leaseComment \"dhcp-lease-script_\$leaseServerName_\$leaseClientH\
    ostnameSource\"\r\
    \n:local leaseClientHostname\r\
    \n:if (\$leaseClientHostnameSource = \"lease-hostname\") do={\r\
    \n  :set leaseClientHostname \$\"lease-hostname\"\r\
    \n} else={\r\
    \n  :set leaseClientHostname ([:pick \\\r\
    \n    [/ip dhcp-server lease print as-value where server=\"\$leaseServerNa\
    me\" address=\"\$leaseActIP\" mac-address=\"\$leaseActMAC\"] \\\r\
    \n    0]->\"\$leaseClientHostnameSource\")\r\
    \n}\r\
    \n:local leaseClientHostnameShort \"\$leaseClientHostname\"\r\
    \n:local leaseClientHostnames \"\$leaseClientHostname\"\r\
    \n:if ([:len [\$dnsDomain]] > 0) do={\r\
    \n  :set leaseClientHostname \"\$leaseClientHostname.\$dnsDomain\"\r\
    \n  :if (\$dnsAlwaysNonfqdn = \"1\") do={\r\
    \n    :set leaseClientHostnames \"\$leaseClientHostname,\$leaseClientHostn\
    ameShort\"\r\
    \n  }\r\
    \n}\r\
    \n:if (\$dnsRemoveAllByIp = \"1\") do={\r\
    \n  /ip dns static remove [/ip dns static find comment=\"\$leaseComment\" \
    and address=\"\$leaseActIP\"]\r\
    \n}\r\
    \n:foreach h in=[:toarray value=\"\$leaseClientHostnames\"] do={\r\
    \n  :if (\$dnsRemoveAllByName = \"1\") do={\r\
    \n    /ip dns static remove [/ip dns static find comment=\"\$leaseComment\
    \" and name=\"\$h\"]\r\
    \n  }\r\
    \n  /ip dns static remove [/ip dns static find comment=\"\$leaseComment\" \
    and address=\"\$leaseActIP\" and name=\"\$h\"]\r\
    \n  :if (\$leaseBound = \"1\") do={\r\
    \n    :delay 1\r\
    \n    /ip dns static add comment=\"\$leaseComment\" address=\"\$leaseActIP\
    \" name=\"\$h\" ttl=\"\$dnsTtl\"\r\
    \n  }\r\
    \n}" lease-time=1h10m name=dhcp1
add add-arp=yes address-pool=dhcp_pool1 disabled=no interface=V58 lease-time=\
    1h10m name=dhcp2
add add-arp=yes address-pool=dhcp_pool2 disabled=no interface=br-cam \
    lease-time=1h10m name=dhcp3
add add-arp=yes address-pool=pool-mvd disabled=no interface=eoip-data-mvd \
    lease-time=1h10m name=dhcp4
/interface ovpn-client
add certificate=cert_export_EDDS.p12_0 cipher=null connect-to=\
    core.video.local mac-address=02:D2:7C:2E:3D:8C name=ovpn-tula-demonstacyi \
    password=b44f5d390fb606d2fbf42ff6a8e28d23da255afa port=49100 profile=\
    default-encryption user=S-Shhekinskij
/routing ospf instance
set [ find default=yes ] router-id=172.16.255.26
add distribute-default=always-as-type-1 name=ospf-all
add disabled=yes name=ospf-mng router-id=192.168.255.26 routing-table=rm-mng
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
add area-id=0.0.0.2 disabled=yes instance=ospf-mng name=area-mng
/interface bridge port
add bridge=br-cam interface=ether2
add bridge=br-cam interface=V81
add bridge=br-mng interface=eoip-mng-mvd
add bridge=br-mng interface=eoip-mng trusted=yes
add bridge=br-mng interface=V255-MNG
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=V26 list=IL-IN-DNS
add interface=ether2 list=IL-IN-DNS
add interface=eoip-data-mvd list=IL-IN-DNS
#error exporting /ip accounting web-access
#interrupted
