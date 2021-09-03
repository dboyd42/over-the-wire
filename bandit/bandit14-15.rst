Bandit Level 14 → Level 15
##########################

Level Goal
==========

The password for the next level can be retrieved by submitting the password of
the current level to port 30000 on localhost.

Commands you may need to solve this level:

ssh, telnet, nc, openssl, s_client, nmap

Walkthrough
===========
:Note: Be sure to change your sshkey.private to have no perms for other users!

.. code-block :: Bash

	# Login to server
	TM="bandit.labs.overthewire.org -p 2220"
	KEY14=./docs/bandit13-14.sshkey.private
	ssh -i $KEY14 bandit14@$TM
	#-OR-
	ssh bandit$i@$TM -i docs/bandit13-14.sshkey.private

	# Find password file  // Note: Bandit13->14 states its in the /etc/...
	bandit14@bandit:~/.ssh$ find / -iname "*bandit14*" 2>/dev/null
		> /home/bandit15/.bandit14.password
		> /home/bandit14
		> /etc/bandit_pass/bandit14
		> /run/screen/S-bandit14

	# Verify passowrd file
	bandit14@bandit:~/.ssh$ cat /etc/bandit_pass/bandit14
	4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

	# Capture the Flag
	bandit14@bandit:~/.ssh$ nc 127.0.0.1 30000 < $NEWFI
		> BfMYroe26WYalil77FoDi9qh59eK5xNr
	# Method 2
	cat /etc/bandit_pass/bandit14	# cp stdout to TMUX
	nc localhost 30000
		# paste pwd from TMUX ( <C-b>] )

