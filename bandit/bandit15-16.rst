Bandit Level 15 → Level 16
##########################

Level Goal
==========

The password for the next level can be retrieved by submitting the password of
the current level to port 30001 on localhost using SSL encryption.

Helpful note: Getting “HEARTBEATING” and “Read R BLOCK”? Use -ign_eof and read
the “CONNECTED COMMANDS” section in the manpage. Next to ‘R’ and ‘Q’, the ‘B’
command also works in this version of that command…

Commands you may need to solve this level:

ssh, telnet, nc, openssl, s_client, nmap

Walkthrough
===========
:Note: When using openssl, use the -quite option!

.. code-block :: Bash

	# Login to server
	sshpass -p BfMYroe26WYalil77FoDi9qh59eK5xNr ssh bandit15@$TM

	# Find the password file
	find / -iname "*bandit15*" 2>/dev/null | xargs -L1 file| grep -i ascii
	FI=/etc/bandit_pass/bandit15

	# Capture the Flag
	cat $FI | openssl s_client -connect 127.0.0.1:30001 -quiet
		> depth=0 CN = localhost
		> verify error:num=18:self signed certificate
		> verify return:1
		> depth=0 CN = localhost
		> verify return:1
		> Correct!
		> cluFn7wTiGryunymYOu4RcffSxQluehd

	# Use Tmux to copy data to LHOST
	# Change perm for ssh
	chmod 600 docs/bandit16-17.sshkey.private-b17sPassword

