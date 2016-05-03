## IPSec Docker Client Container 

#Openswan/x2ltpd Client on Ubuntu 14.04 (PreSharedKey)

Build it with:

*docker build -t r4ffy/ipsecclient:v1 ./*


Execute it:


*docker run --privileged -v /lib/modules/:/lib/modules/ -e SERVERIP 0.0.0.0 --e USERNAME vpnuser -e PASSWORD ch4ng3m3 -e PRESHAREDKEY y0umustc4ngeme -i -t ns/ipsecclient:v1*


Enjoy :)
