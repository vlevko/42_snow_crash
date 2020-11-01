#!/usr/bin/expect -f
set ip 192.168.1.103
spawn ssh -o "StrictHostKeyChecking no" level13@$ip -p 4242 "gdb level13"
expect "sword:"
send "g1qKMiRpXf53AWhDaU7FEkczr\r"
expect "(gdb)"
send "disassemble main\r"
expect "(gdb)"
send "break *0x0804859a\r"
expect "(gdb)"
send "run\r"
expect "(gdb)"
send "jump *0x80485cb\r"
expect "(gdb)"
send "quit\r"
interact
