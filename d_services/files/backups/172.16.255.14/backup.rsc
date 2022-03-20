# mar/05/2022 09:35:27 by RouterOS 6.47.4
# software id = MUCQ-CK1Z
#
# model = RB1100x4
# serial number = CE9A0BBE0CFA
/interface bridge
add name=br-loopback
/interface ethernet
set [ find default-name=ether1 ] comment=\
    "\C2 \F1\F2\EE\F0\EE\ED\F3 \D2\F3\EB\FB "
set [ find default-name=ether3 ] disabled=yes
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] disabled=yes
set [ find default-name=ether12 ] disabled=yes
set [ find default-name=ether13 ] disabled=yes
/interface eoip
add allow-fast-path=no ipsec-secret=6121a76c00ba3bc71c63f74101862fa5b449ed7a \
    local-address=192.168.14.253 mac-address=02:60:5A:36:2B:79 name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=14
/interface vlan
add arp=reply-only interface=ether6 name=V14 vlan-id=14
add arp=reply-only interface=ether6 name=V46 vlan-id=46
add interface=ether6 name=V101-CAM vlan-id=101
add arp=proxy-arp interface=ether6 name=V255-MNG vlan-id=255
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
/ip pool
add name=dhcp_pool0 ranges=172.16.14.10-172.16.14.250
add name=dhcp_pool3 ranges=172.16.46.10-172.16.46.250
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 disabled=no interface=V14 \
    lease-script=":local dnsRemoveAllByIp \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"dubna.video.local\"\r\
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
add add-arp=yes address-pool=dhcp_pool3 disabled=no interface=V46 lease-time=\
    1h10m name=dhcp2
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:A5:09:B0:45:EC \
    name=ovpn-tula-demonstracyi password=\
    0bfba3210868f9bdbd9515bad6540d4282e8d5e0 port=49100 profile=\
    default-encryption user=S-Dubenskij
/routing ospf instance
set [ find default=yes ] router-id=172.16.14.254
add distribute-default=always-as-type-1 name=ospf-all
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=ovpn-tula-demonstracyi list=IL-NEIGHBOR
add interface=V255-MNG list=IL-NEIGHBOR
add interface=ether2 list=IL-IN-DNS
add interface=V14 list=IL-IN-DNS
/ip address
add address=192.168.14.253/24 interface=ether1 network=192.168.14.0
add address=192.168.141.253/24 interface=ether2 network=192.168.141.0
add address=172.16.14.254/24 interface=V14 network=172.16.14.0
add address=172.16.14.254 interface=V255-MNG network=172.16.14.253
add address=172.16.46.254/24 interface=V46 network=172.16.46.0
add address=192.168.1.254/24 interface=V101-CAM network=192.168.1.0
add address=172.16.14.254 interface=br-loopback network=172.16.14.254
/ip arp
add address=192.168.1.34 interface=V101-CAM mac-address=F0:23:B9:30:C6:F8
add address=192.168.1.3 interface=V101-CAM mac-address=F0:23:B9:30:21:01
add address=192.168.1.37 interface=V101-CAM mac-address=F0:23:B9:30:C7:33
add address=192.168.1.13 interface=V101-CAM mac-address=F0:23:B9:30:92:54
add address=192.168.1.30 interface=V101-CAM mac-address=F0:23:B9:30:AF:EC
add address=192.168.1.6 interface=V101-CAM mac-address=F0:23:B9:30:23:2B
add address=192.168.1.33 interface=V101-CAM mac-address=F0:23:B9:30:B0:00
add address=192.168.1.2 interface=V101-CAM mac-address=F0:23:B9:30:23:D7
add address=192.168.1.36 interface=V101-CAM mac-address=F0:23:B9:30:C7:34
add address=192.168.1.5 interface=V101-CAM mac-address=00:00:1B:1D:73:67
add address=192.168.1.39 interface=V101-CAM mac-address=F0:23:B9:30:C7:79
add address=192.168.1.32 interface=V101-CAM mac-address=F0:23:B9:30:B0:50
add address=192.168.1.8 interface=V101-CAM mac-address=00:00:1B:1D:74:64
add address=192.168.1.35 interface=V101-CAM mac-address=F0:23:B9:30:C6:F6
add address=192.168.1.4 interface=V101-CAM mac-address=F0:23:B9:30:90:AE
add address=192.168.1.38 interface=V101-CAM mac-address=F0:23:B9:30:C6:EE
add address=192.168.1.31 interface=V101-CAM mac-address=F0:23:B9:30:AF:F1
add address=192.168.1.7 interface=V101-CAM mac-address=00:00:1B:1A:9E:34
add address=192.168.1.40 interface=V101-CAM mac-address=F0:23:B9:30:C6:F5
add address=192.168.1.42 interface=V101-CAM mac-address=F0:23:B9:30:C6:CE
add address=192.168.1.99 interface=V101-CAM mac-address=00:46:A8:11:81:00
add address=192.168.1.27 interface=V101-CAM mac-address=F0:23:B9:30:B0:B9
add address=192.168.1.20 interface=V101-CAM mac-address=00:2A:2A:15:4E:D5
add address=192.168.1.23 interface=V101-CAM mac-address=F0:23:B9:30:B0:29
add address=192.168.1.19 interface=V101-CAM mac-address=F0:23:B9:30:23:E6
add address=192.168.1.29 interface=V101-CAM mac-address=F0:23:B9:30:C0:CA
add address=192.168.1.22 interface=V101-CAM mac-address=F0:23:B9:30:B0:26
add address=192.168.1.25 interface=V101-CAM mac-address=F0:23:B9:30:B0:15
add address=192.168.1.101 interface=V101-CAM mac-address=18:31:BF:69:42:6D
add address=192.168.1.1 interface=V101-CAM mac-address=00:00:1B:1D:72:DB
add address=192.168.1.41 interface=V101-CAM mac-address=F0:23:B9:30:C6:DA
add address=192.168.1.100 interface=V101-CAM mac-address=78:32:1B:F6:1C:CF
/ip dhcp-client
add add-default-route=no disabled=no interface=eoip-mng
/ip dhcp-server lease
add address=172.16.14.250 mac-address=A8:A1:59:09:8A:62 server=dhcp1
add address=172.16.46.250 mac-address=00:D8:61:37:DA:D5 server=dhcp2
add address=172.16.14.249 mac-address=00:D8:61:37:DA:D6 server=dhcp1
add address=172.16.46.249 mac-address=60:63:4C:B1:EF:23 server=dhcp2
add address=172.16.46.248 client-id=1:3c:52:82:ed:36:b5 mac-address=\
    3C:52:82:ED:36:B5 server=dhcp2
/ip dhcp-server network
add address=172.16.14.0/24 dns-server=172.16.14.254 gateway=172.16.14.254 \
    ntp-server=172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.46.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=172.16.14.249 name=srvm.dubna.video.local
/ip firewall filter
add action=accept chain=input connection-state=established,related
add action=accept chain=forward connection-state=established,related
add action=accept chain=input comment=DNS dst-port=53 in-interface-list=\
    IL-IN-DNS protocol=udp
add action=accept chain=input in-interface=ether1
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=input in-interface=eoip-mng
add action=accept chain=input in-interface=V255-MNG protocol=icmp
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V14
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=V14 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=V46 out-interface=ether2
add action=accept chain=forward dst-address=192.168.1.0/24 src-address=\
    172.16.46.0/24
add action=drop chain=input
add action=drop chain=forward
/ip firewall nat
add action=masquerade chain=srcnat disabled=yes dst-address=192.168.1.0/24 \
    out-interface=V101-CAM src-address=172.16.46.0/24
add action=masquerade chain=srcnat dst-address=192.168.1.0/24 out-interface=\
    V101-CAM
add action=masquerade chain=srcnat dst-address=192.168.141.0/24 src-address=\
    172.16.46.0/24
add action=masquerade chain=srcnat comment="\F3\E4\E0\EB\E8\F2\FC" \
    out-interface=ether2 src-address=172.16.0.0/16
#interrupted
