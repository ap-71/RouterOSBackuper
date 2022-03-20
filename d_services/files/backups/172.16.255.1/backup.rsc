# mar/06/2022 14:02:20 by RouterOS 6.48.6
# software id = MRD3-XQ53
#
# model = RB1100Dx4
# serial number = D0BF0BF5459A
/interface bridge
add admin-mac=02:BF:00:35:32:5D auto-mac=no igmp-snooping=yes mtu=1500 name=\
    br-lan protocol-mode=none vlan-filtering=yes
add admin-mac=66:95:78:A4:8A:99 auto-mac=no name=br-loopback
add admin-mac=02:BF:00:35:35:5D auto-mac=no dhcp-snooping=yes igmp-snooping=\
    yes name=br-mng
add admin-mac=D2:66:DF:52:E1:17 auto-mac=no name=br-mng-loopback
add admin-mac=C4:AD:34:9D:3B:EE auto-mac=no mtu=1500 name=br-wan-region
/interface ethernet
set [ find default-name=ether1 ] comment=\
    "\EC\F3\ED\E8\F6\E8\EF\E0\EB\FC\ED\FB\E9 \F3\F0\EE\E2\E5\ED\FC" name=\
    ether1-mucLevel
set [ find default-name=ether2 ] comment=sfp->sit.center l2mtu=2026 name=\
    ether2-sitCenter
set [ find default-name=ether3 ] arp=disabled comment=\
    "\F1\E5\F0\E2\E5\F0 - UPS1" name=ether3-serverUPS1
set [ find default-name=ether4 ] arp=disabled
set [ find default-name=ether5 ] arp=disabled comment="\C0\D0\CC" name=\
    ether5-ARM
set [ find default-name=ether6 ] comment=Glonas name=ether6-glonas
set [ find default-name=ether7 ] arp=disabled
set [ find default-name=ether8 ] arp=disabled comment=\
    "\F1\E5\F0\E2\E5\F0 - UPS2" name=ether8-serverUPS2
set [ find default-name=ether9 ] comment=\
    "wan - \F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC" name=ether9-specLevel
set [ find default-name=ether10 ] arp=disabled comment=\
    "lan - spec - \D1\E5\F0\E2\E5\F0 - \E8\ED\F2\E5\E3\F0\E0" name=\
    ether10-specLevel-serverIntegra
set [ find default-name=ether11 ] arp=disabled comment=\
    "lan - spec - \D1\E5\F0\E2\E5\F0 - \E8\ED\F2\E5\E3\F0\E0" name=\
    ether11-specLevel-serverIntegra
set [ find default-name=ether12 ] arp=disabled comment="RB1100 - 172.16.2.2" \
    name=ether12-RB1100-172.16.2.2
set [ find default-name=ether13 ] arp=reply-only comment=\
    "\C8\ED\F2\E5\F0\ED\E5\F2" name=ether13-internet
/interface pppoe-client
add add-default-route=yes allow=pap default-route-distance=200 disabled=no \
    interface=ether13-internet name=pppoe-rt-internet password=Zc9kOqH2 user=\
    1603396-1@tula.net
/interface ovpn-server
add name=S-p_kos_gora_priroda user=S-p_kos_gora_priroda
add disabled=yes name=S-rp_novogur_cement user=S-rp_novogur_cement
add name=ovpn-S-Aleksin-3 user=S-Aleksin
add name=ovpn-S-Belevskij-10 user=S-Belevskij
add name=ovpn-S-Bogorodickij-11 user=S-Bogorodickij
add disabled=yes name=ovpn-S-Chernskij user=S-Chernskij
add disabled=yes name=ovpn-S-Donskoj user=S-Donskoj
add name=ovpn-S-Dubenskij-14 user=S-Dubenskij
add disabled=yes name=ovpn-S-Efremov user=S-Efremov
add disabled=yes name=ovpn-S-Jasnogorskij user=S-Jasnogorskij
add disabled=yes name=ovpn-S-Kamenskij user=S-Kamenskij
add name=ovpn-S-Kimovskij-17 user=S-Kimovskij
add name=ovpn-S-Kireevskij-18 user=S-Kireevskij
add disabled=yes name=ovpn-S-Kurkinskij user=S-Kurkinskij
add name=ovpn-S-MNG-Notebook user=S-Management-note
add name=ovpn-S-Management user=S-Management
add disabled=yes name=ovpn-S-Novogurovskij user=S-Novogurovskij
add disabled=yes name=ovpn-S-Novomoskovsk user=S-Novomoskovsk
add name=ovpn-S-Odoevskij user=S-Odoevskij
add name=ovpn-S-Plavskij user=S-Plavskij
add name=ovpn-S-Shhekinskij user=S-Shhekinskij
add disabled=yes name=ovpn-S-Slavnyj user=S-Slavnyj
add name=ovpn-S-Suvorovskij user=S-Suvorovskij
add disabled=yes name=ovpn-S-Teplo-Ogarevskij user=S-Teplo-Ogarevskij
add disabled=yes name=ovpn-S-Tulskij user=S-Tulskij
add disabled=yes name=ovpn-S-Uzlovskij user=S-Uzlovskij
add disabled=yes name=ovpn-S-Venevskij user=S-Venevskij
add disabled=yes name=ovpn-S-Volovskij user=S-Volovskij
add name=ovpn-S-Vostok-av user=S-Vostok-av
add disabled=yes name=ovpn-S-Zaokskij user=S-Zaokskij
add name=ovpn-S-spec-FSB-251 user=S-FSB
add name=ovpn-S-spec-OBJ-248 user=S-OBJ-248
add name=ovpn-S-spec-OBJ-249 user=S-OBJ-249
add name=ovpn-S-spec-UVD user=S-UVD
add name=ovpn-S-spec-UVD-2 user=S-UVD-2
add disabled=yes name=ovpn-s-c-eve-vm user=s-cit-eve-vm
add name=ovpn-s-enpv-253 user=s-enpv-253
add name=s-sma-hpc user=s-sma-hpc
/interface eoip
add local-address=192.168.131.253 loop-protect=on mac-address=\
    02:BF:00:35:32:5D name=eoip-data-FaceSearch-F remote-address=\
    192.168.231.251 tunnel-id=1251
add local-address=192.168.131.253 loop-protect=on mac-address=\
    02:F0:6E:14:0E:ED name=eoip-data-FaceSearch-MVD remote-address=\
    192.168.131.248 tunnel-id=1252
add allow-fast-path=no disabled=yes ipsec-secret=\
    df8f6ad6bda4d9254c82a69acc12ed03dce6e530 local-address=192.168.2.253 \
    loop-protect=on mac-address=02:1C:B4:33:F5:32 name=eoip-mng-3-aleksin \
    remote-address=192.168.3.253 tunnel-id=3
add allow-fast-path=no ipsec-secret=285a4953f03a4fdde6733fd3e745e6c6b1ac03cc \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-10-belev remote-address=192.168.10.253 tunnel-id=10
add allow-fast-path=no ipsec-secret=a767653c231465a0befc2be1c670023243a10421 \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-11-bogoroditsk remote-address=192.168.11.253 tunnel-id=11
add allow-fast-path=no ipsec-secret=6121a76c00ba3bc71c63f74101862fa5b449ed7a \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-14-dubna remote-address=192.168.14.253 tunnel-id=14
add allow-fast-path=no ipsec-secret=a06a8d2e9ce79e83372bc0620097049794720c7f \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-17-kimovsk remote-address=192.168.17.253 tunnel-id=17
add allow-fast-path=no ipsec-secret=a06a8d2e9ce79e83372bc0620097049794720c7f \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-18-kireevsk remote-address=192.168.18.253 tunnel-id=18
add allow-fast-path=no ipsec-secret=3518142b4ecd18885ae04c73a17bfba68e4014a8 \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-20-odoev remote-address=192.168.20.253 tunnel-id=20
add allow-fast-path=no ipsec-secret=f660c79f073d2bda587e09dd8189d8b75562bf51 \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-21-plavsk remote-address=192.168.21.253 tunnel-id=21
add allow-fast-path=no ipsec-secret=f1396f29afacd198e83de2ad6d069f111638adaa \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-22-suvorov remote-address=192.168.22.253 tunnel-id=22
add allow-fast-path=no ipsec-secret=1f5a1e7ef2083e0496f4b240f209904c7dcd3fc1 \
    local-address=192.168.2.253 loop-protect=on mac-address=02:1C:B4:33:F5:32 \
    name=eoip-mng-26-schekino remote-address=192.168.26.253 tunnel-id=26
add allow-fast-path=no disabled=yes ipsec-secret=\
    353f6b71efc0ede67a9e5d98ce55e3c778ba80b4 loop-protect=on mac-address=\
    02:1C:B4:33:F5:33 name=eoip-mng-102-tula remote-address=192.168.2.252 \
    tunnel-id=102
add allow-fast-path=no ipsec-secret=e9e6fb17684e80bcfb627215e56e49625e3919c6 \
    local-address=192.168.131.253 loop-protect=on mac-address=\
    02:1C:B4:33:F5:33 name=eoip-mng-248-mvd remote-address=192.168.131.248 \
    tunnel-id=248
add allow-fast-path=no disabled=yes ipsec-secret=\
    0834c385ce26628a0c1f94bed8b0e93fa8551c47 local-address=192.168.131.253 \
    loop-protect=on mac-address=02:1C:B4:33:F5:33 name=eoip-mng-249 \
    remote-address=192.168.131.249 tunnel-id=249
add allow-fast-path=no disabled=yes ipsec-secret=\
    5a8237eb6288bd81e4e4761e46fa991c43a9aef8 local-address=192.168.131.253 \
    loop-protect=on mac-address=02:1C:B4:33:F5:33 name=eoip-mng-250 \
    remote-address=192.168.131.250 tunnel-id=250
add allow-fast-path=no ipsec-secret=89721232730f2249bab86a6bb7482c2118e6bfbc \
    local-address=192.168.131.253 loop-protect=on mac-address=\
    02:1C:B4:33:F5:33 name=eoip-mng-251-fsb remote-address=192.168.231.251 \
    tunnel-id=251
add allow-fast-path=no disabled=yes ipsec-secret=\
    1acde478f4fa57f963f19449c7472e279207a014 local-address=192.168.131.253 \
    loop-protect=on mac-address=02:1C:B4:33:F5:33 name=eoip-mng-252 \
    remote-address=192.168.131.252 tunnel-id=252
add allow-fast-path=no disabled=yes loop-protect=on mac-address=\
    02:F1:D1:E2:DE:13 name=eoip-mng-Managment remote-address=172.16.255.254 \
    tunnel-id=1000
add allow-fast-path=no disabled=yes ipsec-secret=\
    eoip-tunnel-10016-p_kos_goraeoip-tunnel-10016-p_kos_gora local-address=\
    192.168.132.252 mac-address=02:C4:AB:5C:27:82 name=\
    eoip-tunnel-10016-p_kos_gora remote-address=192.168.116.253 tunnel-id=\
    10016
add allow-fast-path=no disabled=yes ipsec-secret=\
    eoip-tunnel-10036-rp_novogureoip-tunnel-10036-rp_novogur local-address=\
    192.168.2.253 mac-address=02:C4:AB:5C:27:82 name=\
    eoip-tunnel-10036-rp_novogur remote-address=10.100.36.2 tunnel-id=10036
add disabled=yes mac-address=02:BB:18:BD:39:29 name=\
    eoip-tunnel-CUKS-demonstration remote-address=192.168.2.252 tunnel-id=\
    3252
add disabled=yes mac-address=02:37:B5:7E:64:46 name=eoip-tunnel-Demonstration \
    remote-address=192.168.2.250 tunnel-id=2000
/interface vlan
add interface=br-lan name=v2 vlan-id=2
add interface=br-lan name=v10_for_setting vlan-id=10
add interface=br-lan name=v131-lan-spec vlan-id=131
add interface=br-lan name=v132-FaceSearch vlan-id=132
add arp=reply-only interface=br-lan name=v252-data-SitCentr vlan-id=252
add interface=br-lan name=v255-mng vlan-id=255
add interface=br-lan name=v1132-p_kos_gora_priroda vlan-id=1132
add interface=br-lan name=v2552 vlan-id=2552
add interface=br-lan name=v3421-region-level vlan-id=3421
add interface=br-lan name=v3422-moscow vlan-id=3422
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
add name=il-wan
add name=il-lan
add name=il-ovpn-tula_region
add name=il-neighbors
add name=il-ovpn-spec
add include=il-ovpn-spec,il-ovpn-tula_region name=il-f-ntp-to-lan
add name=il-in-ovpn-serv-int
add name=il-in-ovpn-contr
add include=il-ovpn-spec,il-ovpn-tula_region name=il-ovpn-spec_and_tularegion
add include=all name=il-dhcp
add name=il-mng
add include=il-ovpn-tula_region,il-ovpn-spec name=il-in-dns
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server
add add-arp=yes disabled=no interface=v252-data-SitCentr lease-time=1d name=\
    d-sit_center-250
/ip ipsec profile
add dh-group=modp1024 enc-algorithm=3des name=profile-phase1
/ip ipsec peer
add address=192.168.255.200/32 disabled=yes name=peer-sitCentr-255.200 \
    profile=profile-phase1
/ip ipsec proposal
add enc-algorithms=aes-128-cbc lifetime=1h name=proposal-phase2
/ip pool
add name=pool-video ranges=172.16.2.200-172.16.2.253
add name=pool-spec ranges=172.16.131.10-172.16.131.250
add name=pool-relay-202 ranges=172.16.202.100-172.16.202.250
add name=pool-sit_center-250 ranges=172.16.250.100-172.16.250.250
add name=pool-FaceSearch ranges=172.16.132.100-172.16.132.250
add name=pool-mng ranges=192.168.255.5-192.168.255.200
/ip dhcp-server
add add-arp=yes address-pool=pool-video disabled=no interface=v2 \
    lease-script=":local dnsRemoveAllByIp \"1\"\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n:local dnsDomain \"video.local\"\r\
    \n:local dnsTtl \"00:15:00\"\r\
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
    \n}" lease-time=1h name=d-video
add add-arp=yes address-pool=pool-spec disabled=no interface=v131-lan-spec \
    lease-script=":local dnsRemoveAllByIp \"1\"\r\
    \n:local dnsRemoveAllByName \"1\"\r\
    \n:local dnsAlwaysNonfqdn \"1\"\r\
    \n:local dnsDomain \"spec.video.local\"\r\
    \n:local dnsTtl \"00:15:00\"\r\
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
    \n}" lease-time=1d name=d-lan-spec
add add-arp=yes address-pool=pool-relay-202 disabled=no interface=v2 \
    lease-time=1h10m name=d-relay-202 relay=172.16.202.254
add address-pool=pool-FaceSearch disabled=no interface=v132-FaceSearch \
    lease-time=1h10m name=d-FaceSearch
add address-pool=pool-mng disabled=no interface=br-mng lease-time=1h10m name=\
    d-mng
/ppp profile
add address-list=AL-OVPN-Tula_Region change-tcp-mss=yes dns-server=\
    172.16.255.1 interface-list=il-ovpn-tula_region local-address=\
    172.16.255.1 name=P-OVPN use-compression=yes use-encryption=yes use-mpls=\
    no use-upnp=no wins-server=172.16.255.1
add address-list=AL-OVPN-Spec change-tcp-mss=yes dns-server=172.16.255.1 \
    interface-list=il-ovpn-spec local-address=172.16.255.1 name=P-OVPN-Spec \
    use-compression=yes use-encryption=yes use-mpls=no use-upnp=no \
    wins-server=172.16.255.1
add address-list=al-in-ovpn-contr change-tcp-mss=yes dns-server=172.16.255.1 \
    interface-list=il-in-ovpn-contr local-address=172.16.255.1 name=\
    p-ovpn-contr use-compression=yes use-encryption=yes use-mpls=no use-upnp=\
    no wins-server=172.16.255.1
add address-list=AL-OVPN-Tula_Region change-tcp-mss=yes dns-server=\
    172.16.255.1 interface-list=il-mng local-address=172.16.255.1 name=\
    p-ovpn-mng use-compression=yes use-encryption=yes use-mpls=no use-upnp=no \
    wins-server=172.16.255.1
set *FFFFFFFE use-mpls=no use-upnp=no
/routing ospf instance
set [ find default=yes ] router-id=172.16.255.1
add disabled=yes name=ospf-mng router-id=192.168.255.254 routing-table=rm-mng
/routing ospf area
add area-id=0.0.0.2 disabled=yes instance=ospf-mng name=area-mng
/snmp community
set [ find default=yes ] authentication-protocol=SHA1 encryption-protocol=AES
/system logging action
set 3 remote=172.16.2.203
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=dude policy="local,ssh,reboot,read,write,test,winbox,sniff,dude,tikap\
    p,!telnet,!ftp,!policy,!password,!web,!sensitive,!api,!romon"
add name=backup policy="ssh,read,write,!local,!telnet,!ftp,!reboot,!policy,!te\
    st,!winbox,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/certificate scep-server
add ca-cert=TULA-CA days-valid=1200 path=/scep/CA
/interface bridge port
add bridge=br-lan interface=ether3-serverUPS1 pvid=2
add bridge=br-lan interface=ether4 pvid=2
add bridge=br-lan interface=ether5-ARM pvid=2
add bridge=br-lan interface=ether7 pvid=2
add bridge=br-lan interface=ether8-serverUPS2 pvid=2
add bridge=br-lan horizon=1 interface=ether10-specLevel-serverIntegra pvid=\
    131
add bridge=br-lan horizon=1 interface=ether11-specLevel-serverIntegra pvid=\
    131
add bridge=br-wan-region interface=eoip-mng-Managment
add bridge=br-lan frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether12-RB1100-172.16.2.2
add bridge=br-lan interface=eoip-tunnel-CUKS-demonstration pvid=2
add bridge=br-lan horizon=1 interface=eoip-data-FaceSearch-F pvid=132
add bridge=br-lan frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether2-sitCenter
add bridge=br-lan frame-types=admit-only-vlan-tagged ingress-filtering=yes \
    interface=ether1-mucLevel
add bridge=br-mng horizon=1 interface=eoip-mng-3-aleksin
add bridge=br-mng horizon=1 interface=eoip-mng-10-belev
add bridge=br-mng horizon=1 interface=eoip-mng-11-bogoroditsk
add bridge=br-mng horizon=1 interface=eoip-mng-14-dubna
add bridge=br-mng horizon=1 interface=eoip-mng-17-kimovsk
add bridge=br-mng horizon=1 interface=eoip-mng-18-kireevsk
add bridge=br-mng horizon=1 interface=eoip-mng-20-odoev
add bridge=br-mng horizon=1 interface=eoip-mng-21-plavsk
add bridge=br-mng horizon=1 interface=eoip-mng-22-suvorov
add bridge=br-mng horizon=1 interface=eoip-mng-26-schekino
add bridge=br-mng horizon=1 interface=eoip-mng-102-tula
add bridge=br-mng horizon=1 interface=eoip-mng-248-mvd
add bridge=br-mng horizon=1 interface=eoip-mng-249
add bridge=br-mng horizon=1 interface=eoip-mng-250
add bridge=br-mng horizon=1 interface=eoip-mng-251-fsb
add bridge=br-mng horizon=1 interface=eoip-mng-252
add bridge=br-mng horizon=1 interface=v255-mng
add bridge=br-lan horizon=1 interface=eoip-data-FaceSearch-MVD pvid=132
add bridge=br-mng horizon=1 interface=eoip-tunnel-10016-p_kos_gora
add bridge=br-mng horizon=1 interface=eoip-tunnel-10036-rp_novogur
/ip neighbor discovery-settings
set discover-interface-list=none
/interface bridge vlan
add bridge=br-lan tagged=ether12-RB1100-172.16.2.2,br-lan untagged=\
    ether3-serverUPS1,ether4,ether5-ARM,ether7,ether8-serverUPS2 vlan-ids=2
add bridge=br-lan tagged=ether12-RB1100-172.16.2.2,br-lan,ether2-sitCenter \
    vlan-ids=255
add bridge=br-lan tagged=ether12-RB1100-172.16.2.2,br-lan vlan-ids=132
add bridge=br-lan tagged=ether2-sitCenter,br-lan vlan-ids=252
add bridge=br-lan tagged=br-lan untagged=\
    ether10-specLevel-serverIntegra,ether11-specLevel-serverIntegra vlan-ids=\
    131
add bridge=br-lan tagged=br-lan,ether1-mucLevel vlan-ids=3421
add bridge=br-lan tagged=br-lan,ether1-mucLevel vlan-ids=3422
add bridge=br-lan tagged=br-lan,ether12-RB1100-172.16.2.2 vlan-ids=2552
add bridge=br-lan tagged=br-lan,ether12-RB1100-172.16.2.2 vlan-ids=10
add bridge=br-lan tagged=ether12-RB1100-172.16.2.2,br-lan vlan-ids=1132
/interface list member
add interface=v3421-region-level list=il-wan
add interface=ether2-sitCenter list=il-lan
add interface=ether3-serverUPS1 list=il-lan
add interface=ether4 list=il-lan
add interface=ether5-ARM list=il-lan
add interface=ether6-glonas list=il-lan
add disabled=yes interface=ether7 list=il-lan
add interface=ether8-serverUPS2 list=il-lan
add interface=ether12-RB1100-172.16.2.2 list=il-lan
add interface=ether13-internet list=il-lan
add interface=v3421-region-level list=il-neighbors
add disabled=yes interface=ether2-sitCenter list=il-neighbors
add interface=v3421-region-level list=il-in-dns
add interface=v2 list=il-in-dns
add interface=ether9-specLevel list=il-in-dns
add interface=br-wan-region list=il-in-dns
add interface=v131-lan-spec list=il-in-dns
add interface=v3421-region-level list=il-in-ovpn-serv-int
add interface=ether9-specLevel list=il-in-ovpn-serv-int
add interface=pppoe-rt-internet list=il-in-ovpn-serv-int
add disabled=yes interface=ether2-sitCenter list=il-in-dns
add disabled=yes interface=ether2-sitCenter list=il-in-ovpn-serv-int
add interface=v2 list=il-dhcp
add interface=v252-data-SitCentr list=il-dhcp
add interface=v132-FaceSearch list=il-dhcp
add interface=v252-data-SitCentr list=il-ovpn-spec
add interface=v252-data-SitCentr list=il-in-dns
/interface ovpn-server server
set certificate=TULA-SERVER cipher=blowfish128,aes256,null default-profile=\
    P-OVPN enabled=yes port=49100
/ip address
add address=192.168.2.253/24 interface=v3421-region-level network=192.168.2.0
add address=172.16.2.254/24 interface=v2 network=172.16.2.0
add address=192.168.131.253/24 interface=ether9-specLevel network=\
    192.168.131.0
add address=172.16.131.254/24 interface=v131-lan-spec network=172.16.131.0
add address=172.16.255.1 interface=br-loopback network=172.16.255.1
add address=10.34.30.253/24 disabled=yes interface=ether13-internet network=\
    10.34.30.0
add address=10.71.71.2/30 interface=v3422-moscow network=10.71.71.0
add address=172.16.132.253 interface=v132-FaceSearch network=172.16.132.253
add address=172.16.250.254/24 interface=v252-data-SitCentr network=\
    172.16.250.0
add address=192.168.255.254/24 interface=br-mng network=192.168.255.0
add address=192.168.255.254 interface=br-loopback network=192.168.255.254
add address=172.16.255.1 interface=v2552 network=172.16.255.2
add address=192.168.147.26/30 interface=ether6-glonas network=192.168.147.24
add address=10.100.16.1/30 disabled=yes interface=v10_for_setting network=\
    10.100.16.0
add address=10.100.36.1/30 disabled=yes interface=v10_for_setting network=\
    10.100.36.0
add address=192.168.132.252/24 interface=v1132-p_kos_gora_priroda network=\
    192.168.132.0
/ip dhcp-server lease
add address=172.16.2.253 client-id=1:ac:1f:6b:3b:8a:c9 mac-address=\
    AC:1F:6B:3B:8A:C9 server=d-video
add address=172.16.2.251 mac-address=AC:1F:6B:3A:D1:BE server=d-video
add address=172.16.2.200 mac-address=3C:EC:EF:02:BC:C5 server=d-video
add address=172.16.2.250 client-id=1:ac:1f:6b:3b:8a:cf mac-address=\
    AC:1F:6B:3B:8A:CF server=d-video
add address=172.16.2.248 mac-address=AC:1F:6B:3A:D1:CA server=d-video
add address=172.16.2.249 client-id=1:78:7b:8a:db:9f:35 mac-address=\
    78:7B:8A:DB:9F:35 server=d-video
add address=172.16.131.250 mac-address=AC:1F:6B:3A:D1:BF server=d-lan-spec
add address=172.16.131.249 mac-address=AC:1F:6B:3A:D1:CB server=d-lan-spec
add address=172.16.2.246 mac-address=B4:2E:99:3F:B7:8C server=d-video
add address=172.16.2.2 client-id=1:c4:ad:34:d3:5:1d mac-address=\
    C4:AD:34:D3:05:1D server=d-video
add address=172.16.2.240 mac-address=08:00:27:0A:CB:42 server=d-video
add address=172.16.2.204 client-id=1:4:92:26:10:9e:a1 mac-address=\
    04:92:26:10:9E:A1 server=d-video
add address=172.16.2.206 client-id=1:0:1c:42:fc:32:64 mac-address=\
    00:1C:42:FC:32:64 server=d-video
add address=172.16.2.201 client-id=1:8:0:27:19:dd:1d mac-address=\
    08:00:27:19:DD:1D server=d-video
add address=172.16.202.249 client-id=1:70:85:c2:fe:da:67 mac-address=\
    70:85:C2:FE:DA:67 server=d-relay-202
add address=172.16.202.248 client-id=1:a8:5e:45:2d:0:7c mac-address=\
    A8:5E:45:2D:00:7C server=d-relay-202
add address=172.16.202.239 client-id=1:2c:fd:a1:5a:50:18 mac-address=\
    2C:FD:A1:5A:50:18 server=d-relay-202
add address=172.16.202.237 client-id=1:3c:2c:30:99:2b:26 mac-address=\
    3C:2C:30:99:2B:26 server=d-relay-202
add address=172.16.250.249 client-id=1:a8:5e:45:e5:17:34 comment="\CF\CA(\E8\
    \ED\F2\E5\E3\F0\E0)+\D2\E5\EB\E5\E2\E8\E7\EE\F0 \E2 \D1\E8\F2 \F6\E5\ED\F2\
    \F0\E5 \E2 \F1\F2\E5\EA\EB\FF\F8\EA\E5 " mac-address=A8:5E:45:E5:17:34 \
    server=d-sit_center-250
add address=172.16.2.3 disabled=yes mac-address=48:8F:5A:CE:24:1D server=\
    d-video
add address=172.16.132.246 client-id=1:4:d9:f5:51:15:f9 comment=STATIC \
    mac-address=04:D9:F5:51:15:F9 server=d-FaceSearch
add address=172.16.132.245 client-id=1:d4:5d:64:3e:a0:90 comment=STATIC \
    mac-address=D4:5D:64:3E:A0:90 server=d-FaceSearch
add address=172.16.132.240 client-id=1:84:2a:fd:c:d0:ee mac-address=\
    84:2A:FD:0C:D0:EE server=d-FaceSearch
add address=172.16.132.241 client-id=1:a8:a1:59:23:af:5b mac-address=\
    A8:A1:59:23:AF:5B server=d-FaceSearch
add address=172.16.132.254 client-id=1:c4:ad:34:d3:5:18 mac-address=\
    C4:AD:34:D3:05:18 server=d-FaceSearch
add address=172.16.132.238 client-id=1:d4:5d:64:3e:a0:93 mac-address=\
    D4:5D:64:3E:A0:93 server=d-FaceSearch
add address=172.16.2.202 client-id=\
    ff:e2:34:3f:3e:0:2:0:0:ab:11:fa:16:c4:8a:e2:85:4e:be mac-address=\
    08:00:27:65:95:89 server=d-video
add address=172.16.132.239 client-id=1:4:d9:f5:51:15:fa mac-address=\
    04:D9:F5:51:15:FA server=d-FaceSearch
add address=172.16.132.234 client-id=1:d4:5d:64:3e:a0:92 mac-address=\
    D4:5D:64:3E:A0:92 server=d-FaceSearch
add address=172.16.132.233 comment="\C0\D0\CC \D4\D1\C1" mac-address=\
    A8:A1:59:38:A8:80 server=d-FaceSearch
add address=192.168.255.10 client-id=1:fe:8a:b9:fa:45:f4 mac-address=\
    FE:8A:B9:FA:45:F4 server=d-mng
add address=192.168.255.12 mac-address=02:B7:B4:18:8E:B1 server=d-mng
add address=192.168.255.198 client-id=1:2:e2:35:76:98:3c mac-address=\
    02:E2:35:76:98:3C server=d-mng
add address=192.168.255.197 client-id=1:2:dc:e3:a9:9b:b mac-address=\
    02:DC:E3:A9:9B:0B server=d-mng
add address=192.168.255.196 client-id=1:fe:d8:d6:f:58:0 mac-address=\
    FE:D8:D6:0F:58:00 server=d-mng
add address=192.168.255.194 client-id=1:fe:f3:ba:10:e6:2f mac-address=\
    FE:F3:BA:10:E6:2F server=d-mng
add address=192.168.255.193 client-id=1:fe:ad:d2:4:a4:14 mac-address=\
    FE:AD:D2:04:A4:14 server=d-mng
add address=192.168.255.192 client-id=1:2:60:5a:36:2b:79 mac-address=\
    02:60:5A:36:2B:79 server=d-mng
add address=192.168.255.191 client-id=1:2:3b:b5:9b:56:25 mac-address=\
    02:3B:B5:9B:56:25 server=d-mng
add address=192.168.255.190 client-id=1:2:d2:4a:60:53:4c mac-address=\
    02:D2:4A:60:53:4C server=d-mng
add address=192.168.255.189 client-id=1:2:63:a8:36:a4:f7 mac-address=\
    02:63:A8:36:A4:F7 server=d-mng
add address=192.168.255.188 client-id=1:2:d7:96:77:4:ab mac-address=\
    02:D7:96:77:04:AB server=d-mng
add address=192.168.255.187 mac-address=02:75:0F:DD:6D:E8 server=d-mng
add address=192.168.255.186 client-id=1:2:4a:20:8e:72:c4 mac-address=\
    02:4A:20:8E:72:C4 server=d-mng
add address=192.168.255.185 client-id=1:fe:c9:32:9:1d:bf mac-address=\
    FE:C9:32:09:1D:BF server=d-mng
add address=192.168.255.184 client-id=1:fe:ed:9e:2b:f4:13 mac-address=\
    FE:ED:9E:2B:F4:13 server=d-mng
add address=192.168.255.183 client-id=1:fe:cf:ac:6c:a1:c0 mac-address=\
    FE:CF:AC:6C:A1:C0 server=d-mng
add address=192.168.255.11 client-id=1:7a:11:f2:9e:25:c7 mac-address=\
    7A:11:F2:9E:25:C7 server=d-mng
add address=192.168.255.9 client-id=1:2:e:ad:9:9e:69 mac-address=\
    02:0E:AD:09:9E:69 server=d-mng
add address=192.168.255.7 client-id=1:48:8f:5a:ce:24:1d mac-address=\
    48:8F:5A:CE:24:1D server=d-mng
add address=192.168.255.6 client-id=1:16:d0:67:7c:a8:38 mac-address=\
    16:D0:67:7C:A8:38 server=d-mng
add address=192.168.255.5 client-id=1:c4:ad:34:e6:0:4e mac-address=\
    C4:AD:34:E6:00:4E server=d-mng
add address=192.168.255.103 client-id=1:fe:db:fa:da:e1:9a mac-address=\
    FE:DB:FA:DA:E1:9A server=d-mng
add address=192.168.255.102 client-id=1:2:38:12:9e:c5:3a mac-address=\
    02:38:12:9E:C5:3A server=d-mng
add address=192.168.255.101 client-id=1:fe:5b:e2:4e:2c:35 mac-address=\
    FE:5B:E2:4E:2C:35 server=d-mng
add address=192.168.255.8 client-id=1:2:b6:e9:1f:52:f4 mac-address=\
    02:B6:E9:1F:52:F4 server=d-mng
add address=192.168.255.182 client-id=1:2:e:97:d5:dc:23 mac-address=\
    02:0E:97:D5:DC:23 server=d-mng
add address=172.16.132.232 client-id=1:4:d9:f5:51:15:fb mac-address=\
    04:D9:F5:51:15:FB server=d-FaceSearch
add address=192.168.255.195 client-id=1:2:6c:0:a8:6a:c7 mac-address=\
    02:6C:00:A8:6A:C7 server=d-mng
add address=192.168.255.199 mac-address=2C:C8:1B:A6:42:68 server=d-mng
add address=172.16.132.231 client-id=b8af.6770.50fd-Vlan-interface194 \
    mac-address=B8:AF:67:70:50:FD server=d-FaceSearch
add address=172.16.2.203 client-id=1:8:0:27:65:95:89 comment="ros chr" \
    mac-address=08:00:27:65:95:89 server=d-video
/ip dhcp-server network
add address=172.16.2.0/24 dns-server=172.16.2.254 domain=video.local gateway=\
    172.16.2.254 ntp-server=172.16.2.254 wins-server=172.16.2.254
add address=172.16.131.0/24 dns-server=172.16.131.254 domain=spec.video.local \
    ntp-server=172.16.131.254 wins-server=172.16.131.254
add address=172.16.132.0/24 domain=fs.local gateway=172.16.132.254
add address=172.16.202.0/24
add address=172.16.250.0/24 dns-server=77.88.8.1,77.88.8.8,172.16.250.254 \
    domain=sc.video.local gateway=172.16.250.254 ntp-server=172.16.250.254 \
    wins-server=172.16.250.254
add address=192.168.255.0/24 dns-server=192.168.255.254 gateway=\
    192.168.255.254
/ip dns
set allow-remote-requests=yes servers=77.88.8.1,77.88.8.8
/ip dns static
add address=192.168.2.253 name=core.video.local ttl=15m
add address=172.16.255.1 name=core.video.local ttl=15m
add address=192.168.131.253 name=core.video.local ttl=15m
add address=172.16.2.251 name=ups1.video.local
add address=172.16.2.248 comment=dhcp-lease-script_dhcp1_lease-hostname name=\
    ups2.video.local ttl=15m
add address=192.168.255.10 name=core.schekino.video.local
add address=192.168.255.11 name=sw.schekino.video.local
add address=192.168.255.12 name=mvd.obj.schekino.video.local
add address=192.168.255.197 name=core.odoev.video.local
add address=192.168.255.192 name=core.dubna.video.local
add address=192.168.255.191 name=core.belev.video.local
add address=192.168.255.182 name=core.bogoroditsk.video.local
add address=192.168.255.190 name=core.kireevsk.video.local
add address=192.168.255.195 name=core.aleksin.video.local
add address=192.168.255.198 name=core.suvorov.video.local
add address=192.168.255.186 name=core.plavsk.video.local
add address=192.168.255.187 name=core.kimovsk.video.local
add address=172.16.255.102 name=core.edds-tula.video.local
add address=192.168.255.184 name=core.mvd.video.local
add address=192.168.255.183 name=core.f.video.local
add address=192.168.255.5 name=core.sc.video.local
add address=172.16.255.249 name=core.obj-249.video.local
add address=172.16.255.248 name=core.obj-248.video.local
add address=172.16.2.252 comment=dhcp-lease-script_dhcp1_lease-hostname name=\
    armadmin.video.local ttl=15m
add address=172.16.2.200 name=main.time.video.local
add address=172.16.2.251 name=slave.time.video.local
add address=192.168.255.8 name=core.tula.video.local
add address=192.168.255.103 name=mvd-83.tula.video.local
add address=192.168.255.102 name=mvd-53.tula.video.local
add address=192.168.255.101 name=kreml.tula.video.local
add address=192.168.255.7 name=core.fs.video.local
add address=192.168.255.254 name=core.video.local
add address=192.168.255.6 name=dem21.sc.video.local
add address=192.168.255.5 name=len2.sc.video.local
add address=172.16.2.201 comment=dhcp-lease-script_d-video_lease-hostname \
    name=ksc.video.local ttl=15m
add address=172.16.2.201 comment=dhcp-lease-script_d-video_lease-hostname \
    name=ksc ttl=15m
add address=172.16.110.110 name=eco.monitoring.video.local
add address=172.16.2.240 comment=dhcp-lease-script_d-video_lease-hostname \
    name=maps-new.video.local ttl=15m
add address=172.16.2.240 comment=dhcp-lease-script_d-video_lease-hostname \
    name=maps-new ttl=15m
add address=172.16.131.249 comment=\
    dhcp-lease-script_d-lan-spec_lease-hostname name=ups2.spec.video.local \
    ttl=15m
add address=172.16.131.249 comment=\
    dhcp-lease-script_d-lan-spec_lease-hostname name=ups2 ttl=15m
add address=172.16.131.250 comment=\
    dhcp-lease-script_d-lan-spec_lease-hostname name=ups1.spec.video.local \
    ttl=15m
add address=172.16.131.250 comment=\
    dhcp-lease-script_d-lan-spec_lease-hostname name=ups1 ttl=15m
add address=172.16.2.200 comment=dhcp-lease-script_d-video_lease-hostname \
    name=armadmin.video.local ttl=15m
add address=172.16.2.200 comment=dhcp-lease-script_d-video_lease-hostname \
    name=armadmin ttl=15m
add address=172.16.2.246 comment=dhcp-lease-script_d-video_lease-hostname \
    name=tula.video.local ttl=15m
add address=172.16.2.246 comment=dhcp-lease-script_d-video_lease-hostname \
    name=tula ttl=15m
/ip firewall address-list
add address=172.16.2.246 list=al-moscow->video-servers
add address=192.168.10.100 list=al-moscow->video-servers
add address=192.168.10.83 list=al-moscow->video-servers
add address=172.16.2.251 comment="\F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC -> \E4\EE\
    \F1\F2\F3\EF \EA \F1\E5\F0\E2\E5\F0\F3 \E8\ED\F2\E5\E3\F0\E0" list=\
    AL-SPEC-acc->server->SPEC
add address=172.16.2.248 comment="\F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC -> \E4\EE\
    \F1\F2\F3\EF \EA \F1\E5\F0\E2\E5\F0\F3 \E8\ED\F2\E5\E3\F0\E0" list=\
    AL-SPEC-acc->server->SPEC
add address=172.16.2.246 comment="\F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC -> \E4\EE\
    \F1\F2\F3\EF \EA \F1\E5\F0\E2\E5\F0\F3 " list=AL-SPEC-acc->server->SPEC
add address=172.16.2.240 comment="\F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC -> \F1\E5\
    \F0\E2\E5\F0 \EA\E0\F0\F2\EE\E3\F0\E0\F4\E8\E8" list=\
    AL-SPEC-acc->server->SPEC
add address=172.16.2.201 comment="\F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC -> \F1\E5\
    \F0\E2\E5\F0 \EA\E0\F1\EF\E5\F0\F1\EA\EE\E3\EE" list=\
    AL-SPEC-acc->server->SPEC
add address=172.16.2.200 comment="\D3\C4\C0\CB\C8\D2\DC \CF\CE\D1\CB\C5 \CD\C0\
    \D1\D2\D0\CE\C9\CA\C8 \CF\CA \C2 \D1\C8\D2 \D6\C5\CD\D2\D0\C5" disabled=\
    yes list=AL-SPEC-acc->server->SPEC
add address=172.16.2.240 list=al-internet
add address=172.16.2.248 list=al-internet
add address=172.16.2.201 list=al-internet
add address=172.16.250.0/24 list=al-internet
add address=172.16.132.245 list=al-FaceSearch->Integra
add address=172.16.132.246 list=al-FaceSearch->Integra
add address=172.16.2.202 list=al-internet
add address=172.16.2.200 disabled=yes list=al-internet
add address=10.0.0.0/8 list=al-local
add address=172.16.0.0/12 list=al-local
add address=192.168.0.0/16 list=al-local
add address=224.0.0.5 list=al-local
add address=255.255.255.255 list=al-local
add address=172.16.2.0/24 list=al-access->mng
add address=172.16.255.254 list=al-access->mng
add address=172.16.255.244 list=al-access->mng
add address=192.168.90.0/23 list=al-acc-mt_tula-vpn-servers
add address=212.12.29.210 list=al-cam_in_internet
add address=172.16.2.246 list=al-srv_video
add address=172.16.2.246 disabled=yes list=al-internet
add address=212.12.15.79 list=al-cam_in_internet
add address=212.12.15.86 list=al-cam_in_internet
add address=172.16.2.203 list=al-internet
/ip firewall filter
add action=accept chain=forward dst-address=192.168.255.199 src-address=\
    172.16.2.201
add action=accept chain=forward dst-address=192.168.91.10 src-address=\
    172.16.2.246
add action=drop chain=input comment="\E7\E0\EF\F0\E5\F2 \EE\F0\E3\E0\ED\E8\E7\
    \E0\F6\E8\E8 ovpn \F2\F3\ED\ED\E5\EB\FF \F7\E5\F0\E5\E7 \F2\F3\ED\ED\E5\EB\
    \FC \F3\EF\F0\E0\E2\EB\E5\ED\E8\FF" dst-port=49100 in-interface=br-mng \
    protocol=tcp
add action=fasttrack-connection chain=input connection-state=\
    established,related
add action=fasttrack-connection chain=forward connection-state=\
    established,related
add action=accept chain=input connection-state=established,related
add action=accept chain=forward connection-state=established,related
add action=accept chain=output connection-state=established,related \
    out-interface=pppoe-rt-internet
add action=accept chain=input comment="eoip-tunnel \E4\EB\FF \F3\EF\F0\E0\E2\
    \EB\E5\ED\E8\FF \EC\E8\EA\F0\EE\F2\E8\EA" protocol=gre src-address=\
    192.168.0.0/16
add action=accept chain=input comment="eoip-tunnel \E4\EB\FF \F3\EF\F0\E0\E2\
    \EB\E5\ED\E8\FF \EC\E8\EA\F0\EE\F2\E8\EA" protocol=gre src-address=\
    172.16.255.254
add action=accept chain=input comment="\E4\EB\FF \F0\E0\E1\EE\F2\FB OSPF" \
    protocol=ospf
add action=accept chain=input in-interface-list=il-ovpn-spec_and_tularegion \
    protocol=icmp
add action=accept chain=input comment=\
    "\C4\EE\F1\F2\F3\EF \EA DNS \F1\E5\F0\E2\E5\F0\F3" dst-port=53 \
    in-interface-list=il-in-dns protocol=udp
add action=accept chain=input dst-port=67 in-interface-list=il-dhcp protocol=\
    udp src-port=68
add action=accept chain=input comment="\C4\EE\F1\F2\F3\EF \EA \EF\EE\F0\F2\F3 \
    TCP49100(OVPN server) \F7\E5\F0\E5\E7 1\E9 \EF\EE\F0\F2" dst-port=49100 \
    in-interface-list=il-in-ovpn-serv-int protocol=tcp
add action=accept chain=input comment="\C4\EE\F1\F2\F3\EF \EA \F3\F1\F2\F0\EE\
    \E9\F1\F2\E2\F3 \F7\E5\F0\E5\E7 br-LAN" in-interface=v2 protocol=tcp
add action=accept chain=input comment="\C4\EE\F1\F2\F3\EF \EA \F3\F1\F2\F0\EE\
    \E9\F1\F2\E2\F3 \F7\E5\F0\E5\E7 \F2\F3\ED\ED\E5\EB\FC" in-interface-list=\
    il-mng
add action=accept chain=input comment="\C4\EE\F1\F2\F3\EF \EA \F3\F1\F2\F0\EE\
    \E9\F1\F2\E2\F3 \F7\E5\F0\E5\E7 \F2\F3\ED\ED\E5\EB\FC" src-address-list=\
    al-access->mng
add action=accept chain=input dst-address=172.16.255.0/24 src-address=\
    172.16.255.1
add action=accept chain=forward in-interface=v2 out-interface=v2552
add action=accept chain=forward in-interface-list=il-mng
add action=accept chain=forward comment=" lan -> ovpn tula region" \
    in-interface=v2 out-interface-list=il-ovpn-tula_region
add action=accept chain=forward comment="\C4\EE\F1\F2\F3\EF - \EF\F0\EE\F5\EE\
    \E4\FF\F9\E8\E9 \F7\E5\F0\E5\E7 \F3\F1\F2\F0\EE\E9\F1\E2\EE, \EF\F0\E8\F5\
    \EE\E4\FF\F9\E8\E9 \E8\E7 \F2\F3\ED\ED\E5\EB\FF" in-interface-list=\
    il-ovpn-tula_region out-interface=v2
add action=accept chain=forward comment=NTP dst-port=123 in-interface-list=\
    il-f-ntp-to-lan out-interface=v2 protocol=udp
add action=accept chain=forward comment=\
    "\F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC -> \F1\E5\F0\E2\E5\F0\E0" \
    dst-address-list=AL-SPEC-acc->server->SPEC in-interface-list=il-ovpn-spec \
    out-interface=v2
add action=accept chain=forward in-interface=v2
add action=accept chain=forward comment=\
    "\F1\E5\F0\E2\E5\F0\E0 -> \F1\EF\E5\F6 \F3\F0\EE\E2\E5\ED\FC " \
    in-interface=v2 out-interface-list=il-ovpn-spec src-address-list=\
    AL-SPEC-acc->server->SPEC
add action=accept chain=forward comment=\
    "\F1\E5\F0\E2\E5\F0\E0 -> 172.16.2.2 -> vpn" dst-address-list=\
    al-acc-mt_tula-vpn-servers in-interface=v2 src-address-list=\
    AL-SPEC-acc->server->SPEC
add action=accept chain=forward comment=\
    "\F3\E4\E0\EB\E8\F2\FC  - MNG-Noutbook" src-address=172.16.255.244
add action=accept chain=forward dst-address-list=al-moscow->video-servers \
    in-interface=v3422-moscow
add action=accept chain=forward comment=al-internet out-interface=\
    pppoe-rt-internet src-address-list=al-internet
add action=accept chain=forward comment=sitcentr->glonas dst-address=\
    195.88.0.162 in-interface=v252-data-SitCentr out-interface=ether6-glonas \
    src-address=172.16.250.249
add action=accept chain=forward comment=sitcentr->integra dst-address=\
    172.16.2.246 in-interface=v252-data-SitCentr out-interface=v2552
#interrupted
