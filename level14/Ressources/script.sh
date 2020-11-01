#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level14@$ip -p 4242 "gdb getflag"
expect "sword:"
send "2A31L79asukciNyi8uppkEuSx\r"
expect "(gdb)"
send "disassemble main\r"
expect "(gdb)"
send "break *0x0804898e\r"
expect "(gdb)"
send "run\r"
expect "(gdb)"
send "jump *0x8048de5\r"
expect "(gdb)"
send "quit\r"
spawn ssh -o "StrictHostKeyChecking no" flag14@$ip -p 4242 "getflag"
expect "sword:"
send "7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ\r"
interact
