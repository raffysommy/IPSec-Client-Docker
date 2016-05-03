#!/bin/sh


echo "net.ipv4.conf.all.accept_redirects = 0" | tee -a /etc/sysctl.conf

echo "net.ipv4.conf.all.send_redirects = 0" | tee -a /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects = 0" | tee -a /etc/sysctl.conf

echo "net.ipv4.conf.default.send_redirects = 0" | tee -a /etc/sysctl.conf

sysctl -p
sysctl -w net.ipv4.ip_forward=1



echo "Init of /etc/ipsec.secrets"
cat > /etc/ipsec.secrets <<EOF
: PSK "$PRESHAREDKEY"
EOF




echo "Init of /etc/chap-secrets"
cat > /etc/ppp/chap-secrets <<EOF
"$USERNAME" "*" "$PASSWORD" "*"
EOF









echo "Client VPN Impostato"
echo "Username:$USERNAME Password:$PASSWORD"
echo "PSK:$PRESHAREDKEY"
/bin/bash
