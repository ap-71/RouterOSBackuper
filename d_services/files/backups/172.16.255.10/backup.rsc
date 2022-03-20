# mar/03/2022 07:24:07 by RouterOS 6.47
# software id = ZWD3-SHPW
#
# model = RB1100x4
# serial number = CE9A0B828C73
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
add allow-fast-path=no ipsec-secret=285a4953f03a4fdde6733fd3e745e6c6b1ac03cc \
    local-address=192.168.10.253 mac-address=02:3B:B5:9B:56:25 name=eoip-mng \
    remote-address=192.168.2.253 tunnel-id=10
/interface vlan
add arp=reply-only interface=ether6 name=V10 vlan-id=10
add interface=ether6 name=V42 vlan-id=42
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
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=172.16.10.10-172.16.10.250
add name=dhcp_pool3 ranges=172.16.42.10-172.16.42.250
/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool0 disabled=no interface=V10 \
    lease-script=":local dnsRemoveAllByIp \"1\"\r\
    \n# When \"1\" all DNS entries with hostname of DHCP lease are removed\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n# When \"1\" addition and removal of DNS entries is always done also for\
    \_non-FQDN hostname\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n# DNS domain to add after DHCP client hostname\r\
    \n:local dnsDomain \"belev.video.local\"\r\
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
add add-arp=yes address-pool=dhcp_pool3 disabled=no interface=V42 lease-time=\
    1h10m name=dhcp2
/interface ovpn-client
add cipher=null connect-to=core.video.local mac-address=FE:70:9D:25:60:6C \
    name=ovpn-tula-demonstracyi password=\
    0819400c1b20d6dfff79ccb9a3953b66226f26f8 port=49100 profile=\
    default-encryption user=S-Belevskij
/routing ospf instance
set [ find default=yes ] router-id=172.16.10.254
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
/ip address
add address=192.168.10.253/24 interface=ether1 network=192.168.10.0
add address=192.168.144.253/24 interface=ether2 network=192.168.144.0
add address=172.16.10.254/24 interface=V10 network=172.16.10.0
add address=172.16.10.254 interface=V255-MNG network=172.16.10.253
add address=172.16.42.254/24 interface=V42 network=172.16.42.0
add address=192.168.1.254/24 interface=V42 network=192.168.1.0
add address=172.16.10.254 interface=br-loopback network=172.16.10.254
/ip arp
add address=172.16.42.249 interface=V42 mac-address=B4:2E:99:3F:B7:8A
/ip dhcp-client
add add-default-route=no disabled=no interface=eoip-mng
/ip dhcp-server lease
add address=172.16.10.248 mac-address=70:85:C2:FE:B5:0A server=dhcp1
add address=172.16.10.249 mac-address=B4:2E:99:3F:B7:8A server=dhcp1
/ip dhcp-server network
add address=172.16.10.0/24 dns-server=172.16.255.1 gateway=172.16.10.254 \
    ntp-server=172.16.2.251,172.16.2.200,172.16.255.1
add address=172.16.42.0/24
/ip dns
set allow-remote-requests=yes servers=192.168.2.253
/ip dns static
add address=172.16.10.249 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=belev.belev.video.local ttl=15m type=A
add address=172.16.10.249 comment=dhcp-lease-script_dhcp1_lease-hostname \
    name=belev ttl=15m type=A
/ip firewall address-list
add address=172.16.42.0/24 list=AL-BLOCK
add address=192.168.0.0/16 list=AL-BLOCK
add address=belev.belev.video.local list=al-acc_to_cam
/ip firewall filter
add action=accept chain=forward connection-state=established,related
add action=accept chain=input connection-state=established,related
add action=accept chain=input comment=DNS dst-port=53 protocol=udp
add action=accept chain=input in-interface=ether1 protocol=gre
add action=accept chain=input in-interface=ether1
add action=accept chain=input in-interface=eoip-mng
add action=accept chain=input in-interface=ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V10
add action=accept chain=forward in-interface=ovpn-tula-demonstracyi \
    out-interface=V255-MNG
add action=accept chain=forward in-interface=V10 out-interface=\
    ovpn-tula-demonstracyi
add action=accept chain=forward in-interface=V42 out-interface=ether2
add action=accept chain=forward in-interface=V10 out-interface=ether2 \
    src-address-list=al-acc_to_cam
add action=accept chain=forward out-interface=V42 src-address=172.16.42.0/24
add action=accept chain=forward out-interface=V42 src-address-list=\
    al-acc_to_cam
add action=drop chain=input
add action=drop chain=forward
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether2 src-address=\
    172.16.42.0/24
add action=masquerade chain=srcnat out-interface=ether2 src-address-list=\
    al-acc_to_cam
add action=masquerade chain=srcnat dst-address=192.168.1.0/24 out-interface=\
    V42 src-address=172.16.42.0/24
add action=masquerade chain=srcnat dst-address=192.168.1.0/24 out-interface=\
    V42 src-address-list=al-acc_to_cam
/ip route
add distance=1 gateway=192.168.10.254
add distance=10 dst-address=192.168.0.0/16 gateway=192.168.10.254
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
#error exporting /ip smb
#interrupted
