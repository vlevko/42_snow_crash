# Level 01
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	set prompt "~="
	spawn ssh -o "StrictHostKeyChecking no" level01@$ip -p 4242 "cat /etc/passwd | grep flag01"
	expect "sword:"
	send "x24ti5gi3x0ol2eh4esiuxias\r"
	expect -re "\r\n(.*?)\r\n"
	set password $expect_out(1,string)
	set outfile [open "passwd" w]
	puts $outfile $password
	close $outfile
	spawn apk add john
	expect $prompt
	spawn john passwd
	expect $prompt
	spawn john --show passwd
	expect -re ".*?:(.*?):.*"
	set password $expect_out(1,string)
	puts $password
	spawn ssh -o "StrictHostKeyChecking no" flag01@$ip -p 4242 "getflag"
	expect "sword:"
	send "$password\r"
	interact
	```
- View the `passwd` file and find a vulnerability for the user `flag01`
	```sh
	$ cat /etc/passwd | grep flag01
	```
- Copy the output of the command above and save it on your machine to a separate file `passwd`, for example, in the home folder
- Go to the `https://www.openwall.com/john/` and download the corresponding version of the John the Ripper password cracker to your Operating System or install it with a package manager
- Launch this utility twice in a separate CLI with the file saved above given as an argument to it
	```sh
	$ john ~/passwd
	$ john --show ~/passwd
	```
- Copy the decrypted password `abcdefg` and return to the CLI of SnowCrash VM
- Switch to the `flag01` user with the password decrypted above
	```sh
	$ su flag01
	Password: abcdefg
	```
- Run `getflag` command to get the flag
	```sh
	$ getflag
	```
- With the token provided `f2av5il02puano7naaf6adaaf` switch to the next user level
	```sh
	$ su level02
	Password: f2av5il02puano7naaf6adaaf
	```
