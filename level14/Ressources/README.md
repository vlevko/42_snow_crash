# Level 14
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
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
	```
- Run `gdb` debugger
	```sh
	$ gdb getflag
	```
- Disassemble the `main` function code
	```sh
	(gdb) disassemble main
	```
- Find `test` command and with `getuid` function call, notice the operations next to it
	```sh
	0x0804898e <+72>:    test   %eax,%eax
	```
	```sh
	0x08048afd <+439>:   call   0x80484b0 <getuid@plt>
	0x08048b02 <+444>:   mov    %eax,0x18(%esp)
	0x08048b06 <+448>:   mov    0x18(%esp),%eax
	0x08048b0a <+452>:   cmp    $0xbbe,%eax
	0x08048b0f <+457>:   je     0x8048ccb <main+901>
	...
	0x08048bab <+613>:   cmp    $0xbc5,%eax
	0x08048bb0 <+618>:   je     0x8048dc4 <main+1150>
	0x08048bb6 <+624>:   cmp    $0xbc6,%eax
	0x08048bbb <+629>:   je     0x8048de5 <main+1183>
	```
- Set a breakpoint just before a `test` command and run debugging
	```sh
	(gdb) break *0x0804898e
	(gdb) run

	```
- Jump to the address noticed next to the `3014` flag14 uid hex number `0xbc6` to get the token
	```sh
	(gdb) jump *0x8048de5
	```
- Quit the debugger
	```sh
	(gdb) quit
	```
7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
- Switch to the `flag14` user with the given token
	```sh
	$ su flag14
	Password: 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
	```
- Run `getflag` command to get the flag `7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ`
	```sh
	$ getflag
	```
