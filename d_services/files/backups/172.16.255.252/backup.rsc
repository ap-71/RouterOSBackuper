# feb/25/2022 13:48:06 by RouterOS 6.47.4
# software id = F7RB-S7P8
#
# model = CRS125-24G-1S
# serial number = 944F088AECC5
/interface bridge
add admin-mac=86:83:33:27:82:2C arp=reply-only auto-mac=no dhcp-snooping=yes \
    igmp-snooping=yes name=br-FaceSearch protocol-mode=none
add admin-mac=CC:2D:E0:99:D2:2A auto-mac=no igmp-snooping=yes name=br-LAN \
    protocol-mode=none
add name=br-loopback
/interface ethernet
set [ find default-name=ether2 ] arp=reply-only disabled=yes
set [ find default-name=ether4 ] disabled=yes
set [ find default-name=ether5 ] disabled=yes
set [ find default-name=ether6 ] arp=reply-only disabled=yes
set [ find default-name=ether7 ] disabled=yes
set [ find default-name=ether8 ] disabled=yes
set [ find default-name=ether9 ] disabled=yes
set [ find default-name=ether10 ] disabled=yes
set [ find default-name=ether11 ] disabled=yes
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
set [ find default-name=sfp1 ] disabled=yes
/interface eoip
add local-address=192.168.131.248 mac-address=02:BD:79:52:97:F7 name=\
    eoip-data-FaceSearch-tula remote-address=192.168.131.253 tunnel-id=1252
add allow-fast-path=no ipsec-secret=e9e6fb17684e80bcfb627215e56e49625e3919c6 \
    local-address=192.168.131.248 loop-protect=on mac-address=\
    FE:ED:9E:2B:F4:13 name=eoip-mng remote-address=192.168.131.253 tunnel-id=\
    248
#interrupted
