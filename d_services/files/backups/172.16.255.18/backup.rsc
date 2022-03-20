# mar/01/2022 22:53:17 by RouterOS 6.47.4
# software id = A23A-K7XA
#
# model = RB1100x4
# serial number = CE9A0B156B65
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
add allow-fast-path=no ipsec-secret=a06a8d2e9ce79e83372bc0620097049794720c7f \
    local-address=192.168.18.253 loop-protect=on mac-address=\
    02:AF:B7:C4:84:17 name=eoip-mng remote-address=192.168.2.253 tunnel-id=18
add allow-fast-path=no ipsec-secret=776a57f97ff742e632a992980dc09ea4511bb6cc \
    local-address=192.168.171.253 mac-address=02:D2:4A:60:53:4C name=\
    eoip-mng-obj remote-address=192.168.171.252 tunnel-id=171
/interface vlan
add arp=reply-only interface=ether6 name=V18 vlan-id=18
add arp=reply-only interface=ether6 name=V50 vlan-id=50
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
add add-arp=yes disabled=no interface=V18 lease-script=":local dnsRemoveAllByI\
    p \"1\"\r\
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
add add-arp=yes disabled=no interface=V50 lease-time=1h10m name=dhcp2
/ip pool
add name=dhcp_pool0 ranges=172.16.18.10-172.16.18.250
add name=dhcp_pool3 ranges=172.16.50.10-172.16.50.250
/ppp profile
set *FFFFFFFE local-address=172.16.50.253 remote-address=172.16.50.252 \
    use-compression=yes use-upnp=no
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:CF:5F:4C:0E:52 \
    name=ovpn-tula-demonstracyi password=\
    d26230c9bb91e2b79e71e129429ee1ad04f79b58 port=49100 profile=\
    default-encryption user=S-Kireevskij
/routing ospf instance
set [ find default=yes ] router-id=172.16.18.254
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
/interface l2tp-server server
set allow-fast-path=yes authentication=mschap1,mschap2 ipsec-secret=\
    1111111111 use-ipsec=yes
/interface list member
add disabled=yes interface=ovpn-tula-demonstracyi list=IL-NEIGHBOR
add disabled=yes interface=V255-MNG list=IL-NEIGHBOR
add disabled=yes interface=ovpn-in-object list=IL-NEIGHBOR
add disabled=yes list=IL-NEIGHBOR
add interface=ether2 list=IL-IN-DNS
add interface=V18 list=IL-IN-DNS
/interface ovpn-server server
set certificate=EDDS-SERVER cipher=blowfish128,aes256,null default-profile=\
    default-encryption enabled=yes netmask=32 port=49100
/ip address
add address=192.168.18.253/24 interface=ether1 network=192.168.18.0
add address=192.168.171.253/24 interface=ether2 network=192.168.171.0
add address=172.16.18.254/24 interface=V18 network=172.16.18.0
add address=172.16.18.254 interface=V255-MNG network=172.16.18.253
add address=172.16.50.254/24 interface=V50 network=172.16.50.0
add address=172.16.18.254 interface=br-loopback network=172.16.18.254
/ip arp
add address=172.16.18.253 interface=V255-MNG mac-address=6E:32:BD:FE:89:7B
/ip dhcp-client
add add-default-route=no disabled=no interface=br-mng
/ip dhcp-server lease
add address=172.16.18.250 mac-address=70:85:C2:FE:B5:4D server=dhcp1
add address=172.16.18.249 mac-address=00:D8:61:59:6A:A3 server=dhcp1
add address=172.16.50.247 mac-address=00:D8:61:59:6A:A2 server=dhcp2
/ip dhcp-server network
add address=172.16.18.0/24 dns-server=172.16.18.254 gateway=172.16.18.254 \
    ntp-server=172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.50.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=192.168.171.253 name=core.kireevsk.video.local
add address=172.16.18.250 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=arm.dubna.video.local ttl=15m
add address=172.16.18.250 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=arm ttl=15m
/ip firewall address-list
add address=172.16.50.0/24 list=AL-BLOCK
add address=192.168.0.0/16 list=AL-BLOCK
/ip firewall filter
add action=accept chain=forward connection-state=established,related
add action=accept chain=input connection-state=established,related
add action=accept chain=input comment=DNS dst-port=53 in-interface-list=\
    IL-IN-DNS protocol=udp
add action=accept chain=input in-interface=br-mng
add action=accept chain=input in-interface=ovpn-in-object protocol=ospf
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=input protocol=gre
add action=accept chain=input in-interface=ether1
add action=accept chain=input dst-port=49100 in-interface=ether2 protocol=tcp
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=ovpn-in-object protocol=icmp
add action=accept chain=forward dst-port=8291 in-interface=\
    ovpn-tula-demonstracyi out-interface=ovpn-in-object protocol=tcp
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V18
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=V18 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=V50 out-interface=ovpn-in-object
add action=accept chain=forward connection-state=new in-interface=V50 \
    out-interface=ether2
add action=drop chain=input
add action=drop chain=forward
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether2 src-address=\
    172.16.50.0/24
/ip route
add distance=1 gateway=192.168.18.254
add distance=10 dst-address=192.168.0.0/16 gateway=192.168.18.254
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
#interrupted
