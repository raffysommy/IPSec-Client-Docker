#!/bin/bash
	IFACE=eth0
	VPN_ADDR=$SERVERIP
	GW_ADDR=$(/sbin/route -n |grep -m 1 "^0\.0\.0\.0" |awk '{print $2}')  
	IP_ADDR=$(/sbin/ifconfig $IFACE | head -n2 | tail -n1 | cut -d' ' -f12 | cut -c 6-)
	sed -i "s/^lns =.*/lns = $VPN_ADDR/g" /etc/xl2tpd/xl2tpd.conf
	sed -i "s/left=.*$/left=$IP_ADDR/g" /etc/ipsec.conf
	sed -i "s/right=.*$/right=$VPN_ADDR/g" /etc/ipsec.conf
	/etc/init.d/ipsec restart
	sleep 2    

	/etc/init.d/xl2tpd restart
	/usr/sbin/ipsec auto --up L2TP-PSK-CLIENT                    
	/bin/echo "c L2TPCLIENT" > /var/run/xl2tpd/l2tp-control     
	sleep 5    
	VPN_GW=192.168.10.1
	VPNIP_ADDR=$(/sbin/ifconfig ppp0 | head -n2 | tail -n1 | cut -d' ' -f12 | cut -c 6-)
	#route add $VPN_ADDR gw $GW_ADDR $IFACE
	#route delete default gw $GW_ADDR
	#route add default gw $VPN_GW ppp0

