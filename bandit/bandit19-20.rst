Bandit Level 19 → Level 20
##########################

Level Goal
==========
:URL: https://en.wikipedia.org/wiki/Setuid

To gain access to the next level, you should use the setuid binary in the
homedirectory. Execute it without arguments to find out how to use it. The
password for this level can be found in the usual place (/etc/bandit_pass),
after you have used the setuid binary.)

Walkthrough
===========

.. code-block :: Bash

	# Login to server
	sshpass -p IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x ssh bandit19@$TM

	# Capture the Flag
	./bandit20-do cat /etc/bandit_pass/bandit20
		> GbKksEFF4yrVs6il55v6gwY5aVje5f0j

