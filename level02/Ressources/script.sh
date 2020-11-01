#!/usr/bin/expect -f
set ip 192.168.1.103
set prompt "~="
spawn scp -o "StrictHostKeyChecking no" -P 4242 level02@$ip:~/level02.pcap ./
expect "sword:"
send "f2av5il02puano7naaf6adaaf\r"
expect $prompt
spawn ssh -o "StrictHostKeyChecking no" flag02@$ip -p 4242 "getflag"
expect "sword:"
send "ft_waNDReL0L\r"
interact
