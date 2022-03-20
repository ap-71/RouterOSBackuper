# mar/04/2022 04:50:49 by RouterOS 6.47.4
# software id = SKXE-PHPC
#
# model = RB1100x4
# serial number = CE9A0BE0C68E
/interface bridge
add arp=disabled dhcp-snooping=yes igmp-snooping=yes name=br-data_for_arm \
    protocol-mode=none
add name=br-loopback
add dhcp-snooping=yes igmp-snooping=yes name=br-mng
/interface ethernet
set [ find default-name=ether1 ] comment=\
    "\C2 \F1\F2\EE\F0\EE\ED\F3 \D2\F3\EB\FB "
set [ find default-name=ether3 ] comment=ARM disabled=yes
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether6 ] arp=reply-only
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] disabled=yes
set [ find default-name=ether12 ] disabled=yes
set [ find default-name=ether13 ] disabled=yes
/interface l2tp-server
add name=l2tp-in-object user=object
/interface ovpn-server
add name=ovpn-in-object user=object
/interface eoip
add local-address=192.168.179.253 mac-address=02:4A:20:8E:72:C4 name=\
    eoip-data_for_arm-obj remote-address=192.168.179.252 tunnel-id=1790
add allow-fast-path=no ipsec-secret=f660c79f073d2bda587e09dd8189d8b75562bf51 \
    local-address=192.168.21.253 mac-address=02:85:3E:55:AC:19 name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=21
add allow-fast-path=no ipsec-secret=776a57f97ff742e632a992980dc09ea4511bb6cc \
    local-address=192.168.179.253 mac-address=02:4A:20:8E:72:C4 name=\
    eoip-mng-obj remote-address=192.168.179.252 tunnel-id=179
/interface vlan
add arp=reply-only interface=ether6 name=V21 vlan-id=21
add arp=reply-only interface=ether6 name=V53 vlan-id=53
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
add name=il-vpn
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.16.21.10-172.16.21.250
add name=dhcp_pool3 ranges=172.16.53.10-172.16.53.250
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 disabled=no interface=V21 \
    lease-script=":local dnsRemoveAllByIp \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"plavsk.video.local\"\r\
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
add add-arp=yes address-pool=dhcp_pool3 disabled=no interface=V53 lease-time=\
    1h10m name=dhcp2
/ppp profile
set *FFFFFFFE interface-list=il-vpn local-address=172.16.53.253 \
    remote-address=172.16.53.252 use-compression=yes use-mpls=no use-upnp=no
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:3F:8E:94:0F:79 \
    name=ovpn-tula-demonstracyi password=\
    93ded65192f8db64bab1b58df1ae41cc86a7476b port=49100 profile=\
    default-encryption user=S-Plavskij
/routing ospf instance
set [ find default=yes ] redistribute-other-ospf=as-type-1 router-id=\
    172.16.21.254
add distribute-default=always-as-type-1 name=ospf-all router-id=172.16.53.253
/routing ospf area
add area-id=0.0.0.1 instance=ospf-all name=area-obj
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=br-mng interface=eoip-mng-obj
add bridge=br-mng interface=eoip-mng trusted=yes
add bridge=br-data_for_arm interface=ether3
add bridge=br-data_for_arm interface=eoip-data_for_arm-obj
/ip neighbor discovery-settings
set discover-interface-list=IL-NEIGHBOR
/interface l2tp-server server
set allow-fast-path=yes authentication=mschap1,mschap2 enabled=yes
/interface list member
add interface=ovpn-tula-demonstracyi list=IL-NEIGHBOR
add interface=V255-MNG list=IL-NEIGHBOR
add interface=ovpn-in-object list=IL-NEIGHBOR
/interface ovpn-server server
set certificate=EDDS-SERVER cipher=blowfish128,aes256,null default-profile=\
    default-encryption netmask=32 port=49100
/ip address
add address=192.168.21.253/24 interface=ether1 network=192.168.21.0
add address=192.168.179.253/24 interface=ether2 network=192.168.179.0
add address=172.16.21.254/24 interface=V21 network=172.16.21.0
add address=172.16.21.254 interface=V255-MNG network=172.16.21.253
add address=172.16.53.254/24 interface=V53 network=172.16.53.0
add address=172.16.21.254 interface=br-loopback network=172.16.21.254
add address=172.16.53.253 interface=br-loopback network=172.16.53.253
/ip arp
add address=172.16.53.251 interface=V53 mac-address=B4:2E:99:39:B6:DB
/ip dhcp-client
add add-default-route=no disabled=no interface=br-mng
/ip dhcp-server lease
add address=172.16.21.247 client-id=1:78:7b:8a:db:9f:35 mac-address=\
    78:7B:8A:DB:9F:35 server=dhcp1
add address=172.16.21.249 mac-address=70:85:C2:FE:B5:7F server=dhcp1
add address=172.16.21.250 mac-address=B4:2E:99:39:B6:DB server=dhcp1
/ip dhcp-server network
add address=172.16.21.0/24 dns-server=172.16.255.1 gateway=172.16.21.254 \
    ntp-server=172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.53.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=192.168.179.253 name=core.plavsk.video.local
add address=172.16.21.249 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=arm.plavsk.video.local ttl=15m
add address=172.16.21.249 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=arm ttl=15m
/ip firewall address-list
add address=172.16.53.0/24 list=AL-BLOCK
add address=192.168.0.0/16 list=AL-BLOCK
/ip firewall filter
add action=accept chain=forward connection-state=established,related
add action=accept chain=input connection-state=established,related
add action=accept chain=input comment=DNS dst-port=53 protocol=udp
add action=accept chain=input in-interface=br-mng
add action=accept chain=input in-interface-list=il-vpn protocol=ospf
add action=accept chain=input protocol=gre
add action=accept chain=input dst-port=49100 in-interface=ether2 protocol=tcp \
    src-address=192.168.179.0/24
add action=accept chain=input dst-port=1701 in-interface=ether2 protocol=udp \
    src-address=192.168.179.0/24
add action=accept chain=input in-interface=ether2 protocol=gre src-address=\
    192.168.179.0/24
add action=accept chain=input in-interface=ether1
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface-list=il-vpn protocol=icmp
add action=accept chain=forward dst-port=8291 in-interface=\
    ovpn-tula-demonstracyi out-interface-list=il-vpn protocol=tcp
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V21
add action=accept chain=forward in-interface=V21 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward comment=ARM->macroscope in-interface=V21 \
    out-interface=l2tp-in-object src-address=172.16.21.249
add action=accept chain=forward in-interface=V53 out-interface=ether2
add action=accept chain=forward in-interface=V53 out-interface-list=il-vpn
add action=drop chain=input
add action=drop chain=forward
/ip route
add distance=1 gateway=192.168.21.254
add distance=10 dst-address=192.168.2.0/24 gateway=192.168.21.254
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
#error exporting /ip socks
#interrupted
