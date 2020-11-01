#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level00@$ip -p 4242 "find / -user flag00 -print 2>/dev/null -exec cat \{\} \\\; | head -2 | tail -1 | tr 'A-Za-z' 'L-ZA-Kl-za-k'"
expect "sword:"
send "level00\r"
expect -re "\r\n(.*?)\r\n"
set password $expect_out(1,string)
spawn ssh -o "StrictHostKeyChecking no" flag00@$ip -p 4242 "getflag"
expect "sword:"
send "$password\r"
interact
