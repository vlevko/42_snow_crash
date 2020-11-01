This project is an introduction to cyber security.

To launch this project you will have to use a virtual machine with the ISO provided with the subject.

VM setup recommendations:
- install and open Oracle VM VirtualBox
- create new Linux VM, e.g. Ubuntu (64-bit)
- change VM network settings to use Bridged Adapter
- mount provided ISO to the virtual optical drive
- use reasonably small values for RAM and Processor options

If the configuration is correct, once you have launched your VM, you will get a simple prompt with an IP.

You just need to choose your command line shell to connect to the displayed IP address using credentials provided with the subject, i.e. using SSH on port 4242 with login:password `level00:level00`, and then find the way to get the flag.

# Level 00
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level00@$ip -p 4242 "find / -user flag00 -print 2>/dev/null -exec cat \{\} \\\; | head -2 | tail -1 | tr 'A-Za-z' 'L-ZA-Kl-za-k'"
	expect "sword:"
	send "level00\r"
	expect -re "\r\n(.*?)\r\n"
	set password $expect_out(1,string)
	spawn ssh -o "StrictHostKeyChecking no" flag00@$ip -p 4242 "getflag"
	expect "sword:"
	send "$password\r"
	interact
	```
- Connect to the SnowCrash VM using SSH on port 4242 and login `level00` with password `level00` as follows
	```sh
	$ ssh level00@192.168.1.103 -p 4242
	Password: level00
	```
- Find the file whose owner is user `flag00`
	```sh
	$ find / -user flag00 -print 2>/dev/null
	```
- View and copy its content `cdiiddwpgswtgt`
	```sh
	$ cat /usr/sbin/john
	```
- Go to the site `dcode.fr` and find a tool `Caesar Cipher`
- Paste the text copied earlier to the input and decrypt it
- Copy the decrypted result `nottoohardhere` and return to the CLI
- Switch to the `flag00` user with the password decrypted above
	```sh
	$ su flag00
	Password: nottoohardhere
	```
- Run `getflag` command to get the flag
	```sh
	$ getflag
	```
- With the token provided `x24ti5gi3x0ol2eh4esiuxias` switch to the next user level
	```sh
	$ su level01
	Password: x24ti5gi3x0ol2eh4esiuxias
	```
