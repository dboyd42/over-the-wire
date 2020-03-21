bandit13-14
###########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note: localhost is a hostname that refers to the machine you are working on

Commands you may need to solve this level

ssh, telnet, nc, openssl, s_client, nmap


Walkthrough
===========
:ssh -i: IdentityFile - Specifies the file from which the user's RSA authentication identity is read

.. code-block :: Bash

	# Login to server
	sshpass 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL ssh bandit13@bandit.overthewire.org -p 2220

	# Capture the Flag
	ls
	ssh bandit14@localhost -i sshkey.private

