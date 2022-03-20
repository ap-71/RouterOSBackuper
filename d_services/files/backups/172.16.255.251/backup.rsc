# feb/15/2022 03:19:34 by RouterOS 6.47.4
# software id = SF7K-X5XN
#
# model = CRS125-24G-1S
# serial number = 944F08899E81
/interface bridge
add admin-mac=02:04:3A:7E:BA:40 auto-mac=no dhcp-snooping=yes igmp-snooping=\
    yes name=br-FaceSearch protocol-mode=none
add admin-mac=CC:2D:E0:99:CE:44 arp=reply-only auto-mac=no igmp-snooping=yes \
    name=br-LAN protocol-mode=none
add name=br-loopback
/interface ethernet
set [ find default-name=ether2 ] disabled=yes
set [ find default-name=ether3 ] disabled=yes
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether6 ] disabled=yes
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] arp=reply-only
set [ find default-name=ether12 ] disabled=yes
set [ find default-name=ether13 ] disabled=yes
set [ find default-name=ether14 ] disabled=yes
set [ find default-name=ether15 ] disabled=yes
set [ find default-name=ether16 ] disabled=yes
set [ find default-name=ether17 ] disabled=yes
set [ find default-name=ether18 ] disabled=yes
set [ find default-name=ether19 ] disabled=yes
set [ find default-name=ether20 ] disabled=yes
set [ find default-name=ether21 ] disabled=yes
set [ find default-name=ether22 ] disabled=yes
set [ find default-name=ether23 ] disabled=yes
set [ find default-name=ether24 ] arp=reply-only
set [ find default-name=sfp1 ] disabled=yes
/interface eoip
add local-address=192.168.231.251 mac-address=02:04:3A:7E:BA:40 name=\
    eoip-data-FaceSearch-tula remote-address=192.168.131.253 tunnel-id=1251
add allow-fast-path=no ipsec-secret=89721232730f2249bab86a6bb7482c2118e6bfbc \
    local-address=192.168.231.251 mac-address=FE:CF:AC:6C:A1:C0 name=eoip-mng \
    remote-address=192.168.131.253 tunnel-id=251
#interrupted
