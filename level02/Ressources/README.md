# Level 02
- In the shell of your choice run the script attached or follow the steps bellow using your VM IP address to get the flag, also root privileges and some dependencies may be needed to install before
	```sh
	$ chmod u+x script.sh
	$ ./script.sh
	$ cat script.sh
	#!/usr/bin/expect -f
	set ip 192.168.1.103
	set prompt "~="
	spawn scp -o "StrictHostKeyChecking no" -P 4242 level02@$ip:~/level02.pcap ./
	expect "sword:"
	send "f2av5il02puano7naaf6adaaf\r"
	expect $prompt
	spawn ssh -o "StrictHostKeyChecking no" flag02@$ip -p 4242 "getflag"
	expect "sword:"
	send "ft_waNDReL0L\r"
	interact
	```
- List content of the home directory
	```sh
	$ ls -l
	```
- Copy the file `level02.pcap` to your machine using `scp` command in a separate CLI with the password found earlier
	```sh
	$ scp -o "StrictHostKeyChecking no" -P 4242 level02@192.168.1.103:~/level02.pcap ./
	Password: f2av5il02puano7naaf6adaaf
	```
- Get and use any suitable tool on your machine to open pcap file, for example, `wireshark`
- Find a packet with login or password text data, i.e. number 20 or 43
- Follow the TCP stream, e.g. via main menu Analys, then Follow, then TCP
- In the window that opens restore password removing redundent symbols to get `ft_waNDReL0L`
- Switch to the `flag02` user with the password restored above
	```sh
	$ su flag02
	Password: ft_waNDReL0L
	```
- Run `getflag` command to get the flag
	```sh
	$ getflag
	```
- With the token provided `kooda2puivaav1idi4f57q8iq` switch to the next user level
	```sh
	$ su level03
	Password: kooda2puivaav1idi4f57q8iq
	```
