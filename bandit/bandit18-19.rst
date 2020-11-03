Bandit Level 18 → Level 19
##########################

Level Goal
==========

The password for the next level is stored in a file readme in the
homedirectory. Unfortunately, someone has modified .bashrc to log you out when
you log in with SSH.

Commands you may need to solve this level:

ssh, ls, cat

Walkthrough
===========

.. code-block :: Bash

	# Login to server
	sshpass -p kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd ssh bandit18@$TM
		> ByeBye !

	# Find the password file
	scp bandit18@$TM:/home/bandit18/readme ./docs/bandit18-19s_password.readme

	# Capture the Flag
	IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x

