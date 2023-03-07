bandit13-14
###########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in /etc/bandit_pass/bandit14 and can
only be read by user bandit14. For this level, you don’t get the next password,
but you get a private SSH key that can be used to log into the next level.
Note: localhost is a hostname that refers to the machine you are working on.

Commands you may need to solve this level:

ssh, telnet, nc, openssl, s_client, nmap


Walkthrough
===========
:ssh -i: IdentityFile - Specifies the file from which the user's RSA authentication identity is read
:scp wildcard: Use the escape char to read in the asterisk.

.. code-block :: Bash

   # Login using the SSH file from the current bandit user
   bandit13@bandit:~$
        ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220

	# # Login to server
	# sshpass 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL ssh bandit13@bandit.overthewire.org -p 2220
	# # Find flag
	# ls; exit

	# # Copy the flag from RHOST to LHOST
	# # Method 1
	# scp -P 2220 bandit13@bandit.labs.overthewire.org:./sshkey.private ./
	# # Method 2
	# scp -P 2220 bandit$i@bandit.labs.overthewire.org:/home/bandit1
	# 3/\* ./

	# # [ISSUE] ssh's "WARNING: UNPROTECTED PRIVATE KEY FILE!"
	# #   [FIX] reset key to perm defaults
	# sudo chmod 600 sshkey.private

	# # Capture the Flag
	# ssh bandit14@localhost -i sshkey.private

