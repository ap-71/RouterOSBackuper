# mar/03/2022 06:40:17 by RouterOS 6.47.4
# software id = P3HJ-CPL0
#
# model = RB1100x4
# serial number = CE9A0B1A3DB2
/interface bridge
add name=br-loopback
add admin-mac=02:6C:00:A8:6A:C7 auto-mac=no dhcp-snooping=yes igmp-snooping=\
    yes name=br-mng
/interface ethernet
set [ find default-name=ether1 ] comment=\
    "\C2 \F1\F2\EE\F0\EE\ED\F3 \D2\F3\EB\FB "
set [ find default-name=ether3 ] disabled=yes
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether6 ] arp=disabled
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] disabled=yes
set [ find default-name=ether12 ] disabled=yes
set [ find default-name=ether13 ] disabled=yes
/interface ovpn-server
add name=ovpn-in-object user=object
add name=ovpn-in-object-2 user=object2
/interface eoip
add allow-fast-path=no ipsec-secret=df8f6ad6bda4d9254c82a69acc12ed03dce6e530 \
    local-address=192.168.3.253 mac-address=02:2D:2B:AC:57:72 name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=3
add allow-fast-path=no ipsec-secret=89721232730f2249bab86a6bb7482c2118e6bfbc \
    local-address=192.168.136.253 mac-address=02:6C:00:A8:6A:C7 name=\
    eoip-mng-251 remote-address=192.168.136.251 tunnel-id=251
add allow-fast-path=no ipsec-secret=1acde478f4fa57f963f19449c7472e279207a014 \
    local-address=192.168.136.253 mac-address=02:6C:00:A8:6A:C7 name=\
    eoip-mng-252 remote-address=192.168.136.252 tunnel-id=252
/interface vlan
add arp=reply-only interface=ether6 name=V3 vlan-id=3
add arp=reply-only interface=ether6 name=V35 vlan-id=35
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
add name=IL-NEIGHBOR
add name=IL-IN-DNS
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server
add add-arp=yes disabled=no interface=V3 lease-script=":local dnsRemoveAllByIp\
    \_\"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"aleksin.video.local\"\r\
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
add add-arp=yes disabled=no interface=V35 lease-time=1h10m name=dhcp2
/ip pool
add name=dhcp_pool0 ranges=172.16.3.10-172.16.3.250
add name=dhcp_pool3 ranges=172.16.35.10-172.16.35.250
/ppp profile
set *FFFFFFFE local-address=172.16.35.253 remote-address=172.16.35.252 \
    use-compression=yes use-upnp=no
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:8A:AD:54:2C:35 \
    name=ovpn-tula-demonstracyi password=\
    9d15093a0a6b954b4ce5ba99ff5b2d0d63f2761d port=49100 profile=\
    default-encryption user=S-Aleksin
/routing ospf instance
set [ find default=yes ] router-id=172.16.3.254
add distribute-default=always-as-type-1 name=ospf-all
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=br-mng interface=eoip-mng trusted=yes
add bridge=br-mng interface=eoip-mng-251
add bridge=br-mng interface=eoip-mng-252
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=ovpn-tula-demonstracyi list=IL-NEIGHBOR
add interface=V255-MNG list=IL-NEIGHBOR
add interface=ovpn-in-object list=IL-NEIGHBOR
add interface=ovpn-in-object-2 list=IL-NEIGHBOR
add interface=V3 list=IL-IN-DNS
add interface=ether2 list=IL-IN-DNS
/interface ovpn-server server
set certificate=EDDS-SERVER cipher=blowfish128,aes256,null default-profile=\
    default-encryption enabled=yes netmask=32 port=49100
/ip address
add address=192.168.3.253/24 interface=ether1 network=192.168.3.0
add address=192.168.136.253/24 interface=ether2 network=192.168.136.0
add address=172.16.3.254/24 interface=V3 network=172.16.3.0
add address=172.16.3.254 interface=V255-MNG network=172.16.3.253
add address=172.16.35.254/24 interface=V35 network=172.16.35.0
add address=192.168.10.254/24 interface=V35 network=192.168.10.0
add address=172.16.3.254 interface=br-loopback network=172.16.3.254
/ip arp
add address=192.168.10.10 interface=V35 mac-address=4C:BD:8F:73:55:F8
add address=192.168.10.13 interface=V35 mac-address=44:19:B6:60:60:6F
add address=192.168.10.200 interface=V35 mac-address=74:D4:35:E3:3A:38
add address=192.168.10.1 interface=V35 mac-address=58:03:FB:11:B4:DF
add address=192.168.10.12 interface=V35 mac-address=44:47:CC:9D:C7:1B
add address=192.168.10.11 interface=V35 mac-address=44:47:CC:9D:C7:16
add address=192.168.136.251 interface=ether2 mac-address=CC:2D:E0:99:CE:72
add address=192.168.136.252 interface=ether2 mac-address=CC:2D:E0:99:D0:98
add address=172.16.3.253 interface=V255-MNG mac-address=D2:57:BC:69:1D:A1
/ip dhcp-client
add add-default-route=no disabled=no interface=br-mng
/ip dhcp-server lease
add address=172.16.3.248 mac-address=70:85:C2:FE:B5:46 server=dhcp1
add address=172.16.35.246 mac-address=60:63:4C:B1:EF:2F server=dhcp2
add address=172.16.3.249 mac-address=00:D8:61:59:68:BC server=dhcp1
/ip dhcp-server network
add address=172.16.3.0/24 dns-server=172.16.3.254 gateway=172.16.3.254 \
    ntp-server=172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.35.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=192.168.136.253 name=core.aleksin.video.local
add address=172.16.3.249 comment=dhcp-lease-script_dhcp1_lease-hostname name=\
    aleksin.aleksin.video.local ttl=15m
add address=172.16.3.249 comment=dhcp-lease-script_dhcp1_lease-hostname name=\
    aleksin ttl=15m
/ip firewall address-list
add address=172.16.35.0/24 list=AL-BLOCK
add address=192.168.0.0/16 list=AL-BLOCK
/ip firewall filter
add action=accept chain=input connection-state=established,related
add action=accept chain=forward connection-state=established,related
add action=accept chain=input in-interface=ether2 protocol=gre
add action=accept chain=input comment=DNS dst-port=53 in-interface-list=\
    IL-IN-DNS protocol=udp
add action=accept chain=input in-interface=ovpn-in-object protocol=ospf
add action=accept chain=input in-interface=ovpn-in-object-2 protocol=ospf
add action=accept chain=input dst-port=49100 in-interface=ether2 protocol=tcp
add action=accept chain=input in-interface=ether1 src-address=192.168.2.253
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=input in-interface=br-mng
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V3
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=ovpn-in-object protocol=icmp
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=ovpn-in-object-2 protocol=icmp
add action=accept chain=forward dst-port=8291 in-interface=\
    ovpn-tula-demonstracyi out-interface=ovpn-in-object protocol=tcp
add action=accept chain=forward dst-port=8291 in-interface=\
    ovpn-tula-demonstracyi out-interface=ovpn-in-object-2 protocol=tcp
add action=accept chain=forward in-interface=V3 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=V35 out-interface=ether2
add action=accept chain=forward in-interface=V35 out-interface=ovpn-in-object
add action=accept chain=forward in-interface=V35 out-interface=\
    ovpn-in-object-2
add action=accept chain=forward dst-address=192.168.10.0/24 src-address=\
    172.16.35.0/24
add action=drop chain=input
add action=drop chain=forward
/ip firewall nat
add action=masquerade chain=srcnat dst-address=192.168.10.0/24 src-address=\
    172.16.35.0/24
/ip route
add distance=1 gateway=192.168.3.254
add disabled=yes distance=1 dst-address=172.22.0.0/16 gateway=\
    ovpn-tula-demonstracyi
add distance=110 dst-address=192.168.1.10/32 gateway=172.16.35.252 scope=20
/ip route vrf
add disabled=yes interfaces=br-mng routing-mark=rm-mng
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address=172.16.0.0/16,192.168.0.0/16
set api disabled=yes
set winbox address=172.16.0.0/16,192.168.0.0/16
set api-ssl disabled=yes
#error exporting /ip upnp
#interrupted
