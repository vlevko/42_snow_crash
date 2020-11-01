# Level 09
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	spawn ssh -o "StrictHostKeyChecking no" level09@$ip -p 4242 "echo \"import os\nfd = os.open\('/home/user/level09/token', os.O_RDONLY\)\ncontent = os.read\(fd, 25\)\nprint ''.join\(\[chr\(ord\(content\[i\]\)-i\) for i in range\(len\(content\)\)\]\)\" > /tmp/level09.py ; python /tmp/level09.py"
	expect "sword:"
	send "25749xKZ8L7DkSCwJkT9dyv6f\r"
	expect -re "\r\n(.*?)\r\n"
	set password $expect_out(1,string)
	spawn ssh -o "StrictHostKeyChecking no" flag09@$ip -p 4242 "getflag"
	expect "sword:"
	send "$password\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Run the file `level09` with one argument
	```sh
	$ ./level09 00000
	```
- View content of the `token` file
	```sh
	$ cat token
	```
- Create a script `level09.py` in `/tmp` location
	```python
	import os
	fd = os.open("/home/user/level09/token", os.O_RDONLY)
	content = os.read(fd, 25)
	print ''.join([chr(ord(content[i])-i) for i in range(len(content))])
	```
- Run that script to get the token
	```sh
	$ python /tmp/level09.py
	```
- Switch to the user `flag09` with the given token `f3iji1ju5yuevaus41q1afiuq`
	```sh
	$ su flag09
	Password: f3iji1ju5yuevaus41q1afiuq
	```
- Run `getflag` command to get the flag
	```sh
	$ getflag
	``` 
- With the token provided `s5cAJpM8ev6XHw998pRWG728z` switch to the next user level
	```sh
	$ su level10
	Password: s5cAJpM8ev6XHw998pRWG728z
	```
