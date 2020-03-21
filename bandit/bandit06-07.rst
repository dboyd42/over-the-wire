bandit6-7
#########
:Author: David Boyd
:Date: 2020-03-20

Level Goal
==========

The password for the next level is stored somewhere on the server and has all of the following properties:

	- owned by user bandit7
	- owned by group bandit6
	- 33 bytes in size

Commands you may need to solve this level

ls, cd, cat, file, du, find, grep

Walkthrough
===========
:find: can also search for users, groups, and sizes

.. code-block :: Bash

	# Login to server
	ssh bandit6@bandit.overthewire.org -p 2220
		passwd: <C-b>]			# If using tmux
		passwd: DXjZPULLxYr17uwoI01bNLQbtFemEgo7

	# Capture the Flag
	find /* -user bandit7 -group bandit6 -size 33c 2>/dev/null
	cat /var/lib/dpkg/info/bandit7.password

	# Tmux copy to system clipboard
	<C-b>]		# Enter vi mode
	<Space>		# Start visual copy
	<Enter>		# Copy text

