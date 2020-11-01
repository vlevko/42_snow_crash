# Level 13
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
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
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run the `level13` file
	```sh
	$ ./level13
	```
- Trace libraries calls with `ltrace`
	```sh
	$ ltrace ./level13
	```
- Run `gdb` debugger
	```sh
	$ gdb level13
	```
- Disassemble the `main` function code
	```sh
	(gdb) disassemble main
	```
- Find command with `getuid` function call and notice the address jumped to next
	```sh
	0x08048595 <+9>:     call   0x8048380 <getuid@plt>
	0x0804859a <+14>:    cmp    $0x1092,%eax
	0x0804859f <+19>:    je     0x80485cb <main+63>
	```
- Set a breakpoint just right after `getuid` call and run debugging
	```sh
	(gdb) break *0x0804859a
	(gdb) run

	```
- Jump to the address noticed next to the breakpoint to get the token
	```sh
	(gdb) jump *0x80485cb
	```
- Quit the debugger
	```sh
	(gdb) quit
	```
- With the token provided `2A31L79asukciNyi8uppkEuSx` switch to the next user level
	```sh
	$ su level14
	Password: 2A31L79asukciNyi8uppkEuSx
	```
