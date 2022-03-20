# mar/03/2022 02:28:45 by RouterOS 6.47.4
# software id = VZ97-1B3G
#
# model = RB1100x4
# serial number = 91D70B4A6BBF
/interface bridge
add name=br-loopback
add dhcp-snooping=yes igmp-snooping=yes name=br-mng
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
add allow-fast-path=no ipsec-secret=3518142b4ecd18885ae04c73a17bfba68e4014a8 \
    local-address=192.168.20.253 mac-address=02:42:AC:67:79:6C name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=20
add allow-fast-path=no ipsec-secret=776a57f97ff742e632a992980dc09ea4511bb6cc \
    local-address=192.168.145.253 loop-protect=on mac-address=\
    02:DC:E3:A9:9B:0B name=eoip-mng-obj remote-address=192.168.145.252 \
    tunnel-id=145
/interface vlan
add arp=reply-only interface=ether6 name=V20 vlan-id=20
add arp=reply-only interface=ether6 name=V52 vlan-id=52
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
add add-arp=yes disabled=no interface=V20 lease-script=":local dnsRemoveAllByI\
    p \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"odoev.video.local\"\r\
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
add add-arp=yes disabled=no interface=V52 lease-time=1h10m name=dhcp2
/ip pool
add name=dhcp_pool0 ranges=172.16.20.10-172.16.20.250
add name=dhcp_pool3 ranges=172.16.52.10-172.16.52.250
/ppp profile
set *FFFFFFFE change-tcp-mss=default local-address=172.16.52.253 \
    remote-address=172.16.52.252 use-compression=no use-mpls=no use-upnp=no
/interface ovpn-client
add certificate=cert_export_EDDS.p12_0 cipher=null connect-to=\
    core.video.local mac-address=02:AD:EA:3C:A0:90 name=\
    ovpn-tula-demonstracyi password=742357bc2755b202a939c9960fd4e1c7056833b6 \
    port=49100 profile=default-encryption user=S-Odoevskij
/routing ospf instance
set [ find default=yes ] router-id=172.16.20.254
add distribute-default=always-as-type-1 name=ospf-all
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=br-mng interface=eoip-mng-obj
add bridge=br-mng interface=eoip-mng trusted=yes
/ip neighbor discovery-settings
set discover-interface-list=none
/interface list member
add interface=ovpn-tula-demonstracyi list=IL-NEIGHBOR
add interface=V20 list=IL-NEIGHBOR
add interface=V255-MNG list=IL-NEIGHBOR
add interface=ovpn-in-object list=IL-NEIGHBOR
add interface=eoip-mng list=IL-NEIGHBOR
add interface=ether2 list=IL-IN-DNS
add interface=V20 list=IL-IN-DNS
/interface ovpn-server server
set certificate=cert_export_EDDS.p12_0 cipher=blowfish128,aes128,aes256,null \
    default-profile=default-encryption enabled=yes netmask=32 port=49100
/ip address
add address=192.168.20.253/24 interface=ether1 network=192.168.20.0
add address=192.168.145.253/24 interface=ether2 network=192.168.145.0
add address=172.16.20.254/24 interface=V20 network=172.16.20.0
add address=172.16.20.254 interface=V255-MNG network=172.16.20.253
add address=172.16.52.254/24 interface=V52 network=172.16.52.0
add address=172.16.20.254 interface=br-loopback network=172.16.20.254
/ip arp
add address=192.168.145.15 disabled=yes interface=ether2 mac-address=\
    F0:23:B9:30:C6:9F
add address=192.168.145.252 interface=ether2 mac-address=C4:AD:34:4D:E6:57
add address=172.16.20.253 interface=V255-MNG mac-address=6E:32:BD:FE:89:7B
/ip dhcp-client
add add-default-route=no disabled=no interface=br-mng
/ip dhcp-server lease
add address=172.16.20.249 mac-address=A8:A1:59:09:C8:DE server=dhcp1
add address=172.16.20.246 mac-address=00:D8:61:38:CE:47 server=dhcp1
add address=172.16.52.14 mac-address=60:63:4C:B1:EF:31 server=dhcp2
add address=172.16.52.13 client-id=1:78:7b:8a:db:9f:35 mac-address=\
    78:7B:8A:DB:9F:35 server=dhcp2
add address=172.16.20.13 mac-address=78:7B:8A:DB:9F:35 server=dhcp1
/ip dhcp-server network
add address=172.16.20.0/24 dns-server=172.16.20.254 gateway=172.16.20.254 \
    ntp-server=172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.52.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=192.168.145.253 name=core.odoev.video.local
add address=172.16.20.249 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=arm.odoev.video.local ttl=15m
add address=172.16.20.249 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=arm ttl=15m
/ip firewall address-list
add address=172.16.20.246 list=al-acc_to_cam
/ip firewall filter
add action=accept chain=forward connection-state=established,related
add action=accept chain=input connection-state=established,related
add action=accept chain=input comment=DNS dst-port=53 in-interface-list=\
    IL-IN-DNS protocol=udp
add action=accept chain=input in-interface=ovpn-in-object protocol=ospf
add action=accept chain=input in-interface=ether2 protocol=gre src-address=\
    192.168.145.252
add action=accept chain=input comment=OVPN dst-port=49100 protocol=tcp \
    src-address=192.168.145.252
add action=accept chain=input in-interface=ether1
add action=accept chain=input in-interface=br-mng
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=ovpn-in-object protocol=icmp
add action=accept chain=forward dst-port=8291 in-interface=\
    ovpn-tula-demonstracyi out-interface=ovpn-in-object protocol=tcp
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V20
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=V20 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=V52 out-interface=ovpn-in-object
add action=accept chain=forward in-interface=V20 out-interface=ovpn-in-object \
    src-address-list=al-acc_to_cam
add action=accept chain=forward in-interface=V20 out-interface=ether2 \
    src-address-list=al-acc_to_cam
add action=accept chain=forward in-interface=V52 out-interface=ether2
add action=drop chain=input
add action=drop chain=forward
/ip firewall nat
add action=masquerade chain=srcnat dst-address=192.168.145.0/24 \
    out-interface=ether2 src-address=172.16.52.0/24
add action=masquerade chain=srcnat dst-address=192.168.145.0/24 \
    out-interface=ether2 src-address-list=al-acc_to_cam
/ip route
add distance=1 gateway=192.168.20.254
add distance=10 dst-address=192.168.0.0/16 gateway=192.168.20.254
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
#error exporting /ip traffic-flow
#interrupted
