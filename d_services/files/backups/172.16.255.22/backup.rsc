# mar/05/2022 07:00:36 by RouterOS 6.49.2
# software id = G66G-A2QQ
#
# model = RB1100x4
# serial number = CE9A0B5455CD
/interface bridge
add name=br-loopback
add dhcp-snooping=yes disabled=yes igmp-snooping=yes name=br-mng \
    protocol-mode=none
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
/interface eoip
add allow-fast-path=no ipsec-secret=f1396f29afacd198e83de2ad6d069f111638adaa \
    local-address=192.168.22.253 mac-address=02:E2:35:76:98:3C name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=22
/interface vlan
add arp=reply-only interface=ether6 name=V22 vlan-id=22
add arp=reply-only interface=ether6 name=V54 vlan-id=54
add arp=reply-only interface=ether6 name=V101-CAM vlan-id=101
add interface=ether6 name=V255-MNG vlan-id=255
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
add add-arp=yes disabled=no interface=V22 lease-script=":local dnsRemoveAllByI\
    p \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"suvorov.video.local\"\r\
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
add add-arp=yes disabled=no interface=V54 lease-time=1h10m name=dhcp2
/ip pool
add name=dhcp_pool0 ranges=172.16.22.10-172.16.22.250
add name=dhcp_pool3 ranges=172.16.54.10-172.16.54.250
/ppp profile
set *FFFFFFFE local-address=172.16.54.253 remote-address=172.16.54.252 \
    use-compression=yes use-upnp=no
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:6F:30:6D:54:EC \
    name=ovpn-tula-demonstracyi password=\
    2173f66e3c618a5a558f9f5aadc3933b83df2884 port=49100 profile=\
    default-encryption user=S-Suvorovskij
/routing ospf instance
set [ find default=yes ] router-id=172.16.22.254
add distribute-default=always-as-type-1 name=ospf-all
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=br-mng disabled=yes interface=eoip-mng
add bridge=br-mng disabled=yes interface=V255-MNG
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=ovpn-tula-demonstracyi list=IL-NEIGHBOR
add interface=V255-MNG list=IL-NEIGHBOR
add interface=ovpn-in-object list=IL-NEIGHBOR
add interface=ether2 list=IL-IN-DNS
add interface=V22 list=IL-IN-DNS
/interface ovpn-server server
set auth=md5 certificate=EDDS-SERVER cipher=blowfish128,aes256 \
    default-profile=default-encryption enabled=yes netmask=32 port=49100
/ip address
add address=192.168.22.253/24 interface=ether1 network=192.168.22.0
add address=192.168.146.253/24 interface=ether2 network=192.168.146.0
add address=172.16.22.254/24 interface=V22 network=172.16.22.0
add address=172.16.22.254 interface=V255-MNG network=172.16.22.253
add address=172.16.54.254/24 interface=V54 network=172.16.54.0
add address=192.168.1.254/24 interface=V101-CAM network=192.168.1.0
add address=172.16.22.254 interface=br-loopback network=172.16.22.254
/ip arp
add address=192.168.1.17 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.6 interface=V101-CAM mac-address=00:24:7B:C8:00:96
add address=192.168.1.11 interface=V101-CAM mac-address=00:12:3E:26:00:95
add address=192.168.1.16 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.5 interface=V101-CAM mac-address=24:A4:3C:FE:3A:80
add address=192.168.1.10 interface=V101-CAM mac-address=00:24:7B:D3:00:96
add address=192.168.1.4 interface=V101-CAM mac-address=24:A4:3C:FE:3A:80
add address=192.168.1.9 interface=V101-CAM mac-address=24:A4:3C:FE:1C:D8
add address=192.168.1.14 interface=V101-CAM mac-address=00:12:12:0E:83:57
add address=192.168.1.3 interface=V101-CAM mac-address=00:5A:20:4E:BC:73
add address=192.168.1.19 interface=V101-CAM mac-address=00:00:1B:0D:AF:8E
add address=192.168.1.8 interface=V101-CAM mac-address=00:9F:5C:86:00:95
add address=192.168.1.13 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.7 interface=V101-CAM mac-address=00:24:7B:BF:00:96
add address=192.168.1.12 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=172.16.22.253 interface=V255-MNG mac-address=7A:11:F2:9E:25:C7
add address=192.168.1.15 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.146.12 interface=ether2 mac-address=F0:23:B9:30:C7:14
add address=192.168.146.10 interface=ether2 mac-address=F0:23:B9:30:C7:37
add address=192.168.146.20 interface=ether2 mac-address=F0:23:B9:30:C6:99
add address=192.168.146.18 interface=ether2 mac-address=AC:CB:51:34:B3:11
add address=192.168.1.18 interface=V101-CAM mac-address=00:5A:20:4E:B8:D0
add address=192.168.1.66 interface=V101-CAM mac-address=00:27:22:72:3D:78
add address=192.168.1.102 interface=V101-CAM mac-address=24:A4:3C:FE:3A:7C
add address=192.168.1.110 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.122 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.130 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.121 interface=V101-CAM mac-address=24:A4:3C:FE:3A:80
add address=192.168.1.200 interface=V101-CAM mac-address=00:25:90:E8:E8:DA
add address=192.168.1.107 interface=V101-CAM mac-address=04:18:D6:48:CD:70
add address=192.168.1.140 interface=V101-CAM mac-address=04:18:D6:00:0E:2C
add address=192.168.1.123 interface=V101-CAM mac-address=04:18:D6:00:10:1E
add address=192.168.1.101 interface=V101-CAM mac-address=04:18:D6:00:10:15
add address=192.168.1.104 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
add address=192.168.1.124 interface=V101-CAM mac-address=24:A4:3C:FE:3A:76
/ip dhcp-client
add add-default-route=no disabled=no interface=eoip-mng
/ip dhcp-server lease
add address=172.16.54.248 mac-address=60:63:4C:B1:EF:30 server=dhcp2
add address=172.16.22.11 mac-address=00:D8:61:37:DA:7B server=dhcp1
add address=172.16.22.12 mac-address=70:85:C2:FE:B9:A8 server=dhcp1
/ip dhcp-server network
add address=172.16.22.0/24 dns-server=172.16.22.254 domain=\
    suvorov.video.local gateway=172.16.22.254 ntp-server=\
    172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.54.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=192.168.146.253 name=core.suvorov.video.local
add address=172.16.22.11 comment=dhcp-lease-script_dhcp2_lease-hostname name=\
    srvm.suvorov.video.local ttl=15m
add address=172.16.22.12 comment=dhcp-lease-script_dhcp1_lease-hostname name=\
    arm.suvorov.video.local ttl=15m
add address=172.16.22.12 comment=dhcp-lease-script_dhcp1_lease-hostname name=\
    arm ttl=15m
/ip firewall address-list
add address=172.16.54.0/24 list=AL-BLOCK
add address=192.168.0.0/16 list=AL-BLOCK
/ip firewall filter
add action=accept chain=forward connection-state=established,related
add action=accept chain=input connection-state=established,related
add action=accept chain=input in-interface=ether1 protocol=gre
add action=accept chain=input in-interface=ether1
add action=accept chain=input in-interface=eoip-mng
add action=accept chain=input comment=DNS dst-port=53 in-interface-list=\
    IL-IN-DNS protocol=udp
add action=accept chain=input dst-port=49100 in-interface=ether2 protocol=tcp
add action=accept chain=input dst-port=67 in-interface=V54 protocol=udp
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V22
add action=accept chain=forward comment="\F3\E4\E0\EB\E8\F2\FC" in-interface=\
    ovpn-tula-demonstracyi out-interface=ether2
add action=accept chain=forward in-interface=V22 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=V54 out-interface=V101-CAM
add action=accept chain=forward in-interface=V54 out-interface=ether2
add action=drop chain=input
add action=drop chain=forward
/ip firewall nat
add action=masquerade chain=srcnat log=yes out-interface=ether2 src-address=\
    172.16.2.0/24
add action=masquerade chain=srcnat out-interface=ether2 src-address=\
    172.16.54.0/24
add action=masquerade chain=srcnat out-interface=V101-CAM src-address=\
    172.16.54.0/24
add action=masquerade chain=srcnat disabled=yes out-interface=V101-CAM \
    src-address=172.16.22.0/24
/ip route
add distance=1 gateway=192.168.22.254
add distance=10 dst-address=192.168.0.0/16 gateway=192.168.22.254
add distance=1 dst-address=192.168.0.0/24 gateway=172.16.54.252
/ip route vrf
add disabled=yes interfaces=eoip-mng routing-mark=rm-mng
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www disabled=yes
set ssh address=172.16.0.0/16,192.168.0.0/16
set api disabled=yes
set winbox address=172.16.0.0/16,192.168.0.0/16
set api-ssl disabled=yes
#error exporting /ip traffic-flow
#interrupted
