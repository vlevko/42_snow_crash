#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level09@$ip -p 4242 "echo \"import os\nfd = os.open\('/home/user/level09/token', os.O_RDONLY\)\ncontent = os.read\(fd, 25\)\nprint ''.join\(\[chr\(ord\(content\[i\]\)-i\) for i in range\(len\(content\)\)\]\)\" > /tmp/level09.py ; python /tmp/level09.py"
expect "sword:"
send "25749xKZ8L7DkSCwJkT9dyv6f\r"
expect -re "\r\n(.*?)\r\n"
set password $expect_out(1,string)
spawn ssh -o "StrictHostKeyChecking no" flag09@$ip -p 4242 "getflag"
expect "sword:"
send "$password\r"
interact
