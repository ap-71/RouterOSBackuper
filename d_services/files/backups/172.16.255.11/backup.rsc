# mar/05/2022 15:09:37 by RouterOS 6.47.4
# software id = 9YIM-YH4A
#
# model = RB1100x4
# serial number = 91D90BDA968D
/interface bridge
add admin-mac=B6:19:C9:42:5A:65 auto-mac=no name=br-loopback
add name=bridge-11
add name=bridge-43
add name=bridge-246 protocol-mode=none
/interface ethernet
set [ find default-name=ether1 ] comment=\
    "\C2 \F1\F2\EE\F0\EE\ED\F3 \D2\F3\EB\FB "
set [ find default-name=ether6 ] arp=disabled
/interface eoip
add allow-fast-path=no ipsec-secret=a767653c231465a0befc2be1c670023243a10421 \
    local-address=192.168.11.253 mac-address=02:0E:97:D5:DC:23 name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=11
/interface vlan
add arp=reply-only interface=ether6 name=V11 vlan-id=11
add arp=reply-only interface=ether6 name=V43 vlan-id=43
add interface=ether6 name=V246-cams vlan-id=246
add interface=ether6 name=V255-MNG vlan-id=255
add interface=ether4 name=v43-server vlan-id=43
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
set 10 default-vlan-id=0
set 11 default-vlan-id=0
set 12 default-vlan-id=0
set 13 default-vlan-id=0
set 14 default-vlan-id=0
set 15 default-vlan-id=0
/interface list
add name=IL-NEIGHBOR
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server
add add-arp=yes disabled=no interface=bridge-11 lease-script=":local dnsRemove\
    AllByIp \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"bogoroditsk.video.local\"\r\
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
    \n}" lease-time=1h name=dhcp1
/ip pool
add name=dhcp_pool0 ranges=172.16.11.10-172.16.11.250
add name=dhcp_pool3 ranges=172.16.43.10-172.16.43.250
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool3 interface=bridge-43 lease-time=1h10m \
    name=dhcp2
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:6B:2D:70:F3:4E \
    name=ovpn-tula-demonstracyi password=\
    a7aeb9092af7a49c5dfe0f4801ac74b88389c367 port=49100 profile=\
    default-encryption user=S-Bogorodickij
/routing ospf instance
set [ find default=yes ] router-id=172.16.11.254
add distribute-default=always-as-type-1 name=ospf-all
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge-11 interface=ether3
add bridge=bridge-11 interface=ether4
add bridge=bridge-246 interface=ether7
add bridge=bridge-11 interface=V11
add bridge=bridge-43 interface=V43
add bridge=bridge-246 interface=V246-cams
add bridge=bridge-43 interface=ether5
add bridge=bridge-43 interface=v43-server
/ip neighbor discovery-settings
set discover-interface-list=none
#interrupted
