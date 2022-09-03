# openvpn-alert-telegram
openvpn-login-alert-telegram


tambahkan config di /etc/openvpn/openvpn.conf

#contoh

server 192.168.255.0 255.255.255.0
verb 3
key /etc/openvpn/pki/private/202.145.2.100.key
ca /etc/openvpn/pki/ca.crt
cert /etc/openvpn/pki/issued/202.145.2.100.crt
dh /etc/openvpn/pki/dh.pem
tls-auth /etc/openvpn/pki/ta.key
key-direction 0
keepalive 10 60
persist-key
persist-tun

proto udp
# Rely on Docker to do port mapping, internally always 1194
port 1194
dev tun0
status /tmp/openvpn-status.log

user nobody
group nogroup
comp-lzo no

### Route Configurations Below
route 192.168.254.0 255.255.255.0

### Push Configurations Below
push "block-outside-dns"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
push "comp-lzo no"

log /var/log/openvpn.log #tambakan


