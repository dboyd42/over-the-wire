Bandit Level 17 → Level 18
##########################

Level Goal
==========

There are 2 files in the homedirectory: passwords.old and passwords.new. The
password for the next level is in passwords.new and is the only line that has
been changed between passwords.old and passwords.new

NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into
bandit18, this is related to the next level, bandit19

Commands you may need to solve this level:

cat, grep, ls, diff

Walkthrough
===========

.. code-block :: Bash

	# Login to server
	ssh -i docs/bandit16-17.sshkey.private-b17sPassword bandit17@$TM

	# Find the password file
	diff *

	# Capture the Flag
	kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd

